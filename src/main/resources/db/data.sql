INSERT INTO  user (  `email`, `password`, `user_name`, `phone_number`,level,`created_at`)
VALUES ( 'admin', '1234', '어드민', '010-0000-0000',2, now());
INSERT INTO  user (  `email`, `password`, `user_name`, `phone_number`,level,`created_at`)
VALUES ( 'ssar@nate.com', '1234', '쌀', '010-1212-1212',1, now());
INSERT INTO  user (  `email`, `password`, `user_name`, `phone_number`,level,`created_at`)
VALUES ( 'sin@nate.com', '1234', '사인', '010-1212-1212',1, now());
INSERT INTO  user (  `email`, `password`, `user_name`, `phone_number`,level,`created_at`)
VALUES ( 'cos@nate.com', '1234', '코사인', '010-1212-1212',1, now());
INSERT INTO  user (  `email`, `password`, `user_name`, `phone_number`,level,`created_at`)
VALUES ( 'vector@nate.com', '1234', '벡터', '010-1212-1212',1, now());
INSERT INTO  user (  `email`, `password`, `user_name`, `phone_number`,level,`created_at`)
VALUES ( 'zzang@nate.com', '1234', '짱', '010-1212-1212',1, now());
INSERT INTO  user (  `email`, `password`, `user_name`, `phone_number`,level,`created_at`)
VALUES ( 'fac@nate.com', '1234', '팩', '010-1212-1212',1, now());


INSERT INTO first_category 
(code, first_category_name) VALUES ( 1, '빅사이즈 장난감'),
                            ( 1, '스몰사이즈 장난감'),
                            ( 1, '유아가전제품'),
                            ( 1, '유모차/카시트/아기띠'),
                            ( 1, '산모용품'),
                            ( 1, '그림책'),
									 ( 2, '유아장난감'),
                            ( 2, '유아의류'),
                            ( 2, '유아식품'),
                            ( 2, '유아화장품'),
                            ( 2, '유아위생용품'),
                            ( 2, '유아안전용품');

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
INSERT INTO second_category 
(second_category_name, first_category_id) VALUES ('장난감', 7),
                                                 ('바운서', 7);

INSERT INTO second_category 
(second_category_name, first_category_id) VALUES ('의류', 8),
                                                 ('힙시트', 8),
                                                 ('슬링', 8);

INSERT INTO second_category 
(second_category_name, first_category_id) VALUES ('유축기', 9),
                                                 ('수유용품', 9);

INSERT INTO second_category 
(second_category_name, first_category_id) VALUES ('화장품', 10);

INSERT INTO second_category 
(second_category_name, first_category_id) VALUES ('살균기', 11),
                                                 ('세정제', 11);

INSERT INTO second_category 
(second_category_name, first_category_id) VALUES ('카시트', 12),
                                                 ('유모차', 12);

insert into product (first_category_id,second_category_id,price,name,pic_url,content,status,grade,created_at) values (1,2,45000,"다이치 디가드토들러 ISOFIX 오가닉브라운","http://www.lovelybaby.kr/data/item/1478518421/thumb-002002000054_500x500.jpg","겁나 좋음",1,"최상",now());
insert into product (first_category_id,second_category_id,price,name,pic_url,content,status,grade,created_at) values (1,2,45000,"다이치 디가드토들러 ISOFIX 오가닉브라운","http://www.lovelybaby.kr/data/item/1478518421/thumb-002002000054_500x500.jpg","겁나 좋음",2,"최상",now());
insert into product (first_category_id,second_category_id,price,name,pic_url,content,status,grade,created_at) values (1,2,45000,"다이치 디가드토들러 ISOFIX 오가닉브라운","http://www.lovelybaby.kr/data/item/1478518421/thumb-002002000054_500x500.jpg","겁나 좋음",3,"최상",now());
insert into product (first_category_id,second_category_id,price,name,pic_url,content,status,grade,created_at) values (1,2,45000,"다이치 디가드토들러 ISOFIX 오가닉브라운","http://www.lovelybaby.kr/data/item/1478518421/thumb-002002000054_500x500.jpg","겁나 좋음",1,"최상",now());
insert into product (first_category_id,second_category_id,price,name,pic_url,content,status,grade,created_at) values (1,2,45000,"다이치 디가드토들러 ISOFIX 오가닉브라운","http://www.lovelybaby.kr/data/item/1478518421/thumb-002002000054_500x500.jpg","겁나 좋음",1,"최상",now());
insert into product (first_category_id,second_category_id,price,NAME,pic_url,content,status,grade,created_at) values (1,2,55000,"다이치 퍼스트세븐 터치픽스 ISOFIX 어반그레이","http://www.lovelybaby.kr/data/item/1475322665/thumb-002002000076_358x358.jpg","겁나 좋음",1,"최상",now());
insert into product (first_category_id,second_category_id,price,name,pic_url,content,status,grade,created_at) values (1,2,55000,"다이치 퍼스트세븐 터치픽스 ISOFIX 어반그레이","http://www.lovelybaby.kr/data/item/1475322665/thumb-002002000076_358x358.jpg","겁나 좋음",2,"최상",now());
insert into product (first_category_id,second_category_id,price,name,pic_url,content,status,grade,created_at) values (1,2,55000,"다이치 퍼스트세븐 터치픽스 ISOFIX 어반그레이","http://www.lovelybaby.kr/data/item/1475322665/thumb-002002000076_358x358.jpg","겁나 좋음",3,"최상",now());
insert into product (first_category_id,second_category_id,price,name,pic_url,content,status,grade,created_at) values (1,2,55000,"다이치 퍼스트세븐 터치픽스 ISOFIX 어반그레이","http://www.lovelybaby.kr/data/item/1475322665/thumb-002002000076_358x358.jpg","겁나 좋음",1,"최상",now());
insert into product (first_category_id,second_category_id,price,name,pic_url,content,status,grade,created_at) values (1,2,55000,"다이치 퍼스트세븐 터치픽스 ISOFIX 어반그레이","http://www.lovelybaby.kr/data/item/1475322665/thumb-002002000076_358x358.jpg","겁나 좋음",1,"최상",now());
insert into cart(user_id,product_id,created_at) values (2,1,now());
insert into cart(user_id,product_id,created_at) values (2,4,now());
insert into cart(user_id,product_id,created_at) values (2,5,now());
insert into cart(user_id,product_id,created_at) values (3,1,now());
insert into cart(user_id,product_id,created_at) values (3,4,now());
insert into cart(user_id,product_id,created_at) values (4,1,NOW());
insert into cart(user_id,product_id,created_at) values (5,10,now());

