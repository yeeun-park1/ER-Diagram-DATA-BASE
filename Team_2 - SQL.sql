-- 유저 테이블
CREATE TABLE user_tbl(
	unum VARCHAR(5) PRIMARY KEY,
	ulast VARCHAR(10) NOT NULL,
	ufirst VARCHAR(10) NOT NULL,
	uage INT NOT NULL,
	uphone VARCHAR(12) NOT NULL,
	umail VARCHAR(20) NULL,
	usocial1 INT NOT NULL,
	usocial2 INT NOT NULL,
	uppnum VARCHAR(10) NOT NULL,
	udriver INT NOT NULL
);

INSERT INTO user_tbl
VALUES ('u001', 'Han', 'Junhee', 21, '01045455445', 'junhee@naver.com', 030504, 4211212, 'M1212124', 2323233);
INSERT INTO user_tbl
VALUES ('u002', 'Kim', 'Jaehui', 25, '01012321434', 'jaehui@naver.com', 990510, 1411212, 'M145545', 4536451);
INSERT INTO user_tbl
VALUES ('u003', 'Lim', 'Daehyun', 22, '01045181354', 'daehyun@naver.com', 020408, 3411212, 'M1213414', 4564564);
INSERT INTO user_tbl
VALUES ('u004', 'Jang', 'Jaeyoung', 23, '01054521364', 'jaeyoung@naver.com', 010616, 3411212, 'M145654', 4564563);
INSERT INTO user_tbl
VALUES ('u005', 'Park', 'Yeeun', 27, '01078954264', 'yeeun@naver.com', 970908, 2411212, 'M1245624', 4564545);

-- 공항 테이블
CREATE TABLE airport_tbl(
	apnum VARCHAR(5) PRIMARY KEY,
    apname VARCHAR(20) NOT NULL,
    apnumber VARCHAR(14) NOT NULL,
    apmail VARCHAR(20) NULL,
    applace VARCHAR(20) NOT NULL
);

INSERT INTO airport_tbl
VALUES('ap001', 'IncheonAirplain', '0325999765', 'incheon@naver.com', '인천공항');

INSERT INTO airport_tbl
VALUES('ap002', 'GimpoAirplain', '0315999743', 'gimpo@naver.com', '김포공항');

INSERT INTO airport_tbl
VALUES('ap003', 'SoeulAirplains', '025999715', 'souel@naver.com', '서울공항');

INSERT INTO airport_tbl
VALUES('ap004', 'BusanAirplains', '0515999735', 'busan@naver.com', '부산공항');

INSERT INTO airport_tbl
VALUES('ap005', 'JejuAirplains', '0645999755', 'jeju@naver.com', '제주공항');

-- 항공사 테이블
CREATE TABLE airline_tbl(
	alnum VARCHAR(5) PRIMARY KEY,
    alname VARCHAR(20) NOT NULL,
    alnumber VARCHAR(14) NOT NULL,
    almail VARCHAR(20) NULL,
    apnum VARCHAR(5),
    FOREIGN KEY (apnum) REFERENCES airport_tbl (apnum)
    ON UPDATE CASCADE ON DELETE SET NULL
);

INSERT INTO airline_tbl
VALUES('al001', 'chinaAirplain', '0325661234', 'scuber1@naver.com', 'ap001');

INSERT INTO airline_tbl
VALUES('al002', 'rusiaAirplain', '0325551237', 'scuber2@naver.com', 'ap005');

INSERT INTO airline_tbl
VALUES('al003', 'franceAirplain', '0325661234', 'scuber3@naver.com', 'ap005' );

INSERT INTO airline_tbl
VALUES('al004', 'JapanAirplain', '0645661231', 'scuber4@naver.com', 'ap005' );

INSERT INTO airline_tbl
VALUES('al005', 'BusanAirplain', '025661233', 'scuber5@naver.com', 'ap005');

