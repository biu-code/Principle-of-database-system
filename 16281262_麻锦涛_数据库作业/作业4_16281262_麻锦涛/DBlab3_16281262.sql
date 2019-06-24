--����һ����Ϊschool�����ݿ�
DROP database if exists school;
CREATE database school;

--ʹ��school���ݿ�
USE school��

--ɾ�����ݱ�
DROP TABLE account;
DROP TABLE train;
DROP TABLE information;
DROP TABLE booking;
DROP TABLE user;

--�������ݱ�
CREATE TABLE user (
         id             int PRIMARY KEY,
         name           varchar(20) NOT NULL,
         gender         char CHECK(gender IN('��','Ů')),
         idcode         varchar(100)NOT NULL,
         native_place   varchar(50),
         telephone      bigint CHECK(telephone LIKE '___________'),
         mail           varchar(100) )ENGINE=InnoDB;
CREATE TABLE account(
         id             int,
         password       varchar(20),
         PRIMARY KEY(id),
         FOREIGN KEY(id) REFERENCES user(id))ENGINE=InnoDB;
CREATE TABLE booking(
         no             varchar(50),
         id             int NOT NULL,
         bookingtime    timestamp,
         PRIMARY KEY(no),
         FOREIGN KEY(id) REFERENCES user(id))ENGINE=InnoDB;
CREATE TABLE train  (
         trips          varchar(20) PRIMARY KEY,
         route          text,
         driven_distance int ,
         driven_time    time)ENGINE=InnoDB;
CREATE TABLE information (
         no             varchar(50),
         trips          varchar(20),
         departure_time timestamp,
         arrival_time   timestamp,
         originating_station varchar(20),
         arrival_station varchar(20),
         type            varchar(20),
         price           int,
         amount          int,
         PRIMARY KEY(no),
         FOREIGN KEY(no) REFERENCES booking(no),
         FOREIGN KEY(trips) REFERENCES train(trips))ENGINE=InnoDB;

--��user���������
INSERT INTO user VALUES(10000,'����','��','360734198003040001','����',13912761234,'2847239812@qq.com');
INSERT INTO user VALUES(10001,'����','��','360734199512104523','���',15778951024,'2712134569@qq.com');
INSERT INTO user VALUES(10002,'��ǿ','��','360734199704050231','����',13912560903,'4523908712@qq.com');
INSERT INTO user VALUES(10003,'����','Ů','360734199604010831','����',12712345679,'3569123409@qq.com');
INSERT INTO user VALUES(10004,'����','Ů','360734199911051231','����',15913016031,'1098090812@qq.com');
INSERT INTO user VALUES(10005,'����','��','360734198701020231','����',13911221145,'0000111134@qq.com');
INSERT INTO user VALUES(10006,'����','��','360734199008018031','����',13701560904,'1287123409@qq.com');
INSERT INTO user VALUES(10007,'��˧','Ů','360734199712058034','����',15800121212,'2849774125@qq.com');

--��account���������
INSERT INTO account VALUES(10000,'waws1234');
INSERT INTO account VALUES(10001,'asdf4567');
INSERT INTO account VALUES(10002,'197812ac');
INSERT INTO account VALUES(10003,'15280901');
INSERT INTO account VALUES(10004,'08231789');
INSERT INTO account VALUES(10005,'bt120912');
INSERT INTO account VALUES(10006,'11119090');
INSERT INTO account VALUES(10007,'1907aabb');