insert into rent(user_id,product_id,status,post_number,address,address_detail,start_day,end_day,created_at) values (2,2,2,"15350","서울시","어딘가","2023-12-01","2023-12-07","2023-11-29");
insert into rent(user_id,product_id,status,post_number,address,address_detail,start_day,end_day,created_at) values (3,7,2,"15351","서울시","어딘가","2023-12-01","2023-12-07","2023-11-29");
insert into rent(user_id,product_id,status,post_number,address,address_detail,start_day,end_day,created_at) VALUES (4,1,1,"15352","서울시","어딘가","2023-12-11","2024-12-11","2023-11-29");
insert into rent(user_id,product_id,status,post_number,address,address_detail,start_day,end_day,created_at) values (2,2,2,"15353","서울시","어딘가","2023-12-01","2023-12-07","2023-11-29");
insert into rent(user_id,product_id,status,post_number,address,address_detail,start_day,end_day,created_at) values (3,7,2,"15354","서울시","어딘가","2023-12-01","2023-12-07","2023-11-29");
insert into rent(user_id,product_id,status,post_number,address,address_detail,start_day,end_day,created_at) VALUES (4,1,1,"15355","서울시","어딘가","2023-12-11","2024-12-11","2023-11-29");
insert into rent(user_id,product_id,status,post_number,address,address_detail,start_day,end_day,created_at) values (2,2,2,"15356","강원도","어딘가","2023-12-01","2023-12-07","2023-11-29");
insert into rent(user_id,product_id,status,post_number,address,address_detail,start_day,end_day,created_at) values (3,7,2,"15357","경기도","어딘가","2023-12-01","2023-12-07","2023-11-29");
insert into rent(user_id,product_id,status,post_number,address,address_detail,start_day,end_day,created_at) VALUES (4,1,1,"15380","경기도","어딘가","2023-12-11","2024-12-11","2023-11-29");
insert into rent(user_id,product_id,status,post_number,address,address_detail,start_day,end_day,created_at) values (2,2,2,"15310","울산시","어딘가","2023-12-01","2023-12-07","2023-11-29");
insert into rent(user_id,product_id,status,post_number,address,address_detail,start_day,end_day,created_at) values (3,7,2,"55350","부산시","어딘가","2023-12-01","2023-12-07","2023-11-29");
insert into rent(user_id,product_id,status,post_number,address,address_detail,start_day,end_day,created_at) VALUES (4,1,1,"95350","부산시","어딘가","2023-12-11","2024-12-11","2023-11-29");

INSERT INTO sale ( user_id,product_id,post_number,address,address_detail,STATUS,created_at) VALUES
(2,1,"15350","서울시","어딘가",1,NOW())
,(1,5,"15350","서울시","어딘가",1,NOW())
,(6,5,"15350","서울시","어딘가",4,NOW())
,(3,2,"59202","부산","어딘가",1,Now());

INSERT INTO purchase ( user_id,product_id,post_number,address,address_detail,STATUS,created_at) VALUES
(2,1,"59202","부산","어딘가",1,NOW()),
(3,5,"59202","부산","어딘가",1,NOW()),
(6,5,"59202","부산","어딘가",4,NOW());

insert into board (user_id, product_id,  code, title, content,created_at) values(1,null,1,"공지사항 테스트1","공지사항 테스트 내용",NOW());
insert into board (user_id, product_id,  code, title, content,created_at) values(1,null,1,"공지사항 테스트2","공지사항 테스트 내용",NOW());
insert into board (user_id, product_id,  CODE, title, content,created_at) values(1,null,1,"공지사항 테스트3","공지사항 테스트 내용",NOW());
insert into board (user_id, product_id,  code, title, content,created_at) values(1,null,1,"공지사항 테스트4","공지사항 테스트 내용",NOW());
insert into board (user_id, product_id,  code, title, content,created_at) values(1,null,1,"공지사항 테스트5","공지사항 테스트 내용",NOW());
insert into board (user_id, product_id,  code, title, content,created_at) values(1,null,1,"공지사항 테스트6","공지사항 테스트 내용",NOW());
insert into board (user_id, product_id,  code, title, content,created_at) values(4,null,3,"질user문1","질문테스트",NOW());
insert into board (user_id, product_id,  code, title, content,created_at) values(3,null,3,"질문1","질문테스트",NOW());
insert into board (user_id, product_id,  code, title, content,created_at) values(2,null,3,"질문1","질문테스트",NOW());