-- 항공예매 테이블
CREATE TABLE airticket_tbl(
	atnum VARCHAR(5) PRIMARY KEY,
    atdate DATE NOT NULL,
    atstart VARCHAR(10) NOT NULL,
    atend VARCHAR(10) NOT NULL,
    atbtime VARCHAR(11) NOT NULL,
    atbplace VARCHAR(20) NOT NULL,
    atsnum VARCHAR(20) NOT NULL,
    atptime VARCHAR(11) NOT NULL,
    unum VARCHAR(5),
    apnum VARCHAR(5),
    alnum VARCHAR(5),
    FOREIGN KEY (unum) REFERENCES user_tbl (unum)
    ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (apnum) REFERENCES airport_tbl (apnum)
    ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (alnum) REFERENCES airline_tbl (alnum)
    ON UPDATE CASCADE ON DELETE SET NULL
);

INSERT INTO airticket_tbl
VALUES ('at001', '2023-09-25', '대한민국', '일본','16시00분', '서울','A1', '2시간', 'u001', 'ap001', 'al001');
INSERT INTO airticket_tbl
VALUES ('at002', '2023-10-04', '대한민국', '미국','14시00분', '인천','A3', '8시간', 'u002', 'ap002', 'al002');
INSERT INTO airticket_tbl
VALUES ('at003', '2023-10-17', '대한민국', '사우디아라비아','12시00분', '부산','A3', '6시간', 'u003', 'ap003', 'al003');
INSERT INTO airticket_tbl
VALUES ('at004', '2023-12-21', '대한민국', '중국','17시00분', '부산','A3', '6시간', 'u003', 'ap003', 'al003');
INSERT INTO airticket_tbl
VALUES ('at005', '2023-11-18', '대한민국', '대만','19시00분', '부산','A3', '6시간', 'u003', 'ap003', 'al003');

-- 호텔 테이블
CREATE TABLE hotel_tbl(
	hnum VARCHAR(5) PRIMARY KEY,
    hname VARCHAR(20) NOT NULL,
    haddress VARCHAR(20) NOT NULL,
    hpnum INT NOT NULL
);

INSERT INTO hotel_tbl
VALUES ('h001', '시그니엘', '서울', 023337777);
INSERT INTO hotel_tbl
VALUES ('h002', '신라', '경기', 024539257);
INSERT INTO hotel_tbl
VALUES ('h003', '라마다', '인천', 0323233647);
INSERT INTO hotel_tbl
VALUES ('h004', '조선', '서울', 0323223537);
INSERT INTO hotel_tbl
VALUES ('h005', '롯데', '서울', 0323354147);

-- 호텔 객실 정보 테이블
CREATE TABLE hroom_tbl (
	hroom VARCHAR(5) PRIMARY KEY,
    hname VARCHAR(20) NOT NULL,
    hfloor VARCHAR(10) NULL,
    hprice INT NOT NULL,
    hbed VARCHAR(10) NULL,
    htype VARCHAR(10) NULL,
    hnum VARCHAR(5),
    FOREIGN KEY (hnum) REFERENCES hotel_tbl (hnum)
    ON UPDATE CASCADE ON DELETE SET NULL
);

INSERT INTO hroom_tbl
VALUES ('hr001', '시그니엘','10층',100000000, '킹', '럭셔리', 'h001');
INSERT INTO hroom_tbl
VALUES ('hr002', '신라','6층',1000000, '퀸', '일반', 'h002');
INSERT INTO hroom_tbl
VALUES ('hr003', '라마다','1층',800000, '싱글', '디럭스', 'h003');
INSERT INTO hroom_tbl
VALUES ('hr004', '조선', '45층', 7800000, '더블', '일반', 'h004');
INSERT INTO hroom_tbl
VALUES ('hr005', '롯데','24층',980000, '킹', '스위트', 'h005');