--��booking���������
INSERT INTO booking VALUES('A-07892345',10000,DATE_FORMAT('2017-03-25 13:24:11','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('A-12361209',10001,DATE_FORMAT('2017-05-26 20:10:12','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('E-16581231',10006,DATE_FORMAT('2017-04-01 07:00:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('E-78121222',10004,DATE_FORMAT('2017-08-31 10:20:19','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('A-01231234',10002,DATE_FORMAT('2017-05-26 10:20:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('E-00110101',10005,DATE_FORMAT('2017-03-25 22:11:10','%Y-%m-%d %H:%i:%s'));

--��train���������
INSERT INTO train VALUES('G105','����-���-����-����-�Ͼ�-�Ϻ�',1000,TIME_FORMAT('04:10:00','%H:%i:%s'));
INSERT INTO train VALUES('G120','�人-֣��-ʯ��ׯ-������',1200,TIME_FORMAT('06:20:00','%H:%i:%s'));
INSERT INTO train VALUES('T3085','����-����-��Դ-����-ӥ̶-����-���ݶ�-����-�Ϻ���',1562,TIME_FORMAT('22:15:00','%H:%i:%s'));
INSERT INTO train VALUES('K486','����-����-�ع�-����-����-��̶-����-����-����-�ɶ���',2310,TIME_FORMAT('37:16:00','%H:%i:%s'));
INSERT INTO train VALUES('Z43','������-ʯ��ׯ��-�Ӱ�-����',1427,TIME_FORMAT('13:40:00','%H:%i:%s'));
INSERT INTO train VALUES('K571','������-��ˮ-�ĳ�-����-����-�Ž�-������-����-����',3100,TIME_FORMAT('18:47:00','%H:%i:%s'));
INSERT INTO train VALUES('D3227','�人-����-��ʯ-�����-����-�ϲ���',600,TIME_FORMAT('02:46:00','%H:%i:%s'));
INSERT INTO train VALUES('G7','������-������-�Ͼ���-�Ϻ�����',1000,TIME_FORMAT('04:10:00','%H:%i:%s'));
INSERT INTO train VALUES('D313','������-�Ͼ�-����-�Ϻ�',1000,TIME_FORMAT('04:10:00','%H:%i:%s'));
INSERT INTO train VALUES('G153','������-������-̩��-���ݶ�-���ݱ�-�Ϻ�����',1000,TIME_FORMAT('04:10:00','%H:%i:%s'));

--��information���������
INSERT INTO information VALUES('A-07892345','G105',DATE_FORMAT('2017-03-30 12:00:00','%Y-%m-%d %H:%i:%s'),
   DATE_FORMAT('2017-03-30 16:10:00','%Y-%m-%d %H:%i:%s'),'����','�Ϻ�','������',400,210);
INSERT INTO information VALUES('A-01231234','Z43',DATE_FORMAT('2017-06-01 12:00:00','%Y-%m-%d %H:%i:%s'),
   DATE_FORMAT('2017-06-02 01:40:00','%Y-%m-%d %H:%i:%s'),'����','����','�ص���',650,300);
INSERT INTO information VALUES('E-00110101','Z43',DATE_FORMAT('2017-06-01 12:00:00','%Y-%m-%d %H:%i:%s'),
   DATE_FORMAT('2017-06-02 01:40:00','%Y-%m-%d %H:%i:%s'),'����','����','Ӳ��',750,100);
INSERT INTO information VALUES('E-16581231','Z43',DATE_FORMAT('2017-06-01 12:00:00','%Y-%m-%d %H:%i:%s'),
   DATE_FORMAT('2017-06-02 01:40:00','%Y-%m-%d %H:%i:%s'),'����','����','����',780,100);
INSERT INTO information VALUES('E-78121222','K571',DATE_FORMAT('2017-08-01 06:00:00','%Y-%m-%d %H:%i:%s'),
   DATE_FORMAT('2017-08-02 00:47:00','%Y-%m-%d %H:%i:%s'),'������','����','����',780,300);
INSERT INTO information VALUES('A-12361209','K571',DATE_FORMAT('2017-08-01 06:00:00','%Y-%m-%d %H:%i:%s'),
   DATE_FORMAT('2017-08-02 00:47:00','%Y-%m-%d %H:%i:%s'),'������','����','Ӳ��',400,50);

--�����ύ
COMMIT; 

--��train����Ψһ����
CREATE UNIQUE INDEX train_s ON train(trips);

--�۴�������Ψһ�ģ�ÿ������������������о۴أ������������Ӿ۴����� 


         