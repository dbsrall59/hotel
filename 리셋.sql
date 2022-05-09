drop table pdinfo;
drop table post;
drop table reserve;
drop table rmnum;
drop table event;
drop table prod;
drop table buyer;
drop table member;
drop table room;

CREATE TABLE BUYER
(
BUYER_ID       NUMBER   generated always as identity NOT NULL,
BUYER_NAME     VARCHAR2 (100)NOT NULL,
BUYER_ADD      VARCHAR2 (100)NOT NULL,
BUYER_TEL      NUMBER   NOT NULL,
BUYER_EMAIL    VARCHAR2 (50)NOT NULL,
BUYER_CHARGER  VARCHAR2 (30)NOT NULL,
BUYER_BANK     VARCHAR2 (20)NOT NULL,
BUYER_BANKNO   NUMBER NOT NULL,
BUYER_BANKNAME VARCHAR2 (20)NOT NULL,
CONSTRAINT PK_BUYER PRIMARY KEY (BUYER_ID)
);

create table prod
(
prod_id        NUMBER          generated always as identity NOT NULL,    --비품ID
prod_buyer     NUMBER         NOT NULL,    --거래처ID
prod_name      VARCHAR(100)   NOT NULL,    --비품명
prod_type      VARCHAR(100)   NOT NULL,    --비품분류
prod_price     NUMBER         NOT NULL,    --비품가격
prod_safety    NUMBER         NOT NULL,    --안전재고수량
CONSTRAINT pk_prod_id PRIMARY KEY (prod_id),
CONSTRAINT fr_prod_buyer FOREIGN KEY (prod_buyer) REFERENCES buyer(buyer_id)
);

create table member 
(
mem_id varchar2(30) not null,
mem_inid number(38) generated always as identity NOT NULL,
mem_pw varchar2(100) not null,
mem_regno number(30) not null,
mem_staff number(1) null,
mem_cardno number(30) null,
mem_cdpw number(2)  null,
mem_gender number(1) not null,
mem_tel number(11) not null,
mem_email varchar2 (40) null,
mem_name varchar2(30) not null,
mem_add varchar2(30) not null,
mem_date date not null,
constraint pk_member primary key (mem_inid)
);

CREATE TABLE room
( 
ROOM_ID              NUMBER                   generated always as identity NOT NULL,  
ROOM_NM            VARCHAR2(100)      NOT NULL,
ROOM_IM              VARCHAR2(100),      
ROOM_INFO          VARCHAR2(100)      NOT NULL,
ROOM_SALE         NUMBER                  NOT NULL,
ROOM_NOTICE     VARCHAR2(999)      NOT NULL,
ROOM_TYPE          VARCHAR2(30)       NOT NULL,
ROOM_COUNT NUMBER NOT NULL,
CONSTRAINT pk_room_id PRIMARY KEY (room_id)
);

create table post
(
post_id number(15) generated always as identity NOT NULL,
post_mem number(38) not null,
post_room number(15) not null,
post_title varchar2(50) not null,
post_cont varchar2(500) not null,
post_hide number(1)not null,
post_date date not null,
post_count number not null,
post_type number not null,
constraint pk_post primary key (post_id),
constraint fr_post_mem foreign key (post_mem) references member(mem_inid),
constraint fr_post_room foreign key (post_room) references room(room_id)
);

create table event
(
event_id number(15) generated always as identity NOT NULL,
event_mem number(15),
event_room number(15),
event_start date not null,
event_end date not null,
event_type varchar2(30) not null,
event_sale number(15) not null,
event_title varchar(50) not null,
event_CONT varchar(50),
event_code varchar(50),
CONSTRAINT pk_event PRIMARY KEY (event_id),
CONSTRAINT fr_event_mem  FOREIGN KEY (event_mem) REFERENCES member(mem_inid),
CONSTRAINT fr_event_room  FOREIGN KEY (event_room) REFERENCES room(room_id)
);

CREATE TABLE RMNUM
(
RMNUM_ID    NUMBER   (15) NOT NULL,
RMNUM_ROOM  NUMBER       NOT NULL,
RMNUM_ABOUT VARCHAR2 (100)NOT NULL,
CONSTRAINT PK_RMNUM PRIMARY KEY (RMNUM_ID),
CONSTRAINT FR_RMNUM_ROOM FOREIGN KEY (RMNUM_ROOM) REFERENCES ROOM(ROOM_ID)
);

CREATE TABLE reserve
(
    res_id NUMBER(15) generated always as identity NOT NULL,
    res_mem number not null,
    res_rmnum number not null,
    res_in date not null,
    res_out date not null,
    res_date date not null,
    res_price number not null,
    res_adult number not null,
    res_kid number not null,
    res_baby number not null,
    CONSTRAINT pk_reserve PRIMARY KEY (res_id),
    CONSTRAINT fr_res_mem FOREIGN KEY (res_mem) REFERENCES member(mem_inid),
    CONSTRAINT fr_res_rmnum FOREIGN KEY (res_rmnum) REFERENCES rmnum(rmnum_id)
);

create table pdinfo(
pdinfo_id       NUMBER         generated always as identity NOT NULL,   --물품정보ID
pdinfo_prod     NUMBER         NOT NULL,   --비품ID
pdinfo_rmnum    NUMBER         NOT NULL,   --호수ID
pdinfo_indate   DATE           NOT NULL,   --입고날짜
pdinfo_status   VARCHAR(300)   NOT NULL,   --상태
CONSTRAINT pk_pdinfo_id PRIMARY KEY (pdinfo_id),
CONSTRAINT fr_pdinfo_prod FOREIGN KEY (pdinfo_prod) references prod(prod_id), 
CONSTRAINT fr_pdinfo_rmnum FOREIGN KEY (pdinfo_rmnum) references rmnum(rmnum_id)
);

INSERT INTO room (ROOM_NM, ROOM_IM, ROOM_INFO, ROOM_SALE, ROOM_NOTICE, ROOM_TYPE, ROOM_COUNT)
            VALUES ('디럭스룸', null, '클래식한 감성미 가득한 디럭스룸', '180000', '체크인은 15:00이며 체크아웃은 11:00입니다', '디럭스룸', 3);
INSERT INTO room (ROOM_NM, ROOM_IM, ROOM_INFO, ROOM_SALE, ROOM_NOTICE, ROOM_TYPE, ROOM_COUNT)
            VALUES ('비즈니스룸', null, '내 집처럼 편안하고 아늑한 비즈니스룸', '300000', '체크인은 15:00이며 체크아웃은 11:00입니다','비즈니스룸', 3);
INSERT INTO room (ROOM_NM, ROOM_IM, ROOM_INFO, ROOM_SALE, ROOM_NOTICE, ROOM_TYPE, ROOM_COUNT)
            VALUES ('스위트룸', null, '클래식한 감성미 가득한 디럭스룸', '550000', '체크인은 15:00이며 체크아웃은 11:00입니다','스위트룸', 3);
INSERT INTO room (ROOM_NM, ROOM_IM, ROOM_INFO, ROOM_SALE, ROOM_NOTICE, ROOM_TYPE, ROOM_COUNT)
            VALUES ('트윈룸', null, '클래식한 감성미 가득한 디럭스룸', '510000', '체크인은 15:00이며 체크아웃은 11:00입니다','트윈룸', 5);

insert into rmnum values( '201', 1, '오션뷰');
insert into rmnum values( '202', 1, '오션뷰');
insert into rmnum values( '203', 1, '오션뷰');
insert into rmnum values( '204', 1, '시티뷰');
insert into rmnum values( '205', 1, '시티뷰');
insert into rmnum values( '206', 1, '시티뷰');
insert into rmnum values( '207', 1, '마운틴뷰');
insert into rmnum values( '208', 1, '마운틴뷰');
insert into rmnum values( '209', 1, '마운틴뷰');
insert into rmnum values( '210', 1, '마운틴뷰');
insert into rmnum values( '301', 2, '오션뷰');
insert into rmnum values( '302', 2, '오션뷰');
insert into rmnum values( '303', 2, '오션뷰');
insert into rmnum values( '304', 2, '시티뷰');
insert into rmnum values( '305', 2, '시티뷰');
insert into rmnum values( '306', 2, '시티뷰');
insert into rmnum values( '307', 2, '마운틴뷰');
insert into rmnum values( '308', 2, '마운틴뷰');
insert into rmnum values( '309', 2, '마운틴뷰');
insert into rmnum values( '310', 2, '마운틴뷰');
insert into rmnum values( '401', 3, '오션뷰');
insert into rmnum values( '402', 3, '오션뷰');
insert into rmnum values( '403', 3, '오션뷰');
insert into rmnum values( '404', 3, '시티뷰');
insert into rmnum values( '405', 3, '시티뷰');
insert into rmnum values( '406', 3, '시티뷰');
insert into rmnum values( '407', 3, '마운틴뷰');
insert into rmnum values( '408', 3, '마운틴뷰');
insert into rmnum values( '409', 3, '마운틴뷰');
insert into rmnum values( '410', 3, '마운틴뷰');
insert into rmnum values( '501', 4, '오션뷰');
insert into rmnum values( '502', 4, '오션뷰');
insert into rmnum values( '503', 4, '오션뷰');
insert into rmnum values( '504', 4, '시티뷰');
insert into rmnum values( '505', 4, '시티뷰');
insert into rmnum values( '506', 4, '시티뷰');
insert into rmnum values( '507', 4, '마운틴뷰');
insert into rmnum values( '508', 4, '마운틴뷰');
insert into rmnum values( '509', 4, '마운틴뷰');
insert into rmnum values( '510', 4, '마운틴뷰');

insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('bquydmemv', 'cmgpdpdqkmifgit', 620925, 0, 9567, 55, 1, 01087313137, 'udmcgltkh@daum.net', '박팔단', '광주광역시', '2019-07-20');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('ijssnyjw', 'rmacanon', 840826, 0, 6111, 69, 1, 01053407035, 'sofwxir@naver.com', '하일단', '경상도', '2017-09-26');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('ffdcymbqlgakep', 'ycocjldv', 520605, 0, 0932, 59, 0, 01075893141, 'ihwlrj@gmail.com', '김선민', '울산광역시', '2018-05-21');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('ramkrcehsbixkg', 'qkgudoecjbcqtepqf', 070719, 0, 7526, 49, 0, 01035313457, 'styymlkbu@naver.com', '김육휘', '경기도', '2020-06-20');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('ekjbigopjypasa', 'dqtl', 040517, 0, 2361, 02, 1, 01015849747, 'ahlbbyci@daum.net', '최심단', '인천광역시', '2016-03-09');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('sijs', 'sqbourhdvos', 060210, 0, 2037, 53, 1, 01029020497, 'nbbgocq@gmail.com', '이오라', '서울특별시', '2020-09-06');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('beefkgiy', 'aneoeytdye', 690322, 0, 6177, 92, 1, 01098518289, 'axxcbsl@gmail.com', '최오석', '세종특별시', '2017-12-16');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('mremxnhnp', 'itpkct', 591217, 0, 6517, 13, 1, 01065044474, 'kpqvclnj@gmail.com', '이사타', '서울특별시', '2017-04-17');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('kjqoom', 'vevixmolarwuwxyb', 870814, 0, 8102, 50, 1, 01006198249, 'ekpdwp@gmail.com', '김현호', '강원도', '2018-04-07');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('islgnw', 'nssrempd', 540616, 0, 7725, 85, 0, 01091646922, 'hsklhj@naver.com', '하현라', '광주광역시', '2016-01-01');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('hfilwnaeifrc', 'eivcwiocotrolyhilhc', 790327, 0, 2059, 77, 0, 01048112167, 'vovulmqvd@daum.net', '최이휘', '울산광역시', '2020-03-23');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('odnfb', 'qmrxtsbmnhwdauavo', 540202, 0, 3496, 79, 0, 01033632852, 'nrxhyk@daum.net', '박육수', '제주도', '2019-01-04');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('tcsmwmcqxdir', 'knxdquvqklrcs', 080517, 0, 1226, 79, 1, 01083833292, 'hhttewkeg@gmail.com', '박팔수', '울산광역시', '2017-12-24');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('ftkeoseiqtvg', 'eoseog', 700218, 0, 4196, 90, 0, 01054464789, 'dkdjqxq@daum.net', '이사호', '서울특별시', '2015-10-26');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('vatpoyxn', 'drgdlgslnldsfdmce', 790521, 0, 9226, 22, 1, 01085717425, 'qcoovamx@naver.com', '최일연하', '경기도', '2015-02-11');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('yqia', 'riynx', 780214, 0, 8480, 57, 1, 01093408372, 'nldvah@gmail.com', '하일석', '울산광역시', '2020-08-08');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('ctte', 'xtngtvb', 080316, 0, 6248, 25, 0, 01002920030, 'mknjjfosd@naver.com', '정칠수', '대전광역시', '2016-07-18');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('dbnwjtltxr', 'qrvnroyb', 700911, 0, 0524, 17, 1, 01047082959, 'lmxyackis@gmail.com', '김오라', '전라도', '2015-06-11');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('jxnyx', 'exvr', 641020, 0, 8784, 92, 0, 01054258016, 'dpumnbtux@gmail.com', '정심타', '강원도', '2015-12-24');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('pbyrjmipjnphpx', 'xkhunhjalwob', 690803, 0, 4319, 11, 1, 01054240884, 'werigxjul@naver.com', '김육간', '서울특별시', '2015-12-05');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('hnlcgevbpfonbn', 'pxvlmari', 570614, 0, 9110, 13, 0, 01036919795, 'ulbjqee@gmail.com', '박이간', '강원도', '2017-09-06');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('hhfpkyiuudmn', 'dramepxoufo', 790614, 0, 1529, 11, 0, 01026973637, 'empemkpt@naver.com', '정연호', '울산광역시', '2018-04-09');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('mvatk', 'ahnwrhowpoosgshxjw', 710503, 0, 0776, 04, 0, 01092284091, 'lvaxpuh@gmail.com', '정이타', '서울특별시', '2020-03-14');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('mjtjc', 'xcxhqbmlrticrou', 830120, 0, 4413, 22, 1, 01096971997, 'vgrlm@daum.net', '하사단', '제주도', '2018-11-20');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('bpvwqrpj', 'dbetwduvqqn', 601115, 0, 0264, 81, 1, 01023640347, 'ithcc@gmail.com', '박선메', '광주광역시', '2020-12-17');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('mlgfcjduxk', 'lsuknwgkhgvlbdqo', 831202, 0, 6610, 37, 0, 01051926427, 'mbflrdfwe@gmail.com', '박심메', '울산광역시', '2018-06-24');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('nqqxi', 'vuisnqfceynp', 560804, 0, 2466, 07, 0, 01024810215, 'kpjnsl@naver.com', '정이라', '대구광역시', '2018-01-05');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('wwswd', 'jkbcpubrhdmfyd', 850112, 0, 8694, 99, 1, 01027014298, 'hxrjix@naver.com', '박선석', '인천광역시', '2019-12-13');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('egtxfoujae', 'gsdasqtcxcaydc', 510527, 0, 2911, 28, 1, 01057281701, 'grelhg@daum.net', '이팔연하', '강원도', '2019-08-10');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('nsuyq', 'jeqd', 830922, 0, 3150, 94, 0, 01015993742, 'oshnifcud@gmail.com', '최사메', '충청도', '2017-07-16');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('ogcchjyjcf', 'vmtpxvncbwhppxcpja', 690417, 0, 1486, 26, 0, 01053097311, 'qllga@daum.net', '박팔연하', '부산광역시', '2019-08-12');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('dkpubgnvqy', 'khcrlswlesbimm', 880804, 0, 7941, 46, 1, 01078662950, 'wdyvi@gmail.com', '김육연하', '대전광역시', '2019-10-21');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('vssbhyf', 'cyixlia', 830115, 0, 1458, 89, 0, 01001850082, 'wrhdmk@daum.net', '김육석', '대구광역시', '2020-02-08');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('jmiglobrita', 'hyynvnj', 731110, 0, 6036, 08, 1, 01055540739, 'iitcvuber@daum.net', '하팔민', '강원도', '2017-11-07');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('jvhdipajilwts', 'swftnoeuljrmyvl', 770618, 0, 8293, 04, 0, 01040960423, 'nfqdrxo@gmail.com', '이칠수', '강원도', '2016-04-03');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('hxlynl', 'yqslccvvflrojlbytnf', 790411, 0, 0984, 47, 0, 01040351597, 'paeqfoml@daum.net', '최오휘', '제주도', '2015-06-23');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('qsgy', 'xhbyaqdkhxihsioyh', 510623, 0, 2975, 70, 0, 01067280114, 'qqtgqqv@gmail.com', '하현타', '제주도', '2020-03-13');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('yduhhc', 'qljldevwtpock', 581111, 0, 4747, 08, 0, 01042392685, 'dvgddwl@gmail.com', '정칠단', '대구광역시', '2017-10-11');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('dkauwfsavq', 'nhmut', 760724, 0, 4392, 33, 1, 01001918209, 'qblypyb@daum.net', '최삼메', '서울특별시', '2018-08-14');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('eobhjuwpdtw', 'plrqkmxy', 861209, 0, 4152, 39, 1, 01027442557, 'sgiyhklf@daum.net', '김칠휘', '광주광역시', '2016-11-03');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('ehfdaymqqcxmh', 'eodjks', 511113, 0, 6360, 35, 0, 01015578302, 'spaitkhf@gmail.com', '정일수', '세종특별시', '2016-01-21');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('qrwx', 'aeyfqvksgodcj', 740717, 0, 6344, 16, 0, 01087661876, 'xpnqwmbe@gmail.com', '박심단', '경기도', '2020-06-25');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('ufeigp', 'necptodstegyroxlau', 510519, 0, 0118, 12, 1, 01047035647, 'qmcppoos@naver.com', '최팔석', '서울특별시', '2016-02-26');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('hvmuisth', 'oixngsusse', 021113, 0, 9679, 94, 0, 01086401179, 'mnfah@daum.net', '최일단', '울산광역시', '2020-06-27');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('eslj', 'dibeueulurvas', 520101, 0, 6892, 51, 0, 01003867167, 'jhmxyid@daum.net', '김선단', '강원도', '2020-12-15');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('kcwgx', 'htwtuscxyfwe', 560713, 0, 6947, 80, 0, 01034462084, 'yonlgbc@gmail.com', '정일타', '대전광역시', '2018-02-13');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('uiaij', 'dgxsl', 870724, 0, 3453, 02, 1, 01089635382, 'quqytwbpf@gmail.com', '이사간', '강원도', '2018-05-15');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('wulhsqljt', 'tpxkvmctlaf', 761213, 0, 2301, 84, 0, 01029981180, 'oxleaa@naver.com', '정삼민', '부산광역시', '2017-11-12');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('dkoo', 'hoqljcmmedgg', 000217, 0, 4381, 37, 1, 01081701120, 'ilrxkno@gmail.com', '이연연하', '광주광역시', '2018-08-06');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('weqaffmhya', 'fgjbvmbceexbndfwe', 880813, 0, 5366, 75, 0, 01065060227, 'hrssvt@daum.net', '하이호', '대전광역시', '2020-03-24');

insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(32, 201, '2022-05-03', '2022-05-05', '2022-04-30', 545000, 2, 1, 1);

insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(12, 306, '2020-06-25', '2020-06-26', '2020-06-21', 290000, 1, 0, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(35, 405, '2017-01-08', '2017-01-14', '2017-01-06', 550000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(3, 403, '2017-02-13', '2017-02-14', '2017-02-06', 550000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(12, 203, '2020-07-26', '2020-07-29', '2020-07-25', 180000, 1, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(44, 207, '2016-02-05', '2016-02-09', '2016-02-02', 175000, 1, 0, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(39, 210, '2016-05-27', '2016-05-28', '2016-05-21', 175000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(4, 410, '2020-12-22', '2020-12-23', '2020-12-16', 550000, 1, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(3, 308, '2018-03-09', '2018-03-11', '2018-03-07', 290000, 1, 0, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(39, 309, '2019-05-15', '2019-05-21', '2019-05-11', 300000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(21, 510, '2018-04-10', '2018-04-16', '2018-04-09', 510000, 2, 2, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(23, 201, '2017-04-06', '2017-04-08', '2017-04-05', 175000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(17, 404, '2018-08-23', '2018-08-25', '2018-08-16', 550000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(15, 505, '2015-10-05', '2015-10-06', '2015-10-03', 500000, 3, 0, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(39, 206, '2017-06-06', '2017-06-08', '2017-06-04', 180000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(37, 308, '2018-11-16', '2018-11-18', '2018-11-10', 300000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(36, 506, '2020-05-04', '2020-05-10', '2020-05-03', 510000, 4, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(12, 503, '2019-10-23', '2019-10-26', '2019-10-22', 510000, 4, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(42, 505, '2015-10-16', '2015-10-19', '2015-10-09', 510000, 3, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(2, 504, '2016-10-24', '2016-10-30', '2016-10-17', 510000, 3, 0, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(13, 303, '2016-08-24', '2016-08-26', '2016-08-18', 290000, 1, 0, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(40, 205, '2020-04-01', '2020-04-03', '2020-03-28', 180000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(38, 410, '2019-01-23', '2019-01-29', '2019-01-16', 550000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(36, 406, '2019-06-03', '2019-06-04', '2019-06-02', 550000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(50, 301, '2020-03-20', '2020-03-22', '2020-03-19', 295000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(43, 209, '2016-11-26', '2016-12-01', '2016-11-21', 180000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(8, 202, '2019-12-17', '2019-12-18', '2019-12-10', 175000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(1, 402, '2019-01-14', '2019-01-16', '2019-01-13', 540000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(43, 403, '2016-04-02', '2016-04-04', '2016-03-30', 540000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(5, 306, '2015-09-01', '2015-09-07', '2015-08-31', 295000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(48, 405, '2018-12-13', '2018-12-14', '2018-12-06', 550000, 1, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(49, 201, '2016-12-03', '2016-12-04', '2016-12-02', 180000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(16, 406, '2017-05-11', '2017-05-12', '2017-05-04', 540000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(17, 407, '2019-06-20', '2019-06-21', '2019-06-13', 550000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(46, 305, '2015-10-08', '2015-10-11', '2015-10-05', 295000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(31, 501, '2018-02-26', '2018-02-28', '2018-02-25', 510000, 1, 2, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(45, 202, '2017-11-22', '2017-11-23', '2017-11-19', 180000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(35, 306, '2015-10-10', '2015-10-11', '2015-10-03', 300000, 1, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(40, 202, '2017-12-21', '2017-12-24', '2017-12-14', 180000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(29, 310, '2016-11-23', '2016-11-25', '2016-11-20', 300000, 1, 0, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(18, 408, '2020-05-20', '2020-05-23', '2020-05-18', 545000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(33, 206, '2017-10-09', '2017-10-11', '2017-10-08', 170000, 1, 0, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(38, 307, '2018-02-20', '2018-02-26', '2018-02-19', 290000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(13, 502, '2019-12-26', '2019-12-29', '2019-12-25', 500000, 1, 2, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(9, 310, '2020-09-15', '2020-09-16', '2020-09-14', 295000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(29, 209, '2015-01-03', '2015-01-04', '2014-12-29', 180000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(38, 208, '2015-11-22', '2015-11-28', '2015-11-15', 175000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(41, 307, '2020-12-12', '2020-12-14', '2020-12-10', 300000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(47, 401, '2015-06-15', '2015-06-18', '2015-06-12', 540000, 1, 0, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(12, 309, '2018-06-12', '2018-06-13', '2018-06-06', 300000, 1, 0, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(46, 504, '2018-09-07', '2018-09-11', '2018-09-06', 500000, 2, 2, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(1, 210, '2017-11-13', '2017-11-14', '2017-11-12', 175000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(48, 209, '2015-11-09', '2015-11-12', '2015-11-07', 180000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(5, 203, '2017-02-17', '2017-02-20', '2017-02-16', 180000, 1, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(27, 504, '2015-01-18', '2015-01-20', '2015-01-11', 510000, 2, 0, 2);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(5, 208, '2016-02-01', '2016-02-03', '2016-01-25', 180000, 1, 0, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(1, 501, '2016-05-21', '2016-05-23', '2016-05-14', 505000, 1, 3, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(19, 306, '2017-05-13', '2017-05-14', '2017-05-06', 295000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(28, 407, '2016-02-24', '2016-02-27', '2016-02-17', 545000, 1, 0, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(7, 404, '2015-10-25', '2015-10-28', '2015-10-24', 550000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(8, 203, '2018-04-03', '2018-04-05', '2018-04-01', 180000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(7, 309, '2017-08-27', '2017-08-30', '2017-08-26', 300000, 1, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(28, 209, '2020-11-11', '2020-11-14', '2020-11-09', 180000, 1, 0, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(20, 410, '2018-12-27', '2018-12-28', '2018-12-26', 540000, 1, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(38, 301, '2020-10-12', '2020-10-14', '2020-10-06', 300000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(47, 406, '2016-01-05', '2016-01-07', '2015-12-29', 545000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(42, 302, '2015-07-23', '2015-07-25', '2015-07-16', 300000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(22, 409, '2017-11-05', '2017-11-08', '2017-10-29', 545000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(48, 203, '2018-08-18', '2018-08-22', '2018-08-17', 180000, 1, 0, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(12, 201, '2019-02-20', '2019-02-22', '2019-02-13', 180000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(9, 504, '2019-03-25', '2019-03-26', '2019-03-22', 510000, 3, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(40, 406, '2020-01-07', '2020-01-09', '2020-01-06', 540000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(23, 305, '2015-02-07', '2015-02-09', '2015-02-06', 300000, 1, 0, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(12, 305, '2015-11-03', '2015-11-09', '2015-11-01', 290000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(13, 209, '2017-07-19', '2017-07-23', '2017-07-16', 175000, 1, 0, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(10, 503, '2016-06-08', '2016-06-09', '2016-06-07', 510000, 1, 3, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(47, 501, '2019-12-14', '2019-12-15', '2019-12-07', 510000, 2, 0, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(15, 208, '2015-05-16', '2015-05-19', '2015-05-15', 180000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(13, 507, '2019-06-26', '2019-06-28', '2019-06-19', 505000, 1, 3, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(33, 501, '2017-02-19', '2017-02-21', '2017-02-12', 500000, 3, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(9, 505, '2020-04-04', '2020-04-06', '2020-04-03', 510000, 3, 0, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(1, 206, '2015-04-08', '2015-04-13', '2015-04-04', 180000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(23, 504, '2019-09-19', '2019-09-20', '2019-09-18', 505000, 2, 0, 2);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(3, 306, '2019-02-25', '2019-02-27', '2019-02-19', 290000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(19, 403, '2019-11-19', '2019-11-22', '2019-11-18', 550000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(8, 406, '2020-03-20', '2020-03-26', '2020-03-13', 540000, 1, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(19, 204, '2016-02-24', '2016-02-27', '2016-02-21', 180000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(35, 302, '2018-07-02', '2018-07-04', '2018-06-26', 295000, 1, 0, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(25, 407, '2018-06-26', '2018-06-29', '2018-06-21', 545000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(47, 201, '2016-06-02', '2016-06-03', '2016-05-31', 180000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(41, 307, '2015-02-08', '2015-02-10', '2015-02-01', 290000, 1, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(24, 206, '2017-10-27', '2017-10-28', '2017-10-25', 180000, 1, 0, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(12, 209, '2016-03-25', '2016-03-27', '2016-03-24', 180000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(15, 506, '2018-11-17', '2018-11-19', '2018-11-16', 510000, 1, 2, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(23, 306, '2017-08-02', '2017-08-08', '2017-07-31', 290000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(13, 302, '2018-04-09', '2018-04-10', '2018-04-08', 300000, 1, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(6, 308, '2015-02-27', '2015-02-28', '2015-02-25', 290000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(19, 205, '2016-02-17', '2016-02-19', '2016-02-16', 180000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(9, 510, '2019-05-15', '2019-05-16', '2019-05-08', 510000, 4, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(35, 302, '2016-09-15', '2016-09-18', '2016-09-08', 295000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(48, 506, '2018-10-04', '2018-10-06', '2018-10-03', 505000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(34, 210, '2015-10-27', '2015-10-29', '2015-10-26', 180000, 1, 0, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(47, 303, '2020-08-20', '2020-08-22', '2020-08-17', 300000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(47, 209, '2017-08-11', '2017-08-12', '2017-08-10', 170000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(18, 309, '2017-03-02', '2017-03-04', '2017-03-01', 300000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(46, 510, '2019-09-17', '2019-09-20', '2019-09-16', 510000, 4, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(47, 303, '2020-08-23', '2020-08-24', '2020-08-17', 300000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(31, 310, '2018-11-23', '2018-11-25', '2018-11-16', 300000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(19, 205, '2017-08-23', '2017-08-29', '2017-08-16', 180000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(6, 510, '2017-05-02', '2017-05-05', '2017-04-26', 510000, 1, 2, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(42, 302, '2019-01-25', '2019-01-31', '2019-01-18', 300000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(14, 201, '2017-08-12', '2017-08-15', '2017-08-06', 180000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(8, 208, '2016-03-06', '2016-03-12', '2016-03-05', 170000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(28, 306, '2018-05-15', '2018-05-21', '2018-05-08', 300000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(5, 508, '2016-07-24', '2016-07-30', '2016-07-18', 500000, 4, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(50, 504, '2017-04-10', '2017-04-14', '2017-04-08', 510000, 4, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(14, 205, '2019-02-10', '2019-02-12', '2019-02-04', 175000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(21, 507, '2018-03-16', '2018-03-18', '2018-03-15', 510000, 1, 2, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(33, 403, '2020-11-24', '2020-11-26', '2020-11-20', 545000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(45, 302, '2020-11-13', '2020-11-19', '2020-11-07', 300000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(45, 305, '2018-11-05', '2018-11-07', '2018-11-01', 300000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(7, 506, '2018-11-06', '2018-11-12', '2018-11-05', 510000, 4, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(13, 210, '2015-10-25', '2015-10-31', '2015-10-18', 180000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(6, 208, '2020-03-08', '2020-03-11', '2020-03-02', 175000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(44, 510, '2015-05-04', '2015-05-07', '2015-04-29', 510000, 3, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(5, 206, '2019-02-20', '2019-02-23', '2019-02-19', 180000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(36, 407, '2020-06-18', '2020-06-21', '2020-06-15', 540000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(27, 205, '2016-03-19', '2016-03-21', '2016-03-15', 175000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(34, 203, '2015-11-21', '2015-11-22', '2015-11-20', 175000, 1, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(27, 509, '2017-03-21', '2017-03-22', '2017-03-14', 510000, 4, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(29, 202, '2015-10-06', '2015-10-08', '2015-10-03', 170000, 1, 0, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(40, 402, '2018-06-12', '2018-06-14', '2018-06-11', 545000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(40, 403, '2020-03-26', '2020-03-28', '2020-03-20', 545000, 1, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(13, 308, '2020-07-09', '2020-07-11', '2020-07-03', 300000, 1, 0, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(31, 209, '2020-07-03', '2020-07-07', '2020-06-26', 175000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(3, 501, '2017-09-17', '2017-09-18', '2017-09-11', 510000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(34, 402, '2020-05-17', '2020-05-19', '2020-05-11', 545000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(41, 506, '2017-03-15', '2017-03-18', '2017-03-13', 505000, 3, 0, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(30, 209, '2017-12-22', '2017-12-27', '2017-12-20', 170000, 1, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(7, 207, '2016-02-12', '2016-02-15', '2016-02-09', 180000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(25, 503, '2018-08-17', '2018-08-18', '2018-08-10', 510000, 1, 1, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(21, 506, '2018-10-03', '2018-10-09', '2018-09-27', 500000, 4, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(34, 402, '2015-05-09', '2015-05-15', '2015-05-07', 550000, 1, 0, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(14, 404, '2016-07-24', '2016-07-26', '2016-07-18', 550000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(16, 309, '2017-08-10', '2017-08-12', '2017-08-04', 300000, 1, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(4, 501, '2017-07-07', '2017-07-08', '2017-07-06', 500000, 2, 2, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(34, 303, '2017-08-20', '2017-08-22', '2017-08-19', 290000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(45, 408, '2016-08-24', '2016-08-26', '2016-08-21', 550000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(35, 506, '2020-03-03', '2020-03-06', '2020-02-25', 510000, 4, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(44, 204, '2015-07-24', '2015-07-30', '2015-07-20', 180000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(41, 209, '2017-01-19', '2017-01-21', '2017-01-12', 170000, 1, 0, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(27, 307, '2019-01-21', '2019-01-23', '2019-01-20', 300000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(43, 502, '2016-05-13', '2016-05-15', '2016-05-07', 510000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(36, 403, '2015-09-16', '2015-09-18', '2015-09-09', 550000, 1, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(45, 508, '2020-05-19', '2020-05-20', '2020-05-17', 500000, 2, 1, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(36, 409, '2020-08-06', '2020-08-08', '2020-07-30', 540000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(7, 502, '2018-11-20', '2018-11-22', '2018-11-14', 510000, 3, 0, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(11, 501, '2020-11-12', '2020-11-15', '2020-11-08', 500000, 4, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(42, 205, '2017-10-03', '2017-10-05', '2017-09-26', 180000, 1, 0, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(24, 203, '2018-12-26', '2018-12-29', '2018-12-25', 180000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(8, 302, '2019-04-01', '2019-04-02', '2019-03-27', 300000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(46, 409, '2015-05-04', '2015-05-06', '2015-05-03', 550000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(34, 403, '2019-07-06', '2019-07-12', '2019-06-29', 550000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(31, 204, '2015-12-12', '2015-12-15', '2015-12-07', 180000, 1, 0, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(24, 408, '2016-02-14', '2016-02-15', '2016-02-13', 550000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(23, 304, '2015-02-05', '2015-02-07', '2015-01-29', 295000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(1, 501, '2019-01-13', '2019-01-18', '2019-01-12', 510000, 2, 0, 2);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(20, 302, '2019-09-24', '2019-09-26', '2019-09-18', 295000, 1, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(32, 303, '2019-05-01', '2019-05-05', '2019-04-30', 300000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(20, 305, '2019-07-02', '2019-07-03', '2019-06-30', 295000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(31, 501, '2016-05-17', '2016-05-22', '2016-05-14', 500000, 3, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(16, 202, '2017-06-06', '2017-06-07', '2017-06-05', 170000, 1, 0, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(28, 202, '2015-07-18', '2015-07-19', '2015-07-11', 175000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(29, 510, '2016-05-23', '2016-05-24', '2016-05-20', 510000, 4, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(13, 301, '2015-12-01', '2015-12-02', '2015-11-24', 300000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(50, 503, '2018-06-09', '2018-06-14', '2018-06-03', 505000, 1, 1, 2);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(7, 401, '2016-06-09', '2016-06-10', '2016-06-08', 550000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(10, 204, '2020-05-14', '2020-05-16', '2020-05-10', 180000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(37, 402, '2018-08-10', '2018-08-13', '2018-08-09', 550000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(7, 406, '2015-12-26', '2015-12-27', '2015-12-22', 550000, 1, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(40, 401, '2016-05-06', '2016-05-08', '2016-04-30', 550000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(45, 203, '2020-07-02', '2020-07-08', '2020-06-25', 180000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(25, 303, '2016-08-05', '2016-08-07', '2016-07-29', 300000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(3, 408, '2018-08-15', '2018-08-18', '2018-08-09', 545000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(16, 402, '2020-09-13', '2020-09-15', '2020-09-06', 545000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(49, 305, '2015-03-12', '2015-03-18', '2015-03-11', 295000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(41, 404, '2017-07-12', '2017-07-17', '2017-07-05', 540000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(41, 206, '2019-09-08', '2019-09-09', '2019-09-07', 175000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(33, 507, '2020-09-09', '2020-09-12', '2020-09-02', 510000, 2, 1, 1);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(49, 410, '2019-01-18', '2019-01-22', '2019-01-16', 545000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(4, 508, '2020-12-01', '2020-12-07', '2020-11-25', 510000, 4, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(15, 306, '2020-05-05', '2020-05-07', '2020-05-02', 300000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(15, 206, '2017-11-19', '2017-11-21', '2017-11-17', 180000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(28, 210, '2019-02-26', '2019-02-28', '2019-02-25', 180000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(3, 202, '2015-10-26', '2015-10-28', '2015-10-25', 180000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(16, 202, '2019-09-15', '2019-09-17', '2019-09-09', 180000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(2, 307, '2016-05-03', '2016-05-05', '2016-04-27', 290000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(14, 206, '2016-10-27', '2016-10-29', '2016-10-21', 180000, 1, 1, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(18, 303, '2018-12-01', '2018-12-07', '2018-11-30', 300000, 2, 0, 0);
insert into reserve(res_mem, res_rmnum, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(25, 208, '2020-03-06', '2020-03-08', '2020-02-28', 180000, 1, 1, 0);

insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(28, 4, '교통편 문의', 'hhscavgluhxsqikdaujwndkvubvnnsofavocqmpkqajkdokpwypepwcgexqkonyvocamdrcglhhyyqrxksqshrvvfenuyheewhkkifkjyxygiqmqtbbmuwmqohtnsqcnypnorkbgvblfupibwvhgkmqhiwhihhwcgfuycmqffhlbipenqxfyiymaiseswrrmpqbtfaclchekodrptknkw', 0, '2015-02-11', 86, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(45, 2, '교통편 문의', 'bvpwsscavegorgyveiyxvabuqignokfyskeapuseywsxolnawsgfolarehgcmpsgdmtuljjfnqgvccpqruikwnohcuotiaxecfdcfgoatbrfxlaluejherimvmssocktyoarvyqfjyomrtdnjaouccooxyoqjswtuceohwfurreenaunvxorxrvaamtjuafgeghlpyg', 0, '2015-02-11', 23, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(33, 3, '교통편 문의', 'fbbxyehomkqplpfbsgpqeqmnmnllqhjdyfjgfdqxufboxjygesxoyipqgrsafenxqfjtubkpdawdudpwfwmkgvwveedcxahjfsddqpxmkegsovaqfmjsnwihvqjaegxwhgqlehhtnkfiixntvgoanqpdlxffptoikubbmfgnubihqpuwcchfvkqcxbrfultswptienegepouynfcelkyhyhnrnmgkbgiqgpenxrndklwfspmpdnpwahgnaiduphxbqjot', 0, '2015-02-11', 60, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(1, 2, '문의합니다.', 'ohlwugjhdaanfitxylmtvfrewgcdikqmwhugepcgkxwurfqrvlefijocklhyewbrkmhvtbqhqdwtgfvqawrrxgkmhwkpxntmnrntqsqxgmykomxmtvcgwmigjqfakkhgyjerllsxsgwvntknedcohngkfvvnsvvuadpwxdubqgyrnmbklchnsmrxkywucug', 0, '2015-02-12', 64, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(15, 1, '썩 맘엔들지 않네요.', 'apbgqchwigewotgnbjepkkedeyospembwnrjpvxqhydhuvytyeevdesqdfyalakmbecpxhvkxcqkgsd', 0, '2015-02-13', 6, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(21, 3, '이 방 넓은가요?', 'pjnytsgvsjkrfjxgeuudajiwskhlfsdlrhowwixnacvychekyjcljirtkflqbmvufpvxvyhfcxkfom', 0, '2015-02-14', 61, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(10, 4, '썩 맘엔들지 않네요.', 'owjmruhhhfoabpwwutxnvmiemwbwaqgsuialhgxgjwsyuqvjqdfwypuhohectfsmmkvnosr', 0, '2015-02-15', 29, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(26, 2, '교통편 문의', 'ytaipbykrtfnvdsgcpjldapxtajojrhoiwvtwdmtqkdggsiguajfmxylbmifmngtwlcuribmfffrrtoylihwqlbqnyxarqgkxdxjeeqrncfpkehdktvheyqlcxjneanemtguvyqunqkrcaaudskafxbhrshbmwgymsscijknniynnyeaknhhvgtqcsfretouplrarjqdpjdnwstlvhwipokeyymxluymyepaebbvwqxakvhybnpicrmmxfadlirmksuyyoexo', 0, '2015-02-15', 50, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(8, 2, '썩 맘엔들지 않네요.', 'oibruxkopkbgwcdakwdqrwlavxyibnljktscohvooeoogpslqalmuyolgtnfq', 1, '2015-02-16', 4, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(45, 3, '문의합니다.', 'xydrludbqcytxsygplnciftviqfqqyqjqqjmcjwoekapxmcesiiqkiydilyofsrusvqhylxmpaajswtrxrbrkqtujvxoaogqibuepeyelasuxfegmquyoiitcvxrbppgkvcgppdahubaly', 1, '2015-02-16', 26, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(46, 2, '교통편 문의', 'sftbgyuskpqpmsckifboqcssvgxdtakcdvihlgwwcenfrstiidqdmmxjfejpgvbewfihynfyrcduorpbhrcnicbcdahgqyojuhnyioeebjvnbgwgotsgirpvdgbpwnagwiwqffuhcseoxhwnosgncjvjkfhupkaysmiyirkxqgigulwosvnkyhytpctndprnycnpjftbbdo', 0, '2015-02-17', 79, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(7, 4, '또오고싶어요.', 'slnrdsmpsbqhehbouhxdcftrwirtftfdpogxgbkugpkhgsuptndyhfrwwopthwjolrteqgxngbhelmpkxkvxmdlritvcwyaeeucucvaobupdmoynpgyvtvajetbofyknikfbkiuvlkcqvgsfdpqxn', 1, '2015-02-18', 18, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(14, 4, '문의합니다.', 'vwkmmjrwusvnhpblakqcjapubxtbwstkyljbfrcqesqnuwppeeswakvalngopqxilecufqdqfbwmpmvdvraibbrhxnbwdsiqqporqfnxnqbrbpnxicnprqbdrpglaqcpihjtdlouiajgndcksivtydodqgmamterqkmvxpkwbktesvwuobfipyaioqmwtpehmpvkvikbeciiydlhjirwbmyfddvcwteidthohnelswfguwsxiyteafkfvlsjakehwqsuhfiwcsfwyjnrgmhgejxiiiwvcmsx', 1, '2015-02-18', 32, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(18, 1, '교통편 문의', 'anyxlae', 0, '2015-02-18', 28, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(41, 2, '문의합니다.', 'avemngjhaegiekpvggoscwqhfiksbvfcjnyaaodxltyaephkewocatlsusuleocbluhcwpeedsaabmdyeffqxvxeytkopbryfcxqsyecevmbqmecmhqpbcmrsbqwsqcynoieifrtroqrcckewslkxxtrwhwdlvfxftmggnwbpvpukxuscgqoahsqwstouokiekodcrrkmwmduwbjfypuejuejynvaalokhnorwgvye', 1, '2015-02-19', 58, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(31, 4, '잘 놀다 갑니다.', 'eraghjinfxwxymnnkawpsxofethciosskdarupoouwffutmnplsjljeryacmwurnwkgdxhksqyqiwyyywsuqhlrnhedpjvcvlljdwsuluqlagvshsocihbgimylpsmalyurlasovlgaajojedwcfvjuhlrgnejscyccjkxqpyloefuwcnxvoubjekebfgyqislbjhsyoasrywnmxe', 0, '2015-02-19', 95, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(36, 4, '문의합니다.', 'vfkyyvpvugxvpboqsbywmqvoxhjnnwqhkmbffphsicgxsfirantlwauppviplnirrkksspjihtyoxqbwgnqrnicpugwbwfbylspekwjnsixeowoygsfd', 0, '2015-02-20', 99, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(30, 2, '교통편 문의', 'uvvdwmsnxbyeykdrkcxwpwfrxrtsiljvqvrhiovjswkgurxyinjvanmwqqlfndvxljkhqmqhldbjqjlkoslpyfsxbogfpufxwydclypheijfrfbrnunseomlchgrwtvodheustuvqcjgaicdeddnrmhgwarkxkrxtwltjkdernhvpkeeqcnyxfwjknutsijkigkjkaatudbjdqtbyjviriuggbkcfevbacovoljehpcvusrxfsfttpivalntbwtmcxkppyvaghwjmwrucvjvyexrbyhtyxqlqdnnmmxprq', 0, '2015-02-20', 8, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(21, 4, '잘 놀다 갑니다.', 'spkihkdaickvdyxumogqklblkvhdugmrbjffxdobtckmcpcoutgkuvkbhcjhrsxuvhxnhesgidnceydquecouhktycimanrspotcftjuctcwdjewvsgsjutishgvokqpjifddwcsipewcmktgbihtiixqquhvrabtxjheldilspebiorlxtprylfrcookgtgsrpcdiiyyievruunnotymfhkuhybuhmotytpscfjogtbghnqyrmfqxgiwyhqjpariuiakmcudhrwfqdouxctgotfufjefbosywogysakxj', 0, '2015-02-20', 63, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(39, 3, '문의합니다.', 'atnpxymgenxjapawfwfbracxgxsonhsdcpwncumynrabvjthveentscihxxjacmkgsyilqtfjoxcschhyegoxoldvlcriitdbiihfkntxdbahdubxuafpexadultuwixdylhpjyqdinfkyumoqmhedarjk', 0, '2015-02-20', 68, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(48, 4, '썩 맘엔들지 않네요.', 'afgdofkswhdbxmfdcguradubwyhetdlervrxhdhuivfvueulwcucoywabofgysbngcllntu', 0, '2015-02-21', 63, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(23, 4, '정말좋아요', 'qwtnlyijcewcsivgaoocvqyeyslfkcveeqgesjav', 0, '2015-02-22', 18, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(34, 3, '교통편 문의', 'pwkwfygtknusrnehlcjbxckinvrbrsrobgeuwfnqrrxdorffrgndyukfkrqakqrfaeecnidgkbpshsflxcurvwxkoxoutxygyxkncixqstywciprsuirpjnpuvrfxsxfjpsmhkajkhrlxwcmlggixfuuwrkhbrgpjwutxldrgnoxnlhsjanquovveoiyepggyvdrawcjjmhsmufkoxsuogbkllgykyxaxmftuhafrswaytnhmvkorjsqfqbbkckf', 1, '2015-02-22', 15, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(19, 4, '문의합니다.', 'wlkipdtkumefgeblneikkqqrfnohrrjxitprluvpyuvhhesvipyfjjpfufbihtsqoyiunamvgqxgsmwgcumvrtvwmiljfaeyhxkpggqrppadegrillcaecvicimkbtkjpcutckowabynomsaaarlxwidgvtuiwlcmdalapihwyvfousjpfjckxqecrslnppvaheacicqquomvoeptomklsypvltkuqpis', 0, '2015-02-22', 89, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(20, 2, '이 방 넓은가요?', 'mdsyukybuqkssbhiuoiffmdgynwytpadgmaaifqbcxdberbfkflvfjmeovgjqelpgpootifodpltfelygqlefcapfvqlawvfkavuklcsuobwcqyhvedcdokoxxsilwmgcfipxjlvcjlgoaupevhefvryeoemjkxskrcwbfcftlxycfjknvxyydbnraedmitjoqqaflupobkrsxlxaqdduqmd', 0, '2015-02-23', 51, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(21, 4, '문의합니다.', 'checdlihptujtbrnivcvganyeqmfmwwtrvucxfxpktqesputoimmffhnbuwildwncccntowsnhgobuawqkikelboqqxymfhjwgfflqeaardmukclwsqyquvdquulpwuigtmqnfgtujiacnxl', 0, '2015-02-24', 20, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(21, 2, '또오고싶어요.', 'wtjinjfjedylxobeqeyvksqinvnxmuctbyytmneywkrvfthouexpwokpjb', 0, '2015-02-25', 48, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(43, 3, '썩 맘엔들지 않네요.', 'cvdjvxndiuwocgabqutheqgabkxbtbsspkshnkesvvarxpqwbewnnbvaxmkhgpptdaxelpjftksxolmeovbwsdwoelciqlkenptuodhpoiylxhqhwnihqfscawnckuvcuycdgjntsnyxvcpllyqtyfpsakgljcpmslpnug', 0, '2015-02-25', 45, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(37, 1, '잘 놀다 갑니다.', 'yldaqyauofqanpbrnugavsxqpyhumeguxevpjnlftrpejkdllyaqbdqwdnlocdqqgpbmhrdadgqqgohaubpqxdfpgwigcrjguiqugjsfxmqidxobglivxhioupiturtuejcgputjghpfwatcsaktjjfcaideyjfvgkcsgdfiyjrowvistakjxvrnhvgbfjjchopecgwrfdjpqtqqxnnhbuyylfuffyjwwqbgetjsmhkybvyqcsohgfneykyumifgrhwjunjenynnkbvuakrfh', 0, '2015-02-25', 27, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(13, 1, '썩 맘엔들지 않네요.', 'dlshpdnyhdujojfhldroynancigfhcckmuvtcysmgamefgwljkxudlmoldgoehthgokebqjqaytaqyvpdpurkiqefeyodpmmsaiwxvcsvjcg', 1, '2015-02-25', 73, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(37, 4, '안좋아요', 'bbgykeqcssmkcsjycveosqsdhihdrspiablmubcobqhfhhfadfocsyodpwsemcrgnupddmneebdkcsutiusoruhutybrwgyspltlecrcbpyhphxuectkiqmqkextauqdnvlfuwujgxdgegwsaoc', 0, '2015-02-25', 85, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(6, 1, '썩 맘엔들지 않네요.', 'spokluirmdvyedpausdosdcfwgicxeekfjdworkrrycctrmoakmqvnjvvhvejepgelmsjxawjdrurrcedsqmrtmvofoyhskmbwccbuqsknwscfaclrkcedqwwggusmnuqgvolbvgvoypqylpldwcvupljrivyjdffhefoggnfuwoaivuyosbbpxnaovawhrogrobhsknbnweepqsbooentmxmnsymarpjbjnegwqmolkrxetyijaflfi', 0, '2015-02-25', 6, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(11, 1, '또오고싶어요.', 'xoiqbjwrgsrtfsgeahvldxasvgdfoocleusqumpgcsacokeggwngcoguuxucqanxawmfostouesafnotfkbmoqtodccxrynckguhcirejryvosnwlqcvtjtysveyaxxvjtqpusrnyljkutgalkqvkcmgjsmxjysapeabplnrkakcvsuhkkeipisonypqk', 0, '2015-02-26', 83, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(45, 4, '교통편 문의', 'lvfprgokptxccricejvqpmaqlxoaytjehthyuyksppwubnnrwhummvbucvmbkjxsudpouvioatojqynkuqobuuoqddugoicndcmoprtbywkglywkkmqrhcfnirfftpbwitdklhhvgmmowbkllrefedkarsgugkyahbqijgmetingxakhosgednndswxkfrsragkhfgityuhvssimosbwaqtarrbhdnxpsgvanvbvsqgrkqjmuccmgvpyrbg', 0, '2015-02-26', 24, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(25, 2, '교통편 문의', 'jtkgyojgdgyggolkiidcaqoogfscldukobbbhfnnemdwurgdiksgfriytrxunsgbssedmhhphqygdfeqglacpvhsh', 0, '2015-02-26', 62, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(19, 1, '이 방 넓은가요?', 'eaqxgattkvspcarppimywwdhbpsqkpsnitbbhvpjynwgfecgdxwhtqeqkioyomstmqpqmpawjbrgyilapinwtltokloikdyxyphmvgjhpcklsretinmerqejdktphukwfquvkcyikembismwgesddprficbvpcdnlcedflsrwcracrpkd', 0, '2015-02-27', 33, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(10, 3, '교통편 문의', 'ilweipffvvquwkuufficnkgyklwrnirdkynpiqjsraoqvejdtdrnuucrljsvbrokdnrlyapetdkiqpnpdtxkngatljkrejvcprvapcdnyeemnvhhuiumkmcqmigorjwqds', 0, '2015-02-27', 71, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(12, 3, '이 방 넓은가요?', 'yagdfadulstvgtktryeyieianaebqnjqwpgqpkrpjtocepwwqfmgqswxaseqwaryfcrhtymugwumfijyhricaceqkblgsfdmraklixxnvkmklfiidhlurhdaguktrayrxesdxeoueiqtepaubkoobcje', 0, '2015-02-27', 58, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(10, 1, '또오고싶어요.', 'jsreftmalclkjwqkchorebrybihmvmuqcxuoyinhkejfocywagojhifkinuyccqpmkldvwbrwcqkkpltocfimycvwvmcntcjjrtauxrwqjrspbmisxcbdgvujtohdeavwusaqspwakyqapnbfhtmijtbtcljvuobptcxoyncxvxuhgoekakjhhxc', 1, '2015-02-28', 39, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(18, 2, '썩 맘엔들지 않네요.', 'tegeprhxcxlgkdrohxlhhwrgscubahwroivrhjdqemxutckwybrfaesqvcecjyxggtuagqyvphrlejrevutfyrtssrulpxjlrpxicbrcvlyuvjcwoesevurcxqtppfcpbnwtkkcwfjwfyahpxejikymbpuwnmvmcqwyubrdrhycsrdsemxuqhsltvjxjgxiabenummxnyiftdfaunpfqnlciygfmrwyuhlbfylbridgckbkn', 1, '2015-03-01', 33, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(13, 2, '안좋아요', 'cibughbsnrfxxclvaikvcjnfxmyhygkbiyqowlffdkoqvrtemkioyoswimjsirgwmimgpfmqwycgblrvkxwiqoovnfsrjphngaetdxgrwgtqtyvtiaancvihhadjpubfnddvjuyadtcpafjuweneeikfidlxomncxpapjbiixksafxnfcakpbxpjnqslsgplhrrbrxarmcvkpnxqgivgksw', 0, '2015-03-02', 87, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(24, 1, '정말좋아요', 'oukvepmvuxhsbdwobclnhqxmiximepvjhnayxjaxbjsofneqckijpfvmwybmibgcbjjjywhpfrggcvkxdkowfuggopxhihqbikqauoersbqnblaksripdeqnycphnstvgqccvswvtkvalliqaykimdaxifhvlfgrgmkasycvxktknoqyroubqhvenxwaxxjneanlkuqyspwbhjmpnhgpkceftxjbtkrpfkeaciaaulaxhrhbmxcjjiteookdmclolaqyotjpvmrnfgajpcdkveyylvvybqaowtpxs', 1, '2015-03-03', 44, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(49, 1, '이 방 넓은가요?', 'owntunsfnrqmasjsbxke', 0, '2015-03-03', 17, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(48, 4, '문의합니다.', 'xutyctsawnkvtqhembxdasvrlqwbtvmcxkeuejuucabkybhttoircwcumqpalehupvolipcwbelivxawfkcoaujipvcifynmmessplwueahrvysfvcrubgcga', 0, '2015-03-03', 59, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(5, 1, '썩 맘엔들지 않네요.', 'cheywqakoxwntvnpcaknbygdubthwveegtoytdhwduxmduykspidvumyiigxttjevqlqlmpsqunsrcmowvidgpuxwnhrdptfedbtngjkhvmxyocjugpfbpwwmnaeibuejhtxfwrsh', 0, '2015-03-04', 4, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(9, 3, '썩 맘엔들지 않네요.', 'uykncerdbmyneflsahkftvswhvvwijvlrhyrccesiacycuakkmidepthfoeqnogpafldbvmavhdkmlmftfeekvolftwmgbhopqdqcdqbsokqfkuxyytbsnglwnpmwvvlorslpgkhpldkljdpxsfhxanrjhhcdinqjlofucnjbouvmkghumycbaqwcel', 0, '2015-03-05', 12, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(4, 1, '안좋아요', 'nmvjhevlrgwglmehluydhcgiwtbmavlseqljwjqqvmcwambvnatceruonumlccjrvndnxrebpaujsaiq', 0, '2015-03-07', 85, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(28, 4, '정말좋아요', 'eahvwfvbiqyisfilnaorhsrdxfqtaqejvyawcspqmujalajksoqjyctrusbafpwpsrelonufmvwixqxmyqdrjobumeqivbrvslvujwgkbdmhyigcaqbkhndffgxoxhtoyqllmkvqdowtfmhairwxugsytykjottpdvvjtwchruhkoyclqqtselyqcvngbd', 0, '2015-03-08', 84, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(40, 4, '교통편 문의', 'mnhrpmggssmysnrufxdonqtnbxwionueopdruyoxixuhintslvcxeqajtxvtasvdhfcnqtoyfdawuaysqommmjhktgworlaptonlgbpsbkcriqjccwyklnypufdlxpntsncqxawikanjhdbcesylwywsexjfqndrfbaoohdsjknsgqladpkaidyamuuiboetksktmjffnomutbdnsomcvjtdywgdjycbcrgbjxnutrgeeijjidsgbqqhucaokbkkinvl', 0, '2015-03-08', 11, 1);

insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('넥센', '전라도', 01024168584, 'ifyhs@naver.com', '김칠휘', '신한은행', 01067799028, '박현메');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('엘지', '충청도', 01059084123, 'pvawcktmx@daum.net', '정이타', '우리은행', 01091475206, '박선연하');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('롯데', '서울특별시', 01022022279, 'rplwn@daum.net', '김심민', '새마을금고', 01000062175, '이이라');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('씨제이', '강원도', 01020828090, 'vdkvnqwqn@naver.com', '박사라', '신한은행', 01075944647, '정현휘');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('엘지', '대구광역시', 01035947344, 'kukctmkxt@daum.net', '김연연하', '국민은행', 01034113491, '최팔라');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('삼성', '전라도', 01009421831, 'vhyjv@naver.com', '박사메', '우리은행', 01052403096, '정육호');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('엘지', '전라도', 01098810116, 'hrcccuqre@daum.net', '하선단', '새마을금고', 01075704509, '김선간');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('엘지', '울산광역시', 01061296535, 'kwgge@daum.net', '박현휘', '새마을금고', 01049286992, '이칠호');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('삼성', '충청도', 01036400809, 'eewtrmmm@naver.com', '하연단', '새마을금고', 01073984470, '정삼연하');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('엘지', '경기도', 01075731871, 'ppaayinj@gmail.com', '이오', '국민은행', 01047821353, '최육라');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('넥센', '인천광역시', 01027414064, 'fsbfaup@daum.net', '이이', '국민은행', 01071970741, '최심연하');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('구글', '경기도', 01001078045, 'pgqxee@daum.net', '정이단', '우리은행', 01095261101, '정선휘');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('현대', '강원도', 01019481105, 'cyxkddliu@naver.com', '이연연하', '우리은행', 01054108267, '하일호');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('현대', '대구광역시', 01062229392, 'rcgvcefff@gmail.com', '김오단', '우리은행', 01057703990, '이연간');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('롯데', '부산광역시', 01066750486, 'qgmcbxg@gmail.com', '이팔연하', '신한은행', 01003271068, '정심메');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('넥센', '대구광역시', 01009903180, 'foncwlhvn@daum.net', '정칠메', '신한은행', 01023872956, '정일단');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('주피터', '대구광역시', 01083720781, 'endnoa@gmail.com', '김팔휘', '신한은행', 01093055843, '박칠수');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('롯데', '경상도', 01089034063, 'stroey@gmail.com', '김현수', '신한은행', 01079003264, '김현타');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('엘지', '대전광역시', 01042427406, 'ailxgmwx@daum.net', '최칠단', '국민은행', 01041529789, '박칠간');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('테슬라', '경기도', 01043480054, 'dhuuvd@daum.net', '최팔간', '국민은행', 01070871448, '이팔호');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('롯데', '전라도', 01043086617, 'kooxu@gmail.com', '이삼타', '우리은행', 01061417065, '박사수');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('삼성', '서울특별시', 01038469825, 'qogwvio@gmail.com', '김현단', '국민은행', 01084653351, '박사타');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('넥센', '강원도', 01082595948, 'wjobukll@gmail.com', '김연단', '신한은행', 01010062443, '최오라');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('엘지', '부산광역시', 01061606798, 'kdeucwn@naver.com', '이연호', '하나은행', 01040751252, '최팔단');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('씨제이', '경상도', 01010765730, 'bhwmlq@naver.com', '최오수', '국민은행', 01061062552, '이오호');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('구글', '부산광역시', 01099288845, 'rpaftbk@gmail.com', '하칠호', '국민은행', 01036315491, '이일호');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('테슬라', '광주광역시', 01061590869, 'hpedjtss@gmail.com', '최칠민', '우리은행', 01007569974, '박삼간');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('현대', '강원도', 01006561743, 'edwnbqi@gmail.com', '최선라', '신한은행', 01071214650, '김오타');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('씨제이', '대구광역시', 01061207423, 'sejrsp@daum.net', '김삼간', '하나은행', 01033159808, '하삼');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('주피터', '대전광역시', 01024322108, 'gqjmq@daum.net', '박삼단', '국민은행', 01089448306, '정칠민');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('넥센', '대전광역시', 01050155664, 'nnldhvr@naver.com', '정심석', '우리은행', 01067445954, '최삼석');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('삼성', '전라도', 01069216183, 'gynejuylx@naver.com', '김칠단', '우리은행', 01030595923, '박이연하');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('현대', '전라도', 01048985827, 'gefkdih@naver.com', '정칠단', '하나은행', 01052232452, '정삼');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('현대', '부산광역시', 01037136342, 'vjfha@naver.com', '최이수', '하나은행', 01052916192, '김연단');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('주피터', '울산광역시', 01070652618, 'nuywls@naver.com', '최심수', '우리은행', 01007981030, '김연');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('넥센', '경상도', 01084274705, 'bqrrqq@gmail.com', '최사호', '하나은행', 01095632614, '정육수');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('씨제이', '제주도', 01099596680, 'vcqieib@gmail.com', '이선타', '우리은행', 01049696518, '하칠수');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('테슬라', '경상도', 01078145633, 'fqutbq@gmail.com', '최삼라', '신한은행', 01022791381, '이육단');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('현대', '강원도', 01068445339, 'qnuuigmtf@daum.net', '김연간', '국민은행', 01003545272, '박팔');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('롯데', '전라도', 01016366489, 'medpwsgsf@naver.com', '최일수', '신한은행', 01014437204, '박육수');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('주피터', '세종특별시', 01092348584, 'kaxdacpj@naver.com', '하팔연하', '신한은행', 01059811500, '박삼연하');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('테슬라', '광주광역시', 01046028698, 'bsdtabvv@gmail.com', '하칠간', '하나은행', 01093884191, '김육라');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('주피터', '울산광역시', 01046864977, 'ydngumsyc@naver.com', '정팔메', '하나은행', 01061340171, '김일호');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('구글', '서울특별시', 01069954962, 'urewrul@gmail.com', '이육석', '하나은행', 01049786702, '하칠민');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('롯데', '강원도', 01021717210, 'aoffqajj@naver.com', '이삼연하', '하나은행', 01068403803, '김오석');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('엘지', '제주도', 01016201176, 'jaxshhirh@daum.net', '정삼연하', '국민은행', 01061838460, '정팔수');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('엘지', '울산광역시', 01009568437, 'chfwumbhi@daum.net', '최삼민', '국민은행', 01040944001, '박선호');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('주피터', '경상도', 01079489623, 'tbaivg@naver.com', '정육', '신한은행', 01025740865, '하칠호');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('테슬라', '세종특별시', 01079814191, 'lhpqby@naver.com', '하육호', '신한은행', 01058154420, '최삼라');
insert into buyer(buyer_name, buyer_add, buyer_tel, buyer_email, buyer_charger, buyer_bank, buyer_bankno, buyer_bankname) values('현대', '경기도', 01028385203, 'tpiwirf@daum.net', '박선호', '국민은행', 01096800716, '최일메');

insert into prod(prod_buyer, prod_name, prod_type, prod_price, prod_safety) values(48, '이불', '침구', 80000, 42);
insert into prod(prod_buyer, prod_name, prod_type, prod_price, prod_safety) values(44, '치약', '일회용품', 100, 100);
insert into prod(prod_buyer, prod_name, prod_type, prod_price, prod_safety) values(43, '칫솔', '일회용품', 100, 100);
insert into prod(prod_buyer, prod_name, prod_type, prod_price, prod_safety) values(50, '샴푸', '일회용품', 100, 100);
insert into prod(prod_buyer, prod_name, prod_type, prod_price, prod_safety) values(39, '바디워시', '일회용품', 150, 100);
insert into prod(prod_buyer, prod_name, prod_type, prod_price, prod_safety) values(45, '비누', '일회용품', 300, 100);
insert into prod(prod_buyer, prod_name, prod_type, prod_price, prod_safety) values(6, '비타500', '음식', 500, 100);
insert into prod(prod_buyer, prod_name, prod_type, prod_price, prod_safety) values(47, '면도기', '일회용품', 500, 100);
insert into prod(prod_buyer, prod_name, prod_type, prod_price, prod_safety) values(38, '면봉', '일회용품', 10, 100);
insert into prod(prod_buyer, prod_name, prod_type, prod_price, prod_safety) values(35, '드라이기', '기타', 50000, 42);
insert into prod(prod_buyer, prod_name, prod_type, prod_price, prod_safety) values(12, '베게', '침구', 20000, 42);
insert into prod(prod_buyer, prod_name, prod_type, prod_price, prod_safety) values(26, '티비', '기타', 500000, 42);
insert into prod(prod_buyer, prod_name, prod_type, prod_price, prod_safety) values(49, '에어컨', '기타', 800000, 42);

insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(7, 206, '2018-10-11', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(8, 309, '2018-02-20', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(8, 205, '2015-04-23', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(4, 407, '2017-09-12', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(6, 406, '2020-12-12', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(11, 302, '2018-03-20', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(7, 501, '2016-08-08', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(6, 404, '2015-04-21', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(8, 410, '2016-07-22', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(6, 505, '2018-04-12', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(1, 308, '2019-04-21', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(1, 505, '2020-01-06', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(6, 302, '2019-01-08', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(7, 404, '2019-08-02', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(8, 505, '2018-05-05', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(2, 210, '2015-09-15', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(10, 201, '2019-04-01', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(7, 401, '2016-01-26', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(5, 206, '2016-09-09', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(3, 203, '2018-03-04', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(4, 303, '2020-04-02', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(9, 206, '2020-05-18', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(3, 210, '2018-07-19', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(4, 503, '2016-12-18', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(6, 510, '2016-01-18', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(6, 409, '2018-10-27', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(10, 405, '2017-10-24', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(3, 401, '2015-04-01', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(4, 207, '2018-07-07', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(7, 507, '2018-06-23', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(1, 509, '2015-06-21', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(2, 508, '2018-04-05', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(6, 401, '2016-10-23', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(7, 310, '2019-07-18', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(5, 409, '2016-04-05', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(3, 204, '2019-12-26', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(5, 307, '2020-06-14', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(4, 201, '2019-06-27', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(5, 510, '2017-11-01', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(10, 206, '2015-10-23', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(6, 303, '2017-12-09', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(4, 305, '2020-10-08', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(10, 409, '2020-10-06', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(6, 208, '2015-11-13', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(12, 309, '2017-02-08', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(11, 309, '2020-04-21', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(5, 409, '2017-08-03', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(6, 509, '2017-07-24', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(11, 403, '2015-06-01', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(8, 405, '2018-03-21', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(7, 304, '2019-08-08', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(5, 208, '2019-09-19', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(13, 204, '2018-02-02', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(3, 410, '2016-05-11', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(4, 209, '2015-05-02', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(4, 503, '2018-12-15', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(5, 402, '2015-06-12', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(10, 205, '2020-12-18', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(3, 203, '2020-01-13', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(1, 303, '2018-07-11', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(11, 408, '2018-04-24', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(9, 310, '2018-04-22', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(6, 303, '2018-12-12', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(5, 506, '2017-05-02', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(3, 404, '2015-04-02', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(11, 206, '2018-08-09', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(2, 208, '2017-09-07', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(2, 307, '2019-01-13', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(13, 306, '2016-08-06', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(11, 508, '2020-05-26', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(1, 304, '2017-12-12', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(12, 407, '2020-07-05', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(6, 302, '2015-08-06', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(9, 504, '2019-06-06', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(4, 503, '2015-11-20', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(4, 510, '2017-12-27', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(10, 407, '2018-07-05', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(2, 406, '2018-09-22', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(2, 204, '2020-10-04', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(3, 304, '2016-07-02', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(10, 307, '2019-01-20', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(10, 207, '2019-01-26', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(1, 510, '2016-06-18', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(10, 205, '2017-03-09', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(2, 405, '2018-01-13', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(2, 204, '2017-06-10', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(13, 203, '2017-06-11', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(10, 204, '2015-08-19', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(4, 501, '2017-05-21', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(11, 208, '2015-06-18', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(7, 410, '2020-10-24', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(12, 507, '2015-08-08', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(8, 305, '2016-11-18', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(12, 308, '2020-07-16', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(6, 207, '2020-11-02', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(8, 303, '2015-11-24', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(5, 407, '2019-12-11', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(6, 307, '2016-03-18', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(12, 305, '2019-10-06', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(5, 505, '2016-03-05', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(6, 204, '2015-02-05', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(5, 202, '2015-10-23', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(2, 408, '2019-06-03', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(7, 403, '2020-01-06', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(6, 303, '2017-08-19', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(3, 302, '2017-12-09', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(3, 205, '2015-01-05', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(11, 301, '2016-10-19', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(3, 403, '2019-08-07', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(6, 502, '2019-05-15', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(7, 503, '2019-11-03', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(7, 203, '2018-11-23', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(7, 207, '2019-07-06', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(4, 208, '2020-02-09', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(10, 406, '2017-10-02', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(11, 304, '2017-10-10', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(10, 406, '2016-12-24', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(13, 507, '2015-03-18', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(6, 403, '2015-02-12', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(12, 308, '2020-03-12', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(9, 403, '2019-04-02', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(9, 201, '2018-08-05', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(1, 409, '2017-06-12', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(7, 402, '2017-05-23', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(11, 305, '2020-10-05', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(13, 407, '2018-06-23', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(7, 204, '2019-01-24', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(12, 307, '2015-01-24', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(9, 509, '2017-12-23', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(5, 306, '2020-01-05', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(3, 204, '2019-11-08', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(12, 401, '2018-02-21', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(12, 405, '2015-02-20', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(1, 203, '2019-06-23', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(1, 306, '2015-02-01', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(8, 403, '2017-01-10', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(8, 503, '2020-03-14', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(12, 201, '2017-07-04', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(3, 402, '2016-02-01', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(1, 209, '2017-05-19', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(1, 510, '2020-09-07', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(3, 301, '2015-11-10', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(5, 509, '2019-06-21', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(1, 304, '2016-04-08', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(13, 210, '2019-06-04', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(10, 309, '2016-02-26', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(13, 403, '2016-02-16', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(5, 509, '2019-10-27', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(5, 205, '2019-01-17', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(10, 410, '2016-09-18', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(5, 402, '2017-05-05', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(7, 203, '2017-05-27', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(9, 309, '2017-02-22', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(2, 402, '2019-04-26', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(6, 507, '2020-02-12', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(2, 203, '2020-10-26', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(10, 208, '2016-05-13', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(12, 308, '2015-11-02', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(3, 503, '2018-12-11', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(9, 410, '2020-04-23', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(12, 506, '2019-09-11', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(8, 504, '2018-10-10', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(11, 201, '2016-08-03', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(11, 407, '2016-05-16', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(3, 503, '2017-10-01', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(1, 501, '2016-02-06', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(12, 503, '2017-10-15', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(12, 406, '2016-09-19', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(12, 210, '2015-01-18', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(12, 206, '2017-03-19', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(13, 409, '2016-11-14', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(5, 307, '2015-08-11', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(4, 204, '2017-08-25', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(6, 207, '2015-08-15', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(4, 503, '2019-10-12', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(6, 508, '2017-11-07', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(1, 502, '2019-10-27', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(1, 201, '2017-10-20', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(2, 506, '2017-10-24', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(6, 404, '2019-01-18', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(1, 205, '2016-12-17', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(13, 307, '2018-11-21', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(13, 202, '2019-01-11', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(12, 308, '2019-08-24', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(8, 405, '2019-11-18', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(7, 204, '2020-04-11', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(8, 208, '2018-06-11', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(8, 303, '2015-02-05', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(2, 510, '2020-09-08', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(12, 206, '2016-09-26', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(3, 301, '2017-01-18', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(1, 401, '2016-11-13', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(3, 207, '2015-01-19', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(7, 501, '2018-01-03', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(6, 409, '2018-03-24', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(1, 208, '2017-11-07', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(9, 204, '2015-11-03', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(12, 402, '2016-09-16', '사용중');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(11, 309, '2015-12-13', '신품');
insert into pdinfo(pdinfo_prod, pdinfo_rmnum, pdinfo_indate, pdinfo_status) values(9, 503, '2020-05-24', '신품');

insert into event(event_mem, event_room, event_start, event_end, event_type, event_sale, event_title, event_cont, event_code)
values(null, null, '20220506', '20220506', '할인', 15, '어린이날 15% 할인 이벤트', '즐거운 어린이날', '2022050101');
insert into event(event_mem, event_room, event_start, event_end, event_type, event_sale, event_title, event_cont, event_code)
values(null, null, '20220501', '20220531', '할인', 10, '5월 가정의 달 10% 할인 이벤트', '가족과 함께 힐링하세요', '2022050102');
insert into event(event_mem, event_room, event_start, event_end, event_type, event_sale, event_title, event_cont, event_code)
values(null, null, '20220310', '20220315', '할인', 15, 'GORYEO HOTEL 20주년 20% 이벤트', '2002년 개업 축하 이벤트', '2022050103');
commit;