-- 호텔 객실 예메 정보 테이블
CREATE TABLE hbook_tbl (
    hbook VARCHAR(5) PRIMARY KEY,
    hname VARCHAR(20) NOT NULL,
    hdate DATE NOT NULL,
    hpcount INT NOT NULL,
    hintime VARCHAR(20) NULL,
    houttime VARCHAR(20) NOT NULL,
    hfood VARCHAR(1) NULL,
	unum VARCHAR(5),
    hnum VARCHAR(5),
    hroom VARCHAR(5),
    FOREIGN KEY (unum) REFERENCES user_tbl (unum)
    ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (hnum) REFERENCES hotel_tbl(hnum)
        ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (hroom) REFERENCES hroom_tbl (hroom)
        ON UPDATE CASCADE ON DELETE SET NULL
);

INSERT INTO hbook_tbl
VALUES ('hb001', '시그니엘', '2020-12-21', 2, '14시00분', '12시00분', 'O', 'u001', 'h001', 'hr001');
INSERT INTO hbook_tbl
VALUES ('hb002', '신라', '2022-10-24', 3, '16시00분', '10시00분', 'X', 'u002', 'h002', 'hr002');
INSERT INTO hbook_tbl
VALUES ('hb003', '라마다', '2024-08-29', 4, '18시00분', '11시00분', 'X', 'u003', 'h003', 'hr003');
INSERT INTO hbook_tbl
VALUES ('hb004', '조선', '2021-09-15', 1, '15시00분', '12시00분', 'X', 'u004', 'h004', 'hr004');
INSERT INTO hbook_tbl
VALUES ('hb005', '롯데', '2023-02-01', 2, '16시00분', '13시00분', 'X', 'u005', 'h005', 'hr005');

-- 렌터카 회사 테이블
CREATE TABLE rentco_tbl(
ccnum VARCHAR(5) PRIMARY KEY,
ccname VARCHAR(20) NOT NULL,
ccloc VARCHAR(50) NOT NULL,
ccnumber INT NOT NULL,
ccrec VARCHAR(20) NOT NULL,
ccreturn VARCHAR(20) NOT NULL
 );

INSERT INTO rentco_tbl
VALUES ('cc001', 'Jun Rentcar', '인천시 주안동', 0324521426, '인천시 주안 준희 집', '인천 일보아카데미');
INSERT INTO rentco_tbl
VALUES ('cc002', 'Hui Rentcar', '서울시 종로구', 02454556, '서울시 종로 재희 집', '인천 일보아카데미');
INSERT INTO rentco_tbl
VALUES ('cc003', 'Dae Rentcar', '서울시 마포구', 025454426, '서울시 마포 대현 집', '인천 일보아카데미');
INSERT INTO rentco_tbl
VALUES ('cc004', 'Young Rentcar', '인천시 학익동', 032498789, '인천시 학익 재영 집', '인천 일보아카데미');
INSERT INTO rentco_tbl
VALUES ('cc005', 'Yen Rentcar', '인천시 송도동', 0324521426, '인천시 송도 예은 집', '인천 일보아카데미');

-- 렌터카 테이블
CREATE TABLE rentcar_tbl (
cnum VARCHAR(5) PRIMARY KEY,
cprice INT NOT NULL,
cbrand VARCHAR(20) NOT NULL,
cyear INT NULL,
coil VARCHAR(10) NULL,
cmile INT NULL,
ccnum VARCHAR(5),
FOREIGN KEY (ccnum) REFERENCES rentco_tbl(ccnum)
ON UPDATE CASCADE ON DELETE SET NULL
 );
 
