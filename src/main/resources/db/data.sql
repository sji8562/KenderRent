INSERT INTO  user (  `email`, `password`, `username`, `phone_number`,level,`created_at`)
VALUES ( 'admin', '1234', '어드민', '010-0000-0000',2, now());
INSERT INTO  user (  `email`, `password`, `username`, `phone_number`,level,`created_at`)
VALUES ( 'ssar@nate.com', '1234', '쌀', '010-1212-1212',1, now());
INSERT INTO  user (  `email`, `password`, `username`, `phone_number`,level,`created_at`)
VALUES ( 'sin@nate.com', '1234', '사인', '010-1212-1212',1, now());
INSERT INTO  user (  `email`, `password`, `username`, `phone_number`,level,`created_at`)
VALUES ( 'cos@nate.com', '1234', '코사인', '010-1212-1212',1, now());
INSERT INTO  user (  `email`, `password`, `username`, `phone_number`,level,`created_at`)
VALUES ( 'vector@nate.com', '1234', '벡터', '010-1212-1212',1, now());
INSERT INTO  user (  `email`, `password`, `username`, `phone_number`,level,`created_at`)
VALUES ( 'zzang@nate.com', '1234', '짱', '010-1212-1212',1, now());
INSERT INTO  user (  `email`, `password`, `username`, `phone_number`,level,`created_at`)
VALUES ( 'fac@nate.com', '1234', '팩', '010-1212-1212',1, now());


INSERT INTO first_category
(first_category_name) VALUES ('빅사이즈 장난감'),
                             ('스몰사이즈 장난감'),
                             ('유아가전제품'),
                             ('유모차/카시트/아기띠'),
                             ('산모용품'),
                             ('그림책');

INSERT INTO second_category
(second_category_name, first_category_id) VALUES ('모빌', 1),
                                                 ('유아침대', 1),
                                                 ('바운서', 1),
                                                 ('쏘서/점프앤런', 1),
                                                 ('베베블럭/러닝홈', 1),
                                                 ('보행기/부스터', 1);

INSERT INTO second_category
(second_category_name, first_category_id) VALUES ('3~6개월', 2),
                                                 ('6~12개월', 2),
                                                 ('12~24개월', 2),
                                                 ('24개월~', 2);

INSERT INTO second_category
(second_category_name, first_category_id) VALUES ('살균기', 3),
                                                 ('기타', 3);

INSERT INTO second_category
(second_category_name, first_category_id) VALUES ('카시트', 4),
                                                 ('유모차', 4),
                                                 ('아기띠', 4);

INSERT INTO second_category
(second_category_name, first_category_id) VALUES ('유축기', 5);

INSERT INTO second_category
(second_category_name, first_category_id) VALUES ('촉감책', 6),
                                                 ('초점책', 6),
                                                 ('그림책', 6),
                                                 ('동화책', 6);


insert into product (first_category_id,second_category_id,price,name,pic_url,content,status,grade,created_at) 
values (1,2,45000,"다이치 디가드토들러 ISOFIX 오가닉브라운",null,"겁나 좋음",1,1,now());
insert into product (first_category_id,second_category_id,price,name,pic_url,content,status,grade,created_at) 
values (1,2,45000,"다이치 디가드토들러 ISOFIX 오가닉브라운",null,"겁나 좋음",2,1,now());
insert into product (first_category_id,second_category_id,price,name,pic_url,content,status,grade,created_at) 
values (1,2,45000,"다이치 디가드토들러 ISOFIX 오가닉브라운",null,"겁나 좋음",3,1,now());
insert into product (first_category_id,second_category_id,price,name,pic_url,content,status,grade,created_at) 
values (1,2,45000,"다이치 디가드토들러 ISOFIX 오가닉브라운",null,"겁나 좋음",1,1,now());
insert into product (first_category_id,second_category_id,price,name,pic_url,content,status,grade,created_at) 
values (1,2,45000,"다이치 디가드토들러 ISOFIX 오가닉브라운",null,"겁나 좋음",1,1,now());
insert into product (first_category_id,second_category_id,price,NAME,pic_url,content,status,grade,created_at) 
values (1,2,55000,"다이치 퍼스트세븐 터치픽스 ISOFIX 어반그레이",null,"겁나 좋음",1,1,now());
insert into product (first_category_id,second_category_id,price,name,pic_url,content,status,grade,created_at) 
values (1,2,55000,"다이치 퍼스트세븐 터치픽스 ISOFIX 어반그레이",null,"겁나 좋음",2,1,now());
insert into product (first_category_id,second_category_id,price,name,pic_url,content,status,grade,created_at) 
values (1,2,55000,"다이치 퍼스트세븐 터치픽스 ISOFIX 어반그레이",null,"겁나 좋음",3,1,now());
insert into product (first_category_id,second_category_id,price,name,pic_url,content,status,grade,created_at) 
values (1,2,55000,"다이치 퍼스트세븐 터치픽스 ISOFIX 어반그레이",null,"겁나 좋음",1,1,now());
insert into product (first_category_id,second_category_id,price,name,pic_url,content,status,grade,created_at) 
values (1,2,55000,"다이치 퍼스트세븐 터치픽스 ISOFIX 어반그레이",null,"겁나 좋음",1,1,now());
insert into cart(user_id,product_id,created_at) values (2,1,now());
insert into cart(user_id,product_id,created_at) values (2,4,now());
insert into cart(user_id,product_id,created_at) values (2,5,now());
insert into cart(user_id,product_id,created_at) values (3,1,now());
insert into cart(user_id,product_id,created_at) values (3,4,now());
insert into cart(user_id,product_id,created_at) values (4,1,NOW());
insert into cart(user_id,product_id,created_at) values (5,10,now());

insert into rent(user_id,product_id,start_day,end_day,created_at) values (2,2,"2023-12-01","2023-12-07","2023-11-29");
insert into rent(user_id,product_id,start_day,end_day,created_at) values (3,7,"2023-12-01","2023-12-07","2023-11-29");



