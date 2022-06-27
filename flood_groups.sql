-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 27 2022 г., 12:53
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
-- Структура таблицы `flood_groups`
--

CREATE TABLE `flood_groups` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `confirmation_tocken` text NOT NULL,
  `text` text CHARACTER SET utf8 NOT NULL,
  `usr_tocken` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `flood_groups`
--

INSERT INTO `flood_groups` (`id`, `group_id`, `confirmation_tocken`, `text`, `usr_tocken`) VALUES
(1, 100891760, '58be1524', 'Поддержать%20стрим:%20Сбербанк%20-%204276%204900%203303%201024%20QIWI%20Карта%20-%204693%209575%205453%200233%20Все%20матчи%20NHL%20@vip_onthefly', '******************USERBOT TOCKEN***********'),
(2, 182977255, 'd6983407', 'Поддержать%20стрим:%20Сбербанк%20-%204276%204900%203303%201024%20QIWI%20Карта%20-%204693%209575%205453%200233%20Все%20матчи%20NHL%20@vip_onthefly', '**********************USERBOT TOCKEN*******');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `flood_groups`
--
ALTER TABLE `flood_groups`
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `flood_groups`
--
ALTER TABLE `flood_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
