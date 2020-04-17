--
-- Скрипт сгенерирован Devart dbForge Studio 2019 for MySQL, Версия 8.2.23.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 17.04.2020 19:52:02
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
-- Удалить таблицу `alisher_clients`
--
DROP TABLE IF EXISTS alisher_clients;

--
-- Удалить таблицу `alisher_payment_state`
--
DROP TABLE IF EXISTS alisher_payment_state;

--
-- Установка базы данных по умолчанию
--
USE alishersv;

--
-- Создать таблицу `alisher_payment_state`
--
CREATE TABLE alisher_payment_state (
  payment_state_id int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  PRIMARY KEY (payment_state_id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `alisher_clients`
--
CREATE TABLE alisher_clients (
  client_id int(11) UNSIGNED NOT NULL,
  surname varchar(255) NOT NULL,
  name varchar(50) NOT NULL,
  registration_date date NOT NULL,
  address varchar(255) NOT NULL,
  PRIMARY KEY (client_id)
)
ENGINE = INNODB,
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
  locality_id int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  PRIMARY KEY (locality_id)
)
ENGINE = INNODB,
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
-- Вывод данных для таблицы alisher_payment_state
--
-- Таблица alishersv.alisher_payment_state не содержит данных

-- 
-- Вывод данных для таблицы alisher_clients
--
-- Таблица alishersv.alisher_clients не содержит данных

-- 
-- Вывод данных для таблицы alisher_locality
--
-- Таблица alishersv.alisher_locality не содержит данных

-- 
-- Вывод данных для таблицы alisher_receipt
--
-- Таблица alishersv.alisher_receipt не содержит данных

-- 
-- Вывод данных для таблицы alisher_price
--
-- Таблица alishersv.alisher_price не содержит данных

-- 
-- Вывод данных для таблицы alisher_phone_calls
--
-- Таблица alishersv.alisher_phone_calls не содержит данных

-- 
-- Восстановить предыдущий режим SQL (SQL mode)
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;