INSERT INTO rentcar_tbl
VALUES ('c001', 4500000, '아우디', 2021, '휘발유', 4500, 'cc001');
INSERT INTO rentcar_tbl
VALUES ('c002', 5000, '티코', 2008, '휘발유', 800000, 'cc002');
INSERT INTO rentcar_tbl
VALUES ('c003', 870000, '벤츠', 2023, '휘발유', 50, 'cc003');
INSERT INTO rentcar_tbl
VALUES ('c004', 785000, '현대', 2019, '경유', 115000, 'cc004');
INSERT INTO rentcar_tbl
VALUES ('c005', 541000, '테슬라', 2019, '전기', 80000, 'cc005');
 
 -- 렌터카 대여정보
 CREATE TABLE rentinfo_tbl (
 rcnum VARCHAR(5) PRIMARY KEY,
 rctime VARCHAR(10) NOT NULL,
 rcstart VARCHAR(10) NOT NULL,
 rcend VARCHAR(10) NOT NULL,
 rccount INT NULL,
 rcdate DATE NOT NULL,
 rcinsurance VARCHAR(3) NOT NULL DEFAULT 'YES',
 ccnum VARCHAR(5),
 unum VARCHAR(5), 
 FOREIGN KEY (ccnum) REFERENCES rentco_tbl(ccnum)
 ON UPDATE CASCADE ON DELETE SET NULL,
 FOREIGN KEY (unum) REFERENCES user_tbl(unum)
 ON UPDATE CASCADE ON DELETE SET NULL
 );
 
 INSERT INTO rentinfo_tbl
VALUES ('rc001','5시간','12시30분','17시30분', 2 ,'2008-12-31', DEFAULT, 'cc001', 'u001');
INSERT INTO rentinfo_tbl
VALUES ('rc002','3시간','01시00분','4시00분', 4 ,'2021-8-15', DEFAULT, 'cc001', 'u001');
INSERT INTO rentinfo_tbl
VALUES ('rc003','13시간','10시30분','23시30분', 3 ,'2007-01-04', DEFAULT, 'cc001', 'u001');
INSERT INTO rentinfo_tbl
VALUES ('rc004','7시간','09시30분','16시30분', 1 ,'2018-02-19', DEFAULT, 'cc001', 'u001');
INSERT INTO rentinfo_tbl
VALUES ('rc005','9시간','7시30분','16시30분', 5 ,'2021-05-29', DEFAULT, 'cc001', 'u001'); 
 
 -- 결제테이블
CREATE TABLE pay_tbl(
	pnum VARCHAR(5) PRIMARY KEY,
    ppay VARCHAR(5) NOT NULL,
    psung VARCHAR(10) NOT NULL,
    pname VARCHAR(20) NOT NULL,
    pcard VARCHAR(20) NOT NULL,
    pdate DATE NOT NULL,
    pcvc INT NOT NULL,
    unum VARCHAR(5),
    hbook VARCHAR(5),
    atnum VARCHAR(5),
    rcnum VARCHAR(5),
	FOREIGN KEY (unum) REFERENCES user_tbl(unum)
    ON UPDATE CASCADE ON DELETE SET NULL,
	FOREIGN KEY (hbook) REFERENCES hbook_tbl(hbook)
    ON UPDATE CASCADE ON DELETE SET NULL,
	FOREIGN KEY (atnum) REFERENCES airticket_tbl(atnum)
    ON UPDATE CASCADE ON DELETE SET NULL,
	FOREIGN KEY (rcnum) REFERENCES rentinfo_tbl(rcnum)
    ON UPDATE CASCADE ON DELETE SET NULL
);

INSERT INTO pay_tbl
value ('p001', 'KBpay', 'Kim', 'Jaehui', '02-05-942634', 0127, 553, 'u001', 'hb001', 'at001', 'rc001');
INSERT INTO pay_tbl
value ('p002', '카카오페이', 'Jang', 'Jaeyoung', '02-10-587512', 0728, 123, 'u002', 'hb002', 'at002', 'rc002');
INSERT INTO pay_tbl
value ('p003', '신용카드', 'Lim', 'Daehyun', '03-50-821354', 0526, 113, 'u003', 'hb003', 'at003', 'rc003');
INSERT INTO pay_tbl
value ('p004', '신용카드', 'Park', 'Yeeun', '04-30-451354', 0526, 113, 'u004', 'hb004', 'at004', 'rc004');
INSERT INTO pay_tbl
value ('p005', '신용카드', 'Han', 'Junhee', '01-40-212421', 0526, 113, 'u005', 'hb005', 'at005', 'rc005');