CREATE TABLE `user` (
  `id` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `email` varchar(255),
  `username` varchar(255),
  `password` varchar(255),
  `post_number` varchar(255),
  `address` varchar(255),
  `address_detail` varchar(255),
  `phone_number` varchar(255),
  `level` integer,
  `created_at` timestamp
);

CREATE TABLE `product` (
  `id` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `first_category_id` integer,
  `second_category_id` integer,
  `price` integer,
  `name` varchar(255),
  `picUrl` varchar(255),
  `content` varchar(255),
  `status` integer COMMENT ' 1재고있음, 2대여중, 3소독중, 4판매완료',
  `grade` varchar(255) COMMENT '최상 상 중 하 최하',
  `created_at` TIMESTAMP
);

CREATE TABLE `first_category` (
  `id` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `first_category_name` varchar(255) COMMENT '용품 책 장난감'
);

CREATE TABLE `second_category` (
  `id` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `second_category_name` varchar(255) COMMENT '용품(유모차,카시트,침대,보행기),책(흑백 초점책, 동화책)',
  `first_category_id` integer
);

CREATE TABLE `board` (
  `id` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `code` integer COMMENT '1 공지 ,2 자주 묻는 질문, 3 1:1 질문, 4 상품질문',
  `user_id` INTEGER,
  `product_id` integer,
  `created_at` TIMESTAMP NOT NULL DEFAULT (NOW())
);

CREATE TABLE `review` (
  `id` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` integer,
  `product_id` integer,
  `content` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `reply` (
  `id` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` integer,
  `board_id` integer,
  `content` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `bookmark` (
  `id` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` integer,
  `product_id` integer,
  `created_at` timestamp
);

CREATE TABLE `cart` (
  `id` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` integer,
  `product_id` integer,
  `created_at` timestamp
);

CREATE TABLE `seller` (
  `id` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` integer,
  `product_id` integer,
  `created_at` timestamp
);

CREATE TABLE `sale` (
  `id` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` integer,
  `product_id` integer,
  `created_at` timestamp
);

CREATE TABLE `purchase` (
  `id` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` integer,
  `product_id` integer,
  `created_at` timestamp
);

CREATE TABLE `order` (
  `id` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` integer,
  `product_id` integer,
  `created_at` timestamp
);

CREATE TABLE `rent` (
  `id` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` integer,
  `product_id` integer,
  `start_day` timestamp COMMENT '대여시작일',
  `end_day` timestamp COMMENT '대여종료일',
  `created_at` timestamp
);

CREATE TABLE `rent_history` (
  `id` integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` integer,
  `product_id` integer,
  `start_day` timestamp COMMENT '대여시작일',
  `end_day` timestamp COMMENT '대여종료일',
  `created_at` timestamp
);

CREATE TABLE `pay` (
  `id` integer PRIMARY KEY NOT NULL AUTO_INCREMENT
);

ALTER TABLE `second_category` ADD FOREIGN KEY (`first_category_id`) REFERENCES `first_category` (`id`);

ALTER TABLE `product` ADD FOREIGN KEY (`first_category_id`) REFERENCES `first_category` (`id`);

ALTER TABLE `product` ADD FOREIGN KEY (`second_category_id`) REFERENCES `second_category` (`id`);

ALTER TABLE `bookmark` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `bookmark` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

ALTER TABLE `seller` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `seller` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

ALTER TABLE `cart` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `cart` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

ALTER TABLE `order` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `order` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

ALTER TABLE `board` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `reply` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `reply` ADD FOREIGN KEY (`board_id`) REFERENCES `board` (`id`);

ALTER TABLE `review` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `review` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

ALTER TABLE `rent` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `rent` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);
