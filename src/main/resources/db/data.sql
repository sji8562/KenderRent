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


insert into first_category("first_category_name") values ("유아 안전 용품");
insert into first_category("first_category_name") values ("그림책");
insert into first_category("first_category_name") values ("가전 제품");
insert into first_category("first_category_name") values ("빅 사이즈 장난감");
insert into first_category("first_category_name") values ("스몰 사이즈 장난감");
insert into first_category("first_category_name") values ("산모용품");

insert into second_category("second_category_name","first_category_id") values ("유모차",1);
insert into second_category("second_category_name","first_category_id") values ("카시트",1);
insert into second_category("second_category_name","first_category_id") values ("아기띠",1);
insert into second_category("second_category_name","first_category_id") values ("생활습관 관련",2);
insert into second_category("second_category_name","first_category_id") values ("말·동요 관련",2);
insert into second_category("second_category_name","first_category_id") values ("상상력·창의력 관련",2);
insert into second_category("second_category_name","first_category_id") values ("개념·사물 관련",2);
insert into second_category("second_category_name","first_category_id") values ("살균기",3);
insert into second_category("second_category_name","first_category_id") values ("기타 제품",3);
insert into second_category("second_category_name","first_category_id") values ("모빌/유아침대",4);
insert into second_category("second_category_name","first_category_id") values ("바운서",4);
insert into second_category("second_category_name","first_category_id") values ("쏘서/점프앤런",4);
insert into second_category("second_category_name","first_category_id") values ("베베블럭/러닝홈",4);
insert into second_category("second_category_name","first_category_id") values ("보행기/부스터",4);
insert into second_category("second_category_name","first_category_id") values ("3개월부터 ~",5);
insert into second_category("second_category_name","first_category_id") values ("6개월부터 ~",5);
insert into second_category("second_category_name","first_category_id") values ("12개월부터 ~",5);
insert into second_category("second_category_name","first_category_id") values ("24개월부터 ~",5);
insert into second_category("second_category_name","first_category_id") values ("유축기",6);
insert into second_category("second_category_name","first_category_id") values ("마사지기",6);

insert into product ("first_category_id","second_category_id","price","name","pic_url","content","status","grade","created_at") values (1,2,45000,"다이치 디가드토들러 ISOFIX 오가닉브라운",null,"겁나 좋음",1,1,now());
insert into product ("first_category_id","second_category_id","price","name","pic_url","content","status","grade","created_at") values (1,2,45000,"다이치 디가드토들러 ISOFIX 오가닉브라운",null,"겁나 좋음",2,1,now());
insert into product ("first_category_id","second_category_id","price","name","pic_url","content","status","grade","created_at") values (1,2,45000,"다이치 디가드토들러 ISOFIX 오가닉브라운",null,"겁나 좋음",3,1,now());
insert into product ("first_category_id","second_category_id","price","name","pic_url","content","status","grade","created_at") values (1,2,45000,"다이치 디가드토들러 ISOFIX 오가닉브라운",null,"겁나 좋음",1,1,now());
insert into product ("first_category_id","second_category_id","price","name","pic_url","content","status","grade","created_at") values (1,2,45000,"다이치 디가드토들러 ISOFIX 오가닉브라운",null,"겁나 좋음",1,1,now());
insert into product ("first_category_id","second_category_id","price","name","pic_url","content","status","grade","created_at") values (1,2,55000,"다이치 퍼스트세븐 터치픽스 ISOFIX 어반그레이",null,"겁나 좋음",1,1,now());
insert into product ("first_category_id","second_category_id","price","name","pic_url","content","status","grade","created_at") values (1,2,55000,"다이치 퍼스트세븐 터치픽스 ISOFIX 어반그레이",null,"겁나 좋음",2,1,now());
insert into product ("first_category_id","second_category_id","price","name","pic_url","content","status","grade","created_at") values (1,2,55000,"다이치 퍼스트세븐 터치픽스 ISOFIX 어반그레이",null,"겁나 좋음",3,1,now());
insert into product ("first_category_id","second_category_id","price","name","pic_url","content","status","grade","created_at") values (1,2,55000,"다이치 퍼스트세븐 터치픽스 ISOFIX 어반그레이",null,"겁나 좋음",1,1,now());
insert into product ("first_category_id","second_category_id","price","name","pic_url","content","status","grade","created_at") values (1,2,55000,"다이치 퍼스트세븐 터치픽스 ISOFIX 어반그레이",null,"겁나 좋음",1,1,now());

insert into cart(user_id,product_id,created_at) values (2,1,now());
insert into cart(user_id,product_id,created_at) values (2,4,now());
insert into cart(user_id,product_id,created_at) values (2,5,now());
insert into cart(user_id,product_id,created_at) values (3,1,now());
insert into cart(user_id,product_id,created_at) values (3,4,now());
insert into cart(user_id,product_id,created_at) values (4,1,now());
insert into cart(user_id,product_id,created_at) values (5,10,now());

insert into rent(user_id,product_id,start_day,end_day,created_at) values (2,2,2023-12-01,2023-12-07,2023-11-29);
insert into rent(user_id,product_id,start_day,end_day,created_at) values (3,7,2023-12-01,2023-12-07,2023-11-29);







