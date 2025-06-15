-- 建立資料庫並設定自動遞增屬性
CREATE DATABASE IF NOT EXISTS eatfast_db;
USE eatfast_db;

DROP TABLE IF EXISTS store;

-- 設定自增主鍵起始值與遞增量
SET auto_increment_offset = 1;
SET auto_increment_increment = 1;

-- 建立門市table
CREATE TABLE store (
store_id	INT	 NOT NULL AUTO_INCREMENT COMMENT'門市編號',
store_name	VARCHAR(10)	NOT NULL COMMENT'門市名稱',
store_loc	VARCHAR(50)	NOT NULL COMMENT'門市地點',
store_phone	VARCHAR(10)	NOT NULL COMMENT'門市電話',
store_time	VARCHAR(50)	NOT NULL COMMENT'營業時間',
store_status	VARCHAR(10)	NOT NULL COMMENT'營業狀態',
create_time	 TIMESTAMP	DEFAULT CURRENT_TIMESTAMP COMMENT'建立時間',
CONSTRAINT store_id_pk PRIMARY KEY (store_id));

-- 新增門市資料

INSERT INTO store (
  store_name, store_loc, store_phone, store_time, store_status
) VALUES

('一號店','台北市中山區南京東路三段219號4F','0227120589','平日05:30~14:00 / 假日 07:00~16:00 周三公休','營業中'),
('二號店','桃園市中壢區復興路46號9樓','034251108','平日05:30~13:00 / 假日 07:00~18:00 周一公休','休息中');