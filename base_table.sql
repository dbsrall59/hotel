drop table post;
drop table reserve;
drop table member;
drop table room;

create table buyer(
BUYER_ID           NUMBER(15)      NOT NULL,  --�ŷ�ó ID
BUYER_NAME         VARCHAR2(100)   NOT NULL,  --�ŷ�ó �̸�
BUYER_ADD          VARCHAR2(100)   NOT NULL,  --�ŷ�ó�ּ�
BUYER_TEL          NUMBER          NOT NULL,  --����ó
BUYER_EMAIL        VARCHAR2(50)    NOT NULL,  --�̸���
BUYER_CHARGER      VARCHAR2(10)    NOT NULL,  --�����
BUYER_BANK         VARCHAR2(9)     NOT NULL,  --����
BUYER_BANKNO       NUMBER          NOT NULL,  --���¹�ȣ
BUYER_BANKNAME     VARCHAR2(3)     NOT NULL,  --������
CONSTRAINT pk_buyer_id PRIMARY KEY (buyer_id)
);


create table prod(
prod_id        NUMBER         NOT NULL,    --��ǰID
prod_buyer     NUMBER         NOT NULL,    --�ŷ�óID
prod_name      VARCHAR(100)   NOT NULL,    --��ǰ��
prod_type      VARCHAR(100)   NOT NULL,    --��ǰ�з�
prod_price     NUMBER         NOT NULL,    --��ǰ����
prod_safety    NUMBER         NOT NULL,    --����������
CONSTRAINT pk_prod_id PRIMARY KEY (prod_id),
CONSTRAINT fr_prod_buyer FOREIGN KEY (prod_buyer) REFERENCES buyer(buyer_id)
);

CREATE TABLE RMNUM
(
RMNUM_ID    NUMBER   (15) NOT NULL,
RMNUM_ROOM  NUMBER       NOT NULL,
RMNUM_ABOUT VARCHAR2 (100)NOT NULL,
CONSTRAINT PK_RMNUM PRIMARY KEY (RMNUM_ID),
CONSTRAINT FR_RMNUM_ROOM FOREIGN KEY (RMNUM_ROOM) REFERENCES ROOM(ROOM_ID)
);


create table pdinfo(
pdinfo_id       NUMBER         NOT NULL,   --��ǰ����ID
pdinfo_prod     NUMBER         NOT NULL,   --��ǰID
pdinfo_rmnum    NUMBER         NOT NULL,   --ȣ��ID
pdinfo_indate   DATE           NOT NULL,   --�԰�¥
pdinfo_status   VARCHAR(300)   NOT NULL,   --����
CONSTRAINT pk_pdinfo_id PRIMARY KEY (pdinfo_id),
CONSTRAINT fr_pdinfo_prod FOREIGN KEY (pdinfo_prod) references prod(prod_id), 
CONSTRAINT fr_pdinfo_rmnum FOREIGN KEY (pdinfo_rmnum) references rmnum(rmnum_id)
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
ROOM_NUM           NUMBER                  NOT NULL,
ROOM_TYPE          VARCHAR2(30)       NOT NULL,
ROOM_COUNT NUMBER NOT NULL,
CONSTRAINT pk_room_id PRIMARY KEY (room_id)
);


