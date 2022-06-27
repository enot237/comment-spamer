-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 27 2022 г., 12:54
-- Версия сервера: 5.7.22-22-log
-- Версия PHP: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `a257970_1`
--

-- --------------------------------------------------------

--
-- Структура таблицы `video_counters`
--

CREATE TABLE `video_counters` (
  `groupid_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `video_title` text NOT NULL,
  `writed_counter` int(11) NOT NULL,
  `range_counter` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `video_counters`
--

INSERT INTO `video_counters` (`groupid_id`, `video_id`, `video_title`, `writed_counter`, `range_counter`) VALUES
(2, 456239034, 'Live: testgroup237', 58, 3),
(0, 456254450, 'Шайба Тарасенко', 0, 0),
(0, 456242258, 'Live: 36 студия | Русские комментарии NFL,NHL,NBA,MLB', 3739, 0),
(0, 456242259, 'Live: 36 студия | Русские комментарии NFL,NHL,NBA,MLB', 5267, 0),
(0, 456242260, 'Live: 36 студия | Русские комментарии NFL,NHL,NBA,MLB', 1008, 0),
(1, 456240638, 'Live: OnTheFly Hockey ?', 121, 10),
(0, 456254451, 'Янг с логотипа', 0, 0),
(0, 456254452, 'Обмен трёхочковыми', 0, 0),
(0, 456242261, 'Live: 36 студия | Русские комментарии NFL,NHL,NBA,MLB', 438, 0),
(0, 456242262, 'Live: 36 студия | Русские комментарии NFL,NHL,NBA,MLB', 174, 0),
(0, 456242252, 'Live: 36 студия | Русские комментарии NFL,NHL,NBA,MLB', 0, 0),
(0, 456242263, 'Live: 36 студия | Русские комментарии NFL,NHL,NBA,MLB', 1887, 0),
(0, 456242432, 'Live: 36 студия | Русские комментарии NFL,NHL,NBA,MLB', 10044, 0),
(0, 456242433, 'Live: 36 студия | Русские комментарии NFL,NHL,NBA,MLB', 168, 0),
(0, 456242434, 'Live: 36 студия | Русские комментарии NFL,NHL,NBA,MLB', 1185, 0),
(1, 456240885, 'Live: OnTheFly Hockey ?', 226, 15),
(1, 456240889, 'Live: OnTheFly Hockey ?', 393, 15),
(0, 456242435, 'Live: 36 студия | Русские комментарии NFL,NHL,NBA,MLB', 8102, 0),
(0, 456254531, 'Шайба Палата', 0, 0),
(0, 456242436, 'Live: 36 студия | Русские комментарии NFL,NHL,NBA,MLB', 198, 0),
(0, 456242437, 'Live: 36 студия | Русские комментарии NFL,NHL,NBA,MLB', 10689, 0),
(0, 456242438, 'Live: 36 студия | Русские комментарии NFL,NHL,NBA,MLB', 354, 0),
(1, 456240890, 'Live: OnTheFly Hockey ?', 559, 15);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
