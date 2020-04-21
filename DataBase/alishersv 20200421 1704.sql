--
-- Скрипт сгенерирован Devart dbForge Studio 2019 for MySQL, Версия 8.2.23.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 21.04.2020 17:04:04
-- Версия сервера: 5.5.5-10.3.13-MariaDB-log
-- Версия клиента: 4.1
--

-- 
-- Отключение внешних ключей
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Установить режим SQL (SQL mode)
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Установка кодировки, с использованием которой клиент будет посылать запросы на сервер
--
SET NAMES 'utf8';

--
-- Установка базы данных по умолчанию
--
USE alishersv;

--
-- Удалить таблицу `alisher_phone_calls`
--
DROP TABLE IF EXISTS alisher_phone_calls;

--
-- Удалить таблицу `alisher_price`
--
DROP TABLE IF EXISTS alisher_price;

--
-- Удалить таблицу `alisher_locality`
--
DROP TABLE IF EXISTS alisher_locality;

--
-- Удалить таблицу `alisher_receipt`
--
DROP TABLE IF EXISTS alisher_receipt;

--
-- Удалить таблицу `alisher_payment_state`
--
DROP TABLE IF EXISTS alisher_payment_state;

--
-- Удалить таблицу `alisher_clients`
--
DROP TABLE IF EXISTS alisher_clients;

--
-- Удалить таблицу `alisher_oper`
--
DROP TABLE IF EXISTS alisher_oper;

--
-- Установка базы данных по умолчанию
--
USE alishersv;

--
-- Создать таблицу `alisher_oper`
--
CREATE TABLE alisher_oper (
  oper_id int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  oper_name varchar(255) NOT NULL,
  PRIMARY KEY (oper_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 13,
AVG_ROW_LENGTH = 1489,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `alisher_clients`
--
CREATE TABLE alisher_clients (
  client_id int(11) UNSIGNED NOT NULL,
  client_name varchar(50) NOT NULL,
  registration_date date NOT NULL,
  address varchar(255) NOT NULL,
  oper_id int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (client_id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 2730,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE alisher_clients
ADD CONSTRAINT FK_alisher_clients_alisher_oper_oper_id FOREIGN KEY (oper_id)
REFERENCES alisher_oper (oper_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать таблицу `alisher_payment_state`
--
CREATE TABLE alisher_payment_state (
  payment_state_id int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  PRIMARY KEY (payment_state_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 6,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `alisher_receipt`
--
CREATE TABLE alisher_receipt (
  receipt_id int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  client_id int(11) UNSIGNED NOT NULL,
  payment_state_id int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (receipt_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 6,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE alisher_receipt
ADD CONSTRAINT FK_alisher_receipt_alisher_clients_client_id FOREIGN KEY (client_id)
REFERENCES alisher_clients (client_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать внешний ключ
--
ALTER TABLE alisher_receipt
ADD CONSTRAINT FK_alisher_receipt_alisher_payment_state_payment_state_id FOREIGN KEY (payment_state_id)
REFERENCES alisher_payment_state (payment_state_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать таблицу `alisher_locality`
--
CREATE TABLE alisher_locality (
  locality_id int(11) UNSIGNED NOT NULL,
  locality_name varchar(50) NOT NULL,
  PRIMARY KEY (locality_id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `alisher_price`
--
CREATE TABLE alisher_price (
  price_id int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  locality_id int(11) UNSIGNED NOT NULL,
  cost decimal(19, 4) NOT NULL,
  PRIMARY KEY (price_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 7,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE alisher_price
ADD CONSTRAINT FK_alisher_price_alisher_locality_locality_id FOREIGN KEY (locality_id)
REFERENCES alisher_locality (locality_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать таблицу `alisher_phone_calls`
--
CREATE TABLE alisher_phone_calls (
  call_id int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  price_id int(11) UNSIGNED NOT NULL,
  sub_num int(11) NOT NULL,
  receipt_id int(11) UNSIGNED NOT NULL,
  call_date date NOT NULL,
  call_start_time time NOT NULL,
  call_end_time time NOT NULL,
  PRIMARY KEY (call_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 10,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE alisher_phone_calls
ADD CONSTRAINT FK_alisher_phone_calls_alisher_price_price_id FOREIGN KEY (price_id)
REFERENCES alisher_price (price_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать внешний ключ
--
ALTER TABLE alisher_phone_calls
ADD CONSTRAINT FK_alisher_phone_calls_alisher_receipt_receipt_id FOREIGN KEY (receipt_id)
REFERENCES alisher_receipt (receipt_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Вывод данных для таблицы alisher_oper
--
INSERT INTO alisher_oper VALUES
(1, 'Altel'),
(2, 'Beeline'),
(3, 'Active'),
(4, 'Kcell'),
(5, 'Мегафон'),
(6, 'МТС'),
(7, 'Ростелеком'),
(8, 'Казахтелеком'),
(9, 'T-Mobile'),
(10, 'Smart'),
(11, 'Tele-2');

-- 
-- Вывод данных для таблицы alisher_payment_state
--
INSERT INTO alisher_payment_state VALUES
(1, 'Оплачено'),
(2, 'Не оплачено'),
(3, 'Оплачено'),
(4, 'Оплачено'),
(5, 'Не оплачено');

-- 
-- Вывод данных для таблицы alisher_clients
--
INSERT INTO alisher_clients VALUES
(1, 'Дорофеев Эдуард', '2005-04-01', '428004, г. Бобров, ул. Друскеникский пер, дом 60, квартира 309', 1),
(2, 'Сергеев Иосиф', '2016-01-05', '102078, г. Кинешма, ул. Полевая, дом 34, квартира 470', 2),
(3, 'Васнецова Леонилла', '2015-04-28', '656050, г. Полярные Зори, ул. Ланинский пер, дом 81, квартира 314', 3),
(4, 'Есенов Жарас', '2003-06-25', '446337, г. Глушково, ул. Киевская, дом 98, квартира 68', 4),
(5, 'Лэнгдон Роберт', '2006-02-25', '195  Reel Avenue, Clayton, New Mexico', 5);

-- 
-- Вывод данных для таблицы alisher_locality
--
INSERT INTO alisher_locality VALUES
(1, 'Семипалатинск'),
(2, 'Усть-Каменогорск'),
(3, 'Уральск'),
(4, 'Алматы'),
(5, 'Нур-Султан');

-- 
-- Вывод данных для таблицы alisher_receipt
--
INSERT INTO alisher_receipt VALUES
(1, 4, 2),
(2, 2, 5),
(3, 3, 4),
(4, 5, 2),
(5, 1, 1);

-- 
-- Вывод данных для таблицы alisher_price
--
INSERT INTO alisher_price VALUES
(1, 1, 50.0000),
(3, 3, 60.0000),
(4, 4, 100.0000),
(5, 5, 120.0000),
(6, 2, 55.0000);

-- 
-- Вывод данных для таблицы alisher_phone_calls
--
INSERT INTO alisher_phone_calls VALUES
(1, 4, 870455563, 5, '2020-04-15', '20:00:00', '21:05:00'),
(6, 6, 895222222, 2, '2020-04-01', '08:45:07', '08:48:54'),
(7, 1, 885800460, 1, '2020-04-06', '04:52:56', '05:28:56'),
(8, 3, 878010250, 4, '2001-02-08', '07:08:06', '10:20:25'),
(9, 5, 804004404, 4, '1985-01-05', '02:20:54', '08:45:22');

-- 
-- Восстановить предыдущий режим SQL (SQL mode)
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;