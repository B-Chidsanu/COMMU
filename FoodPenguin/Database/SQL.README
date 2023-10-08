-- สร้างฐานข้อมูล FoodPenguinAPI
CREATE DATABASE FoodPenguinAPI;

-- เลือกฐานข้อมูลที่สร้างเป็นฐานข้อมูลที่ใช้งาน
USE FoodPenguinAPI;

-- สร้างตาราง user
CREATE TABLE user (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    firstname VARCHAR(255),
    lastname VARCHAR(255),
    nickname VARCHAR(255),
    pay_img VARCHAR(255),
    profile_img VARCHAR(255)
);

-- สร้างตาราง location
CREATE TABLE location (
    loc_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

-- สร้างตาราง market
CREATE TABLE market (
    market_id INT PRIMARY KEY AUTO_INCREMENT,
    loc_id INT,
    name VARCHAR(255) NOT NULL,
    FOREIGN KEY (loc_id) REFERENCES location (loc_id)
);

-- สร้างตาราง receive_post
CREATE TABLE receive_post (
    recvp_id INT PRIMARY KEY AUTO_INCREMENT,
    loc_id INT,
    user_id INT,
    `desc` TEXT,
    `max` INT,
    time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    allowJoin BOOLEAN,
    FOREIGN KEY (loc_id) REFERENCES location (loc_id),
    FOREIGN KEY (user_id) REFERENCES user (user_id)
);

-- สร้างตาราง receive_loc
CREATE TABLE receive_loc (
    recvp_id INT,
    market_id INT,
    FOREIGN KEY (recvp_id) REFERENCES receive_post (recvp_id),
    FOREIGN KEY (market_id) REFERENCES market (market_id)
);

-- สร้างตาราง order_post
CREATE TABLE order_post (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    loc_id INT,
    market_id INT,
    remark TEXT,
    time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user (user_id),
    FOREIGN KEY (loc_id) REFERENCES location (loc_id),
    FOREIGN KEY (market_id) REFERENCES market (market_id)
);

-- สร้างตาราง food
CREATE TABLE food (
    food_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    amount INT,
    order_id INT,
    FOREIGN KEY (order_id) REFERENCES order_post (order_id)
);

-- สร้างตาราง process_order
CREATE TABLE process_order (
    order_id INT,
    recvp_id INT,
    `status` INT,
    pay_img VARCHAR(255),
    finish BOOLEAN,
    FOREIGN KEY (order_id) REFERENCES order_post (order_id),
    FOREIGN KEY (recvp_id) REFERENCES receive_post (recvp_id)
);

-- สร้างตาราง process_food
CREATE TABLE process_food (
    food_id INT PRIMARY KEY,
    order_id INT,
    `price` DECIMAL(10, 2),
    `remark` TEXT,
    finish BOOLEAN,
    FOREIGN KEY (order_id) REFERENCES order_post (order_id)
);