CREATE TABLE reserve
(
    res_id NUMBER(15) generated always as identity NOT NULL,
    res_mem number not null,
    res_room number not null,
    res_in date not null,
    res_out date not null,
    res_date date not null,
    res_price number not null,
    res_adult number not null,
    res_kid number not null,
    res_baby number not null,
    CONSTRAINT pk_reserve PRIMARY KEY (res_id),
    CONSTRAINT fr_res_mem FOREIGN KEY (res_mem) REFERENCES member(mem_inid),
    CONSTRAINT fr_res_room FOREIGN KEY (res_room) REFERENCES room(room_id)
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

INSERT INTO room (ROOM_NM, ROOM_IM, ROOM_INFO, ROOM_SALE, ROOM_NOTICE, ROOM_NUM, ROOM_TYPE, ROOM_COUNT)
            VALUES ('�𷰽���', null, 'Ŭ������ ������ ������ �𷰽���', '180000', 'üũ���� 15:00�̸� üũ�ƿ��� 11:00�Դϴ�','3', '�𷰽���', 3);
INSERT INTO room (ROOM_NM, ROOM_IM, ROOM_INFO, ROOM_SALE, ROOM_NOTICE, ROOM_NUM, ROOM_TYPE, ROOM_COUNT)
            VALUES ('����Ͻ���', null, '�� ��ó�� ����ϰ� �ƴ��� ����Ͻ���', '300000', 'üũ���� 15:00�̸� üũ�ƿ��� 11:00�Դϴ�','3','����Ͻ���', 3);
INSERT INTO room (ROOM_NM, ROOM_IM, ROOM_INFO, ROOM_SALE, ROOM_NOTICE, ROOM_NUM, ROOM_TYPE, ROOM_COUNT)
            VALUES ('����Ʈ��', null, 'Ŭ������ ������ ������ �𷰽���', '550000', 'üũ���� 15:00�̸� üũ�ƿ��� 11:00�Դϴ�','3','����Ʈ��', 3);
INSERT INTO room (ROOM_NM, ROOM_IM, ROOM_INFO, ROOM_SALE, ROOM_NOTICE, ROOM_NUM, ROOM_TYPE, ROOM_COUNT)
            VALUES ('Ʈ����', null, 'Ŭ������ ������ ������ �𷰽���', '510000', 'üũ���� 15:00�̸� üũ�ƿ��� 11:00�Դϴ�','5','Ʈ����', 5);

insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('jwkmlirf', 'hugw', 701127, 0, 1012, 27, 1, 01064517525, 'hedtjjds@gmail.com', '������', '����������', '2016-06-06');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('nrbnywciegarfs', 'lmttnprhkg', 740425, 0, 4343, 38, 1, 01009867617, 'grkbodf@naver.com', '�ֽ�Ÿ', '���ֱ�����', '2020-03-08');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('byhuesb', 'nssdwsi', 620109, 0, 8934, 43, 0, 01023242177, 'diijxlr@naver.com', '���ȶ�', '��⵵', '2015-02-27');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('oklmmtmbh', 'xmfng', 870506, 0, 6893, 06, 0, 01084080756, 'knfvps@daum.net', '��ɼ�', '����Ư����', '2019-02-09');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('uprw', 'ooukfota', 030219, 0, 9141, 68, 0, 01063996540, 'eqetjxwax@daum.net', '������', '����Ư����', '2017-03-04');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('dpcewquuatu', 'ohcjy', 570219, 0, 3500, 02, 0, 01024420175, 'daoot@naver.com', '�輱��', '����', '2020-10-08');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('efqgw', 'yuljvncdiibrawjxxl', 780109, 0, 3639, 14, 1, 01013714657, 'empydsska@daum.net', '�ϻ��', '�λ걤����', '2015-12-24');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('jiuwei', 'eqfbi', 601118, 0, 4056, 36, 1, 01031471135, 'jakbiobiq@gmail.com', '��ĥ��', '������', '2016-09-27');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('aqus', 'vjayhqbqnvowmvdlegv', 540214, 0, 1232, 53, 0, 01061873126, 'nlfsd@gmail.com', '��������', '��û��', '2015-01-22');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('fwpsssbsegivqp', 'duwdfcoxrutqghiti', 050424, 0, 2639, 99, 0, 01040276737, 'usyyatwt@gmail.com', '�ֻ�ȣ', '�λ걤����', '2019-10-25');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('quegw', 'pphktixnplup', 681014, 0, 8101, 90, 1, 01053008102, 'tblumv@daum.net', '�Ͽ�ȣ', '����Ư����', '2016-03-01');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('akdrfsneda', 'lnqhyquiyohkwgd', 510206, 0, 5849, 38, 0, 01006479969, 'ubttcofjm@daum.net', '���̼�', '�λ걤����', '2017-10-26');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('lvkbrt', 'apklsnxsha', 851213, 0, 2217, 84, 0, 01003592009, 'mircguw@naver.com', '����', '���ֱ�����', '2017-07-05');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('fyqomgwcfsj', 'ciftgtyiohj', 690316, 0, 5207, 17, 0, 01074864216, 'yxdpf@gmail.com', '������', '�뱸������', '2016-06-20');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('atehkwpf', 'wpld', 501126, 0, 0355, 04, 0, 01052126433, 'khfgjvdl@daum.net', '�ڼ�', '����������', '2015-09-25');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('barholexrw', 'krwb', 820118, 0, 5980, 24, 1, 01007384747, 'bimahnfo@daum.net', '��������', '������', '2019-03-15');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('kdnnwvubvkpaa', 'aqvfoqxqpevloqljcj', 650214, 0, 7009, 37, 1, 01012710197, 'intuctwu@naver.com', '����ȣ', '����Ư����', '2018-11-14');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('iquod', 'fokrjqctqpqsgaokoqm', 590625, 0, 6929, 35, 1, 01015325609, 'acqhaut@naver.com', '���ϼ�', '��õ������', '2016-08-03');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('fawjkbvkolx', 'fmwcaikyunoxurb', 891210, 0, 1766, 64, 0, 01088655334, 'rbbqgu@gmail.com', '��������', '��û��', '2018-10-23');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('mpabfkg', 'twtvuufnxwr', 690427, 0, 3077, 12, 1, 01039281462, 'kvcxhsxlt@daum.net', '��ĥ��', '�λ걤����', '2018-11-19');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('gkjytolg', 'lvmvp', 620124, 0, 9798, 21, 0, 01068720532, 'edbrle@naver.com', '���ȿ���', '���ֱ�����', '2018-08-08');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('frwbclxovohf', 'mixdcudvvt', 750623, 0, 5130, 72, 0, 01020296403, 'oxaqsxqce@gmail.com', '�ڻ��', '��⵵', '2018-06-27');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('yqjei', 'cfclqh', 830618, 0, 4273, 22, 0, 01003680812, 'kggjue@naver.com', '����', '������', '2019-06-23');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('fieglrne', 'npsvudjtuxpqlmm', 720522, 0, 1183, 82, 1, 01056375260, 'ixrtflvo@daum.net', '����ȣ', '���ֱ�����', '2016-12-22');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('rgduiuga', 'bhputreilotno', 530820, 0, 2537, 52, 1, 01048085454, 'ffgtiyk@gmail.com', '������', '��û��', '2018-02-13');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('slmrvpkvjjpk', 'upjhaxjdpwkxyeuret', 860504, 0, 2002, 58, 0, 01063239751, 'fnonri@gmail.com', '�ڽ���', '��û��', '2016-09-24');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('weejhihvdwo', 'cumxtroyvnscketbtee', 800716, 0, 5038, 03, 0, 01067966596, 'bksck@naver.com', '����Ÿ', '���ֱ�����', '2018-11-15');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('ndwoieijshm', 'ngsh', 590612, 0, 0088, 14, 0, 01069761041, 'stads@gmail.com', '�ֿ���', '��걤����', '2020-08-14');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('neyfucvicc', 'ctkf', 860621, 0, 6430, 19, 0, 01043089521, 'ppfbgwr@gmail.com', '�̼�����', '�λ걤����', '2020-05-01');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('qemltwl', 'bopn', 820508, 0, 4989, 43, 0, 01036844771, 'irabrpxtc@naver.com', '���翬��', '��⵵', '2015-10-12');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('ghdjplvgdslrf', 'igaywqreaesloptjsag', 040425, 0, 5825, 46, 0, 01001043271, 'hdltiog@gmail.com', '�Ͽ���', '���', '2018-04-22');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('andxtslwvlfmm', 'pfvgkpdqwqed', 840910, 0, 6857, 68, 0, 01056204525, 'txfam@daum.net', '������', '����������', '2016-03-13');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('dphgoxp', 'spurnkmtdacdvxepr', 670705, 0, 3585, 53, 1, 01099067160, 'ukspiuli@gmail.com', '���ȣ', '����Ư����', '2015-12-12');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('bvgdmju', 'mkajcoivjes', 550401, 0, 8882, 77, 1, 01046663006, 'rqgkmnrsi@naver.com', '������', '��õ������', '2020-10-08');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('ocbgwkb', 'najgkhhqnocwqqnnkcj', 840110, 0, 8765, 00, 0, 01073029059, 'wuwijfr@daum.net', '�ڻ��', '��û��', '2017-05-06');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('tuqklei', 'eaocmfvwghh', 500825, 0, 9434, 34, 1, 01041546210, 'qadou@naver.com', '���ȼ�', '�뱸������', '2019-07-11');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('jgewvm', 'gkitalnlnfpmtrcodix', 581104, 0, 9071, 31, 0, 01015149159, 'qvvdg@gmail.com', '����', '��⵵', '2018-03-02');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('xhjh', 'egkkfegwkkpsu', 071025, 0, 2034, 71, 1, 01035552632, 'esiidwa@naver.com', '������', '��û��', '2020-12-03');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('ujwucmvvpox', 'nheyrgbedfhnsjxgof', 630307, 0, 5200, 10, 1, 01026844401, 'fiqobwm@daum.net', '������', '����Ư����', '2015-10-23');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('paeqhipirmbdcc', 'uieyr', 740817, 0, 4977, 48, 1, 01021334880, 'wopdcff@naver.com', '��ĥ����', '�뱸������', '2020-11-15');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('kesrbyslaes', 'sptkmgtixwcm', 520620, 0, 4573, 12, 0, 01098187697, 'pxlang@daum.net', '���ϸ�', '�λ걤����', '2017-12-06');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('fwpryaehf', 'wxpyolukcwxxxwqls', 891108, 0, 3864, 83, 1, 01078468765, 'unxqwhnx@daum.net', '��ﰣ', '���ֱ�����', '2016-11-22');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('rbgu', 'mnupdkklaswlhpohgk', 510408, 0, 3932, 09, 1, 01074217814, 'pshcybg@gmail.com', '��ɴ�', '��õ������', '2016-02-07');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('bprxbnsmoxs', 'dpxkgqkofsjkhxs', 810309, 0, 6021, 12, 1, 01092266008, 'qksxmif@daum.net', '������', '�뱸������', '2018-05-03');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('eplimxnhft', 'ndobhumw', 560402, 0, 3864, 89, 0, 01068828727, 'vrfixvlyl@gmail.com', '��缮', '����Ư����', '2020-11-08');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('updeipb', 'uwmapporwujws', 520208, 0, 8728, 35, 0, 01052983443, 'wnyqqhc@daum.net', '����Ÿ', '����������', '2018-02-03');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('ujfovmuigs', 'spekponipystcr', 090320, 0, 4763, 96, 1, 01014909359, 'ipxaagrt@naver.com', '�ڻ��', '��걤����', '2018-11-23');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('qyvpcqirfnxtd', 'ihcubpninghncwfn', 740227, 0, 9456, 78, 1, 01000817978, 'aubpcrqr@daum.net', '������', '����Ư����', '2017-09-17');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('fhgpg', 'pgejrewbildiro', 501027, 0, 2214, 49, 1, 01061114795, 'nbnxrly@daum.net', '���ȹ�', '����Ư����', '2020-09-26');
insert into member(mem_id, mem_pw, mem_regno, mem_staff, mem_cardno, mem_cdpw, mem_gender, mem_tel, mem_email, mem_name, mem_add, mem_date) values('cojxvqp', 'lkrr', 560802, 0, 4263, 87, 1, 01069184164, 'hvxboa@naver.com', '�̼���', '����', '2020-10-02');

insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(19, 4, '2017-10-27', '2017-10-29', '2017-10-20', 510000, 4, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(32, 2, '2019-08-02', '2019-08-05', '2019-07-26', 300000, 1, 0, 1);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(39, 2, '2015-02-26', '2015-02-28', '2015-02-19', 300000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(47, 2, '2019-01-15', '2019-01-17', '2019-01-14', 300000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(37, 1, '2015-04-15', '2015-04-18', '2015-04-11', 175000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(44, 2, '2017-08-18', '2017-08-20', '2017-08-17', 295000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(41, 2, '2015-12-14', '2015-12-16', '2015-12-13', 300000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(17, 4, '2017-03-26', '2017-03-28', '2017-03-24', 510000, 2, 0, 1);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(31, 2, '2018-09-25', '2018-09-27', '2018-09-24', 300000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(26, 4, '2019-02-03', '2019-02-04', '2019-01-29', 510000, 1, 3, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(43, 2, '2017-02-26', '2017-02-28', '2017-02-20', 295000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(27, 1, '2016-12-24', '2016-12-30', '2016-12-21', 180000, 1, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(41, 4, '2015-11-17', '2015-11-19', '2015-11-16', 510000, 2, 2, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(25, 4, '2016-09-24', '2016-09-30', '2016-09-23', 510000, 1, 2, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(41, 1, '2016-02-12', '2016-02-15', '2016-02-11', 170000, 1, 0, 1);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(4, 1, '2015-09-15', '2015-09-21', '2015-09-12', 180000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(14, 3, '2017-01-01', '2017-01-03', '2016-12-31', 540000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(7, 2, '2017-04-08', '2017-04-14', '2017-04-01', 295000, 1, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(46, 2, '2018-10-01', '2018-10-03', '2018-09-24', 300000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(18, 3, '2020-09-14', '2020-09-20', '2020-09-07', 550000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(14, 2, '2015-08-16', '2015-08-18', '2015-08-15', 295000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(24, 4, '2017-06-05', '2017-06-08', '2017-05-29', 510000, 2, 1, 1);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(27, 3, '2019-08-05', '2019-08-08', '2019-08-03', 550000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(4, 4, '2019-07-09', '2019-07-11', '2019-07-02', 510000, 2, 1, 1);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(49, 4, '2016-05-27', '2016-05-31', '2016-05-20', 510000, 4, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(37, 3, '2017-01-08', '2017-01-09', '2017-01-06', 540000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(42, 4, '2019-07-25', '2019-07-28', '2019-07-18', 505000, 4, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(22, 3, '2016-12-01', '2016-12-02', '2016-11-30', 540000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(38, 3, '2020-03-27', '2020-04-02', '2020-03-26', 545000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(9, 2, '2018-02-21', '2018-02-23', '2018-02-15', 300000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(15, 4, '2015-04-01', '2015-04-03', '2015-03-25', 510000, 2, 0, 2);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(48, 3, '2019-09-17', '2019-09-19', '2019-09-16', 550000, 1, 0, 1);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(16, 1, '2016-07-15', '2016-07-17', '2016-07-08', 180000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(11, 1, '2018-12-13', '2018-12-15', '2018-12-06', 180000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(43, 1, '2018-05-13', '2018-05-19', '2018-05-11', 170000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(18, 2, '2019-10-11', '2019-10-13', '2019-10-04', 300000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(11, 4, '2018-02-19', '2018-02-21', '2018-02-13', 500000, 2, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(32, 4, '2020-03-13', '2020-03-15', '2020-03-06', 510000, 4, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(29, 1, '2019-03-24', '2019-03-26', '2019-03-22', 180000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(33, 2, '2017-06-09', '2017-06-11', '2017-06-07', 295000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(6, 4, '2019-05-10', '2019-05-14', '2019-05-03', 510000, 3, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(19, 1, '2018-11-10', '2018-11-12', '2018-11-09', 180000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(37, 4, '2019-04-08', '2019-04-11', '2019-04-07', 510000, 1, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(7, 2, '2015-03-06', '2015-03-09', '2015-03-03', 300000, 1, 0, 1);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(13, 4, '2017-05-04', '2017-05-06', '2017-04-27', 500000, 1, 3, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(5, 3, '2015-10-11', '2015-10-17', '2015-10-10', 550000, 1, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(11, 2, '2017-07-24', '2017-07-25', '2017-07-21', 295000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(6, 2, '2017-02-14', '2017-02-20', '2017-02-13', 300000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(22, 2, '2018-10-10', '2018-10-12', '2018-10-09', 300000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(19, 3, '2016-06-26', '2016-06-28', '2016-06-25', 545000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(24, 3, '2015-03-08', '2015-03-13', '2015-03-04', 540000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(5, 4, '2016-11-24', '2016-11-26', '2016-11-23', 510000, 1, 2, 1);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(16, 4, '2017-09-11', '2017-09-15', '2017-09-07', 510000, 2, 0, 2);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(48, 3, '2016-08-13', '2016-08-16', '2016-08-06', 550000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(43, 3, '2020-06-09', '2020-06-14', '2020-06-07', 545000, 1, 0, 1);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(15, 1, '2017-08-03', '2017-08-05', '2017-08-02', 180000, 1, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(3, 3, '2016-09-05', '2016-09-08', '2016-08-29', 540000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(21, 3, '2017-09-07', '2017-09-08', '2017-09-01', 550000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(17, 3, '2016-11-07', '2016-11-13', '2016-11-02', 550000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(13, 4, '2018-11-15', '2018-11-21', '2018-11-10', 510000, 1, 2, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(25, 1, '2016-06-16', '2016-06-17', '2016-06-15', 180000, 1, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(14, 3, '2020-09-18', '2020-09-19', '2020-09-17', 545000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(28, 4, '2015-11-27', '2015-11-28', '2015-11-21', 510000, 2, 0, 2);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(50, 4, '2020-08-08', '2020-08-14', '2020-08-01', 510000, 4, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(10, 2, '2020-09-05', '2020-09-11', '2020-09-01', 290000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(7, 2, '2018-02-17', '2018-02-19', '2018-02-15', 300000, 1, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(6, 3, '2016-07-05', '2016-07-06', '2016-07-02', 540000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(48, 3, '2016-12-21', '2016-12-24', '2016-12-19', 540000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(26, 2, '2019-12-09', '2019-12-13', '2019-12-07', 290000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(15, 2, '2020-12-03', '2020-12-04', '2020-11-27', 300000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(10, 1, '2019-02-10', '2019-02-12', '2019-02-04', 180000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(8, 4, '2018-04-03', '2018-04-05', '2018-03-27', 505000, 1, 1, 1);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(41, 2, '2020-09-26', '2020-09-28', '2020-09-20', 300000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(43, 3, '2019-10-12', '2019-10-18', '2019-10-11', 550000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(25, 2, '2020-06-22', '2020-06-26', '2020-06-21', 300000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(10, 1, '2017-04-20', '2017-04-26', '2017-04-13', 180000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(33, 1, '2018-02-17', '2018-02-21', '2018-02-13', 170000, 1, 0, 1);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(35, 4, '2015-05-16', '2015-05-18', '2015-05-13', 510000, 1, 1, 2);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(5, 1, '2020-04-09', '2020-04-15', '2020-04-06', 175000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(1, 2, '2020-09-04', '2020-09-08', '2020-09-03', 290000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(33, 4, '2016-12-03', '2016-12-07', '2016-11-26', 500000, 1, 3, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(24, 4, '2020-09-03', '2020-09-07', '2020-09-02', 510000, 2, 2, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(22, 3, '2018-01-17', '2018-01-20', '2018-01-12', 550000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(12, 3, '2019-05-12', '2019-05-15', '2019-05-05', 550000, 1, 0, 1);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(9, 2, '2019-07-03', '2019-07-07', '2019-06-30', 295000, 1, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(35, 2, '2016-10-10', '2016-10-16', '2016-10-03', 290000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(19, 1, '2019-01-08', '2019-01-10', '2019-01-06', 175000, 1, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(4, 2, '2018-10-23', '2018-10-25', '2018-10-22', 290000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(27, 2, '2019-03-13', '2019-03-18', '2019-03-12', 290000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(38, 3, '2017-01-21', '2017-01-27', '2017-01-14', 550000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(15, 3, '2018-07-06', '2018-07-08', '2018-07-05', 545000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(13, 1, '2019-11-09', '2019-11-10', '2019-11-02', 170000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(19, 4, '2016-08-17', '2016-08-19', '2016-08-14', 510000, 2, 1, 1);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(43, 3, '2017-08-02', '2017-08-04', '2017-07-26', 550000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(23, 1, '2016-04-21', '2016-04-22', '2016-04-14', 175000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(49, 4, '2016-07-04', '2016-07-05', '2016-06-27', 505000, 1, 2, 1);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(8, 4, '2019-06-09', '2019-06-15', '2019-06-08', 510000, 4, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(22, 1, '2019-03-15', '2019-03-17', '2019-03-14', 175000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(21, 3, '2020-10-16', '2020-10-18', '2020-10-15', 540000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(4, 4, '2019-06-20', '2019-06-23', '2019-06-13', 500000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(48, 4, '2019-12-27', '2019-12-28', '2019-12-26', 510000, 1, 3, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(30, 1, '2016-02-04', '2016-02-09', '2016-02-01', 180000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(43, 1, '2019-03-23', '2019-03-25', '2019-03-22', 180000, 1, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(26, 2, '2019-05-05', '2019-05-07', '2019-05-04', 300000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(13, 1, '2016-12-07', '2016-12-12', '2016-12-05', 180000, 1, 0, 1);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(11, 4, '2019-02-09', '2019-02-15', '2019-02-08', 505000, 1, 3, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(23, 3, '2015-12-17', '2015-12-20', '2015-12-10', 550000, 1, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(21, 3, '2018-03-10', '2018-03-12', '2018-03-08', 540000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(34, 1, '2019-06-02', '2019-06-03', '2019-05-31', 175000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(37, 4, '2020-05-25', '2020-05-28', '2020-05-18', 510000, 1, 0, 3);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(20, 2, '2018-05-21', '2018-05-23', '2018-05-15', 290000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(46, 2, '2017-02-12', '2017-02-14', '2017-02-10', 300000, 1, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(36, 1, '2017-10-19', '2017-10-20', '2017-10-18', 180000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(44, 4, '2016-10-23', '2016-10-25', '2016-10-16', 505000, 3, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(36, 3, '2019-12-03', '2019-12-05', '2019-11-30', 545000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(36, 4, '2017-01-07', '2017-01-09', '2017-01-05', 510000, 1, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(49, 3, '2015-08-26', '2015-08-30', '2015-08-19', 550000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(32, 2, '2017-02-23', '2017-02-27', '2017-02-17', 295000, 1, 0, 1);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(21, 1, '2017-01-25', '2017-01-31', '2017-01-18', 180000, 1, 0, 1);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(23, 4, '2018-02-16', '2018-02-18', '2018-02-10', 505000, 1, 2, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(32, 3, '2015-05-27', '2015-05-29', '2015-05-26', 550000, 1, 0, 1);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(40, 3, '2019-02-18', '2019-02-20', '2019-02-11', 550000, 1, 0, 1);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(38, 4, '2016-04-04', '2016-04-06', '2016-04-03', 510000, 4, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(26, 1, '2016-08-15', '2016-08-18', '2016-08-13', 180000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(34, 2, '2015-06-21', '2015-06-23', '2015-06-14', 300000, 1, 0, 1);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(36, 2, '2016-12-26', '2016-12-28', '2016-12-19', 300000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(46, 1, '2016-08-16', '2016-08-18', '2016-08-09', 175000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(30, 2, '2019-04-03', '2019-04-04', '2019-03-30', 300000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(8, 3, '2015-07-22', '2015-07-23', '2015-07-21', 550000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(14, 1, '2020-03-18', '2020-03-19', '2020-03-17', 180000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(26, 4, '2018-12-16', '2018-12-17', '2018-12-13', 500000, 3, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(38, 2, '2018-09-26', '2018-09-29', '2018-09-20', 300000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(9, 1, '2015-01-19', '2015-01-22', '2015-01-17', 180000, 1, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(32, 2, '2020-04-10', '2020-04-12', '2020-04-03', 290000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(6, 1, '2016-12-08', '2016-12-12', '2016-12-07', 170000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(7, 3, '2015-08-18', '2015-08-20', '2015-08-15', 545000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(16, 3, '2016-11-11', '2016-11-12', '2016-11-04', 550000, 1, 0, 1);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(16, 4, '2019-04-06', '2019-04-09', '2019-03-30', 505000, 2, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(6, 3, '2019-03-17', '2019-03-19', '2019-03-13', 550000, 1, 0, 1);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(37, 1, '2019-07-04', '2019-07-08', '2019-06-28', 175000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(3, 1, '2015-09-12', '2015-09-15', '2015-09-11', 180000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(5, 3, '2020-08-26', '2020-08-29', '2020-08-20', 550000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(43, 2, '2018-05-17', '2018-05-20', '2018-05-16', 300000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(2, 3, '2016-06-03', '2016-06-06', '2016-06-02', 550000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(40, 2, '2017-04-04', '2017-04-06', '2017-04-02', 290000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(16, 2, '2015-04-22', '2015-04-26', '2015-04-17', 300000, 1, 0, 1);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(1, 4, '2015-06-13', '2015-06-14', '2015-06-12', 510000, 4, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(28, 4, '2017-12-25', '2017-12-30', '2017-12-19', 510000, 4, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(22, 4, '2019-10-15', '2019-10-18', '2019-10-10', 510000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(3, 3, '2019-12-03', '2019-12-05', '2019-11-30', 550000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(20, 3, '2015-09-17', '2015-09-19', '2015-09-11', 550000, 1, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(44, 1, '2018-11-24', '2018-11-28', '2018-11-18', 175000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(44, 1, '2018-02-14', '2018-02-16', '2018-02-07', 180000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(36, 4, '2018-06-21', '2018-06-24', '2018-06-15', 510000, 2, 0, 1);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(12, 4, '2016-01-16', '2016-01-19', '2016-01-09', 505000, 1, 2, 1);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(28, 3, '2018-12-15', '2018-12-21', '2018-12-13', 550000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(22, 3, '2015-08-07', '2015-08-13', '2015-07-31', 545000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(36, 1, '2016-11-23', '2016-11-25', '2016-11-16', 180000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(34, 1, '2016-06-05', '2016-06-06', '2016-05-29', 180000, 1, 0, 1);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(13, 1, '2017-10-02', '2017-10-04', '2017-10-01', 180000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(21, 2, '2016-11-01', '2016-11-07', '2016-10-25', 300000, 1, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(1, 4, '2015-04-22', '2015-04-26', '2015-04-16', 505000, 3, 0, 1);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(7, 2, '2019-03-16', '2019-03-18', '2019-03-09', 290000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(8, 4, '2018-03-22', '2018-03-23', '2018-03-20', 500000, 1, 2, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(48, 4, '2018-01-15', '2018-01-18', '2018-01-11', 500000, 1, 0, 3);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(8, 2, '2017-02-24', '2017-02-25', '2017-02-18', 290000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(18, 4, '2019-05-01', '2019-05-03', '2019-04-24', 505000, 2, 2, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(7, 3, '2016-12-11', '2016-12-13', '2016-12-05', 550000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(36, 3, '2019-09-13', '2019-09-15', '2019-09-12', 545000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(14, 1, '2020-06-08', '2020-06-13', '2020-06-02', 180000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(11, 3, '2019-01-27', '2019-01-30', '2019-01-23', 550000, 1, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(35, 2, '2015-05-11', '2015-05-12', '2015-05-10', 300000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(6, 4, '2017-12-21', '2017-12-22', '2017-12-20', 510000, 4, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(13, 2, '2017-06-21', '2017-06-23', '2017-06-20', 295000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(40, 3, '2019-07-07', '2019-07-09', '2019-06-30', 550000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(48, 1, '2018-10-09', '2018-10-15', '2018-10-08', 170000, 1, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(35, 2, '2016-06-07', '2016-06-09', '2016-06-01', 300000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(49, 3, '2016-11-04', '2016-11-05', '2016-10-28', 550000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(47, 4, '2019-07-18', '2019-07-24', '2019-07-12', 500000, 1, 3, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(29, 4, '2020-05-23', '2020-05-25', '2020-05-19', 510000, 1, 1, 1);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(20, 1, '2020-01-26', '2020-01-29', '2020-01-19', 180000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(12, 3, '2018-09-04', '2018-09-07', '2018-08-28', 550000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(38, 1, '2015-09-21', '2015-09-27', '2015-09-18', 175000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(50, 3, '2018-12-16', '2018-12-18', '2018-12-09', 545000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(48, 2, '2018-10-19', '2018-10-21', '2018-10-18', 300000, 1, 0, 1);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(42, 2, '2018-05-02', '2018-05-04', '2018-04-30', 300000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(17, 1, '2015-04-26', '2015-04-30', '2015-04-19', 180000, 1, 0, 1);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(11, 2, '2019-11-04', '2019-11-07', '2019-11-02', 290000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(20, 1, '2017-07-18', '2017-07-23', '2017-07-14', 180000, 1, 0, 1);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(3, 3, '2015-05-05', '2015-05-11', '2015-04-28', 550000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(42, 4, '2015-10-07', '2015-10-09', '2015-10-06', 510000, 1, 0, 1);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(41, 4, '2020-12-07', '2020-12-09', '2020-12-06', 500000, 3, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(27, 1, '2018-01-06', '2018-01-11', '2018-01-05', 175000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(16, 1, '2017-11-01', '2017-11-03', '2017-10-31', 170000, 1, 0, 1);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(48, 4, '2017-10-27', '2017-10-29', '2017-10-20', 510000, 2, 0, 1);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(18, 3, '2015-05-21', '2015-05-22', '2015-05-15', 550000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(36, 2, '2015-03-01', '2015-03-04', '2015-02-26', 300000, 1, 1, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(43, 4, '2018-03-01', '2018-03-07', '2018-02-28', 500000, 1, 3, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(6, 3, '2017-02-06', '2017-02-12', '2017-01-30', 545000, 2, 0, 0);
insert into reserve(res_mem, res_room, res_in, res_out, res_date, res_price, res_adult, res_kid, res_baby) values(32, 3, '2022-05-03', '2022-05-05', '2022-04-30', 545000, 2, 1, 1);


insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(18, 1, '�����մϴ�.', 'cmqtjkjaqgkuhdodbgcimnoyaexxreukvpqajvhumuclhcclvigetnwvxendyutxcahmcjentllbkmjsdkvsmohwjhlujdfoohaitayhtsfpphbeclpqwytvlfxnlqvpevklmybkhkhvvabudxnowpbxpuprbbkwrlquamhaedwahljxccsounvrmxcdnssnlqfyiibyyyrbtxvuviviyacsymrbjoaevxxyqcgfhxqsyaderrbjuukxkxpoishmsdmmtm', 0, '2017-09-13', 72, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(46, 2, '�����ƿ�', 'pnstlarxbquouiuijgxcminnvyilhstahlhtuenyjsjjstfcbfxmwftubmgbjcksbuhdehldkebuaqbqnanfqtjeohkeaeqxjvvoteisamhupvyckjfpexxsgtolvpawwbkjuewuajcjcybavulbcvqgjqoypubmqfoaxlaknpcqhhwwlkldinrffjqufwcowbkyvbusxvckrwwgqmmjdlffofxgopikjeamrbjhkvguncnkatmgetasbcygughgwwdig', 0, '2017-03-06', 73, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(48, 2, '�� �� ��������?', 'pojoawteamcairpguopscbcnstotahyoxwcwvufkdbcjtlvjknxsnpgvtxveqjwxgmvhowsllvisj', 0, '2017-06-25', 52, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(28, 3, '�� �� ��������?', 'fxxitlvppfensxecbhricfncjqalfmukmsaccotcfykrlbbpdoogjvwdpcwunsgiodeyx', 1, '2018-06-19', 52, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(17, 1, '�� ��� ���ϴ�.', 'jauqfrgwwgkiibhtjtelxmtpqbfgihusmcjcwtyltyanisuexiqhnabvwnaosvsvomtbacyvxjddkvecqbhgxswjhrpyunfarfijjxwiplfkhrnqhtryygkysoakfdsxliaonnckkqirlyvqaehbgtqvdhpguguqvrywpfoguuofihclyrpweybrvcahkixjpwfkpjcyrnsinslxkglsfrsjmuoqvsibghjxtjwbgdf', 0, '2016-11-14', 15, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(38, 3, '������ ����', 'yldvgkyjjpnwmckutjdkdockmqtwwpdweiqvcfhavkwouoluouiwpmaeigrkqtfjsqovwvukptpmyefbbxytfohbgvufkdsjhyuvfurffpwaosumjwdtiafwnknpkembewadadohyxbhttegnedf', 1, '2019-11-11', 19, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(14, 4, '�������ƿ�', 'pbokntkmdquhnhbmriiiybrccsrmwcwkqotagsmgohhjerbbuptrfubjedgjaxgpaquedkmiudjaekvssbwyvhprjnwpwyeryidysewcojbgiulsomjktwi', 1, '2017-05-13', 35, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(36, 3, '�� �� ��������?', 'itkmaaplbqygxuknlrcgvauibsasniyjcmigkcyamtvcanofjbcssntvjpgnhntlvgpnqvfjtlyvmgfgscenhtaqjckbaagqlsbgbaxeaiobwvtrstcjktqcwgbbbgesppmvdyehbt', 0, '2018-08-25', 7, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(46, 2, '�����ƿ�', 'nuamjufghhhjgjeqrvcvrfhmedclkrdpspryagwrnnxnrvaiyjyefwkjhacoopjaduurxssuiykfafeuvieksjiwvauittfhyhnddwoltnptbylbtgmrtmjbfjybeiubywloiavrekdwdjtwkkuulmmypqwobuxgdydonprvmecrrrnnuhvnycbpjdjgcnxcgysobtknnufmqufibrecrahhsmuraljdopehljlhodgmvdglqarvbgbych', 0, '2018-05-21', 3, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(47, 4, '������ ����', 'ecmkehpcowottgtmndytpbrathgemehnpwkpremhqspiqbgnmdefmbhfyfyntjpckatujjyqhtbfbsyklbjfraibaifwbbihhcaqolddmkfmpmuhaeooaqruvkfkigvowtlldjunarpxvucooyvhsbopqnmrswndfehcfytelisfpnkkxtuqmmibnvmlelkfhghocjpsyjcbptncauwyvsjsunfjrmsydpytasquhghghghinvwsgwsywnvtmavlsldibgsvdhkqudmlmblurektradqbxfgdyjxdlxt', 0, '2015-03-24', 11, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(28, 3, '�� ��� ���ϴ�.', 'mgrbesomnkqpnvstqonnbcfixxydmmvothtoyskojkkwcstpxquvqldajtsnnyuovttcgdppmhuybnlyjyiystebqebkwtlqmdvrffabgshhpmnklroiauirfejogwrxwungrsytisfnmsyjmlhoqsunoryhrboxpfydaqyuwqxumbxbvyonitpiscluntxrehiqjxrabinodygkutiwybjlajigixhayofgnmkwvmfplgnpvdyfakkaathgpghfaxjpakvdfdsrnmulxfc', 0, '2018-08-07', 90, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(8, 4, '������ ����', 'ctnnpuc', 0, '2015-09-10', 85, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(25, 1, '�������ƿ�', 'iglmgrvyqbuivjsxlatghypqqgxpvfycstrqhknebqynwfmuewklralgoomqfkoqfsbcjkernhpbldlud', 0, '2015-09-05', 6, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(17, 1, '�����մϴ�.', 'pkjnyheqyjufmokvhxqrnhfhjdjsuhbwqvyvrajudpygtyqdtilksbrfrrdacbivnudwxwecxslxeofxnyxghwgjhrkmlmejbvcbnlfipbcswebainxojvpnyvaxyuntkswtbwddimtonsnbypyahpjgnhpdrrhfsajkeygrprqtilubepqsaihgpibtbvqaxubsoavsyyfugoewscvoqnjmyocnpxuohnkcfhfqnkpvnddidkkafmwydskqqeyviml', 0, '2019-08-06', 9, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(20, 2, '�� �� ��������?', 'jfdrx', 1, '2019-02-25', 50, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(44, 1, '�� �� ��������?', 'jviyvtfijiaegoqhk', 0, '2020-05-07', 68, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(27, 4, '�����մϴ�.', 'cimbmadjjamoevqnvxblrlsubmyhkypsvnnuxcugbwqykamcwmerrbjtjyrqhqujsbuisssfhfnkrtosayfcydagnwueuywhabhlfutbxixxssiycaxiqwewgydqcmjhqjwbxbnduntjgkivvnmhyjrsmjxokfobyigayavjujaexirtvsnkdyfkomidcmbyguefry', 0, '2018-06-07', 10, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(9, 4, '�� �� ��������?', 'dyuryjsoxegwpjfhyybi', 0, '2015-04-25', 38, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(36, 3, '�������ƿ�', 'rxdnjpxquvixujlgfsxmfnrfanabfeadljimlkwadwlynvnkgfbxqgegknmewfbwsrgheocgcjnlaefxnnuaeyeombknvyylpwpsqca', 0, '2016-01-03', 29, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(49, 2, '�ǿ���;��.', 'rdcdptcpllcsdtdlnkkvvyfsgpwulnbyjpawoieyspwumwsuexvxxwqfqbaqxjtqvbffvhhiusuleeyatbgokjgvimwnhoqneoyulrwwacvqbnufegsktmbbqtq', 0, '2019-07-19', 40, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(42, 2, '�� �������� �ʳ׿�.', 'hrqceeeryluqhlwqlfcqaggenhotgoduhmqbwydjtqhixhxgucemojuxwmduflgamlyevioqffplbacajlpkvxfedrjtfiqyyehlvgopjkxoyoownsxntrnpyrclgrpafglgoxatobovjjlxdsojjtamovtim', 0, '2017-10-09', 17, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(13, 1, '�� �� ��������?', 'ybegtacinxvgnnusxsfdrulmmkuvkxaonewbfswyniwrgxgkaqljvyhrpqnhpoejpquiebnttrlwwhxrkyldnchcroaeikcviobiraqvlotnqvvjhbupnufuvulybporwlvjmmlbkqrcrnlktavoqanffqafemxmgvkeynukomodnupragmdhwdfgmyfdxotquaftohjmiktcbngkxxurtpapxlcmpddmmbpnntrxgprta', 0, '2019-10-24', 48, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(41, 2, '�� �� ��������?', 'hpqiwgsoqigcomseloqspuhnhbgcfujpnsedjmswyenktqxcgqvcswesomunovgsoreflckxqdfwxxijqsseruxymlhwpylelokcnumvmggtttejgdbtsybxuasukdqaqvadcxccvlqbkbyqnpuhuaavnwensjmjptegmthielikxtmueghvsdgcogwengvvthunjhkcsefogsyjbovbtnxsyfqoqurjbhtxogykilewpcdxorrgcxhireyfomaatcjhwyqfpcddw', 0, '2016-05-25', 86, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(27, 2, '�������ƿ�', 'cacvktdeawnpwwumvrklgegsiuakfuuvlyvsjem', 1, '2016-03-11', 32, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(27, 2, '������ ����', 'jvvbxuoqbogndwimgmjtcdqrljakutqfljnerbgtxrrevcsghcwlwdgityqxpkqwjrpeywqlwpmolhatlrigjlkixjxrgiflrodwqdphvqnvqkjtyxfpuhakcggqnpcdmhvwsbgqymbibqwjojrdtjjprbceitsjamuurjmqkultsrvjuiierahteslbtxjjukcnibqjyoulxjlphoaetmboidmtbfekdxlonpmdliciohnmdytimduryppbletvhvpcgkewkqiaxneqenmuse', 1, '2016-05-08', 57, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(22, 4, '������ ����', 'yxxphcjgurakqncmfogkretsdkotqjdwjkstuchcwndbpgmwhjrctipummhvnwpgawndrlcitlqdemtfvsjcmcmnuxjgmskwteujxhrcfhrcckaavrvlwykdeynsybyapvqmeymtmrrchjjhkrmjxwxyfvkfyjkkadlrrhoddxdfvenfarifqtaicbrbikukdtumxovqnhesjnbxuknaxaohjejaaqktyqljfvivdxthlltskwblmrbqfxfqiyhalivxkwqowspklliabfdmypeip', 0, '2015-06-01', 45, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(13, 3, '�� �� ��������?', 'kydtrmlqvivwhxikqurspcwwgctefvqcobseruwfffluwsnwiiiymbjelodqwwlqpmbjcnwuipramogemkckrvqchlayfkpmqhdir', 0, '2020-09-21', 79, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(8, 3, '�� �������� �ʳ׿�.', 'ygonsvpociorrgykjprppwueymdmcuaohmkgfwjihpfvvkgkeqjrobjktjroivmqehcxmhapuyllnxbcvopyrampkveyqrgraayiejerkfsywhfyjmxvgfnqokouyrsthjahiwcpoytgkdmasufdtnsfebfeb', 0, '2016-11-18', 60, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(5, 3, '�������ƿ�', 'gvawjss', 0, '2015-06-14', 98, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(20, 2, '������ ����', 'urekoyrylchkhmadfwvxcsffemagswfinsoucrpptsfxxoivtjroiwobgorwyohlneessxsjayrteqarreeiiehfpsoyknaiedmygwsrdoxrxryfniidtmsu', 1, '2018-12-26', 80, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(49, 4, '�� ��� ���ϴ�.', 'efejmqcthiawfdsviwrxlqoiisvlyypetrevxfryeiiruxmwjskpyfsmkdjjmtaebfhvqnmqoolxvvdcnuftolmtwtlflnutlrjfwgbnqyyomapokdwhhovdotld', 0, '2015-08-24', 17, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(47, 3, '�� ��� ���ϴ�.', 'lhwhxkhudafkbxsiovjfxvxgbmtbbsfrgaqruqbmirertcoqnarieropmqbebwyaapentttryktnrtrpghqxoehycaowolperjfpegvmlbssafhymjpsnsrv', 0, '2020-10-19', 78, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(44, 1, '�� �������� �ʳ׿�.', 'lekrwfiemijakewbjohsgcycbwiagggqbidhsqvijtimbslslbxsamlweewantluaslyrjkbolefxxerqpttcma', 0, '2016-12-05', 76, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(40, 4, '�� �������� �ʳ׿�.', 'uxstuqricivsagkyirfxaquwtduhlyujplsokbhfrfeqtioqxjqfoagrpwiuunjbywyvbltfvpsarwxtlnucnrimxcxblywkdytpgxqnuyejxvmximnvnrnawhlhtgjwlrrncfjscqirkpyulcwptrudaviijhnfxbthqjiajtbtatwqiewmtbbeudmlpplfysuaamvqouxn', 0, '2015-09-27', 78, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(1, 3, '�����մϴ�.', 'rxlfpbdqiurmmgnokdovtiracunwuikxfjsabqalqcpmvhobxcbmvaolllovdrjvs', 0, '2015-11-18', 86, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(40, 4, '�ǿ���;��.', 'qwnlavjqgrrkearhdywudnkebffpyrctryfqyagnnxioaqwcuomgdovixmqhbtrqpetkriiccxepmwkgotfejvjevocxydwwbmhrmciufepesmovdypwgglbfbddwdshqixnymunlurwkvdagoayddseuuvhkeslfvwxeesqeyrrtjsgduovn', 0, '2018-07-08', 29, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(19, 4, '�� ��� ���ϴ�.', 'suigxgcecpgksldbkgxxyvrmhdbcaclslyfdhykfaiwdtnbvqbtaucieuonwlknbfdhqwjkghhufmjnvkvetlnlvbuwcprnwtmlwgpqvetnyfmypogjiknlktwnetcwweqcnmtgdcymorlfwarxuatrdxkfckfrtmkhgrjnidq', 0, '2020-08-16', 51, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(7, 4, '������ ����', 'dmcvlxesawoapkraohxlfobtfodksatxvqrktjffuqlymuiwkcfaqiksmhltydkvfbauaswyuvcocyrgspbcxavxwvtufyxsvcuixcgxycadjkyfswxikxfegyycbfvalmbftxtqqrtlkopneneutkpsljqxlpelbwwiynuvomcadxfatfpavqmerbeggqembewowjgybylypksnvqcyfrfrddiqlcnafxrotbutthipm', 0, '2020-07-10', 8, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(8, 1, '�� �������� �ʳ׿�.', 'ejagxlrcuncxllarqifxtjrhldookyqynyfbtaptqhfyxm', 0, '2016-07-10', 13, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(11, 1, '�����ƿ�', 'elkhmeddbqrjspykhcasbnwdvpvsfcvafhcccomqtoywwaxhihlidgpsuwlkxjdqatlwwyrudkjflgobpgrgahbrlcshfjodacjfoewxlnagrqofoumxqglneqgtrawcoskcdanevmirmrmnvvhiufcmssfnvgowrmwycdmkquceaowsrvggdgrhcvfqi', 0, '2018-12-05', 69, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(41, 2, '�����ƿ�', 'ksafitehkwtjrrcdgueomdnkhoennbfjwhwqgkdwbosxjxicghyiveysutfbgsepyqrpkevwevebckxhpvltichgjnrlaoyexqyeasnenwuvvtritrhhojqvgujnoqtujvrmqsgyjltlspclqtvkkeyevemerdokrrtwqpfar', 1, '2016-08-27', 24, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(47, 4, '������ ����', 'crkdktrgcfusgkleuhjcheymuuitsodejecaisnrfpypvbbragxdfydkjdjyhbftmoxxxjddyvsjlvroknddknfoh', 0, '2017-06-20', 65, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(5, 2, '�����մϴ�.', 'pxpskuqvgrfvbnabwsrrhrmxsitgqesvfsamdmnarixftgceraofvmbhbblfyvwukxik', 0, '2019-08-06', 51, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(38, 4, '�� �������� �ʳ׿�.', 'hkpocotndrcxpnohlvcmdqbjpicfhoqxltqxqplfegmyboooonibawbkegechwbjcunpgrsdoqmujvnxyhbmhglhgnulgobxfyo', 1, '2020-10-12', 9, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(25, 2, '�����ƿ�', 'kganeldfuqinnsdmctsexsmlnlhrpqcaknxelfblvkbhfuuptaaadlfdogotmgodtwcqneeqxeaekrwxx', 0, '2016-11-01', 36, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(7, 4, '������ ����', 'ssrfcfpkhhusaqbsgfhjgkwnolnrrhsmscywfyqjvgmkgamdfmtjhuofmvowpvnayleddnfxdlfbqlvuwbgripyyfsiaodbahtgxblshirandrcmmfljrioiyfmdskioarowjxdaqqvvlqlbjhcoljotkawmpfwwhkvowrditaqvmgktsyfwnpddxiylowaixnsl', 1, '2018-12-14', 9, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(15, 3, '������ ����', 'ormydwxafffpnydupofhyrynoqshuddklnvewrtgfsbloioycxgpsfmeoywumthkknsshrkjbwfpinjtybpvlpixvgvtlobfqvecyvuopyotjdchtmoetsnomhgssrjwdvnrtwleuevqjwfjtgpxjmhbowmemtsoapolsoymevkxtguhksagsldqfgpuhruonoljgxksskgsxgnjqfqqrjwceatfgjmadoyrlgpsgxbvbkdbfnfynwivahddcgpuxmmyumbdlyspvsjxbkyhtjyqqjp', 0, '2015-09-04', 18, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(36, 2, '�� �� ��������?', 'qfgypafvoxftptsckrtkreswfjigwoufhqdwmfsyogxelojqhxmixafpilbbcnerhlylljklvvxtflllcxpyrprbliagwyntvagitdnyjgvelubvcvcawpan', 0, '2018-12-11', 2, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(48, 1, '�� �� ��������?', 'yeyhokxbesyaukgtiriaxbmafksoxtlpelsgyqueoglrbuxvevnhvxvhshpudobrxfgwrrlbijceecnscxhqdtcrlbfonoudbroqbkflhnxrkijoihepocdojxhrnokkbtpukvgbiaimiwcwbwmkomstqxlfymuq', 1, '2017-01-12', 17, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(25, 4, '�������ƿ�', 'eragddcqxuaujjmspdrletmrqegqdgrjvpjmb', 0, '2017-06-24', 69, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(30, 1, '�����ƿ�', 'vkmnlkscyfvrlmxvafpafclrejrbgihbmxapkpspnaxvutxetdnlnosubcisjnqnurpbuaodjhgsgopguhsyfioartcvysdhdenufwbpeemjormyjdhqyygekjtvnpefqcedqnhxkuudafdjegcvjoaenvrnlgnwltjlsawpbdknflwqyghqrtlpfvdweolmftxuysfvvdyqonsetqtwvsgcxcugfpagwtmhnvenxewhvmbxnlfphloirydkoyfmwoddcvggpshilshwibvqbd', 0, '2017-04-27', 35, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(22, 1, '�����ƿ�', 'prxxydomklbtlmrlqruddcridsvowrbblsdrrolebkrcfydipvfhylsfqewkyjilqlogmuxhdxljiidfeaqlbbwybfhcqmrwkfchydgjtsqrvddilqoetfwtgefkcciilycbugpjyouarhaenmjyuupsdktkdnfcvueyceptovctndamtunhnfhrfkmfnvnfq', 1, '2017-06-17', 7, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(3, 1, '�� �� ��������?', 'vrluitbvelpxrjqbuqkypwtojreejvvyelkcbimibbfpbemnijqwnggtoudwjwliswuouigxmpcusybuhkrhrnydvsyikcmln', 0, '2015-06-12', 51, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(13, 3, '������ ����', 'mojoixpmajrdhh', 0, '2015-07-08', 66, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(27, 3, '�� ��� ���ϴ�.', 'demhhpflpkplpbjljiimtvidnuloibyrjmjakhpmipaeaaktvgccotrtospxgipqyluscxhxvbpwqwnoilwnvtfimlsakdywdfdbffrlqoynxwuhtbhvcnbixi', 0, '2019-08-08', 3, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(9, 2, '�� �������� �ʳ׿�.', 'ptjqtcykoipsiqiugttigacvxbxuxkaggjskspbckkbjsupkaeubrfmpjnbyfcbckgxnjvicuenmxroyqjrjvjclvlchonvdpdubyriqjaefrieqruslihylcfraqhhsapuatcassaqpghtiehsqwhueuockguqlwbautnddofbvqrrofekolnplvicwkvlrrjrihverceskpdhelftwrekgakylvbhdxvbfg', 1, '2015-05-18', 15, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(6, 2, '�������ƿ�', 'vdubfhcakiohkltet', 0, '2018-08-16', 58, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(12, 1, '�� ��� ���ϴ�.', 'qiyuehietnkrscxagyfjhjdbjibeftu', 1, '2015-02-26', 85, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(8, 2, '�����մϴ�.', 'tvhkitcvrqcceutveorocbltrbvlocieelmjwvqkleruslnqxphawqjexc', 0, '2018-11-14', 37, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(26, 2, '�� ��� ���ϴ�.', 'fwgvvbjwobocftotnwkaetdqpoqravrkilpnbeucqxgu', 1, '2016-10-11', 40, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(50, 3, '������ ����', 'jkfbamemwypwxthdipnqdvemxhwqjnnudoocoqrocadcmqankxvdhahigyybokdkrlogwomrnkuumcaljhqfkdlkreskokawdbkaeqoanqteoexpriplshamrscowxnsatckndowoqchydgxxxuuidguwdpjfopfunlxncfgccledycpytcrhdmgvloeswkorccaahdiucarqwiputvgcujoynlravkhlbsrynshlieljldxvdckr', 1, '2019-03-18', 77, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(13, 4, '�� �������� �ʳ׿�.', 'ypgacaoehrwxvbnbvyqjkvyndkbwpexfdaayiitpvjwepabajxptymmtccoyonoskvymrnitnuymombvqwhpfheowycnbiigakvccubgegwnhdhwmgffusetieobgepgpoemgyqfpraqwivisvckpbhwbkkauabelfxfkhhpckkyelkncuopxblnsgbrafriplrohtwgtpqaypkufhmbrmpuoedkwgeyiqg', 0, '2020-12-05', 52, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(18, 2, '�����ƿ�', 'ychyoskdwshuygwbqdilfniattcukvssapagkwfinhytrtmgtwppccemegjnjfrohytatvhhrwyqvnxorplevvnwbvctxgcdutttdcjwbhjcxmp', 0, '2015-12-13', 49, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(12, 2, '������ ����', 'kvcxmtgtnmuyapwknsfysxeuvubpyxaobrgvpwihpspjiqkotplhnbliuuojmerqsltltxqwqshfwcpcljcippkoelwheigaaxuamnslmbysaoxawxtikwingucrcakmwjympwgrpyyanqabhhki', 0, '2015-11-08', 32, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(11, 4, '�� �� ��������?', 'tqjpqlolepdopgebyhsnqlnoeotcxftoaxvhdcubsxtkkoscihjxsdwmcxffwehakwpibbkohjgkpxcesavewijikoomtyjgkqlokucgasmxvx', 1, '2019-08-10', 11, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(33, 4, '�����մϴ�.', 'pqtxiukmxekmskgxulyuifwmmyvbjdvjluvelfbjawnoitvfssfosn', 1, '2018-01-14', 29, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(50, 4, '������ ����', 'bkfdhqkixevhckheskpqlvgnnfkajmatwtumopxjyogfxnobfkvmyysaceokpcodadcoiiwuspnpaxtaoqcgfkwgoxjktjyubkwsjhtlvbnkawboyrclsqkaeoalrxpltpruveqbvpwdvbfjylhfylrnjhdcfqmwpjeyighcqtxlnryqdhramaegudemvnxnqmpwuohosrrusgidvjtebihrkfxpbwumnkcndmejxsiorvgorpecgdhevxwrkrofvnqho', 1, '2015-03-01', 2, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(36, 3, '�����ƿ�', 'ppkjngqnffhxkibdvmcnwajjglsgutukhsxlbairtmwkqkhenxonyloefmtvxsbebaxefubarfpobpontkpuwnffmuppmpusbstfuuvklqkiaqnnqyqjjjvqukjaijgkogo', 1, '2019-04-23', 71, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(28, 2, '�������ƿ�', 'jphfuyjpbvipobtjupfrrlbtcnrqqprkgeieaejsxxffgxoygfgxaomnnxgdmkitnfqeinfhrrxhbksnvxwaaepsxtlanhsyriyscgavkllpvmiinhlnjxbyeirfnubvgrowsxixtetkyrwkqrsufjyeledebdbugkrtrjarixehidoomqxrldjqjpmstrjvcxqclbaghmnnabouymviiwtrofresamcuq', 0, '2019-12-17', 90, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(17, 4, '�� ��� ���ϴ�.', 'qildhdnwabdpbqmufsyscqpeqpbkxmlllonlwwdksxmlgomyhlquxfqipdxelnymxrxnhujajdgtcnjxyughpubgnpxllqolgchiaikmwssjtlvsrteekwvksqstfevgdlacdifhexbgdoououcsahexqlxosdlkkcjlljffqlertdlwphihioivfevgjsduibrnyhbwamdhidemkogaoofkp', 0, '2019-05-10', 67, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(12, 3, '�� �� ��������?', 'naegxlvrvvsowuvxakthxwjbpmvvaiwhehhoeotoveigwtxallgbnifufnpbinnaowomovhfalqhyrhythxarkdejcykaodoyeiofgsxujyvtmsqlglihoicmmfrkvlhjtgibahohmytkpwsbnesyqkwnwvlejcmuvgupkcxwyajyuypelorikbqnapmvvifygdovp', 0, '2019-04-20', 74, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(31, 1, '�� �������� �ʳ׿�.', 'fpxlrcbuuicxyaxcgmeotlrjrawqlavwqyqexgklnjmftlrwtioxotrrwebgavimrpppjadxpmuhcsupdvloanriuwsfybxheugbntwnbcxolpmxugafrcdudeuwncmdqlffpcgevvvonqpwwpvfqdrbjkvinjeyjegbtptnbndapbwoxxcqftpwpiebuvlxqsqlnqqxvmicnqpnaonptymsjmoexeckjmwferycqdpsmbuiavbpjvnafad', 1, '2015-03-24', 51, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(44, 2, '������ ����', 'bnmrmmtpwfqwapijmsngvupydbxqagpwiojaojyehbrhqddgappfvan', 0, '2018-11-18', 99, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(32, 1, '������ ����', 'vblqbmcqkn', 0, '2020-05-23', 55, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(12, 2, '�������ƿ�', 'ourypeymqqgqqvovlnfivajnpinhdfenxolurugdqseykpqprqlcdpocvnyfrqlrmavbcghqeruksyinqvxcbdbqpjpnwboqthenfcnlpmabcmjqqbkwqpqfpeyyluumtxnhmwhuqshmmlvfixlbwymnqxkssedfmwvwibgtp', 0, '2018-12-10', 60, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(33, 3, '�����մϴ�.', 'adijqawcbvbadjnopfrqpjnqccyqonllejkefbfioqxabbmjijnelgodigfcdntcbptyybidcstddwxoileiaxiwimpnoigtjeejwkamwdskgasfmljbas', 0, '2018-05-26', 57, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(10, 2, '�����ƿ�', 'gljbrvpkchncledcyyalvjldyvbmxmojojpcixdyvvvuawbbgcofkxadlpcorlshhfovsvnvygcbgsgpkhyjqlqxidbdqggfauerxc', 0, '2020-06-13', 33, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(47, 1, '�������ƿ�', 'viqhvvcbxsqyvmjefmpsbtaompfswpolmidk', 0, '2018-05-23', 85, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(16, 4, '�������ƿ�', 'bmprsjaqqeqsqsjbqtldsteijcrglgckbrswerawcvljwfgdgjgogcjagengxvgbyiooircnytvvhwqeeldsedykqlufraxaxbgclpllntvuujeuxpwjlcqfxmqnglgfdabkebwadwojtymxtmdgxqhmyeqivpuqqolntllpwbjvlfaxdbuxmcdegkbfrxgvehgiqvjvecjmlxgkfwtixryeosofqnstxpregaipxyputkbagdbevpxllkiqftuskhbnepwabdykhixwdkmneyjjunxxdph', 1, '2017-11-14', 34, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(17, 4, '�����ƿ�', 'wpgldgchrvdmivsgrqjqgwbxhmsvkjsrgsmhvebqevuvmllhkqkgfywycxayi', 0, '2019-02-03', 83, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(33, 2, '������ ����', 'berioshdidxuvunnqpkwpcekififcjljmqxrgpadsuefdpptbjtlimukhliqgwybnxfuxkyxiqocckdhglxmfxujwupvtnrltpjgebkgopnloyngbbxdqrgupsfldyfutnusysmunousoklnqhyvtppnhcckaayahhchkavaeriplukrpfutvhcixilifthpweqfbnqiimqhkeeqbpqmfuphhsfkt', 0, '2017-09-21', 3, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(26, 3, '������ ����', 'wyjmid', 0, '2019-07-18', 72, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(45, 1, '�� �� ��������?', 'yxsugqoapaesgffyhsgrqjyghgjoicxesbgnwinjfquxqcblokipjbfrhqlntffsasquwtpb', 0, '2019-04-03', 19, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(35, 2, '������ ����', 'rsudmusgnfxliyclftrggvdwejpinhosmagpxmughcyqsurmkhgyxasrfhulgtmncqaasqxbpjwxyuviqbbrpajvkdsqpdgbrmrgjgptbruwwkuxfggeeltbbukqua', 0, '2019-10-05', 80, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(16, 2, '�� �������� �ʳ׿�.', 'orjqkdssjkstsirrouuietftoiqtjofwbbhoubkkeqvcocvulhxegsyitigqtcecedfrmaeqhymgukrlqntleohxgqibkmdrpqfdbxolqssivupnpkhjctgptigvoxwdotpllxbxcwsnjibirxqpivslyshxoluvtcdbbujctytpgrvlwwcmmakhccyxhwrvlunickwkxibpnlvvcfceimjrregqxodyqaapjovxkuneuybrkyetmacjjeatjxmagngsvicib', 1, '2017-05-25', 42, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(12, 4, '�ǿ���;��.', 'jrrffsupuaioswpyaocuiakayryjubpphvbyepchesytnxdqmsxvrfqudxcynphdqilxugcgxfhocpcoobfxdkbiyhcqwuigcoxfofelqwnisdjvbqmmfnsjrvjfaxqicxsxuiiroxwlnqo', 1, '2019-07-07', 30, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(3, 2, '�� �� ��������?', 'kcfqyyjvipeaeqfm', 0, '2016-11-14', 82, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(2, 3, '������ ����', 'cumewfogvwfanthtxvncfdxgoipagibcdfvldmdgpwqoieifkqeljdlbhrluryyoepvrhmosnpxkprctsdkkkmdimuaklgwkbavcbqehqsqjjrkaeorujinttbomgnysususbsuhgnihtjivxkxbjvppjfvvdmihhmmfwjoolmqnoewoxfonlmjraabtuvpcxfcegtocsgswotqcgnsmgaylnhqg', 1, '2015-11-14', 39, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(16, 3, '�����մϴ�.', 'uvrmjmqggotffemjycgrfolgqcvdsqaoigmgkjjuqepbofbydhiknbtdxivcmeayxifsrdebxurqhyduphlslsyiynkjrhtkyrdapfrgethhmgbvitfsdjiahmmlwctpfvdrkpncugnthcgmtkhgopotpxocuhbgalfatafrlnaorismlfstcetwvpligtbqmsjkljpnlmmeeqe', 0, '2020-05-10', 18, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(7, 3, '�����ƿ�', 'fmgnjjyajbcaeifrlgbsgitlisdmuoqkvigrqounxlqaatbcteuwpkoxxvlhtehpysfoylnfrfauqd', 0, '2018-10-15', 18, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(37, 3, '�� �������� �ʳ׿�.', 'xdgunuybqasywtfakbbrdvrnvcmwxwtovbrthldlnanbahnhebvyolkksdplrfckmkqbppsubfjbottydgvdivhsefpwylcvlrlvelfrmrbthnadlsjkmtaucplldgkddaujfcpbnivfx', 1, '2018-05-25', 8, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(22, 4, '�� �� ��������?', 'kbuxtbjnorepjqudaydrxnb', 0, '2016-03-22', 33, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(11, 4, '�����ƿ�', 'vlykwgmbdiycsieedxtmmphdahumvcxrssrxalhstgildrpavxxolyktgwmnbjslfddfregipssnvecskwjewcbhjjcpbhpbyjjtrnywpispriocykhxwghlkdlkkiodtocmvqjkvkfnemonxmulhrlfpnklnejkfqyuejuvsguftmjcsdxdcjafwbksypueeyppkchegfeogvpuetatpjbowajcamlhrubhpkrgefav', 0, '2019-07-24', 16, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(35, 4, '������ ����', 'agxwdmdrsdpwkeysmkgfqxglmxfiafshaqyjcwtvnwhedwqqkqxdgwoktrfyytfwvpsrxjerwdisgsxwtqlkdiwvdvsifbabpntxngsxmmmabucdivyxdkgodbbkfsmkleqisepqusxycroqbebwcomrcjvoggdqpgrxnnfmqomlinrwwscxpmqxfiykvcvfidypw', 0, '2018-06-22', 68, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(42, 1, '�� ��� ���ϴ�.', 'nkpyycppymcdiqafeevtxsqdllnakydngbyyxhfkafbgjihmrwfwyybwdlaeqddggfnaxccsvmpdmmrwawtle', 0, '2016-01-08', 26, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(25, 4, '�����մϴ�.', 'lpgtbkahpfifasnfxqlxijrhfitubyeamexrxjbsclyrkigfaatfoenmxcghjfswehdqufeobupbbeaeusqodadcbcgbajppxhuxbgkabfbqdnicxpxktmvorfnvqpscwagkytmlqmihhsjevkrfylvlfguvvgdkdxvqqfmxxphsnpygwcpbhrmgqdkgryqtmdcukqsnmpxkbrahlssmqjcmiagcr', 1, '2020-04-20', 71, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(42, 3, '�ǿ���;��.', 'yewkliliuwggunxnusoiaiivnryokmntguhvtejcmxktesyhfgwhfdntsnqofaopyqecbayqxggctxewwknfjcdxabrhkcnyammbniujrgditphqcilhifgiahujmmxvmmttsumhax', 0, '2017-07-16', 30, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(43, 2, '�� �� ��������?', 'lxufukqrkxkytagninwlsmelhlvyujqeinidthabxfpeibjxkhtongkfbpitonfhsjnifuyqlekjslhwdpcqgrbnpismhlfwdpnhixtunbkwtsvhjkrvmaghlarrhbmrgeeoncmjbyfkdlx', 0, '2016-04-02', 18, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(49, 3, '�����ƿ�', 'qemonxhoxbrqyhkbkjdadncvoqrnouxkkyyxuqfbcvfhomptgoqqkypsmvydknhbhlelhpnksmevmiopayohjjumitgfgoxqdfhkqgkpmliajicidmpfamlgwcjxbdodcdrwrmddaqstwtourdwrviydkulidspou', 1, '2019-05-27', 50, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(38, 3, '�� ��� ���ϴ�.', 'ssshimuhfksccuegky', 0, '2020-05-27', 31, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(49, 3, '������ ����', 'hiboweioewhtuymvkmgkajabljbvyovtvqhqjkkywtxpdremmqpkwrrfthowlafbsiwuegvahfdbscohmpehbyqugodwwngsebpdhihryqafpppmvirsqsgejjseqopnawtdjvdvlsuuesphewhrsnenntsligyurijpojdfjkkpbkltrcqqsuuatdgqcqbemdckuevlpuuqkt', 1, '2015-06-20', 72, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(32, 2, '�� ��� ���ϴ�.', 'tkrijdumyeuqtysqxxaildtuichisisdoinipowsqsnsrkhlahbgfswjkadotqpmatiofdhrahftojdcqapufomvrnlpesavnipvvravdmdfsbxucaagprcyjsvxmdrgytfofnqhdacfijstcoknndggeqtenxgeowqxjqoebjyrinejpmrwgktaghitqfikhtbnbdullhjubitvwcityt', 0, '2019-11-05', 45, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(23, 3, '�ǿ���;��.', 'oqiutoimqdxqwicbccgqgbeucdovpsxuuoobymwkdysbvdseyhwercaeaimvsxmhroajbwblbxthjkytggkfpfurvsstbmdkwocrwukrytuupgevllubqtbmtwbhvmuulsemidhiblrmybxbolvdoaomhniuusyjsdluluycnplywnavibrfumysvwmhevsrmi', 0, '2020-08-04', 91, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(17, 1, '�� �������� �ʳ׿�.', 'jsrknfbvxlyanpmcsoyvalxwuscverirydxstddwgbuhphjuvnqqpnajbjsmxdkvxvhnqlhlutqdsnolowkqsgounln', 0, '2019-06-23', 90, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(27, 4, '�� ��� ���ϴ�.', 'qejmyluwpouipghedwuuuvvssfwqtjabroqmgqhuqowxxqjudxpunhkpdssirkimdmkdygsrcjvwioxhadeseonmmvbtwemcbukpkjxolnbqexkqmmyqoncmfggpmqisilsvlcuqaxlnvuwbdwkkellyjigimockchpqagtgcfmiemroajtbvbtprjgwsioqqhyaqfjraqm', 0, '2020-09-17', 79, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(10, 3, '�� ��� ���ϴ�.', 'jafkiqlciqhwednlawvuouhspbcsomoilqtivjdijpwqtthiboqdtvxfuwtexkpmjnrbdpcfwnbkplpynrspeqhshfpochdeespsbbidmgvqwpcvkxbglpyqdmlwnhvfmachlqvldhvorhxgmkonblkhqgivqplcugusffuydffiqwjpplrqmlsrpwfisfctiubdusuydbamsfblljprllhnkfgoplcpyvvkgmxkddwuyfnaanccwanlsvypfeqkwl', 1, '2015-07-17', 38, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(37, 3, '�� �������� �ʳ׿�.', 'tntfphyibhkkyqypehoalvgetsietcqlscdbbsfjowgfdwtoessvqrlkpnswvxmbwtadhpuceeejyjpfolpgwjptncegdjlqftichgbpdkyxiokpocgcdtugwvnmrnqixsoruellmpremvvvqqlqwkvanegtmkjnhkapveastotxhkkxgypurddlorksyfnpuolfpkidmnsbimbtxtgmxjcawrqldrwtgwpwspuijcutaasyxsslgxjihumallgxrsuda', 0, '2016-07-26', 78, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(31, 4, '�������ƿ�', 'xualovmccpswsinbdababclsbqcqlnaoiiwpcaijnvihwvvngoinjprrcicjrbhvrtemivbbyssfgtidfsuatdrjnnbndmkawenvjtempqwakkcocykqvyfakoilqbxbjpwmxewgmruuyvkryhnodapsslllxxblettrlxxywdybxcwcadvluqvdstkgtfporvawccxt', 0, '2019-09-26', 7, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(36, 4, '�����ƿ�', 'rjnscakxdebtokddvbfbugmacwkporvdhkiaxbvsxhwmlyyshqytosxidipxahspnaghbfiexfsvdbifgstlebeolkqrcfwjuokwypjtvhokytojqgufyogrnbnvkygqsuhdlttowxeumla', 1, '2019-11-15', 86, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(29, 4, '�������ƿ�', 'lpkbtvmicmmkoprwqiekourukxwxdsibjaraawbjoqdeqpgwwuffodvrebdoajnnyokfbldveknpxyoaehnsitqytqiehfidsqqyprbquusgpxanoukankoykukulvmryyhgvpvydnsycpghbykthmptqhdqiskotflrpeuhdaotyhentpwpegqnolwewqlunclematmxhpmceyiysvpxvyppjowipwjvbsdwojoaajijdwghkinyvpgacuqaeeqavvktdgkxucefcqdmt', 0, '2016-09-09', 57, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(12, 4, '�� �������� �ʳ׿�.', 'hfuqjmqqcsktqmqsriwykoxurxkutkuoysayklbuwgfxdvawwnuathuoivtuvwbxgwqvtwxguhfaqosqdf', 0, '2017-02-16', 77, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(50, 3, '������ ����', 'yeiqqyobuafmcgvvpulmbcfkwgqgnfwnlcikbsrbopmcouiiybjjslfdbuulkrxkous', 0, '2018-03-02', 61, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(16, 1, '�� ��� ���ϴ�.', 'mwgmkjkvjnnuefpuutfpgkyuqujurspvmwxrprerolcjkdqorhkhcshwkrjyfmbmmtacpucoardemvnbsivprmtaaplyyiahwugteiahsfikrwwojqklearqninhpcgvkeoyyicnnxdpodurbfrdtkhwdnguhrwphrvisytacwobwesaoyilkfmytsqahliocmgabwnyfimoaxyotkhccfcwaclwxdwicvtgdebdwttxhujl', 1, '2017-06-22', 49, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(37, 2, '�����ƿ�', 'quytoqaatfhoplikgxahhouaqklfhxyffduhyxlqdqaofjdywqobqkcfkmrcqwdpcruvcfrfglruqlysvwwbtovnmwwrtvdxfauqtlgpmlyhqeksuwofiuuspxvttlghwevbocrfxtjwiwcxmxpslgeepdltw', 0, '2016-03-07', 50, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(4, 4, '������ ����', 'crhkfnvimxusmsqlxnuvsakrkmhanbhebtfpmpucyhuyukjlgvofvrupxdrnjmpyiopkcgqlocbhwjvasdgnubjuyhywypwwjinpvtwvtdcypmeebilvu', 0, '2015-08-27', 43, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(39, 1, '�����մϴ�.', 'uslpobtosbhjmtlvbelxabmocgaejfoqmlepshggwgmxbhkykuoorkgreyejqwvsdutanhiqwrpqbgysqsknlujsrfqujybeebgyvlakoalmxhcetqbhsxlcoaokhuavrupjgcuybeoxppxngxhmctfgqwsscduiatjjiibsnvadwdbkikaxamsnapuvok', 0, '2020-03-13', 29, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(33, 3, '�ǿ���;��.', 'ffsngvxuqscdgtjxdkjadbwnbckrlbkaxtegvhsvqbceyjboiqifqhjwiefxdpkpx', 0, '2016-12-01', 50, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(42, 3, '������ ����', 'aksvphxybaxmcyxcjmhowtucqgoxhpsajgbcfearbkrnwoolfpyjuhuevewlblduejpsb', 0, '2016-11-13', 33, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(28, 1, '�����մϴ�.', 'icibimajjmrvtfitutnbtogfyltftqnrgkuoewcctkowfmtxhbvddtqaqxcarbpui', 0, '2019-06-24', 61, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(32, 1, '�������ƿ�', 'vjoujskwlixsretyigxoqtkuybmvccdvhqfhocatgysmjqikqdapqvjvybefamndlsderclpnmvnshcjpapriogqksqrqismcetkfpucyildpwyjghmjqhhvqgdsgxffkngauppijtnjehnaconjihjsatfilpakprgrovxsoxkqadadilifun', 0, '2019-06-09', 71, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(34, 1, '�� �������� �ʳ׿�.', 'ushsmpynvvndtghndtyinvypfkdbyssdanembccntmbtbdxvlpqbuhegfhstulwbowloysueaoyqnlmyrldijxwcspod', 0, '2015-07-16', 50, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(34, 4, '�����մϴ�.', 'jixnqdglhehrcwttwraqfraphqkfofdlqxjbwvsgirdqikholwfkotjtdvipayqectonicuqmbsymljucwedhoujvlausveuyoclkkpeqlcrydqkylbwanfagilbvhmsekghxjchklwwfvbebogtmfhnjffxapwmvrtomimltgmfbussahfeojkdsmrtvuc', 0, '2017-05-01', 90, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(26, 2, '�����ƿ�', 'vypyitgrenvoebenemnhvtkykowhtcjrenenxnvgkieorkhkcewqgnubtavxylacyqhxqakonpgwbpfnemnypvjaokefkobhcsdwergyhvxeuwooekpqvqxfdxrwju', 0, '2016-04-12', 87, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(1, 1, '�������ƿ�', 'owxhxxqbhxaecapdilmilfblalctjcbkknirqlfkcalaoetmjikmeotheqxhuaqmpirdbchbkdfygjenmyvblqverbmyrgsjqmweulmvsqfccibflxwhcrmyxvtlkrnirqmpwxuyovcggyjcikumxvbcigecmpquxqid', 0, '2018-08-17', 38, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(39, 3, '�����մϴ�.', 'udkmxseoqlabmoyneqrdxsqetsbtrhacixloobavaghxbgsyfqygmudekavgyixrcxyndwtmvocxyusgguxuoenllpfwnfgeqmypmakhvmdhkxjevshfhdlrpeoeoanshoqhdntnsqdqukyvgnvlyuofygcphxfukifyhbfyrhijqffxeusfyrurxjfylmdxhfnwwxmevadqojobymliirolajkckdreolampiiqwad', 0, '2015-01-23', 39, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(14, 4, '�������ƿ�', 'wrlhskhbpcoirbhjlcxhneddkctrrpcaxwjk', 0, '2020-08-19', 77, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(41, 1, '�� ��� ���ϴ�.', 'qipvgnqqn', 0, '2015-08-15', 98, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(1, 2, '�� �������� �ʳ׿�.', 'nvwcwdbetmhnhslbwrauxrpgifuentkosfhexyxaohoyejvdvimwvthuvvsblnwbcfasinmbcfwjvltekbjmylbsbeodqvnu', 0, '2017-08-19', 52, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(6, 4, '�����մϴ�.', 'htqujdowlotkyhlwjvbenlbcjkaavkfcsdmdeecdkfhrxjeaeuywbjnwyfygpoov', 0, '2018-12-26', 99, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(20, 2, '������ ����', 'ltwwtxhbbpldwwnchgsycqnupyqxqnnwxamsiskyilnxitycgmiiirrkphkravfordpdcmrikimtjhhvsjdxiqepfndirecxjtdmtcvokbmayfiawalbnvpoljwglmyeispkoveouylrkxyuonyqqroabdmwhqacgegcrukjnfkhvuttyssvcmoouinbufyrtwescgdmkqfrdirer', 0, '2016-10-27', 66, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(47, 3, '������ ����', 'sgxitbcalrcpqbljaupoxtapnvmjqqpgxlcjmytrssxnlkxnnykfhwvymcparvccvtsavdxceckuewxveaqilsgvbqtyukdymavnmgjawnwhwqcwosxmgbsiefsdpcobmootojlajtvngfimxrnmaftxeamaavqreornoytbbgwoifmnplqgwcnmknmhrvbue', 0, '2018-09-15', 92, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(4, 2, '������ ����', 'tauagfylwdslefvtcorwepsvyrmipigdhlbeeftw', 0, '2015-02-07', 85, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(21, 4, '�ǿ���;��.', 'ysujqrkraaohtcbfvkngtnmkjvmfymocqmlgohhyfpnvtheocoktpghpkhkkdbrajjwxq', 1, '2019-02-13', 43, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(45, 4, '�����մϴ�.', 'vpwebbejmevyfseguxuuaxgyogyphauujllryqlaxsakjfenhdmxjqrusjdwpqjykwfcnfmvokclsgkvhadepgcckekiksjmifcnpibiatvwllagavsokykujtppvyxquochqtnyynekdsenigtnqnoyrichxffogiksliyrcyfcfbevhsycvbolgbkkebcymiylrtsqqemhkbbwybauhuiejpkjggoovborudhvevlxiqndigjokxg', 0, '2018-11-18', 21, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(11, 2, '�� �� ��������?', 'hedpfjdjcjmmuvotbtxofoiochokfitxuonjfgsevlfwcqpekfebeyljtufhapwhaxnpcaixupssiqxsdbkncnsmmmnhlpoopbiclppcpynkbmonugrgiupsoiriluviqnwwhgvhrrppuggsmybwsgctgkgqcskjcjyjqcdnwshrhem', 0, '2020-11-10', 41, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(20, 3, '�����ƿ�', 'brlamtbwcyvabi', 1, '2020-06-05', 92, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(17, 3, '�����մϴ�.', 'hwcsskfoksmcwpwffmrurtxtpiduxwbcbjlehiywwmvrikckynskddbacpnsxhvcthypjkocybgqdiuvinfnjcsabnxtsuogrtbvaxbigruhvraopapnpvkwownrgxfypfsmpcfjetyxxsgnmupfayytruccubxrevkoijwowejiagbmarsincarysburkngwjpfkbcuwbdlfgfcjcnpougtvigaqnrdgfgidovolmbqdpkxdradtvfmsnitxlnsatyjbgjsuwringeruxnejicqiqriwefbpja', 0, '2016-05-13', 94, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(45, 4, '�����մϴ�.', 'mvbicuhwaqetehmkrsrdqviyrxsbfqepfvefobxyagibirf', 0, '2015-01-05', 46, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(22, 1, '�����ƿ�', 'fwhjnklloqiaskpkgsfoagmxnmeujsgqkdbeoohsyuugmosafsjjouslaggwjydmtlvmkudmxmqidwdthpudhbdeewfjyobqcrlcrricexuxkkcvhgovvggjumggkblqgokkncdpqqqfsssrgxwvqocshmfphwswyfpfnarviprewbeevejmcnxjnqksfvonqkefyjeonkhclwpwhwbqacxatwtltwjptrmupbamrxbeeayhwiwgbjhuameluoovlcouvwrugapmmoetcmlhjnsgugsbwfnpxl', 0, '2017-05-08', 59, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(35, 4, '�� �� ��������?', 'neistbrdiwxvbfjnmhjsfgqitkwvxqoxxfngcqqfkvniiqwsxistlwhlfnwxjkycebglfqvnvweyuflsmmbujgsmqlywbumtixrdvasfxdabyrwysvxfaeqfxnhgfgwcpvxahcmlcxlpgvcpybfnlproxrlevahomlxifjmtpqbehkv', 0, '2017-08-16', 90, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(12, 1, '�ǿ���;��.', 'xljyfxpjobifiaflbgk', 0, '2015-10-13', 65, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(15, 4, '�����մϴ�.', 'cxsaelgusijrabfjlnxwsqcgubtptygtjofmjtuwnoiimdndtcwaaaxfijvwifitwpvopmxlwtmbawejgqlnfeqgpgeufqiwwcxyyhioxihvlalyxewvrdnlhnwtxifgpthnnkgoebbxgkuuptviiaydtsuerlumqvskhkmstbkqaookeqghpmlvhphjqmfcvvdqoffdxewruivwtebcobgagknrrcdwxdvsahpflchrtxtdauxomfuldoehvcxaqyxwclvivmkjubbrosvtuujoqkdc', 0, '2018-12-06', 68, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(19, 2, '�����մϴ�.', 'yhhycomjlmngnapvyphrcljoincejyatojngsikagqycuwfqymojuwvbboftxpfexjnjqmvfkfbxpttvnvaghwxsihhvdqegdgkixsunayliicnabtinvjnkxo', 0, '2020-01-19', 97, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(10, 1, '�����ƿ�', 'fyyhthdjsxenkobdpcffkqpycsrkfjqvgnvhenxoxqhawpfermjftgndmvfsbihsyowflpcyoq', 0, '2015-07-01', 83, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(22, 4, '�� ��� ���ϴ�.', 'ljkqhspggaplxinpesjpnxdojikvyxaokjtftkbguxrivvxhiofoiyacxbbtmckessqrtrgwsrxryqvtqlispwpwhufobkaghlqexephxxlpgsamtkxgcetvsbnabtuobyeslorhxnobiumeepdhvlkaagyewyncpgosifuyolbosjfkgjofdnxssjyclihthukokimxgsqpfkqpwlcgifdypllnkbffuwypudjdbhguyhcvlefkwjuleokhmvgwaqaqdxeghclnhedncoovjcewhlbaxoluabhmppq', 0, '2016-12-03', 68, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(21, 1, '�� �������� �ʳ׿�.', 'pfswiepmlgcnkxnprbdhvldjsatqwlfcimuvyrwaqfmberoabevrmqfyibbcoftovjldbnwmhggbpqgdkijehifqjcmrxluxnaoydinanlchvucotfijgwmaavvwxuh', 1, '2019-04-23', 40, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(27, 2, '�����մϴ�.', 'lvnqbujcuuiyqwbixdopqmdprivetxpdxkmgliuwhoxfhknwptqudaddrpwonbobgercawxbgugbdxnceekucjswyguwrcituhffeawvmbsicnfhdgerpfbqpwxdpkwwlbb', 1, '2016-11-25', 27, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(21, 1, '�������ƿ�', 'nfbxexgaeoxgrfhssbwvokreiqnbwhglplgcyidgjpvumpcjqfilgasqwjcgxcopklxwmqoujobpttjswkgkekjhejaxvlfidertdqirnrsmxeehimddxadywgqgbstnyhslvcnmuipxwmsmxgwvactogyjxcgonpsmpluygmggbnhbhnuexsv', 0, '2017-11-05', 93, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(15, 3, '�� ��� ���ϴ�.', 'rxhvpwqoflvvfocrroqrtggqyynvbhukgoimdmuvoqddbtiuhmrqnlw', 0, '2017-11-09', 34, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(29, 2, '�ǿ���;��.', 'daeuminbmlpkqtbrgdbypmhemdclraejokhbqitypusncdrgadefnaqxyliebxhbyurlvcibwrnkcohawtdddgcaleaycemvicnydauasuhovlajwbkvuoiiuehyadpkiwfpnitolnwbmgbedhhocjxkimiedqqmtmodyifsmnelsfuktpcipmbjabnyxcmcijmhsnhhwucxpikowyqdmssbskfqnkfgwbvkrjwekdxwhumwakuqgsoavfwnxwsuivnmovctlqjxebrwxaqioutjxmbymykawl', 0, '2016-09-03', 5, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(10, 2, '������ ����', 'fiejmdxbvwgrpevxxdfrriemfuabnutvfmrmcmpsjavbldlqhsrhbhypytvrnybpneiyyttiyerifucebdhmdqlmiyflvropyajnrflbvjiulmypyeekvlwckngpnbcwawqtxyktrgjxpsvjjvvtwrdkcwmojtviyrxivbauqmotomcniushnmpmoxtqnkopwdrircqrhgvmpkiqcdsnclvjuobeukhapxiryrknrhgkxwgbqlcwmkethbicavoggdegmxtecukfmoecsqiug', 0, '2020-02-25', 43, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(38, 2, '�����մϴ�.', 'cwpsdfctcrmhrrwjjpofvqiwxciotiplnpfqhjtugtgxpbgbjjeyjwaoakobcpqbfbtsudjkgclxytnylchlveougqqjnsuxhdvalqdmnttkamcwmssdcjudecrrobkydsrsswtnqqvnulyypbhcvvvalhykamqhtssftautjhsdkiolthwwvqkhhvjoexullgdncrpwcgltkvgqvlauacgyxnmvocwhjrplgqiatsncefvwncxehcvtdsexmvjgehiibljptnggbcbixlagystebfxfgf', 1, '2018-11-15', 50, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(21, 1, '�����մϴ�.', 'wgdiqxexijhcuahveebjxuiaseiohwsinrpphngfomwsgnghmdvwairsabwpwaturuflkoqxfkjwtrtyhxnwjwmegyxasosehecqakdwelrggqyottdwkssbwyoinupgogonfbnifskoheprojlfuggxvyfvirnstpheprwfsfcqbnkabqdwjlxrewijnngkngtrgmbugmposwmh', 0, '2015-03-27', 7, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(6, 2, '�� ��� ���ϴ�.', 'uhrykoklcsojpbrkbkhgdpqjtsbtnljohcrxemuokonmbqdlvkppecenjjocthnmwsiycwmudryhpwnscnlnxeefekrtngtqcuanhjlpgvaluihkaxxqkocpekgpfruxrtnhoqflrbmoqxsncdrcvgilsckvgisifgntlngbbqdkghagxansfqtvulopnejbmsatcjfuygncyo', 0, '2017-07-18', 77, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(1, 2, '�� �������� �ʳ׿�.', 'xwcxeknrxbpejpjfpb', 0, '2018-02-18', 53, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(4, 1, '�ǿ���;��.', 'chvpmhonyxxgugntprjdlljgebnwrldebjrlefcxmcioyuhbgoxngfqhqlgtisirmjupowmacitnxlxtmmntjoqlkkntjacwfnqushrgvpjhprpvibyqlskhoffwtwiidslrs', 0, '2017-08-22', 6, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(3, 4, '�����ƿ�', 'rqccrvahhlpqakwekeskncecwtfyknwyptpoaxlpuxbdrtgjkkswmoftsgyaagbbawtdfhvlkalklhfdydfnmnmgiffohduxrykclmolj', 0, '2015-02-25', 13, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(27, 1, '�����մϴ�.', 'pbtyygvonpqjbmpmsyqrcrkvprwdkljbwtilkemlpymcsjhrlxkosvfdtejmgswljbujckcvyrcleagxvxxjjdsgslsnuikthcjlxbdpkwqcgmwpldydgejmbremuxmechruybxrkmqrflpsftotjyscotidldytothiqxdd', 0, '2019-07-12', 8, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(1, 3, '�ǿ���;��.', 'uhitunahiwojpbcvjpijpvgirptfqxxtrnhvldiptjmyjfjuejuxjpfulpxrnppytjmbivtmxoqnymhslqmbnccnktjyxegxdwimbgiflawmbvlhocwvhabuqnxaaybcyolpmatvdutuihcwjgfpupiteuhbknihqnnuhyuwxomjocqhulxnjuftmnghuyobejfgocfmbtpthggpafaafejsvpduxnvjpilkuodoidgdkw', 0, '2016-12-27', 82, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(3, 4, '�� �� ��������?', 'rurgglklvmijif', 0, '2020-01-05', 48, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(16, 4, '�����ƿ�', 'yufhv', 1, '2020-11-25', 15, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(5, 4, '�� ��� ���ϴ�.', 'rooxmiunjmtrpcnwredxxedtldsbdqavegksccmelibritdieyjqodfrhwsrrclvkwhnaapwcrfnfrhlimmtxxybojflkrjtiwpltvyswnnqfumofujgdykbydidfcqdwmuqhulspmsajrhabqejffbqqipdhlfqbkkofpwwqfnspgumsanxlrrltmfptfnfpfjkdibuimwxrwxxoeiquyqfqqydriqexc', 1, '2015-09-26', 79, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(34, 4, '������ ����', 'yxpytruqsmvoxbdyphnngihjvwpcvurkkhxchgpydgpenvrvvchjcnyyqhdqirlixdeoswsglionygmjdkhptstbrgycdcybmyeitornqtprbkaqjdgepubwqdrttirjllorspfprmuxjylxcxujpenbjtnkypymfnhyxrvmuiivjkbifftxtoqbp', 0, '2017-10-01', 88, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(9, 3, '�����մϴ�.', 'xjfptgrcuixpddamuontniaerggdggrasnmidlllljlabohjedqjdxliglvljbcrjqjfvjjwvfcwygvxqgyxpjewtqkoidsitelxklstbtuwopuekgfkqgdbspmshdaoihxufaybrxudysrvvkvvxywtjpjllsdfmxupamncpreyhkspcwrhwlcnmtsoautlfkbxaadilmwosgphhoohh', 0, '2018-07-20', 80, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(6, 3, '�����մϴ�.', 'acbckmvfdcaichbtaehetjfccvbipuuhyxvskghfvmifugcvymflknjbhfvglokdgsmvtwebukihuqqjxuwuidfsmobkcldlpdcrdeobjjuuvgyxvtdbohxcvvfrqvtgfbgrljjqhyslpwbwinwafptqggsjcbffdjlegxcvkmahtipcvuehbneexxflygshkkwx', 1, '2016-09-27', 1, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(45, 2, '�ǿ���;��.', 'dakvnrxlswlqrjqpkeqhtslgnbsabw', 0, '2020-04-13', 58, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(29, 2, '������ ����', 'cropaccyhoxggfxpfdtelnewddgfqseyetplehqbgtrulmpyimqvlpkbucsrtwyedsjjmmfquojtjgddracyoqhpacuecexhhbypmpkbeymbeyvrlpvxtteiatqwecxyatwcipadqejxmufhov', 0, '2016-11-24', 5, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(40, 1, '������ ����', 'yrteggtxkhsfuohjqvmkprfrcslcnwamvwgeasyhvlosanlyeeeornxufxxiyocwmrdkadiijoeivtthkxqmaulgqnghdmwkpgynkamfgmurcflwnxbckrjgmbrdxjolswwsafsefr', 0, '2019-09-08', 95, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(36, 4, '�� ��� ���ϴ�.', 'umexhcaqcjfbwljpcnugaqxsxoyiyxmimthujblrajdcjgajsyfincgbenirflbkkinvvoisanvyuqlriehdkatesepoijaelwhaysnoaxuelihhgyycwyevwykthhwhpxotcyhfvtbbigurqrrcysonabtmpqlaedtnprgswmgtrshewqagdibjdoqkasajtgrspqtnquwlbepuheqrdxdjpgelrdncskapxjpxxxxpgexugcsnrutbpjsqnnymgbtxkbebxueqignqdm', 0, '2015-10-15', 34, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(41, 2, '������ ����', 'serqkcyexuyrigiscmmfvtbopscwdhygtvuwuqeidfkjuffyemsahbffkfgicrnduvvljqfbeybtohwmwviuiwuywepplgovdackeoughuoovnkxwfxgmfhsednwqtgvpvnmnsplrrdkoksivgrvnmyrfmxrpyhdgjlofxdshfhngkvbxygwjxsgerxdt', 0, '2019-04-18', 30, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(17, 2, '�ǿ���;��.', 'qkalutancnhbfurvkvttlmsgmfsbpitxooupwrhoxpfjbnicjwjlyhxgjglcufrfpmefbmnhngpsaquodpgjeagkqhlaehydsfsemytqdqegffeyifblfeliymtpvrxiatacxnnifhbawdyaxssxgfbfrwoigwbtutbvdlxasgvkxiddeydsrnhqjnxnjptdudorxxtuodouytiysubetafajurpbxahvupqymylyjbjidvbflwqtfn', 1, '2015-12-26', 74, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(16, 3, '�������ƿ�', 'lubdqdsubmoavkododfolepkqxsxtveiiaormvmhdpgpvmwunwqkdmysbtawtswiinyfwrdqthlp', 0, '2019-04-25', 91, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(33, 3, '�����մϴ�.', 'kprvouireultukocnxrfulypxuaxofed', 0, '2019-03-15', 28, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(40, 3, '�� �� ��������?', 'hfvskhhnuobavaksufrsvditgsovfteyklkofrrkpudfpjcpidsefrrdqalalcxhbtkfgxqsnqop', 0, '2016-10-06', 80, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(48, 3, '�������ƿ�', 'rftrdacwyttjckphpumhlpgjxlydinrrubfniuvtohdgefkfhvm', 0, '2017-07-12', 79, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(1, 2, '�����ƿ�', 'imqeuwavabmmwuqpdxjsqfoyvpvmqcnuptyxchbvwnxtvlibusnlfhvwhaajrjsneuwpbcookipwalhgqkhhccwirdmxlyqtxtfiihaktjdirsnvilpbvfqsiapdfydprbigdowaylktpvmxahxteexywpfrebnlypiabnvcivriimiwfudvywnvwxupbuyvmivgxgrhpanlwljpptwyffebqarcaawpsssxljtgpxtjehtwaymyfmxvhqruvtasiqhxrlfsv', 0, '2019-01-01', 73, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(10, 4, '������ ����', 'dmohepkihmqperchrvwrjxwgxcrbfirgluwkuxphacuraeoetycttatooxvdlqsvmdsokhxxce', 0, '2019-11-13', 13, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(40, 1, '�� ��� ���ϴ�.', 'xmvsocvxrxpscmcpowknkwnfxdtmwdijtyayihxfspdmrdgjjlyxafibhqakqaukeandbtmdqyubufjelatweoinkocdyqjpsuuqdfgeycckiyfwwkpxjxgcrrhcwfcknlloywnrtuvqvwhlonithkqidslvscyyycttyvmhys', 0, '2020-09-14', 67, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(44, 1, '�����ƿ�', 'mrvkltdgpbyfnvolgdolshnhuwsggjrvbquvsliponrpmnksttkilfucxlbfgkfexgdybptfhfnuofpmtpuqlexiftiouhbvtrfoiamolsfnpevedgbjefsfwybqapxmjkpkmvuqnxvhbfsehyedxrbhdpvefwhovmhycqfelhsqvgevtdkpufdqcejabvmtmcelcvgfxmcctnvrmraurlttnviwvvibmvohxncmpubalidofysqneqkselhidpwtoscbrmqiycnujndjqhhujvraimpdxmhqxuaoyk', 0, '2018-04-17', 46, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(10, 4, '������ ����', 'uaywcigryaowvrlpykknamiiclelyqwrduhceoshhbukixosxolvauldgcpkbeixgquwbsmqokfcslmnuaoxfccveixkcdbfgciynsuchkwrkdudfdqnirljcsstqpstlpeiuqyqstxkwwvbqeguxhyrnkhlpsaoftpimbqwnrpltvxmigpehfhyvmfnhisgaliqsplhinidyraexfqolkdlhjogjxubherjmulurnhacqhsdnhtyknviajjihwwuytemikxikofqqdjqxemjmwvsnoh', 0, '2018-11-24', 48, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(32, 1, '�����ƿ�', 'nfsnmbehahrmvnedwejngeqdtnaus', 0, '2015-01-20', 91, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(32, 4, '�� �������� �ʳ׿�.', 'ileyusxarkfkwleveeladcsmpjekuuanfxqkelhtwgjvxtlnivsmiwwlmkrrrywkfvsjpxybbvftacjkhgcqxqfxpqofdlgtwuqeihmaehbjkmjftarhepthfbgpmgexssicjouqgjpxxejajpmihrbjfsaanbwq', 0, '2019-02-26', 51, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(20, 3, '�����մϴ�.', 'bqstphpltnfjrwjljguplvyiptdevoxpcdvsgueyagvuysrwcxclbgacpkhshvnrvdlntlmaifpypuav', 0, '2016-04-18', 3, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(28, 4, '�������ƿ�', 'sjugbuofphxyhttjcpfejdkmbxjsfwqyfmdovrycwbjklpwnvfebbrsvhacgegocqanwyfoxjvfirdsmtyujbjkefqvcgibxrcgouqpucyrilpnijroutuqq', 1, '2020-05-10', 87, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(28, 3, '�� ��� ���ϴ�.', 'ykbufqiqhxtoqhidoldldmikekfijcamdwecvbfuikwmiomiwvxdkfqiugcngplrlhqugtjrqgesncdmmybqqltpfnbhegbgdwlhvcifnbxaxujoiojmtqiivvtktrwhbnoeyoduyocxf', 0, '2015-04-15', 22, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(22, 1, '�������ƿ�', 'nwuifpxdkkguixkidgelfkjukgnfxfljuilfrdftbnufkirmldjrkdfjlxpwttgywaxnmgbonkviaeuvlcdjcchlusaoouxnkobyaccdojbkcscekvxqnmtyvrqkibtnokprpjfheckltjqllynktiorf', 1, '2015-07-25', 53, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(20, 4, '�����մϴ�.', 'wmanomwtevhukitfrxjeeiafqcyyofovmwxyciadrymibhugvjbtovbykpeairryweyysabgtnwglhftsppgerrhbwicouavaaxeorkxwycdtskxulnbxejidapsoxnubopxbdvemdceddkqfpffkniaapbqtwwodkmafnrnfqtynhxabvixcaxvaaubchkwfhsfcxpbwuxwbveahkfmoefsuhgusurhbwrttjkeenptjfvosyrxdk', 1, '2017-01-19', 72, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(43, 3, '�� �������� �ʳ׿�.', 'xxnpaykthmsllqogsdggjesqsfrognfahcxhevdwrajxkbdlmoruodtkbnflrwvfetxhcbwjetjgpymypajbcwiuwcmxieafbdqxncopdwhautdfqmtriwfckffwymkeugkfxhbhwnorcdulmovprbymdauculloudsqhqoxjropijbrxjgikemdbneibygwskikwwcikstjsxmbiqooqtmjlejghhuhinoxyeknoaxrieoorkgoroxvdpp', 1, '2017-07-06', 2, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(46, 2, '�� �� ��������?', 'lgxvyxfndoyeryskwokccwfjefbu', 0, '2019-11-11', 45, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(49, 3, '�����մϴ�.', 'itqepvqecfwlfabuqqfjyofprqkxufhqvrbwjyeyelpeeotaaodafodktjwybchlbagfhoarwjvfhpqnwttdjlubemvg', 0, '2020-07-17', 24, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(37, 1, '������ ����', 'rqowwncmvefrshdpdfxbcgggeixggbeuabixwormtemwtqtukwducdcssntdqehplbaxcbymmcusevgsrbsvwqjbtufwrsvrfdmitymigwepbegrpahkxshalvnyoxhrgngopxcagrxitnfchruojwwcoplxkbcojkfwylsrmjriotenncsensvgagjuyuuxkcuasu', 0, '2015-12-02', 66, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(41, 1, '�� �� ��������?', 'phsqkehxpishytbicchrpcketjwsjxxuxxxkrihdiqudynuvxomugciuuriwakpppbhqijwfpushwicklokxopnhelvhlegmtohluedt', 0, '2016-06-04', 7, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(33, 4, '������ ����', 'wbqievekqwhgoaixpxcxorxscvsabiuaymmrogvmafhqjxqlfgkpktdtdikfeverqrkxqjdearwnusvfikibamgqrabpduarilexwonhotuaatajwkwspcmgnmtllwbogngmrklukqyfckcvffvvtweanyemdfnxwdjwdaelljwelpaibxyikvasehpljloinnsvcyftpinprxdrcpuvpyfkgreq', 0, '2015-06-04', 67, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(22, 3, '�������ƿ�', 'oyxqlrgiskgmeltmflnfaxbjnlejmldyllwnpkivddwvlliqhkvltegxrjgmvdibuovqbpvrkbllkccwstjrqiqawksbdyvhrxnkgakfwjsrokrjkxtcgilhggjsrwrtiswgkkbxxroajgwpxbuocosunjbhgjhlqqsbevmg', 0, '2016-10-24', 93, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(44, 3, '�����ƿ�', 'cqhreschoiisfbjpgylptsqxqyjkoraqbgqqigmeqfqekxesucpkppjhxtrpjhrwfiefequglbjrj', 1, '2015-04-08', 55, 0);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(32, 1, '�� �� ��������?', 'vcbjrbfppjalhnbiqbsxkyecntmdgctmatlwxgjxxblhwfayfbtqlitcxkifbampbgvsponnnnytxywrxeqviimyiuoekwikvvdpvilcwafyjmjwxyijdfgdpqrirrgcwjlvbvhcfrxrpsvfgmfjnyigtjjdcmfbibohhiybkhlehxafsovfdojscfblgbtcfwgtgyaohnmpsfgagpvinwhkembefxsixostbhdskffgvqpfjikogxcphtvwfdqvmlfbhtyofgdpgjnftttjohesmowwoa', 0, '2020-09-10', 7, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(43, 3, '�����մϴ�.', 'cvnojwlohkthjjyvnxjqejoluprjepeljqxuodrsylcixhppbgkyfvxvaybepqetdyhnfgxphlbyftwybuksgahwonjuhtcsrewmlfektkbgkgetjoukiiknrocatuwjkdiwqjtykrdpseaejxxfdpurtvwbkxssmhtwipnowbxaprpswicovhitudvaioreoeivfgbtjrkqdwxfgjkewleglbmfkhffdhiomwfinhtqe', 0, '2018-08-10', 67, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(48, 1, '�� �� ��������?', 'kpxvgidylmejudtjftjetnojiahrkirsbxnlknklgruaneaxwgigtkcabpklxbdrodpynugpbgpcrkwshdpmpdximerhbwpmoaolqpvrbvqnkbieponawelibvsqdaguwlnpiiqgsdwlfkjnjwdjrfqkohfarwbfebe', 0, '2018-10-24', 47, 1);
insert into post(post_mem, post_room, post_title, post_cont, post_hide, post_date, post_count, post_Type) values(37, 4, '�� �� ��������?', 'irwxtlkigksntyyvehxfxkiybrtlmklmu', 0, '2018-03-17', 22, 1);






commit;