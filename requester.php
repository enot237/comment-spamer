<?php 
if (!isset($_REQUEST)) { 
file_put_contents("requester.log", date("Y-m-d H:i:s").">>no income request given \n",FILE_APPEND);
return; 
} 

include 'conf.php';
$link = new mysqli($host, $login, $pass, $db);
$link->set_charset("utf8");
// $link=mysqli_connect($host, $login, $pass, $db);
// mysqli_set_charset($link,'utf16_unicode_ci');
$new_video_req = '{"type":"video_new","object":{"id":*********,"owner_id":-***********,"title":"Дэйм отправляет Оклахому домой","duration":36,"description":"","date":1575401936,"comments":0,"views":1,"width":640,"height":640,"photo_130":"https:\/\/sun9-25.userapi.com\/c857524\/v857524750\/110d92\/7LrNJzTZzB4.jpg","photo_320":"https:\/\/sun9-9.userapi.com\/c857524\/v857524750\/110d90\/wBBE85GIRB4.jpg","photo_800":"https:\/\/sun9-56.userapi.com\/c857524\/v857524750\/110d8a\/aIO0f5MUieQ.jpg","photo_1280":"https:\/\/sun9-25.userapi.com\/c857524\/v857524750\/110d8b\/_8Q9rbcJTwA.jpg","first_frame_800":"https:\/\/sun9-46.userapi.com\/c854016\/v854016750\/18dc48\/6BjCtn8zzf4.jpg","first_frame_1280":"https:\/\/sun9-30.userapi.com\/c854016\/v854016750\/18dc49\/vLZwcVFc1mw.jpg","first_frame_320":"https:\/\/sun9-54.userapi.com\/c854016\/v854016750\/18dc4e\/pqMfswjIJHs.jpg","first_frame_720":"https:\/\/sun9-25.userapi.com\/c854016\/v854016750\/18dc4b\/oG7zAlRWX5Y.jpg","first_frame_1024":"https:\/\/sun9-13.userapi.com\/c854016\/v854016750\/18dc4c\/H7QTJyDEZgo.jpg","first_frame_4096":"https:\/\/sun9-25.userapi.com\/c854016\/v854016750\/18dc4d\/MCErdEfvUU4.jpg","first_frame_160":"https:\/\/sun9-12.userapi.com\/c854016\/v854016750\/18dc4f\/Cjvhqj3TkbM.jpg","first_frame_130":"https:\/\/sun9-8.userapi.com\/c854016\/v854016750\/18dc50\/UOg1lPWn0Dc.jpg","can_add":1},"group_id":182977255,"event_id":"bdb32c954f099ed*********989d82c5f6413fd665"}';


$new_comment_req = '{"type":"video_comment_new","object":{"id":****,"from_id":*********,"date":1575410454,"text":"Period2","video_owner_id":-*****,"video_id":***********},"group_id":***********,"event_id":"1478*******5268528d972467328d84a16b4ad6"}
';

$confirmation_req = '{
    "type": "confirmation",
    "group_id": ********,
    "event_id": "",
    "v": ""
}';

// $confirmation_token = '5256a953'; 

// $FILE_NAME = 'allsn.json';
// $TEXT = 'Поддержи%20трансляцию:%0aКарта%20Сбербанка%20-%204276110015107598%0aЯндекс%20-%20410013979308535%0aQIWI%20-%20+79667854268';
$data = json_decode(file_get_contents('php://input')); 
// $data = json_decode($new_comment_req);
// $data = json_decode($confirmation_req);
//Проверяем, что находится в поле "type" 
switch ($data->type) {
    //Если это уведомление для подтверждения адреса... 
    case 'confirmation': 
    //Запрашиваем токен подтверждения для этой группы из базы данных
    // echo "conf tocken";
    // echo 'req: >> '."SELECT confirmation_tocken FROM flood_groups WHERE group_id=".$data->group_id;
    $query = mysqli_query($link, "SELECT confirmation_tocken FROM flood_groups WHERE group_id=".$data->group_id);
    $query_data = mysqli_fetch_assoc($query);
    // var_dump($query_data);
    $confirmation_tocken = $query_data["confirmation_tocken"];
    //...отправляем строку для подтверждения
    echo $confirmation_tocken; 
    file_put_contents("requester.log", date("Y-m-d H:i:s")."  >>  New group with id: ".$data->group_id." | confirmation_tocken from db: ".$confirmation_tocken." \n",FILE_APPEND);
    // echo "*****";
    break; 

case 'video_new':
    $query = mysqli_query($link, "SELECT * FROM flood_groups WHERE group_id=".$data->group_id);
    $query_data = mysqli_fetch_assoc($query);
    extract($query_data);
    $sql_Req = "INSERT INTO video_counters (groupid_id, video_id, video_title) VALUES ('".$id."','".$data->object->id."','".$data->object->title."')";
    file_put_contents("requester.log", date("Y-m-d H:i:s")."  >>  New video :  id".$data->object->id." | ".$data->object->title ."\nSQL>>>".$sql_Req.'\n',FILE_APPEND);
    mysqli_query($link, $sql_Req);
    echo('ok'); 
    break;

case 'video_comment_new':
//обновим счётчик для видео, с которого пришёл запрос
    mysqli_query($link, "UPDATE video_counters SET writed_counter = writed_counter + 1 WHERE video_id=".$data->object->video_id);
    if ($data->object->from_id=="-".$data->group_id) {//если это сообщение от сообщества
        if (preg_match("/Period[0-9]{1,3}/",$data->object->text)) { //если это указание счетчика
        $start_message = TRUE;
        preg_match_all('!\d+!', $data->object->text, $matches);
        $counter = (int)$matches[0][0];
         mysqli_query($link, "UPDATE video_counters SET range_counter = ".$counter." WHERE video_id=".$data->object->video_id);
        }
    }
    $query = mysqli_query($link, "SELECT * FROM video_counters WHERE video_id=".$data->object->video_id);
    $query_data = mysqli_fetch_assoc($query);
    extract($query_data);

    if ((((int)$writed_counter%(int)$range_counter)==0) or $start_message) {
        $query = mysqli_query($link, "SELECT * FROM flood_groups WHERE group_id=".$data->group_id);
        $query_data = mysqli_fetch_assoc($query);
        extract($query_data);
        $request = "https://api.vk.com/method/video.createComment?owner_id=-".$group_id."&video_id=".$data->object->video_id."&message=".$text."&from_group=1&access_token=".$usr_tocken."&v=5.124";
        file_put_contents("1A1A_requests.txt", $request, FILE_APPEND);
        $resp = file_get_contents($request);
        file_put_contents("err.log", date("Y-m-d H:i:s").'  >>  '.$resp."\n",FILE_APPEND);
        file_put_contents("requester.log", date("Y-m-d H:i:s").'  >>  New comment : video "'.$video_title.'"'."\n",FILE_APPEND);
    }


echo('ok'); 
break; 
}
?>
