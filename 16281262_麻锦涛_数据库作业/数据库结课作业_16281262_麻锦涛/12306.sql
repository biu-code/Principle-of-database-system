#建立一个名为ticket_query的数据库
CREATE database ticket_query;

#使用ticket_query数据库
use ticket_query;
#创建数据表
#创建用户表
CREATE TABLE user (
         id             bigint PRIMARY KEY,
         name           varchar(50) NOT NULL,
         gender         enum('男','女') NOT NULL,
         idcode         varchar(100)NOT NULL,
         telephone      bigint NOT NULL,
         mail           varchar(100) )ENGINE=InnoDB;
#创建账户表
CREATE TABLE account(
         id             bigint,
         password       varchar(20),
         money          int,
		 flag           varchar(20),
         PRIMARY KEY(id),
         FOREIGN KEY(id) REFERENCES user(id))ENGINE=InnoDB;
#创建管理员账户表
CREATE TABLE admin(
         id             bigint,
         password       varchar(20),
         PRIMARY KEY(id))ENGINE=InnoDB;
#创建订购表
CREATE TABLE booking(
         no             varchar(50),
         id             bigint NOT NULL,
         bookingtime    timestamp,
         PRIMARY KEY(no),
         FOREIGN KEY(id) REFERENCES user(id))ENGINE=InnoDB;
#创建车次信息表
CREATE TABLE train  (
         trips          varchar(50) PRIMARY KEY,
         originating_station varchar(50),
         arrival_station varchar(50),
         departure_time time,
         arrival_time   time,
         driven_distance int,
         driven_time    time,
         route          text)ENGINE=InnoDB;
 #创建订票信息表        
CREATE TABLE information (
         trips           varchar(50),
         type            varchar(50),
         price           int,
         amount          int,
         PRIMARY KEY(trips,type),
         FOREIGN KEY(trips) REFERENCES train(trips))ENGINE=InnoDB;
#创建对应表
CREATE TABLE map (
         no              varchar(50),
         trips           varchar(50),
         primary key(no))ENGINE=InnoDB;

#给user表插入数据
INSERT INTO user VALUES(10000,'张三','男','360734198003040001','北京',13912761234,'2847239812@qq.com');
INSERT INTO user VALUES(10001,'李四','男','360734199512104523','天津',15778951024,'2712134569@qq.com');
INSERT INTO user VALUES(10002,'赵强','男','360734199704050231','河南',13912560903,'4523908712@qq.com');
INSERT INTO user VALUES(10003,'徐丽','女','360734199604010831','湖北',12712345679,'3569123409@qq.com');
INSERT INTO user VALUES(10004,'何云','女','360734199911051231','江西',15913016031,'1098090812@qq.com');
INSERT INTO user VALUES(10005,'刘亮','男','360734198701020231','北京',13911221145,'0000111134@qq.com');
INSERT INTO user VALUES(10006,'王有','男','360734199008018031','河南',13701560904,'1287123409@qq.com');
INSERT INTO user VALUES(10007,'何帅','女','360734199712058034','福建',15800121212,'2849774125@qq.com');
INSERT INTO user VALUES(10008,'欧阳坤','男','360734199509021234','安徽',15612340908,'090898123@qq.com');

#给account表插入数据
INSERT INTO account VALUES(10000,'aaaaa',3500,'false');
INSERT INTO account VALUES(10001,'bbbbb',4000,'false');
INSERT INTO account VALUES(10002,'ccccc',5000,'false');
INSERT INTO account VALUES(10003,'ddddd',5000,'false');
INSERT INTO account VALUES(10004,'eeeee',4000,'false');
INSERT INTO account VALUES(10005,'fffff',2500,'false');
INSERT INTO account VALUES(10006,'ggggg',6000,'false');
INSERT INTO account VALUES(10007,'hhhhh',3600,'false');
INSERT INTO account VALUES(10008,'iiiii',5000,'false');

#给admin表插入数据
INSERT INTO admin VALUES(10000,'aaaaa');
INSERT INTO admin VALUES(10001,'bbbbb');
INSERT INTO admin VALUES(10002,'ccccc');
INSERT INTO admin VALUES(10003,'ddddd');
INSERT INTO admin VALUES(10004,'eeeee');

#给booking表插入数据
INSERT INTO booking VALUES('A-0',10000,DATE_FORMAT('2017-12-12 07:00:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('A-1',10001,DATE_FORMAT('2017-12-12 08:10:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('A-2',10002,DATE_FORMAT('2017-12-12 09:00:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('A-3',10003,DATE_FORMAT('2017-12-12 10:20:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('A-4',10004,DATE_FORMAT('2017-12-12 10:20:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('A-5',10005,DATE_FORMAT('2017-12-12 12:11:10','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('A-6',10006,DATE_FORMAT('2017-12-12 15:00:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('A-7',10007,DATE_FORMAT('2017-12-12 23:00:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('A-8',10008,DATE_FORMAT('2017-12-12 07:12:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('B-0',10000,DATE_FORMAT('2017-12-13 07:00:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('B-1',10001,DATE_FORMAT('2017-12-13 08:10:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('B-2',10002,DATE_FORMAT('2017-12-13 09:00:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('B-3',10003,DATE_FORMAT('2017-12-13 10:20:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('B-4',10004,DATE_FORMAT('2017-12-13 10:20:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('B-5',10005,DATE_FORMAT('2017-12-13 12:11:10','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('B-6',10006,DATE_FORMAT('2017-12-13 15:00:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('B-7',10007,DATE_FORMAT('2017-12-13 23:00:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('B-8',10008,DATE_FORMAT('2017-12-13 07:12:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('C-0',10000,DATE_FORMAT('2017-12-14 07:00:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('C-1',10001,DATE_FORMAT('2017-12-14 08:10:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('C-2',10002,DATE_FORMAT('2017-12-14 09:00:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('C-3',10003,DATE_FORMAT('2017-12-14 10:20:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('C-4',10004,DATE_FORMAT('2017-12-14 10:20:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('C-5',10005,DATE_FORMAT('2017-12-14 12:11:10','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('C-6',10006,DATE_FORMAT('2017-12-14 15:00:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('C-7',10007,DATE_FORMAT('2017-12-14 23:00:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('C-8',10008,DATE_FORMAT('2017-12-14 07:12:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('D-0',10000,DATE_FORMAT('2017-12-15 07:00:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('D-1',10001,DATE_FORMAT('2017-12-15 08:10:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('D-2',10002,DATE_FORMAT('2017-12-15 09:00:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('D-3',10003,DATE_FORMAT('2017-12-15 10:20:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('D-4',10004,DATE_FORMAT('2017-12-15 10:20:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('D-5',10005,DATE_FORMAT('2017-12-15 12:11:10','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('D-6',10006,DATE_FORMAT('2017-12-15 15:00:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('D-7',10007,DATE_FORMAT('2017-12-15 23:00:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('D-8',10008,DATE_FORMAT('2017-12-15 07:12:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('E-0',10000,DATE_FORMAT('2017-12-16 07:00:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('E-1',10001,DATE_FORMAT('2017-12-16 08:10:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('E-2',10002,DATE_FORMAT('2017-12-16 09:00:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('E-3',10003,DATE_FORMAT('2017-12-16 10:20:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('E-4',10004,DATE_FORMAT('2017-12-16 10:20:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('E-5',10005,DATE_FORMAT('2017-12-16 12:11:10','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('E-6',10006,DATE_FORMAT('2017-12-16 15:00:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('E-7',10007,DATE_FORMAT('2017-12-16 23:00:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('E-8',10008,DATE_FORMAT('2017-12-16 07:12:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('F-0',10000,DATE_FORMAT('2017-12-17 07:00:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('F-1',10001,DATE_FORMAT('2017-12-17 08:10:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('F-2',10002,DATE_FORMAT('2017-12-17 09:00:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('F-3',10003,DATE_FORMAT('2017-12-17 10:20:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('F-4',10004,DATE_FORMAT('2017-12-17 10:20:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('F-5',10005,DATE_FORMAT('2017-12-17 12:11:10','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('F-6',10006,DATE_FORMAT('2017-12-17 15:00:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('F-7',10007,DATE_FORMAT('2017-12-17 23:00:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('F-8',10008,DATE_FORMAT('2017-12-17 07:12:00','%Y-%m-%d %H:%i:%s'));

#给train表插入数据
INSERT INTO train VALUES('G1','北京','天津',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('12:30:00','%H:%i:%s'),200,TIME_FORMAT('00:30:00','%H:%i:%s'),'北京-天津');
INSERT INTO train VALUES('D1','北京','天津',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('06:30:00','%H:%i:%s'),200,TIME_FORMAT('00:30:00','%H:%i:%s'),'北京-天津');
INSERT INTO train VALUES('C1','北京','天津',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('12:30:00','%H:%i:%s'),200,TIME_FORMAT('00:30:00','%H:%i:%s'),'北京-天津');
INSERT INTO train VALUES('G2','北京','天津',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('08:30:00','%H:%i:%s'),200,TIME_FORMAT('00:30:00','%H:%i:%s'),'北京-天津');
INSERT INTO train VALUES('D2','北京','天津',TIME_FORMAT('16:00:00','%H:%i:%s'),TIME_FORMAT('16:30:00','%H:%i:%s'),200,TIME_FORMAT('00:30:00','%H:%i:%s'),'北京-天津');
INSERT INTO train VALUES('C2','北京','天津',TIME_FORMAT('22:00:00','%H:%i:%s'),TIME_FORMAT('22:30:00','%H:%i:%s'),200,TIME_FORMAT('00:30:00','%H:%i:%s'),'北京-天津');
INSERT INTO train VALUES('G3','天津','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('12:30:00','%H:%i:%s'),200,TIME_FORMAT('00:30:00','%H:%i:%s'),'天津-北京');
INSERT INTO train VALUES('D3','天津','北京',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('06:30:00','%H:%i:%s'),200,TIME_FORMAT('00:30:00','%H:%i:%s'),'天津-北京');
INSERT INTO train VALUES('C3','天津','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('12:30:00','%H:%i:%s'),200,TIME_FORMAT('00:30:00','%H:%i:%s'),'天津-北京');
INSERT INTO train VALUES('G4','天津','北京',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('08:30:00','%H:%i:%s'),200,TIME_FORMAT('00:30:00','%H:%i:%s'),'天津-北京');
INSERT INTO train VALUES('D4','天津','北京',TIME_FORMAT('16:00:00','%H:%i:%s'),TIME_FORMAT('16:30:00','%H:%i:%s'),200,TIME_FORMAT('00:30:00','%H:%i:%s'),'天津-北京');
INSERT INTO train VALUES('C4','天津','北京',TIME_FORMAT('22:00:00','%H:%i:%s'),TIME_FORMAT('22:30:00','%H:%i:%s'),200,TIME_FORMAT('00:30:00','%H:%i:%s'),'天津-北京');

INSERT INTO train VALUES('G5','北京','上海',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('16:30:00','%H:%i:%s'),1000,TIME_FORMAT('04:30:00','%H:%i:%s'),'北京-天津-济南-徐州-南京-上海');
INSERT INTO train VALUES('D5','北京','上海',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('10:30:00','%H:%i:%s'),1000,TIME_FORMAT('04:30:00','%H:%i:%s'),'北京-天津-济南-徐州-南京-上海');
INSERT INTO train VALUES('G6','北京','上海',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('16:30:00','%H:%i:%s'),1000,TIME_FORMAT('04:30:00','%H:%i:%s'),'北京-天津-济南-徐州-南京-上海');
INSERT INTO train VALUES('D6','北京','上海',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('12:30:00','%H:%i:%s'),1000,TIME_FORMAT('04:30:00','%H:%i:%s'),'北京-天津-济南-徐州-南京-上海');
INSERT INTO train VALUES('G7','北京','上海',TIME_FORMAT('16:00:00','%H:%i:%s'),TIME_FORMAT('20:30:00','%H:%i:%s'),1000,TIME_FORMAT('04:30:00','%H:%i:%s'),'北京-天津-济南-徐州-南京-上海');
INSERT INTO train VALUES('D7','北京','上海',TIME_FORMAT('22:00:00','%H:%i:%s'),TIME_FORMAT('02:30:00','%H:%i:%s'),1000,TIME_FORMAT('04:30:00','%H:%i:%s'),'北京-天津-济南-徐州-南京-上海');
INSERT INTO train VALUES('G8','上海','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('16:30:00','%H:%i:%s'),1000,TIME_FORMAT('04:30:00','%H:%i:%s'),'上海-南京-徐州-济南-天津-北京');
INSERT INTO train VALUES('D8','上海','北京',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('10:30:00','%H:%i:%s'),1000,TIME_FORMAT('04:30:00','%H:%i:%s'),'上海-南京-徐州-济南-天津-北京');
INSERT INTO train VALUES('G9','上海','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('16:30:00','%H:%i:%s'),1000,TIME_FORMAT('04:30:00','%H:%i:%s'),'上海-南京-徐州-济南-天津-北京');
INSERT INTO train VALUES('D9','上海','北京',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('12:30:00','%H:%i:%s'),1000,TIME_FORMAT('04:30:00','%H:%i:%s'),'上海-南京-徐州-济南-天津-北京');
INSERT INTO train VALUES('G10','上海','北京',TIME_FORMAT('16:00:00','%H:%i:%s'),TIME_FORMAT('20:30:00','%H:%i:%s'),1000,TIME_FORMAT('04:30:00','%H:%i:%s'),'上海-南京-徐州-济南-天津-北京');
INSERT INTO train VALUES('D10','上海','北京',TIME_FORMAT('22:00:00','%H:%i:%s'),TIME_FORMAT('02:30:00','%H:%i:%s'),1000,TIME_FORMAT('04:30:00','%H:%i:%s'),'上海-南京-徐州-济南-天津-北京');

INSERT INTO train VALUES('G11','北京','广州',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('20:30:00','%H:%i:%s'),2500,TIME_FORMAT('08:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-郴州-广州');
INSERT INTO train VALUES('D11','北京','广州',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('14:30:00','%H:%i:%s'),2500,TIME_FORMAT('08:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-郴州-广州');
INSERT INTO train VALUES('T11','北京','广州',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('22:30:00','%H:%i:%s'),2500,TIME_FORMAT('10:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-郴州-广州');
INSERT INTO train VALUES('Z11','北京','广州',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('20:30:00','%H:%i:%s'),2500,TIME_FORMAT('12:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-郴州-广州');
INSERT INTO train VALUES('K11','北京','广州',TIME_FORMAT('16:00:00','%H:%i:%s'),TIME_FORMAT('06:30:00','%H:%i:%s'),2500,TIME_FORMAT('14:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-郴州-广州');
INSERT INTO train VALUES('G12','广州','北京',TIME_FORMAT('22:00:00','%H:%i:%s'),TIME_FORMAT('06:30:00','%H:%i:%s'),2500,TIME_FORMAT('08:30:00','%H:%i:%s'),'广州-郴州-长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('D12','广州','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('20:30:00','%H:%i:%s'),2500,TIME_FORMAT('08:30:00','%H:%i:%s'),'广州-郴州-长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('T12','广州','北京',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('16:30:00','%H:%i:%s'),2500,TIME_FORMAT('10:30:00','%H:%i:%s'),'广州-郴州-长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('Z12','广州','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('00:30:00','%H:%i:%s'),2500,TIME_FORMAT('12:30:00','%H:%i:%s'),'广州-郴州-长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('K12','广州','北京',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('22:30:00','%H:%i:%s'),2500,TIME_FORMAT('14:30:00','%H:%i:%s'),'广州-郴州-长沙-武汉-郑州-石家庄-北京');

INSERT INTO train VALUES('G13','北京','杭州',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('20:30:00','%H:%i:%s'),1500,TIME_FORMAT('08:30:00','%H:%i:%s'),'北京-天津-济南-徐州-苏州-南京-上海-杭州');
INSERT INTO train VALUES('D13','北京','杭州',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('14:30:00','%H:%i:%s'),1500,TIME_FORMAT('08:30:00','%H:%i:%s'),'北京-天津-济南-徐州-苏州-南京-上海-杭州');
INSERT INTO train VALUES('T13','北京','杭州',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('22:30:00','%H:%i:%s'),1500,TIME_FORMAT('10:30:00','%H:%i:%s'),'北京-天津-济南-徐州-苏州-南京-上海-杭州');
INSERT INTO train VALUES('Z13','北京','杭州',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('20:30:00','%H:%i:%s'),1500,TIME_FORMAT('12:30:00','%H:%i:%s'),'北京-天津-济南-徐州-苏州-南京-上海-杭州');
INSERT INTO train VALUES('K13','北京','杭州',TIME_FORMAT('16:00:00','%H:%i:%s'),TIME_FORMAT('06:30:00','%H:%i:%s'),1500,TIME_FORMAT('14:30:00','%H:%i:%s'),'北京-天津-济南-徐州-苏州-南京-上海-杭州');
INSERT INTO train VALUES('G14','杭州','北京',TIME_FORMAT('22:00:00','%H:%i:%s'),TIME_FORMAT('06:30:00','%H:%i:%s'),1500,TIME_FORMAT('08:30:00','%H:%i:%s'),'杭州-上海-南京-苏州-徐州-济南-天津-北京');
INSERT INTO train VALUES('D14','杭州','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('20:30:00','%H:%i:%s'),1500,TIME_FORMAT('08:30:00','%H:%i:%s'),'杭州-上海-南京-苏州-徐州-济南-天津-北京');
INSERT INTO train VALUES('T14','杭州','北京',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('16:30:00','%H:%i:%s'),1500,TIME_FORMAT('10:30:00','%H:%i:%s'),'杭州-上海-南京-苏州-徐州-济南-天津-北京');
INSERT INTO train VALUES('Z14','杭州','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('00:30:00','%H:%i:%s'),1500,TIME_FORMAT('12:30:00','%H:%i:%s'),'杭州-上海-南京-苏州-徐州-济南-天津-北京');
INSERT INTO train VALUES('K14','杭州','北京',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('22:30:00','%H:%i:%s'),1500,TIME_FORMAT('14:30:00','%H:%i:%s'),'杭州-上海-南京-苏州-徐州-济南-天津-北京');

INSERT INTO train VALUES('G15','北京','西安',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('20:30:00','%H:%i:%s'),1500,TIME_FORMAT('08:30:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-西安');
INSERT INTO train VALUES('D15','北京','西安',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('14:30:00','%H:%i:%s'),1500,TIME_FORMAT('08:30:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-西安');
INSERT INTO train VALUES('T15','北京','西安',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('22:30:00','%H:%i:%s'),1500,TIME_FORMAT('10:30:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-西安');
INSERT INTO train VALUES('Z15','北京','西安',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('20:30:00','%H:%i:%s'),1500,TIME_FORMAT('12:30:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-西安');
INSERT INTO train VALUES('K15','北京','西安',TIME_FORMAT('16:00:00','%H:%i:%s'),TIME_FORMAT('06:30:00','%H:%i:%s'),1500,TIME_FORMAT('14:30:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-西安');
INSERT INTO train VALUES('G16','西安','北京',TIME_FORMAT('22:00:00','%H:%i:%s'),TIME_FORMAT('06:30:00','%H:%i:%s'),1500,TIME_FORMAT('08:30:00','%H:%i:%s'),'西安-临汾-太原-邯郸-石家庄-北京');
INSERT INTO train VALUES('D16','西安','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('20:30:00','%H:%i:%s'),1500,TIME_FORMAT('08:30:00','%H:%i:%s'),'西安-临汾-太原-邯郸-石家庄-北京');
INSERT INTO train VALUES('T16','西安','北京',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('16:30:00','%H:%i:%s'),1500,TIME_FORMAT('10:30:00','%H:%i:%s'),'西安-临汾-太原-邯郸-石家庄-北京');
INSERT INTO train VALUES('Z16','西安','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('00:30:00','%H:%i:%s'),1500,TIME_FORMAT('12:30:00','%H:%i:%s'),'西安-临汾-太原-邯郸-石家庄-北京');
INSERT INTO train VALUES('K16','西安','北京',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('22:30:00','%H:%i:%s'),1500,TIME_FORMAT('14:30:00','%H:%i:%s'),'西安-临汾-太原-邯郸-石家庄-北京');

INSERT INTO train VALUES('G17','北京','成都',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('20:30:00','%H:%i:%s'),2000,TIME_FORMAT('08:30:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-西安-成都');
INSERT INTO train VALUES('D17','北京','成都',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('14:30:00','%H:%i:%s'),2000,TIME_FORMAT('08:30:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-西安-成都');
INSERT INTO train VALUES('T17','北京','成都',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('22:30:00','%H:%i:%s'),2000,TIME_FORMAT('10:30:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-西安-成都');
INSERT INTO train VALUES('Z17','北京','成都',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('20:30:00','%H:%i:%s'),2000,TIME_FORMAT('12:30:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-西安-成都');
INSERT INTO train VALUES('K17','北京','成都',TIME_FORMAT('16:00:00','%H:%i:%s'),TIME_FORMAT('06:30:00','%H:%i:%s'),2000,TIME_FORMAT('14:30:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-西安-成都');
INSERT INTO train VALUES('G18','成都','北京',TIME_FORMAT('22:00:00','%H:%i:%s'),TIME_FORMAT('06:30:00','%H:%i:%s'),2000,TIME_FORMAT('08:30:00','%H:%i:%s'),'成都-西安-临汾-太原-邯郸-石家庄-北京');
INSERT INTO train VALUES('D18','成都','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('20:30:00','%H:%i:%s'),2000,TIME_FORMAT('08:30:00','%H:%i:%s'),'成都-西安-临汾-太原-邯郸-石家庄-北京');
INSERT INTO train VALUES('T18','成都','北京',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('16:30:00','%H:%i:%s'),2000,TIME_FORMAT('10:30:00','%H:%i:%s'),'成都-西安-临汾-太原-邯郸-石家庄-北京');
INSERT INTO train VALUES('Z18','成都','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('00:30:00','%H:%i:%s'),2000,TIME_FORMAT('12:30:00','%H:%i:%s'),'成都-西安-临汾-太原-邯郸-石家庄-北京');
INSERT INTO train VALUES('K18','成都','北京',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('22:30:00','%H:%i:%s'),2000,TIME_FORMAT('14:30:00','%H:%i:%s'),'成都-西安-临汾-太原-邯郸-石家庄-北京');

INSERT INTO train VALUES('G19','北京','兰州',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('20:30:00','%H:%i:%s'),2000,TIME_FORMAT('08:30:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-西安-兰州');
INSERT INTO train VALUES('D19','北京','兰州',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('14:30:00','%H:%i:%s'),2000,TIME_FORMAT('08:30:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-西安-兰州');
INSERT INTO train VALUES('T19','北京','兰州',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('22:30:00','%H:%i:%s'),2000,TIME_FORMAT('10:30:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-西安-兰州');
INSERT INTO train VALUES('Z19','北京','兰州',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('20:30:00','%H:%i:%s'),2000,TIME_FORMAT('12:30:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-西安-兰州');
INSERT INTO train VALUES('K19','北京','兰州',TIME_FORMAT('16:00:00','%H:%i:%s'),TIME_FORMAT('06:30:00','%H:%i:%s'),2000,TIME_FORMAT('14:30:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-西安-兰州');
INSERT INTO train VALUES('G20','兰州','北京',TIME_FORMAT('22:00:00','%H:%i:%s'),TIME_FORMAT('06:30:00','%H:%i:%s'),2000,TIME_FORMAT('08:30:00','%H:%i:%s'),'兰州-西安-临汾-太原-邯郸-石家庄-北京');
INSERT INTO train VALUES('D20','兰州','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('20:30:00','%H:%i:%s'),2000,TIME_FORMAT('08:30:00','%H:%i:%s'),'兰州-西安-临汾-太原-邯郸-石家庄-北京');
INSERT INTO train VALUES('T20','兰州','北京',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('16:30:00','%H:%i:%s'),2000,TIME_FORMAT('10:30:00','%H:%i:%s'),'兰州-西安-临汾-太原-邯郸-石家庄-北京');
INSERT INTO train VALUES('Z20','兰州','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('00:30:00','%H:%i:%s'),2000,TIME_FORMAT('12:30:00','%H:%i:%s'),'兰州-西安-临汾-太原-邯郸-石家庄-北京');
INSERT INTO train VALUES('K20','兰州','北京',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('22:30:00','%H:%i:%s'),2000,TIME_FORMAT('14:30:00','%H:%i:%s'),'兰州-西安-临汾-太原-邯郸-石家庄-北京');

INSERT INTO train VALUES('G21','北京','郑州',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('18:30:00','%H:%i:%s'),700,TIME_FORMAT('06:30:00','%H:%i:%s'),'北京-石家庄-郑州');
INSERT INTO train VALUES('D21','北京','郑州',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('12:30:00','%H:%i:%s'),700,TIME_FORMAT('06:30:00','%H:%i:%s'),'北京-石家庄-郑州');
INSERT INTO train VALUES('T21','北京','郑州',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('19:30:00','%H:%i:%s'),700,TIME_FORMAT('07:30:00','%H:%i:%s'),'北京-石家庄-郑州');
INSERT INTO train VALUES('Z21','北京','郑州',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('15:30:00','%H:%i:%s'),700,TIME_FORMAT('07:30:00','%H:%i:%s'),'北京-石家庄-郑州');
INSERT INTO train VALUES('K21','北京','郑州',TIME_FORMAT('16:00:00','%H:%i:%s'),TIME_FORMAT('00:30:00','%H:%i:%s'),700,TIME_FORMAT('08:30:00','%H:%i:%s'),'北京-石家庄-郑州');
INSERT INTO train VALUES('G22','郑州','北京',TIME_FORMAT('22:00:00','%H:%i:%s'),TIME_FORMAT('04:30:00','%H:%i:%s'),700,TIME_FORMAT('06:30:00','%H:%i:%s'),'郑州-石家庄-北京');
INSERT INTO train VALUES('D22','郑州','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('18:30:00','%H:%i:%s'),700,TIME_FORMAT('06:30:00','%H:%i:%s'),'郑州-石家庄-北京');
INSERT INTO train VALUES('T22','郑州','北京',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('13:30:00','%H:%i:%s'),700,TIME_FORMAT('07:30:00','%H:%i:%s'),'郑州-石家庄-北京');
INSERT INTO train VALUES('Z22','郑州','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('19:30:00','%H:%i:%s'),700,TIME_FORMAT('07:30:00','%H:%i:%s'),'郑州-石家庄-北京');
INSERT INTO train VALUES('K22','郑州','北京',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('16:30:00','%H:%i:%s'),700,TIME_FORMAT('08:30:00','%H:%i:%s'),'郑州-石家庄-北京');

INSERT INTO train VALUES('G23','北京','武汉',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('18:30:00','%H:%i:%s'),800,TIME_FORMAT('06:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉');
INSERT INTO train VALUES('D23','北京','武汉',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('12:30:00','%H:%i:%s'),800,TIME_FORMAT('06:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉');
INSERT INTO train VALUES('T23','北京','武汉',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('19:30:00','%H:%i:%s'),800,TIME_FORMAT('07:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉');
INSERT INTO train VALUES('Z23','北京','武汉',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('15:30:00','%H:%i:%s'),800,TIME_FORMAT('07:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉');
INSERT INTO train VALUES('K23','北京','武汉',TIME_FORMAT('16:00:00','%H:%i:%s'),TIME_FORMAT('00:30:00','%H:%i:%s'),800,TIME_FORMAT('08:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉');
INSERT INTO train VALUES('G24','武汉','北京',TIME_FORMAT('22:00:00','%H:%i:%s'),TIME_FORMAT('04:30:00','%H:%i:%s'),800,TIME_FORMAT('06:30:00','%H:%i:%s'),'武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('D24','武汉','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('18:30:00','%H:%i:%s'),800,TIME_FORMAT('06:30:00','%H:%i:%s'),'武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('T24','武汉','北京',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('13:30:00','%H:%i:%s'),800,TIME_FORMAT('07:30:00','%H:%i:%s'),'武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('Z24','武汉','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('19:30:00','%H:%i:%s'),800,TIME_FORMAT('07:30:00','%H:%i:%s'),'武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('K24','武汉','北京',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('16:30:00','%H:%i:%s'),800,TIME_FORMAT('08:30:00','%H:%i:%s'),'武汉-郑州-石家庄-北京');

INSERT INTO train VALUES('G25','北京','长沙',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('19:30:00','%H:%i:%s'),1200,TIME_FORMAT('07:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙');
INSERT INTO train VALUES('D25','北京','长沙',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('13:30:00','%H:%i:%s'),1200,TIME_FORMAT('07:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙');
INSERT INTO train VALUES('T25','北京','长沙',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('20:30:00','%H:%i:%s'),1200,TIME_FORMAT('08:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙');
INSERT INTO train VALUES('Z25','北京','长沙',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('16:30:00','%H:%i:%s'),1200,TIME_FORMAT('08:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙');
INSERT INTO train VALUES('K25','北京','长沙',TIME_FORMAT('16:00:00','%H:%i:%s'),TIME_FORMAT('01:30:00','%H:%i:%s'),1200,TIME_FORMAT('09:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙');
INSERT INTO train VALUES('G26','长沙','北京',TIME_FORMAT('22:00:00','%H:%i:%s'),TIME_FORMAT('05:30:00','%H:%i:%s'),1200,TIME_FORMAT('07:30:00','%H:%i:%s'),'长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('D26','长沙','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('19:30:00','%H:%i:%s'),1200,TIME_FORMAT('07:30:00','%H:%i:%s'),'长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('T26','长沙','北京',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('14:30:00','%H:%i:%s'),1200,TIME_FORMAT('08:30:00','%H:%i:%s'),'长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('Z26','长沙','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('20:30:00','%H:%i:%s'),1200,TIME_FORMAT('08:30:00','%H:%i:%s'),'长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('K26','长沙','北京',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('17:30:00','%H:%i:%s'),1200,TIME_FORMAT('09:30:00','%H:%i:%s'),'长沙-武汉-郑州-石家庄-北京');

INSERT INTO train VALUES('G27','北京','南昌',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('19:30:00','%H:%i:%s'),1200,TIME_FORMAT('07:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-南昌');
INSERT INTO train VALUES('D27','北京','南昌',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('13:30:00','%H:%i:%s'),1200,TIME_FORMAT('07:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-南昌');
INSERT INTO train VALUES('T27','北京','南昌',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('20:30:00','%H:%i:%s'),1200,TIME_FORMAT('08:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-南昌');
INSERT INTO train VALUES('Z27','北京','南昌',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('16:30:00','%H:%i:%s'),1200,TIME_FORMAT('08:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-南昌');
INSERT INTO train VALUES('K27','北京','南昌',TIME_FORMAT('16:00:00','%H:%i:%s'),TIME_FORMAT('01:30:00','%H:%i:%s'),1200,TIME_FORMAT('09:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-南昌');
INSERT INTO train VALUES('G28','南昌','北京',TIME_FORMAT('22:00:00','%H:%i:%s'),TIME_FORMAT('05:30:00','%H:%i:%s'),1200,TIME_FORMAT('07:30:00','%H:%i:%s'),'南昌-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('D28','南昌','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('19:30:00','%H:%i:%s'),1200,TIME_FORMAT('07:30:00','%H:%i:%s'),'南昌-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('T28','南昌','北京',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('14:30:00','%H:%i:%s'),1200,TIME_FORMAT('08:30:00','%H:%i:%s'),'南昌-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('Z28','南昌','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('20:30:00','%H:%i:%s'),1200,TIME_FORMAT('08:30:00','%H:%i:%s'),'南昌-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('K28','南昌','北京',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('17:30:00','%H:%i:%s'),1200,TIME_FORMAT('09:30:00','%H:%i:%s'),'南昌-武汉-郑州-石家庄-北京');

INSERT INTO train VALUES('G29','北京','合肥',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('19:30:00','%H:%i:%s'),1200,TIME_FORMAT('07:30:00','%H:%i:%s'),'北京-石家庄-郑州-合肥');
INSERT INTO train VALUES('D29','北京','合肥',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('13:30:00','%H:%i:%s'),1200,TIME_FORMAT('07:30:00','%H:%i:%s'),'北京-石家庄-郑州-合肥');
INSERT INTO train VALUES('T29','北京','合肥',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('20:30:00','%H:%i:%s'),1200,TIME_FORMAT('08:30:00','%H:%i:%s'),'北京-石家庄-郑州-合肥');
INSERT INTO train VALUES('Z29','北京','合肥',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('16:30:00','%H:%i:%s'),1200,TIME_FORMAT('08:30:00','%H:%i:%s'),'北京-石家庄-郑州-合肥');
INSERT INTO train VALUES('K29','北京','合肥',TIME_FORMAT('16:00:00','%H:%i:%s'),TIME_FORMAT('01:30:00','%H:%i:%s'),1200,TIME_FORMAT('09:30:00','%H:%i:%s'),'北京-石家庄-郑州-合肥');
INSERT INTO train VALUES('G30','合肥','北京',TIME_FORMAT('22:00:00','%H:%i:%s'),TIME_FORMAT('05:30:00','%H:%i:%s'),1200,TIME_FORMAT('07:30:00','%H:%i:%s'),'合肥-郑州-石家庄-北京');
INSERT INTO train VALUES('D30','合肥','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('19:30:00','%H:%i:%s'),1200,TIME_FORMAT('07:30:00','%H:%i:%s'),'合肥-郑州-石家庄-北京');
INSERT INTO train VALUES('T30','合肥','北京',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('14:30:00','%H:%i:%s'),1200,TIME_FORMAT('08:30:00','%H:%i:%s'),'合肥-郑州-石家庄-北京');
INSERT INTO train VALUES('Z30','合肥','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('20:30:00','%H:%i:%s'),1200,TIME_FORMAT('08:30:00','%H:%i:%s'),'合肥-郑州-石家庄-北京');
INSERT INTO train VALUES('K30','合肥','北京',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('17:30:00','%H:%i:%s'),1200,TIME_FORMAT('09:30:00','%H:%i:%s'),'合肥-郑州-石家庄-北京');

INSERT INTO train VALUES('G31','北京','南宁',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('03:00:00','%H:%i:%s'),1200,TIME_FORMAT('15:00:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-郴州-柳州-南宁');
INSERT INTO train VALUES('D31','北京','南宁',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('21:00:00','%H:%i:%s'),1200,TIME_FORMAT('15:00:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-郴州-柳州-南宁');
INSERT INTO train VALUES('T31','北京','南宁',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('06:30:00','%H:%i:%s'),1200,TIME_FORMAT('18:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-郴州-柳州-南宁');
INSERT INTO train VALUES('Z31','北京','南宁',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('02:30:00','%H:%i:%s'),1200,TIME_FORMAT('18:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-郴州-柳州-南宁');
INSERT INTO train VALUES('K31','北京','南宁',TIME_FORMAT('16:00:00','%H:%i:%s'),TIME_FORMAT('12:30:00','%H:%i:%s'),1200,TIME_FORMAT('20:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-郴州-柳州-南宁');
INSERT INTO train VALUES('G32','南宁','北京',TIME_FORMAT('22:00:00','%H:%i:%s'),TIME_FORMAT('13:00:00','%H:%i:%s'),1200,TIME_FORMAT('15:00:00','%H:%i:%s'),'南宁-柳州-郴州-长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('D32','南宁','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('03:00:00','%H:%i:%s'),1200,TIME_FORMAT('15:00:00','%H:%i:%s'),'南宁-柳州-郴州-长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('T32','南宁','北京',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('00:30:00','%H:%i:%s'),1200,TIME_FORMAT('18:30:00','%H:%i:%s'),'南宁-柳州-郴州-长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('Z32','南宁','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('06:30:00','%H:%i:%s'),1200,TIME_FORMAT('18:30:00','%H:%i:%s'),'南宁-柳州-郴州-长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('K32','南宁','北京',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('04:30:00','%H:%i:%s'),1200,TIME_FORMAT('20:30:00','%H:%i:%s'),'南宁-柳州-郴州-长沙-武汉-郑州-石家庄-北京');

INSERT INTO train VALUES('G33','北京','福州',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('03:00:00','%H:%i:%s'),2800,TIME_FORMAT('15:00:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-南昌-鹰潭-三明-福州');
INSERT INTO train VALUES('D33','北京','福州',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('21:00:00','%H:%i:%s'),2800,TIME_FORMAT('15:00:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-南昌-鹰潭-三明-福州');
INSERT INTO train VALUES('T33','北京','福州',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('06:30:00','%H:%i:%s'),2800,TIME_FORMAT('18:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-南昌-鹰潭-三明-福州');
INSERT INTO train VALUES('Z33','北京','福州',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('02:30:00','%H:%i:%s'),2800,TIME_FORMAT('18:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-南昌-鹰潭-三明-福州');
INSERT INTO train VALUES('K33','北京','福州',TIME_FORMAT('16:00:00','%H:%i:%s'),TIME_FORMAT('12:30:00','%H:%i:%s'),2800,TIME_FORMAT('20:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-南昌-鹰潭-三明-福州');
INSERT INTO train VALUES('G34','福州','北京',TIME_FORMAT('22:00:00','%H:%i:%s'),TIME_FORMAT('13:00:00','%H:%i:%s'),2800,TIME_FORMAT('15:00:00','%H:%i:%s'),'福州-三明-鹰潭-南昌-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('D34','福州','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('03:00:00','%H:%i:%s'),2800,TIME_FORMAT('15:00:00','%H:%i:%s'),'福州-三明-鹰潭-南昌-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('T34','福州','北京',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('00:30:00','%H:%i:%s'),2800,TIME_FORMAT('18:30:00','%H:%i:%s'),'福州-三明-鹰潭-南昌-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('Z34','福州','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('06:30:00','%H:%i:%s'),2800,TIME_FORMAT('18:30:00','%H:%i:%s'),'福州-三明-鹰潭-南昌-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('K34','福州','北京',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('04:30:00','%H:%i:%s'),2800,TIME_FORMAT('20:30:00','%H:%i:%s'),'福州-三明-鹰潭-南昌-武汉-郑州-石家庄-北京');

INSERT INTO train VALUES('G35','北京','重庆',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('03:00:00','%H:%i:%s'),2800,TIME_FORMAT('15:00:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-贵阳-重庆');
INSERT INTO train VALUES('D35','北京','重庆',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('21:00:00','%H:%i:%s'),2800,TIME_FORMAT('15:00:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-贵阳-重庆');
INSERT INTO train VALUES('T35','北京','重庆',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('06:30:00','%H:%i:%s'),2800,TIME_FORMAT('18:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-贵阳-重庆');
INSERT INTO train VALUES('Z35','北京','重庆',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('02:30:00','%H:%i:%s'),2800,TIME_FORMAT('18:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-贵阳-重庆');
INSERT INTO train VALUES('K35','北京','重庆',TIME_FORMAT('16:00:00','%H:%i:%s'),TIME_FORMAT('12:30:00','%H:%i:%s'),2800,TIME_FORMAT('20:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-贵阳-重庆');
INSERT INTO train VALUES('G36','重庆','北京',TIME_FORMAT('22:00:00','%H:%i:%s'),TIME_FORMAT('13:00:00','%H:%i:%s'),2800,TIME_FORMAT('15:00:00','%H:%i:%s'),'重庆-贵阳-长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('D36','重庆','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('03:00:00','%H:%i:%s'),2800,TIME_FORMAT('15:00:00','%H:%i:%s'),'重庆-贵阳-长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('T36','重庆','北京',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('00:30:00','%H:%i:%s'),2800,TIME_FORMAT('18:30:00','%H:%i:%s'),'重庆-贵阳-长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('Z36','重庆','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('06:30:00','%H:%i:%s'),2800,TIME_FORMAT('18:30:00','%H:%i:%s'),'重庆-贵阳-长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('K36','重庆','北京',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('04:30:00','%H:%i:%s'),2800,TIME_FORMAT('20:30:00','%H:%i:%s'),'重庆-贵阳-长沙-武汉-郑州-石家庄-北京');

INSERT INTO train VALUES('G37','北京','贵阳',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('03:00:00','%H:%i:%s'),2800,TIME_FORMAT('15:00:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-贵阳');
INSERT INTO train VALUES('D37','北京','贵阳',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('21:00:00','%H:%i:%s'),2800,TIME_FORMAT('15:00:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-贵阳');
INSERT INTO train VALUES('T37','北京','贵阳',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('06:30:00','%H:%i:%s'),2800,TIME_FORMAT('18:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-贵阳');
INSERT INTO train VALUES('Z37','北京','贵阳',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('02:30:00','%H:%i:%s'),2800,TIME_FORMAT('18:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-贵阳');
INSERT INTO train VALUES('K37','北京','贵阳',TIME_FORMAT('16:00:00','%H:%i:%s'),TIME_FORMAT('12:30:00','%H:%i:%s'),2800,TIME_FORMAT('20:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-贵阳');
INSERT INTO train VALUES('G38','贵阳','北京',TIME_FORMAT('22:00:00','%H:%i:%s'),TIME_FORMAT('13:00:00','%H:%i:%s'),2800,TIME_FORMAT('15:00:00','%H:%i:%s'),'贵阳-长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('D38','贵阳','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('03:00:00','%H:%i:%s'),2800,TIME_FORMAT('15:00:00','%H:%i:%s'),'贵阳-长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('T38','贵阳','北京',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('00:30:00','%H:%i:%s'),2800,TIME_FORMAT('18:30:00','%H:%i:%s'),'贵阳-长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('Z38','贵阳','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('06:30:00','%H:%i:%s'),2800,TIME_FORMAT('18:30:00','%H:%i:%s'),'贵阳-长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('K38','贵阳','北京',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('04:30:00','%H:%i:%s'),2800,TIME_FORMAT('20:30:00','%H:%i:%s'),'贵阳-长沙-武汉-郑州-石家庄-北京');

INSERT INTO train VALUES('G39','北京','昆明',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('03:00:00','%H:%i:%s'),3500,TIME_FORMAT('15:00:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-贵阳-昆明');
INSERT INTO train VALUES('D39','北京','昆明',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('21:00:00','%H:%i:%s'),3500,TIME_FORMAT('15:00:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-贵阳-昆明');
INSERT INTO train VALUES('T39','北京','昆明',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('06:30:00','%H:%i:%s'),3500,TIME_FORMAT('18:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-贵阳-昆明');
INSERT INTO train VALUES('Z39','北京','昆明',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('02:30:00','%H:%i:%s'),3500,TIME_FORMAT('18:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-贵阳-昆明');
INSERT INTO train VALUES('K39','北京','昆明',TIME_FORMAT('16:00:00','%H:%i:%s'),TIME_FORMAT('12:30:00','%H:%i:%s'),3500,TIME_FORMAT('20:30:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-贵阳-昆明');
INSERT INTO train VALUES('G40','昆明','北京',TIME_FORMAT('22:00:00','%H:%i:%s'),TIME_FORMAT('13:00:00','%H:%i:%s'),3500,TIME_FORMAT('15:00:00','%H:%i:%s'),'昆明-贵阳-长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('D40','昆明','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('03:00:00','%H:%i:%s'),3500,TIME_FORMAT('15:00:00','%H:%i:%s'),'昆明-贵阳-长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('T40','昆明','北京',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('00:30:00','%H:%i:%s'),3500,TIME_FORMAT('18:30:00','%H:%i:%s'),'昆明-贵阳-长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('Z40','昆明','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('06:30:00','%H:%i:%s'),3500,TIME_FORMAT('18:30:00','%H:%i:%s'),'昆明-贵阳-长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('K40','昆明','北京',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('04:30:00','%H:%i:%s'),3500,TIME_FORMAT('20:30:00','%H:%i:%s'),'昆明-贵阳-长沙-武汉-郑州-石家庄-北京');

INSERT INTO train VALUES('G41','北京','太原',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('15:30:00','%H:%i:%s'),700,TIME_FORMAT('03:30:00','%H:%i:%s'),'北京-石家庄-大同-太原');
INSERT INTO train VALUES('D41','北京','太原',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('09:30:00','%H:%i:%s'),700,TIME_FORMAT('03:30:00','%H:%i:%s'),'北京-石家庄-大同-太原');
INSERT INTO train VALUES('T41','北京','太原',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('16:30:00','%H:%i:%s'),700,TIME_FORMAT('04:30:00','%H:%i:%s'),'北京-石家庄-大同-太原');
INSERT INTO train VALUES('Z41','北京','太原',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('12:30:00','%H:%i:%s'),700,TIME_FORMAT('04:30:00','%H:%i:%s'),'北京-石家庄-大同-太原');
INSERT INTO train VALUES('K41','北京','太原',TIME_FORMAT('16:00:00','%H:%i:%s'),TIME_FORMAT('21:30:00','%H:%i:%s'),700,TIME_FORMAT('05:30:00','%H:%i:%s'),'北京-石家庄-大同-太原');
INSERT INTO train VALUES('G42','太原','北京',TIME_FORMAT('22:00:00','%H:%i:%s'),TIME_FORMAT('01:30:00','%H:%i:%s'),700,TIME_FORMAT('03:30:00','%H:%i:%s'),'太原-大同-石家庄-北京');
INSERT INTO train VALUES('D42','太原','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('15:30:00','%H:%i:%s'),700,TIME_FORMAT('03:30:00','%H:%i:%s'),'太原-大同-石家庄-北京');
INSERT INTO train VALUES('T42','太原','北京',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('10:30:00','%H:%i:%s'),700,TIME_FORMAT('04:30:00','%H:%i:%s'),'太原-大同-石家庄-北京');
INSERT INTO train VALUES('Z42','太原','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('16:30:00','%H:%i:%s'),700,TIME_FORMAT('04:30:00','%H:%i:%s'),'太原-大同-石家庄-北京');
INSERT INTO train VALUES('K42','太原','北京',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('13:30:00','%H:%i:%s'),700,TIME_FORMAT('05:30:00','%H:%i:%s'),'太原-大同-石家庄-北京');

INSERT INTO train VALUES('G43','北京','沈阳',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('17:30:00','%H:%i:%s'),1000,TIME_FORMAT('05:30:00','%H:%i:%s'),'北京-承德-锦州-沈阳');
INSERT INTO train VALUES('D43','北京','沈阳',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('11:30:00','%H:%i:%s'),1000,TIME_FORMAT('05:30:00','%H:%i:%s'),'北京-承德-锦州-沈阳');
INSERT INTO train VALUES('T43','北京','沈阳',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('18:30:00','%H:%i:%s'),1000,TIME_FORMAT('06:30:00','%H:%i:%s'),'北京-承德-锦州-沈阳');
INSERT INTO train VALUES('Z43','北京','沈阳',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('14:30:00','%H:%i:%s'),1000,TIME_FORMAT('06:30:00','%H:%i:%s'),'北京-承德-锦州-沈阳');
INSERT INTO train VALUES('K43','北京','沈阳',TIME_FORMAT('16:00:00','%H:%i:%s'),TIME_FORMAT('23:30:00','%H:%i:%s'),1000,TIME_FORMAT('07:30:00','%H:%i:%s'),'北京-承德-锦州-沈阳');
INSERT INTO train VALUES('G44','沈阳','北京',TIME_FORMAT('22:00:00','%H:%i:%s'),TIME_FORMAT('03:30:00','%H:%i:%s'),1000,TIME_FORMAT('05:30:00','%H:%i:%s'),'沈阳-锦州-承德-北京');
INSERT INTO train VALUES('D44','沈阳','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('17:30:00','%H:%i:%s'),1000,TIME_FORMAT('05:30:00','%H:%i:%s'),'沈阳-锦州-承德-北京');
INSERT INTO train VALUES('T44','沈阳','北京',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('12:30:00','%H:%i:%s'),1000,TIME_FORMAT('06:30:00','%H:%i:%s'),'沈阳-锦州-承德-北京');
INSERT INTO train VALUES('Z44','沈阳','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('18:30:00','%H:%i:%s'),1000,TIME_FORMAT('06:30:00','%H:%i:%s'),'沈阳-锦州-承德-北京');
INSERT INTO train VALUES('K44','沈阳','北京',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('15:30:00','%H:%i:%s'),1000,TIME_FORMAT('07:30:00','%H:%i:%s'),'沈阳-锦州-承德-北京');

INSERT INTO train VALUES('G45','北京','长春',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('17:30:00','%H:%i:%s'),1400,TIME_FORMAT('05:30:00','%H:%i:%s'),'北京-承德-锦州-沈阳-长春');
INSERT INTO train VALUES('D45','北京','长春',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('11:30:00','%H:%i:%s'),1400,TIME_FORMAT('05:30:00','%H:%i:%s'),'北京-承德-锦州-沈阳-长春');
INSERT INTO train VALUES('T45','北京','长春',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('18:30:00','%H:%i:%s'),1400,TIME_FORMAT('06:30:00','%H:%i:%s'),'北京-承德-锦州-沈阳-长春');
INSERT INTO train VALUES('Z45','北京','长春',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('14:30:00','%H:%i:%s'),1400,TIME_FORMAT('06:30:00','%H:%i:%s'),'北京-承德-锦州-沈阳-长春');
INSERT INTO train VALUES('K45','北京','长春',TIME_FORMAT('16:00:00','%H:%i:%s'),TIME_FORMAT('23:30:00','%H:%i:%s'),1400,TIME_FORMAT('07:30:00','%H:%i:%s'),'北京-承德-锦州-沈阳-长春');
INSERT INTO train VALUES('G46','长春','北京',TIME_FORMAT('22:00:00','%H:%i:%s'),TIME_FORMAT('03:30:00','%H:%i:%s'),1400,TIME_FORMAT('05:30:00','%H:%i:%s'),'长春-沈阳-锦州-承德-北京');
INSERT INTO train VALUES('D46','长春','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('17:30:00','%H:%i:%s'),1400,TIME_FORMAT('05:30:00','%H:%i:%s'),'长春-沈阳-锦州-承德-北京');
INSERT INTO train VALUES('T46','长春','北京',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('12:30:00','%H:%i:%s'),1400,TIME_FORMAT('06:30:00','%H:%i:%s'),'长春-沈阳-锦州-承德-北京');
INSERT INTO train VALUES('Z46','长春','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('18:30:00','%H:%i:%s'),1400,TIME_FORMAT('06:30:00','%H:%i:%s'),'长春-沈阳-锦州-承德-北京');
INSERT INTO train VALUES('K46','长春','北京',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('15:30:00','%H:%i:%s'),1400,TIME_FORMAT('07:30:00','%H:%i:%s'),'长春-沈阳-锦州-承德-北京');

INSERT INTO train VALUES('G47','北京','哈尔滨',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('20:30:00','%H:%i:%s'),1600,TIME_FORMAT('08:30:00','%H:%i:%s'),'北京-承德-锦州-沈阳-长春-哈尔滨');
INSERT INTO train VALUES('D47','北京','哈尔滨',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('14:30:00','%H:%i:%s'),1600,TIME_FORMAT('08:30:00','%H:%i:%s'),'北京-承德-锦州-沈阳-长春-哈尔滨');
INSERT INTO train VALUES('T47','北京','哈尔滨',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('21:30:00','%H:%i:%s'),1600,TIME_FORMAT('09:30:00','%H:%i:%s'),'北京-承德-锦州-沈阳-长春-哈尔滨');
INSERT INTO train VALUES('Z47','北京','哈尔滨',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('17:30:00','%H:%i:%s'),1600,TIME_FORMAT('09:30:00','%H:%i:%s'),'北京-承德-锦州-沈阳-长春-哈尔滨');
INSERT INTO train VALUES('K47','北京','哈尔滨',TIME_FORMAT('16:00:00','%H:%i:%s'),TIME_FORMAT('02:30:00','%H:%i:%s'),1600,TIME_FORMAT('10:30:00','%H:%i:%s'),'北京-承德-锦州-沈阳-长春-哈尔滨');
INSERT INTO train VALUES('G48','哈尔滨','北京',TIME_FORMAT('22:00:00','%H:%i:%s'),TIME_FORMAT('06:30:00','%H:%i:%s'),1600,TIME_FORMAT('08:30:00','%H:%i:%s'),'哈尔滨-长春-沈阳-锦州-承德-北京');
INSERT INTO train VALUES('D48','哈尔滨','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('20:30:00','%H:%i:%s'),1600,TIME_FORMAT('08:30:00','%H:%i:%s'),'哈尔滨-长春-沈阳-锦州-承德-北京');
INSERT INTO train VALUES('T48','哈尔滨','北京',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('15:30:00','%H:%i:%s'),1600,TIME_FORMAT('09:30:00','%H:%i:%s'),'哈尔滨-长春-沈阳-锦州-承德-北京');
INSERT INTO train VALUES('Z48','哈尔滨','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('21:30:00','%H:%i:%s'),1600,TIME_FORMAT('09:30:00','%H:%i:%s'),'哈尔滨-长春-沈阳-锦州-承德-北京');
INSERT INTO train VALUES('K48','哈尔滨','北京',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('18:30:00','%H:%i:%s'),1600,TIME_FORMAT('10:30:00','%H:%i:%s'),'哈尔滨-长春-沈阳-锦州-承德-北京');

INSERT INTO train VALUES('G49','北京','呼和浩特',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('20:30:00','%H:%i:%s'),1600,TIME_FORMAT('08:30:00','%H:%i:%s'),'北京-张家口-呼和浩特');
INSERT INTO train VALUES('D49','北京','呼和浩特',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('14:30:00','%H:%i:%s'),1600,TIME_FORMAT('08:30:00','%H:%i:%s'),'北京-张家口-呼和浩特');
INSERT INTO train VALUES('T49','北京','呼和浩特',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('21:30:00','%H:%i:%s'),1600,TIME_FORMAT('09:30:00','%H:%i:%s'),'北京-张家口-呼和浩特');
INSERT INTO train VALUES('Z49','北京','呼和浩特',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('17:30:00','%H:%i:%s'),1600,TIME_FORMAT('09:30:00','%H:%i:%s'),'北京-张家口-呼和浩特');
INSERT INTO train VALUES('K49','北京','呼和浩特',TIME_FORMAT('16:00:00','%H:%i:%s'),TIME_FORMAT('02:30:00','%H:%i:%s'),1600,TIME_FORMAT('10:30:00','%H:%i:%s'),'北京-张家口-呼和浩特');
INSERT INTO train VALUES('G50','呼和浩特','北京',TIME_FORMAT('22:00:00','%H:%i:%s'),TIME_FORMAT('06:30:00','%H:%i:%s'),1600,TIME_FORMAT('08:30:00','%H:%i:%s'),'呼和浩特-张家口-北京');
INSERT INTO train VALUES('D50','呼和浩特','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('20:30:00','%H:%i:%s'),1600,TIME_FORMAT('08:30:00','%H:%i:%s'),'呼和浩特-张家口-北京');
INSERT INTO train VALUES('T50','呼和浩特','北京',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('15:30:00','%H:%i:%s'),1600,TIME_FORMAT('09:30:00','%H:%i:%s'),'呼和浩特-张家口-北京');
INSERT INTO train VALUES('Z50','呼和浩特','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('21:30:00','%H:%i:%s'),1600,TIME_FORMAT('09:30:00','%H:%i:%s'),'呼和浩特-张家口-北京');
INSERT INTO train VALUES('K50','呼和浩特','北京',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('18:30:00','%H:%i:%s'),1600,TIME_FORMAT('10:30:00','%H:%i:%s'),'呼和浩特-张家口-北京');

INSERT INTO train VALUES('G51','北京','银川',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('20:30:00','%H:%i:%s'),1500,TIME_FORMAT('08:30:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-银川');
INSERT INTO train VALUES('D51','北京','银川',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('14:30:00','%H:%i:%s'),1500,TIME_FORMAT('08:30:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-银川');
INSERT INTO train VALUES('T51','北京','银川',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('22:30:00','%H:%i:%s'),1500,TIME_FORMAT('10:30:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-银川');
INSERT INTO train VALUES('Z51','北京','银川',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('20:30:00','%H:%i:%s'),1500,TIME_FORMAT('12:30:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-银川');
INSERT INTO train VALUES('K51','北京','银川',TIME_FORMAT('16:00:00','%H:%i:%s'),TIME_FORMAT('06:30:00','%H:%i:%s'),1500,TIME_FORMAT('14:30:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-银川');
INSERT INTO train VALUES('G52','银川','北京',TIME_FORMAT('22:00:00','%H:%i:%s'),TIME_FORMAT('06:30:00','%H:%i:%s'),1500,TIME_FORMAT('08:30:00','%H:%i:%s'),'银川-临汾-太原-邯郸-石家庄-北京');
INSERT INTO train VALUES('D52','银川','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('20:30:00','%H:%i:%s'),1500,TIME_FORMAT('08:30:00','%H:%i:%s'),'银川-临汾-太原-邯郸-石家庄-北京');
INSERT INTO train VALUES('T52','银川','北京',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('16:30:00','%H:%i:%s'),1500,TIME_FORMAT('10:30:00','%H:%i:%s'),'银川-临汾-太原-邯郸-石家庄-北京');
INSERT INTO train VALUES('Z52','银川','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('00:30:00','%H:%i:%s'),1500,TIME_FORMAT('12:30:00','%H:%i:%s'),'银川-临汾-太原-邯郸-石家庄-北京');
INSERT INTO train VALUES('K52','银川','北京',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('22:30:00','%H:%i:%s'),1500,TIME_FORMAT('14:30:00','%H:%i:%s'),'银川-临汾-太原-邯郸-石家庄-北京');

INSERT INTO train VALUES('G53','北京','西宁',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('22:00:00','%H:%i:%s'),2500,TIME_FORMAT('10:00:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-西安-兰州-西宁');
INSERT INTO train VALUES('D53','北京','西宁',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('16:00:00','%H:%i:%s'),2500,TIME_FORMAT('10:00:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-西安-兰州-西宁');
INSERT INTO train VALUES('T53','北京','西宁',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('23:00:00','%H:%i:%s'),2500,TIME_FORMAT('11:00:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-西安-兰州-西宁');
INSERT INTO train VALUES('Z53','北京','西宁',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('19:00:00','%H:%i:%s'),2500,TIME_FORMAT('11:00:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-西安-兰州-西宁');
INSERT INTO train VALUES('K53','北京','西宁',TIME_FORMAT('16:00:00','%H:%i:%s'),TIME_FORMAT('06:00:00','%H:%i:%s'),2500,TIME_FORMAT('14:00:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-西安-兰州-西宁');
INSERT INTO train VALUES('G54','西宁','北京',TIME_FORMAT('22:00:00','%H:%i:%s'),TIME_FORMAT('08:00:00','%H:%i:%s'),2500,TIME_FORMAT('10:00:00','%H:%i:%s'),'西宁-兰州-西安-临汾-太原-邯郸-石家庄-北京');
INSERT INTO train VALUES('D54','西宁','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('22:00:00','%H:%i:%s'),2500,TIME_FORMAT('10:00:00','%H:%i:%s'),'西宁-兰州-西安-临汾-太原-邯郸-石家庄-北京');
INSERT INTO train VALUES('T54','西宁','北京',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('17:00:00','%H:%i:%s'),2500,TIME_FORMAT('11:00:00','%H:%i:%s'),'西宁-兰州-西安-临汾-太原-邯郸-石家庄-北京');
INSERT INTO train VALUES('Z54','西宁','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('23:00:00','%H:%i:%s'),2500,TIME_FORMAT('11:00:00','%H:%i:%s'),'西宁-兰州-西安-临汾-太原-邯郸-石家庄-北京');
INSERT INTO train VALUES('K54','西宁','北京',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('22:00:00','%H:%i:%s'),2500,TIME_FORMAT('14:00:00','%H:%i:%s'),'西宁-兰州-西安-临汾-太原-邯郸-石家庄-北京');

INSERT INTO train VALUES('G55','北京','拉萨',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('22:00:00','%H:%i:%s'),2800,TIME_FORMAT('10:00:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-西安-兰州-西宁-拉萨');
INSERT INTO train VALUES('D55','北京','拉萨',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('16:00:00','%H:%i:%s'),2800,TIME_FORMAT('10:00:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-西安-兰州-西宁-拉萨');
INSERT INTO train VALUES('T55','北京','拉萨',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('23:00:00','%H:%i:%s'),2800,TIME_FORMAT('11:00:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-西安-兰州-西宁-拉萨');
INSERT INTO train VALUES('Z55','北京','拉萨',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('19:00:00','%H:%i:%s'),2800,TIME_FORMAT('11:00:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-西安-兰州-西宁-拉萨');
INSERT INTO train VALUES('K55','北京','拉萨',TIME_FORMAT('16:00:00','%H:%i:%s'),TIME_FORMAT('06:00:00','%H:%i:%s'),2800,TIME_FORMAT('14:00:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-西安-兰州-西宁-拉萨');
INSERT INTO train VALUES('G56','拉萨','北京',TIME_FORMAT('22:00:00','%H:%i:%s'),TIME_FORMAT('08:00:00','%H:%i:%s'),2800,TIME_FORMAT('10:00:00','%H:%i:%s'),'拉萨-西宁-兰州-西安-临汾-太原-邯郸-石家庄-北京');
INSERT INTO train VALUES('D56','拉萨','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('22:00:00','%H:%i:%s'),2800,TIME_FORMAT('10:00:00','%H:%i:%s'),'拉萨-西宁-兰州-西安-临汾-太原-邯郸-石家庄-北京');
INSERT INTO train VALUES('T56','拉萨','北京',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('17:00:00','%H:%i:%s'),2800,TIME_FORMAT('11:00:00','%H:%i:%s'),'拉萨-西宁-兰州-西安-临汾-太原-邯郸-石家庄-北京');
INSERT INTO train VALUES('Z56','拉萨','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('23:00:00','%H:%i:%s'),2800,TIME_FORMAT('11:00:00','%H:%i:%s'),'拉萨-西宁-兰州-西安-临汾-太原-邯郸-石家庄-北京');
INSERT INTO train VALUES('K56','拉萨','北京',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('22:00:00','%H:%i:%s'),2800,TIME_FORMAT('14:00:00','%H:%i:%s'),'拉萨-西宁-兰州-西安-临汾-太原-邯郸-石家庄-北京');

INSERT INTO train VALUES('G57','北京','乌鲁木齐',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('00:00:00','%H:%i:%s'),3500,TIME_FORMAT('12:00:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-西安-兰州-乌鲁木齐');
INSERT INTO train VALUES('D57','北京','乌鲁木齐',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('18:00:00','%H:%i:%s'),3500,TIME_FORMAT('12:00:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-西安-兰州-乌鲁木齐');
INSERT INTO train VALUES('T57','北京','乌鲁木齐',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('02:00:00','%H:%i:%s'),3500,TIME_FORMAT('14:00:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-西安-兰州-乌鲁木齐');
INSERT INTO train VALUES('Z57','北京','乌鲁木齐',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('22:00:00','%H:%i:%s'),3500,TIME_FORMAT('14:00:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-西安-兰州-乌鲁木齐');
INSERT INTO train VALUES('K57','北京','乌鲁木齐',TIME_FORMAT('16:00:00','%H:%i:%s'),TIME_FORMAT('10:00:00','%H:%i:%s'),3500,TIME_FORMAT('18:00:00','%H:%i:%s'),'北京-石家庄-邯郸-太原-临汾-西安-兰州-乌鲁木齐');
INSERT INTO train VALUES('G58','乌鲁木齐','北京',TIME_FORMAT('22:00:00','%H:%i:%s'),TIME_FORMAT('10:00:00','%H:%i:%s'),3500,TIME_FORMAT('12:00:00','%H:%i:%s'),'乌鲁木齐-兰州-西安-临汾-太原-邯郸-石家庄-北京');
INSERT INTO train VALUES('D58','乌鲁木齐','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('00:00:00','%H:%i:%s'),3500,TIME_FORMAT('12:00:00','%H:%i:%s'),'乌鲁木齐-兰州-西安-临汾-太原-邯郸-石家庄-北京');
INSERT INTO train VALUES('T58','乌鲁木齐','北京',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('20:00:00','%H:%i:%s'),3500,TIME_FORMAT('14:00:00','%H:%i:%s'),'乌鲁木齐-兰州-西安-临汾-太原-邯郸-石家庄-北京');
INSERT INTO train VALUES('Z58','乌鲁木齐','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('16:00:00','%H:%i:%s'),3500,TIME_FORMAT('14:00:00','%H:%i:%s'),'乌鲁木齐-兰州-西安-临汾-太原-邯郸-石家庄-北京');
INSERT INTO train VALUES('K58','乌鲁木齐','北京',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('02:00:00','%H:%i:%s'),3500,TIME_FORMAT('18:00:00','%H:%i:%s'),'乌鲁木齐-兰州-西安-临汾-太原-邯郸-石家庄-北京');

INSERT INTO train VALUES('G59','北京','石家庄',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('14:00:00','%H:%i:%s'),400,TIME_FORMAT('02:00:00','%H:%i:%s'),'北京-石家庄');
INSERT INTO train VALUES('D59','北京','石家庄',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('08:00:00','%H:%i:%s'),400,TIME_FORMAT('02:00:00','%H:%i:%s'),'北京-石家庄');
INSERT INTO train VALUES('T59','北京','石家庄',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('15:00:00','%H:%i:%s'),400,TIME_FORMAT('03:00:00','%H:%i:%s'),'北京-石家庄');
INSERT INTO train VALUES('Z59','北京','石家庄',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('11:00:00','%H:%i:%s'),400,TIME_FORMAT('03:00:00','%H:%i:%s'),'北京-石家庄');
INSERT INTO train VALUES('K59','北京','石家庄',TIME_FORMAT('16:00:00','%H:%i:%s'),TIME_FORMAT('20:00:00','%H:%i:%s'),400,TIME_FORMAT('04:00:00','%H:%i:%s'),'北京-石家庄');
INSERT INTO train VALUES('G60','石家庄','北京',TIME_FORMAT('22:00:00','%H:%i:%s'),TIME_FORMAT('00:00:00','%H:%i:%s'),400,TIME_FORMAT('02:00:00','%H:%i:%s'),'石家庄-北京');
INSERT INTO train VALUES('D60','石家庄','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('14:00:00','%H:%i:%s'),400,TIME_FORMAT('02:00:00','%H:%i:%s'),'石家庄-北京');
INSERT INTO train VALUES('T60','石家庄','北京',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('09:00:00','%H:%i:%s'),400,TIME_FORMAT('03:00:00','%H:%i:%s'),'石家庄-北京');
INSERT INTO train VALUES('Z60','石家庄','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('15:00:00','%H:%i:%s'),400,TIME_FORMAT('03:00:00','%H:%i:%s'),'石家庄-北京');
INSERT INTO train VALUES('K60','石家庄','北京',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('12:00:00','%H:%i:%s'),400,TIME_FORMAT('04:00:00','%H:%i:%s'),'石家庄-北京');

INSERT INTO train VALUES('G61','北京','南京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('15:00:00','%H:%i:%s'),800,TIME_FORMAT('03:00:00','%H:%i:%s'),'北京-天津-徐州-南京');
INSERT INTO train VALUES('D61','北京','南京',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('09:00:00','%H:%i:%s'),800,TIME_FORMAT('03:00:00','%H:%i:%s'),'北京-天津-徐州-南京');
INSERT INTO train VALUES('T61','北京','南京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('16:00:00','%H:%i:%s'),800,TIME_FORMAT('04:00:00','%H:%i:%s'),'北京-天津-徐州-南京');
INSERT INTO train VALUES('Z61','北京','南京',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('12:00:00','%H:%i:%s'),800,TIME_FORMAT('04:00:00','%H:%i:%s'),'北京-天津-徐州-南京');
INSERT INTO train VALUES('K61','北京','南京',TIME_FORMAT('16:00:00','%H:%i:%s'),TIME_FORMAT('21:00:00','%H:%i:%s'),800,TIME_FORMAT('05:00:00','%H:%i:%s'),'北京-天津-徐州-南京');
INSERT INTO train VALUES('G62','南京','北京',TIME_FORMAT('22:00:00','%H:%i:%s'),TIME_FORMAT('01:00:00','%H:%i:%s'),800,TIME_FORMAT('03:00:00','%H:%i:%s'),'南京-徐州-天津-北京');
INSERT INTO train VALUES('D62','南京','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('15:00:00','%H:%i:%s'),800,TIME_FORMAT('03:00:00','%H:%i:%s'),'南京-徐州-天津-北京');
INSERT INTO train VALUES('T62','南京','北京',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('10:00:00','%H:%i:%s'),800,TIME_FORMAT('04:00:00','%H:%i:%s'),'南京-徐州-天津-北京');
INSERT INTO train VALUES('Z62','南京','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('16:00:00','%H:%i:%s'),800,TIME_FORMAT('04:00:00','%H:%i:%s'),'南京-徐州-天津-北京');
INSERT INTO train VALUES('K62','南京','北京',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('13:00:00','%H:%i:%s'),800,TIME_FORMAT('05:00:00','%H:%i:%s'),'南京-徐州-天津-北京');

INSERT INTO train VALUES('G63','北京','香港',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('22:00:00','%H:%i:%s'),3000,TIME_FORMAT('10:00:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-郴州-广州-惠州-深圳-香港');
INSERT INTO train VALUES('D63','北京','香港',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('16:00:00','%H:%i:%s'),3000,TIME_FORMAT('10:00:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-郴州-广州-惠州-深圳-香港');
INSERT INTO train VALUES('T63','北京','香港',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('04:00:00','%H:%i:%s'),3000,TIME_FORMAT('16:00:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-郴州-广州-惠州-深圳-香港');
INSERT INTO train VALUES('Z63','北京','香港',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('00:00:00','%H:%i:%s'),3000,TIME_FORMAT('16:00:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-郴州-广州-惠州-深圳-香港');
INSERT INTO train VALUES('K63','北京','香港',TIME_FORMAT('16:00:00','%H:%i:%s'),TIME_FORMAT('12:00:00','%H:%i:%s'),3000,TIME_FORMAT('20:00:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-郴州-广州-惠州-深圳-香港');
INSERT INTO train VALUES('G64','香港','北京',TIME_FORMAT('22:00:00','%H:%i:%s'),TIME_FORMAT('08:00:00','%H:%i:%s'),3000,TIME_FORMAT('10:00:00','%H:%i:%s'),'香港-深圳-惠州-广州-郴州-长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('D64','香港','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('22:00:00','%H:%i:%s'),3000,TIME_FORMAT('10:00:00','%H:%i:%s'),'香港-深圳-惠州-广州-郴州-长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('T64','香港','北京',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('22:00:00','%H:%i:%s'),3000,TIME_FORMAT('16:00:00','%H:%i:%s'),'香港-深圳-惠州-广州-郴州-长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('Z64','香港','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('04:00:00','%H:%i:%s'),3000,TIME_FORMAT('16:00:00','%H:%i:%s'),'香港-深圳-惠州-广州-郴州-长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('K64','香港','北京',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('04:00:00','%H:%i:%s'),3000,TIME_FORMAT('20:00:00','%H:%i:%s'),'香港-深圳-惠州-广州-郴州-长沙-武汉-郑州-石家庄-北京');

INSERT INTO train VALUES('G65','北京','澳门',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('22:00:00','%H:%i:%s'),3000,TIME_FORMAT('10:00:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-郴州-广州-珠海-澳门');
INSERT INTO train VALUES('D65','北京','澳门',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('16:00:00','%H:%i:%s'),3000,TIME_FORMAT('10:00:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-郴州-广州-珠海-澳门');
INSERT INTO train VALUES('T65','北京','澳门',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('04:00:00','%H:%i:%s'),3000,TIME_FORMAT('16:00:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-郴州-广州-珠海-澳门');
INSERT INTO train VALUES('Z65','北京','澳门',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('00:00:00','%H:%i:%s'),3000,TIME_FORMAT('16:00:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-郴州-广州-珠海-澳门');
INSERT INTO train VALUES('K65','北京','澳门',TIME_FORMAT('16:00:00','%H:%i:%s'),TIME_FORMAT('12:00:00','%H:%i:%s'),3000,TIME_FORMAT('20:00:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-郴州-广州-珠海-澳门');
INSERT INTO train VALUES('G66','澳门','北京',TIME_FORMAT('22:00:00','%H:%i:%s'),TIME_FORMAT('08:00:00','%H:%i:%s'),3000,TIME_FORMAT('10:00:00','%H:%i:%s'),'澳门-珠海-广州-郴州-长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('D66','澳门','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('22:00:00','%H:%i:%s'),3000,TIME_FORMAT('10:00:00','%H:%i:%s'),'澳门-珠海-广州-郴州-长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('T66','澳门','北京',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('22:00:00','%H:%i:%s'),3000,TIME_FORMAT('16:00:00','%H:%i:%s'),'澳门-珠海-广州-郴州-长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('Z66','澳门','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('04:00:00','%H:%i:%s'),3000,TIME_FORMAT('16:00:00','%H:%i:%s'),'澳门-珠海-广州-郴州-长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('K66','澳门','北京',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('04:00:00','%H:%i:%s'),3000,TIME_FORMAT('20:00:00','%H:%i:%s'),'澳门-珠海-广州-郴州-长沙-武汉-郑州-石家庄-北京');

INSERT INTO train VALUES('G67','北京','海口',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('22:00:00','%H:%i:%s'),3000,TIME_FORMAT('10:00:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-郴州-广州-湛江-海口');
INSERT INTO train VALUES('D67','北京','海口',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('16:00:00','%H:%i:%s'),3000,TIME_FORMAT('10:00:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-郴州-广州-湛江-海口');
INSERT INTO train VALUES('T67','北京','海口',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('04:00:00','%H:%i:%s'),3000,TIME_FORMAT('16:00:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-郴州-广州-湛江-海口');
INSERT INTO train VALUES('Z67','北京','海口',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('00:00:00','%H:%i:%s'),3000,TIME_FORMAT('16:00:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-郴州-广州-湛江-海口');
INSERT INTO train VALUES('K67','北京','海口',TIME_FORMAT('16:00:00','%H:%i:%s'),TIME_FORMAT('12:00:00','%H:%i:%s'),3000,TIME_FORMAT('20:00:00','%H:%i:%s'),'北京-石家庄-郑州-武汉-长沙-郴州-广州-湛江-海口');
INSERT INTO train VALUES('G68','海口','北京',TIME_FORMAT('22:00:00','%H:%i:%s'),TIME_FORMAT('08:00:00','%H:%i:%s'),3000,TIME_FORMAT('10:00:00','%H:%i:%s'),'海口-湛江-广州-郴州-长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('D68','海口','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('22:00:00','%H:%i:%s'),3000,TIME_FORMAT('10:00:00','%H:%i:%s'),'海口-湛江-广州-郴州-长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('T68','海口','北京',TIME_FORMAT('06:00:00','%H:%i:%s'),TIME_FORMAT('22:00:00','%H:%i:%s'),3000,TIME_FORMAT('16:00:00','%H:%i:%s'),'海口-湛江-广州-郴州-长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('Z68','海口','北京',TIME_FORMAT('12:00:00','%H:%i:%s'),TIME_FORMAT('04:00:00','%H:%i:%s'),3000,TIME_FORMAT('16:00:00','%H:%i:%s'),'海口-湛江-广州-郴州-长沙-武汉-郑州-石家庄-北京');
INSERT INTO train VALUES('K68','海口','北京',TIME_FORMAT('08:00:00','%H:%i:%s'),TIME_FORMAT('04:00:00','%H:%i:%s'),3000,TIME_FORMAT('20:00:00','%H:%i:%s'),'海口-湛江-广州-郴州-长沙-武汉-郑州-石家庄-北京');

#给information表插入数据
INSERT INTO information VALUES('G1','商务座',50,500);
INSERT INTO information VALUES('D1','商务座',50,500);
INSERT INTO information VALUES('C1','硬座',50,500);
INSERT INTO information VALUES('G2','商务座',50,500);
INSERT INTO information VALUES('D2','商务座',50,500);
INSERT INTO information VALUES('C2','商务座',50,500);
INSERT INTO information VALUES('G3','商务座',50,500);
INSERT INTO information VALUES('D3','商务座',50,500);
INSERT INTO information VALUES('C3','商务座',50,500);
INSERT INTO information VALUES('G4','商务座',50,500);
INSERT INTO information VALUES('D4','商务座',50,500);
INSERT INTO information VALUES('G5','商务座',200,500);
INSERT INTO information VALUES('D5','商务座',200,500);
INSERT INTO information VALUES('G6','商务座',200,500);
INSERT INTO information VALUES('D6','商务座',200,500);
INSERT INTO information VALUES('G7','商务座',200,500);
INSERT INTO information VALUES('D7','商务座',200,500);
INSERT INTO information VALUES('G8','商务座',200,500);
INSERT INTO information VALUES('D8','商务座',200,500);
INSERT INTO information VALUES('G9','商务座',200,500);
INSERT INTO information VALUES('D9','商务座',200,500);
INSERT INTO information VALUES('G10','商务座',200,500);
INSERT INTO information VALUES('D10','商务座',200,500);
INSERT INTO information VALUES('G11','商务座',500,500);
INSERT INTO information VALUES('D11','商务座',500,500);
INSERT INTO information VALUES('T11','商务座',500,500);
INSERT INTO information VALUES('Z11','商务座',500,500);
INSERT INTO information VALUES('K11','商务座',500,500);
INSERT INTO information VALUES('T11','硬座',500,500);
INSERT INTO information VALUES('Z11','硬座',500,500);
INSERT INTO information VALUES('K11','硬座',500,500);
INSERT INTO information VALUES('T11','软座',600,500);
INSERT INTO information VALUES('Z11','软座',600,500);
INSERT INTO information VALUES('K11','软座',600,500);
INSERT INTO information VALUES('T11','硬卧',550,500);
INSERT INTO information VALUES('Z11','硬卧',550,500);
INSERT INTO information VALUES('K11','硬卧',550,500);
INSERT INTO information VALUES('T11','软卧',700,500);
INSERT INTO information VALUES('Z11','软卧',700,500);
INSERT INTO information VALUES('K11','软卧',700,500);
INSERT INTO information VALUES('G12','商务座',500,500);
INSERT INTO information VALUES('D12','商务座',500,500);
INSERT INTO information VALUES('T12','商务座',500,500);
INSERT INTO information VALUES('Z12','商务座',500,500);
INSERT INTO information VALUES('K12','商务座',500,500);
INSERT INTO information VALUES('T12','硬座',500,500);
INSERT INTO information VALUES('Z12','硬座',500,500);
INSERT INTO information VALUES('K12','硬座',500,500);
INSERT INTO information VALUES('T12','软座',600,500);
INSERT INTO information VALUES('Z12','软座',600,500);
INSERT INTO information VALUES('K12','软座',600,500);
INSERT INTO information VALUES('T12','硬卧',550,500);
INSERT INTO information VALUES('Z12','硬卧',550,500);
INSERT INTO information VALUES('K12','硬卧',550,500);
INSERT INTO information VALUES('T12','软卧',700,500);
INSERT INTO information VALUES('Z12','软卧',700,500);
INSERT INTO information VALUES('K12','软卧',700,500);
INSERT INTO information VALUES('G13','商务座',50,500);
INSERT INTO information VALUES('D13','商务座',50,500);
INSERT INTO information VALUES('T13','商务座',50,500);
INSERT INTO information VALUES('Z13','商务座',50,500);
INSERT INTO information VALUES('K13','商务座',50,500);
INSERT INTO information VALUES('T13','硬座',50,500);
INSERT INTO information VALUES('Z13','硬座',50,500);
INSERT INTO information VALUES('K13','硬座',50,500);
INSERT INTO information VALUES('T13','软座',50,500);
INSERT INTO information VALUES('Z13','软座',50,500);
INSERT INTO information VALUES('K13','软座',50,500);
INSERT INTO information VALUES('T13','硬卧',50,500);
INSERT INTO information VALUES('Z13','硬卧',50,500);
INSERT INTO information VALUES('K13','硬卧',50,500);
INSERT INTO information VALUES('T13','软卧',50,500);
INSERT INTO information VALUES('Z13','软卧',50,500);
INSERT INTO information VALUES('K13','软卧',50,500);
INSERT INTO information VALUES('G14','商务座',50,500);
INSERT INTO information VALUES('D14','商务座',50,500);
INSERT INTO information VALUES('T14','商务座',50,500);
INSERT INTO information VALUES('Z14','商务座',50,500);
INSERT INTO information VALUES('K14','商务座',50,500);
INSERT INTO information VALUES('T14','硬座',50,500);
INSERT INTO information VALUES('Z14','硬座',50,500);
INSERT INTO information VALUES('K14','硬座',50,500);
INSERT INTO information VALUES('T14','软座',50,500);
INSERT INTO information VALUES('Z14','软座',50,500);
INSERT INTO information VALUES('K14','软座',50,500);
INSERT INTO information VALUES('T14','硬卧',50,500);
INSERT INTO information VALUES('Z14','硬卧',50,500);
INSERT INTO information VALUES('K14','硬卧',50,500);
INSERT INTO information VALUES('T14','软卧',50,500);
INSERT INTO information VALUES('Z14','软卧',50,500);
INSERT INTO information VALUES('K14','软卧',50,500);
INSERT INTO information VALUES('G15','商务座',50,500);
INSERT INTO information VALUES('D15','商务座',50,500);
INSERT INTO information VALUES('T15','商务座',50,500);
INSERT INTO information VALUES('Z15','商务座',50,500);
INSERT INTO information VALUES('K15','商务座',50,500);
INSERT INTO information VALUES('T15','硬座',50,500);
INSERT INTO information VALUES('Z15','硬座',50,500);
INSERT INTO information VALUES('K15','硬座',50,500);
INSERT INTO information VALUES('T15','软座',50,500);
INSERT INTO information VALUES('Z15','软座',50,500);
INSERT INTO information VALUES('K15','软座',50,500);
INSERT INTO information VALUES('T15','硬卧',50,500);
INSERT INTO information VALUES('Z15','硬卧',50,500);
INSERT INTO information VALUES('K15','硬卧',50,500);
INSERT INTO information VALUES('T15','软卧',50,500);
INSERT INTO information VALUES('Z15','软卧',50,500);
INSERT INTO information VALUES('K15','软卧',50,500);
INSERT INTO information VALUES('G16','商务座',50,500);
INSERT INTO information VALUES('D16','商务座',50,500);
INSERT INTO information VALUES('T16','商务座',50,500);
INSERT INTO information VALUES('Z16','商务座',50,500);
INSERT INTO information VALUES('K16','商务座',50,500);
INSERT INTO information VALUES('T16','硬座',50,500);
INSERT INTO information VALUES('Z16','硬座',50,500);
INSERT INTO information VALUES('K16','硬座',50,500);
INSERT INTO information VALUES('T16','软座',50,500);
INSERT INTO information VALUES('Z16','软座',50,500);
INSERT INTO information VALUES('K16','软座',50,500);
INSERT INTO information VALUES('T16','硬卧',50,500);
INSERT INTO information VALUES('Z16','硬卧',50,500);
INSERT INTO information VALUES('K16','硬卧',50,500);
INSERT INTO information VALUES('T16','软卧',50,500);
INSERT INTO information VALUES('Z16','软卧',50,500);
INSERT INTO information VALUES('K16','软卧',50,500);
INSERT INTO information VALUES('G17','商务座',50,500);
INSERT INTO information VALUES('D17','商务座',50,500);
INSERT INTO information VALUES('T17','商务座',50,500);
INSERT INTO information VALUES('Z17','商务座',50,500);
INSERT INTO information VALUES('K17','商务座',50,500);
INSERT INTO information VALUES('T17','硬座',50,500);
INSERT INTO information VALUES('Z17','硬座',50,500);
INSERT INTO information VALUES('K17','硬座',50,500);
INSERT INTO information VALUES('T17','软座',50,500);
INSERT INTO information VALUES('Z17','软座',50,500);
INSERT INTO information VALUES('K17','软座',50,500);
INSERT INTO information VALUES('T17','硬卧',50,500);
INSERT INTO information VALUES('Z17','硬卧',50,500);
INSERT INTO information VALUES('K17','硬卧',50,500);
INSERT INTO information VALUES('T17','软卧',50,500);
INSERT INTO information VALUES('Z17','软卧',50,500);
INSERT INTO information VALUES('K17','软卧',50,500);
INSERT INTO information VALUES('G18','商务座',50,500);
INSERT INTO information VALUES('D18','商务座',50,500);
INSERT INTO information VALUES('T18','商务座',50,500);
INSERT INTO information VALUES('Z18','商务座',50,500);
INSERT INTO information VALUES('K18','商务座',50,500);
INSERT INTO information VALUES('T18','硬座',50,500);
INSERT INTO information VALUES('Z18','硬座',50,500);
INSERT INTO information VALUES('K18','硬座',50,500);
INSERT INTO information VALUES('T18','软座',50,500);
INSERT INTO information VALUES('Z18','软座',50,500);
INSERT INTO information VALUES('K18','软座',50,500);
INSERT INTO information VALUES('T18','硬卧',50,500);
INSERT INTO information VALUES('Z18','硬卧',50,500);
INSERT INTO information VALUES('K18','硬卧',50,500);
INSERT INTO information VALUES('T18','软卧',50,500);
INSERT INTO information VALUES('Z18','软卧',50,500);
INSERT INTO information VALUES('K18','软卧',50,500);
INSERT INTO information VALUES('G19','商务座',50,500);
INSERT INTO information VALUES('D19','商务座',50,500);
INSERT INTO information VALUES('T19','商务座',50,500);
INSERT INTO information VALUES('Z19','商务座',50,500);
INSERT INTO information VALUES('K19','商务座',50,500);
INSERT INTO information VALUES('T19','硬座',50,500);
INSERT INTO information VALUES('Z19','硬座',50,500);
INSERT INTO information VALUES('K19','硬座',50,500);
INSERT INTO information VALUES('T19','软座',50,500);
INSERT INTO information VALUES('Z19','软座',50,500);
INSERT INTO information VALUES('K19','软座',50,500);
INSERT INTO information VALUES('T19','硬卧',50,500);
INSERT INTO information VALUES('Z19','硬卧',50,500);
INSERT INTO information VALUES('K19','硬卧',50,500);
INSERT INTO information VALUES('T19','软卧',50,500);
INSERT INTO information VALUES('Z19','软卧',50,500);
INSERT INTO information VALUES('K19','软卧',50,500);
INSERT INTO information VALUES('G20','商务座',50,500);
INSERT INTO information VALUES('D20','商务座',50,500);
INSERT INTO information VALUES('T20','商务座',50,500);
INSERT INTO information VALUES('Z20','商务座',50,500);
INSERT INTO information VALUES('K20','商务座',50,500);
INSERT INTO information VALUES('T20','硬座',50,500);
INSERT INTO information VALUES('Z20','硬座',50,500);
INSERT INTO information VALUES('K20','硬座',50,500);
INSERT INTO information VALUES('T20','软座',50,500);
INSERT INTO information VALUES('Z20','软座',50,500);
INSERT INTO information VALUES('K20','软座',50,500);
INSERT INTO information VALUES('T20','硬卧',50,500);
INSERT INTO information VALUES('Z20','硬卧',50,500);
INSERT INTO information VALUES('K20','硬卧',50,500);
INSERT INTO information VALUES('T20','软卧',50,500);
INSERT INTO information VALUES('Z20','软卧',50,500);
INSERT INTO information VALUES('K20','软卧',50,500);
INSERT INTO information VALUES('G21','商务座',50,500);
INSERT INTO information VALUES('D21','商务座',50,500);
INSERT INTO information VALUES('T21','商务座',50,500);
INSERT INTO information VALUES('Z21','商务座',50,500);
INSERT INTO information VALUES('K21','商务座',50,500);
INSERT INTO information VALUES('T21','硬座',50,500);
INSERT INTO information VALUES('Z21','硬座',50,500);
INSERT INTO information VALUES('K21','硬座',50,500);
INSERT INTO information VALUES('T21','软座',50,500);
INSERT INTO information VALUES('Z21','软座',50,500);
INSERT INTO information VALUES('K21','软座',50,500);
INSERT INTO information VALUES('T21','硬卧',50,500);
INSERT INTO information VALUES('Z21','硬卧',50,500);
INSERT INTO information VALUES('K21','硬卧',50,500);
INSERT INTO information VALUES('T21','软卧',50,500);
INSERT INTO information VALUES('Z21','软卧',50,500);
INSERT INTO information VALUES('K21','软卧',50,500);
INSERT INTO information VALUES('G22','商务座',50,500);
INSERT INTO information VALUES('D22','商务座',50,500);
INSERT INTO information VALUES('T22','商务座',50,500);
INSERT INTO information VALUES('Z22','商务座',50,500);
INSERT INTO information VALUES('K22','商务座',50,500);
INSERT INTO information VALUES('T22','硬座',50,500);
INSERT INTO information VALUES('Z22','硬座',50,500);
INSERT INTO information VALUES('K22','硬座',50,500);
INSERT INTO information VALUES('T22','软座',50,500);
INSERT INTO information VALUES('Z22','软座',50,500);
INSERT INTO information VALUES('K22','软座',50,500);
INSERT INTO information VALUES('T22','硬卧',50,500);
INSERT INTO information VALUES('Z22','硬卧',50,500);
INSERT INTO information VALUES('K22','硬卧',50,500);
INSERT INTO information VALUES('T22','软卧',50,500);
INSERT INTO information VALUES('Z22','软卧',50,500);
INSERT INTO information VALUES('K22','软卧',50,500);
INSERT INTO information VALUES('G23','商务座',50,500);
INSERT INTO information VALUES('D23','商务座',50,500);
INSERT INTO information VALUES('T23','商务座',50,500);
INSERT INTO information VALUES('Z23','商务座',50,500);
INSERT INTO information VALUES('K23','商务座',50,500);
INSERT INTO information VALUES('T23','硬座',50,500);
INSERT INTO information VALUES('Z23','硬座',50,500);
INSERT INTO information VALUES('K23','硬座',50,500);
INSERT INTO information VALUES('T23','软座',50,500);
INSERT INTO information VALUES('Z23','软座',50,500);
INSERT INTO information VALUES('K23','软座',50,500);
INSERT INTO information VALUES('T23','硬卧',50,500);
INSERT INTO information VALUES('Z23','硬卧',50,500);
INSERT INTO information VALUES('K23','硬卧',50,500);
INSERT INTO information VALUES('T23','软卧',50,500);
INSERT INTO information VALUES('Z23','软卧',50,500);
INSERT INTO information VALUES('K23','软卧',50,500);
INSERT INTO information VALUES('G24','商务座',50,500);
INSERT INTO information VALUES('D24','商务座',50,500);
INSERT INTO information VALUES('T24','商务座',50,500);
INSERT INTO information VALUES('Z24','商务座',50,500);
INSERT INTO information VALUES('K24','商务座',50,500);
INSERT INTO information VALUES('T24','硬座',50,500);
INSERT INTO information VALUES('Z24','硬座',50,500);
INSERT INTO information VALUES('K24','硬座',50,500);
INSERT INTO information VALUES('T24','软座',50,500);
INSERT INTO information VALUES('Z24','软座',50,500);
INSERT INTO information VALUES('K24','软座',50,500);
INSERT INTO information VALUES('T24','硬卧',50,500);
INSERT INTO information VALUES('Z24','硬卧',50,500);
INSERT INTO information VALUES('K24','硬卧',50,500);
INSERT INTO information VALUES('T24','软卧',50,500);
INSERT INTO information VALUES('Z24','软卧',50,500);
INSERT INTO information VALUES('K24','软卧',50,500);
INSERT INTO information VALUES('G25','商务座',50,500);
INSERT INTO information VALUES('D25','商务座',50,500);
INSERT INTO information VALUES('T25','商务座',50,500);
INSERT INTO information VALUES('Z25','商务座',50,500);
INSERT INTO information VALUES('K25','商务座',50,500);
INSERT INTO information VALUES('T25','硬座',50,500);
INSERT INTO information VALUES('Z25','硬座',50,500);
INSERT INTO information VALUES('K25','硬座',50,500);
INSERT INTO information VALUES('T25','软座',50,500);
INSERT INTO information VALUES('Z25','软座',50,500);
INSERT INTO information VALUES('K25','软座',50,500);
INSERT INTO information VALUES('T25','硬卧',50,500);
INSERT INTO information VALUES('Z25','硬卧',50,500);
INSERT INTO information VALUES('K25','硬卧',50,500);
INSERT INTO information VALUES('T25','软卧',50,500);
INSERT INTO information VALUES('Z25','软卧',50,500);
INSERT INTO information VALUES('K25','软卧',50,500);
INSERT INTO information VALUES('G26','商务座',50,500);
INSERT INTO information VALUES('D26','商务座',50,500);
INSERT INTO information VALUES('T26','商务座',50,500);
INSERT INTO information VALUES('Z26','商务座',50,500);
INSERT INTO information VALUES('K26','商务座',50,500);
INSERT INTO information VALUES('T26','硬座',50,500);
INSERT INTO information VALUES('Z26','硬座',50,500);
INSERT INTO information VALUES('K26','硬座',50,500);
INSERT INTO information VALUES('T26','软座',50,500);
INSERT INTO information VALUES('Z26','软座',50,500);
INSERT INTO information VALUES('K26','软座',50,500);
INSERT INTO information VALUES('T26','硬卧',50,500);
INSERT INTO information VALUES('Z26','硬卧',50,500);
INSERT INTO information VALUES('K26','硬卧',50,500);
INSERT INTO information VALUES('T26','软卧',50,500);
INSERT INTO information VALUES('Z26','软卧',50,500);
INSERT INTO information VALUES('K26','软卧',50,500);
INSERT INTO information VALUES('D27','商务座',50,500);
INSERT INTO information VALUES('T27','商务座',50,500);
INSERT INTO information VALUES('Z27','商务座',50,500);
INSERT INTO information VALUES('K27','商务座',50,500);
INSERT INTO information VALUES('T27','硬座',50,500);
INSERT INTO information VALUES('Z27','硬座',50,500);
INSERT INTO information VALUES('K27','硬座',50,500);
INSERT INTO information VALUES('T27','软座',50,500);
INSERT INTO information VALUES('Z27','软座',50,500);
INSERT INTO information VALUES('K27','软座',50,500);
INSERT INTO information VALUES('T27','硬卧',50,500);
INSERT INTO information VALUES('Z27','硬卧',50,500);
INSERT INTO information VALUES('K27','硬卧',50,500);
INSERT INTO information VALUES('T27','软卧',50,500);
INSERT INTO information VALUES('Z27','软卧',50,500);
INSERT INTO information VALUES('K27','软卧',50,500);
INSERT INTO information VALUES('G28','商务座',50,500);
INSERT INTO information VALUES('D28','商务座',50,500);
INSERT INTO information VALUES('T28','商务座',50,500);
INSERT INTO information VALUES('Z28','商务座',50,500);
INSERT INTO information VALUES('K28','商务座',50,500);
INSERT INTO information VALUES('T28','硬座',50,500);
INSERT INTO information VALUES('Z28','硬座',50,500);
INSERT INTO information VALUES('K28','硬座',50,500);
INSERT INTO information VALUES('T28','软座',50,500);
INSERT INTO information VALUES('Z28','软座',50,500);
INSERT INTO information VALUES('K28','软座',50,500);
INSERT INTO information VALUES('T28','硬卧',50,500);
INSERT INTO information VALUES('Z28','硬卧',50,500);
INSERT INTO information VALUES('K28','硬卧',50,500);
INSERT INTO information VALUES('T28','软卧',50,500);
INSERT INTO information VALUES('Z28','软卧',50,500);
INSERT INTO information VALUES('K28','软卧',50,500);
INSERT INTO information VALUES('G29','商务座',50,500);
INSERT INTO information VALUES('D29','商务座',50,500);
INSERT INTO information VALUES('T29','商务座',50,500);
INSERT INTO information VALUES('Z29','商务座',50,500);
INSERT INTO information VALUES('K29','商务座',50,500);
INSERT INTO information VALUES('T29','硬座',50,500);
INSERT INTO information VALUES('Z29','硬座',50,500);
INSERT INTO information VALUES('K29','硬座',50,500);
INSERT INTO information VALUES('T29','软座',50,500);
INSERT INTO information VALUES('Z29','软座',50,500);
INSERT INTO information VALUES('K29','软座',50,500);
INSERT INTO information VALUES('T29','硬卧',50,500);
INSERT INTO information VALUES('Z29','硬卧',50,500);
INSERT INTO information VALUES('K29','硬卧',50,500);
INSERT INTO information VALUES('T29','软卧',50,500);
INSERT INTO information VALUES('Z29','软卧',50,500);
INSERT INTO information VALUES('K29','软卧',50,500);
INSERT INTO information VALUES('G30','商务座',50,500);
INSERT INTO information VALUES('D30','商务座',50,500);
INSERT INTO information VALUES('T30','商务座',50,500);
INSERT INTO information VALUES('Z30','商务座',50,500);
INSERT INTO information VALUES('K30','商务座',50,500);
INSERT INTO information VALUES('T30','硬座',50,500);
INSERT INTO information VALUES('Z30','硬座',50,500);
INSERT INTO information VALUES('K30','硬座',50,500);
INSERT INTO information VALUES('T30','软座',50,500);
INSERT INTO information VALUES('Z30','软座',50,500);
INSERT INTO information VALUES('K30','软座',50,500);
INSERT INTO information VALUES('T30','硬卧',50,500);
INSERT INTO information VALUES('Z30','硬卧',50,500);
INSERT INTO information VALUES('K30','硬卧',50,500);
INSERT INTO information VALUES('T30','软卧',50,500);
INSERT INTO information VALUES('Z30','软卧',50,500);
INSERT INTO information VALUES('K30','软卧',50,500);
INSERT INTO information VALUES('G31','商务座',50,500);
INSERT INTO information VALUES('D31','商务座',50,500);
INSERT INTO information VALUES('T31','商务座',50,500);
INSERT INTO information VALUES('Z31','商务座',50,500);
INSERT INTO information VALUES('K31','商务座',50,500);
INSERT INTO information VALUES('T31','硬座',50,500);
INSERT INTO information VALUES('Z31','硬座',50,500);
INSERT INTO information VALUES('K31','硬座',50,500);
INSERT INTO information VALUES('T31','软座',50,500);
INSERT INTO information VALUES('Z31','软座',50,500);
INSERT INTO information VALUES('K31','软座',50,500);
INSERT INTO information VALUES('T31','硬卧',50,500);
INSERT INTO information VALUES('Z31','硬卧',50,500);
INSERT INTO information VALUES('K31','硬卧',50,500);
INSERT INTO information VALUES('T31','软卧',50,500);
INSERT INTO information VALUES('Z31','软卧',50,500);
INSERT INTO information VALUES('K31','软卧',50,500);
INSERT INTO information VALUES('G32','商务座',50,500);
INSERT INTO information VALUES('D32','商务座',50,500);
INSERT INTO information VALUES('T32','商务座',50,500);
INSERT INTO information VALUES('Z32','商务座',50,500);
INSERT INTO information VALUES('K32','商务座',50,500);
INSERT INTO information VALUES('T32','硬座',50,500);
INSERT INTO information VALUES('Z32','硬座',50,500);
INSERT INTO information VALUES('K32','硬座',50,500);
INSERT INTO information VALUES('T32','软座',50,500);
INSERT INTO information VALUES('Z32','软座',50,500);
INSERT INTO information VALUES('K32','软座',50,500);
INSERT INTO information VALUES('T32','硬卧',50,500);
INSERT INTO information VALUES('Z32','硬卧',50,500);
INSERT INTO information VALUES('K32','硬卧',50,500);
INSERT INTO information VALUES('T32','软卧',50,500);
INSERT INTO information VALUES('Z32','软卧',50,500);
INSERT INTO information VALUES('K32','软卧',50,500);
INSERT INTO information VALUES('G33','商务座',50,500);
INSERT INTO information VALUES('D33','商务座',50,500);
INSERT INTO information VALUES('T33','商务座',50,500);
INSERT INTO information VALUES('Z33','商务座',50,500);
INSERT INTO information VALUES('K33','商务座',50,500);
INSERT INTO information VALUES('T33','硬座',50,500);
INSERT INTO information VALUES('Z33','硬座',50,500);
INSERT INTO information VALUES('K33','硬座',50,500);
INSERT INTO information VALUES('T33','软座',50,500);
INSERT INTO information VALUES('Z33','软座',50,500);
INSERT INTO information VALUES('K33','软座',50,500);
INSERT INTO information VALUES('T33','硬卧',50,500);
INSERT INTO information VALUES('Z33','硬卧',50,500);
INSERT INTO information VALUES('K33','硬卧',50,500);
INSERT INTO information VALUES('T33','软卧',50,500);
INSERT INTO information VALUES('Z33','软卧',50,500);
INSERT INTO information VALUES('K33','软卧',50,500);
INSERT INTO information VALUES('G34','商务座',50,500);
INSERT INTO information VALUES('D34','商务座',50,500);
INSERT INTO information VALUES('T34','商务座',50,500);
INSERT INTO information VALUES('Z34','商务座',50,500);
INSERT INTO information VALUES('K34','商务座',50,500);
INSERT INTO information VALUES('T34','硬座',50,500);
INSERT INTO information VALUES('Z34','硬座',50,500);
INSERT INTO information VALUES('K34','硬座',50,500);
INSERT INTO information VALUES('T34','软座',50,500);
INSERT INTO information VALUES('Z34','软座',50,500);
INSERT INTO information VALUES('K34','软座',50,500);
INSERT INTO information VALUES('T34','硬卧',50,500);
INSERT INTO information VALUES('Z34','硬卧',50,500);
INSERT INTO information VALUES('K34','硬卧',50,500);
INSERT INTO information VALUES('T34','软卧',50,500);
INSERT INTO information VALUES('Z34','软卧',50,500);
INSERT INTO information VALUES('K34','软卧',50,500);
INSERT INTO information VALUES('G35','商务座',50,500);
INSERT INTO information VALUES('D35','商务座',50,500);
INSERT INTO information VALUES('T35','商务座',50,500);
INSERT INTO information VALUES('Z35','商务座',50,500);
INSERT INTO information VALUES('K35','商务座',50,500);
INSERT INTO information VALUES('T35','硬座',50,500);
INSERT INTO information VALUES('Z35','硬座',50,500);
INSERT INTO information VALUES('K35','硬座',50,500);
INSERT INTO information VALUES('T35','软座',50,500);
INSERT INTO information VALUES('Z35','软座',50,500);
INSERT INTO information VALUES('K35','软座',50,500);
INSERT INTO information VALUES('T35','硬卧',50,500);
INSERT INTO information VALUES('Z35','硬卧',50,500);
INSERT INTO information VALUES('K35','硬卧',50,500);
INSERT INTO information VALUES('T35','软卧',50,500);
INSERT INTO information VALUES('Z35','软卧',50,500);
INSERT INTO information VALUES('K35','软卧',50,500);
INSERT INTO information VALUES('G36','商务座',50,500);
INSERT INTO information VALUES('D36','商务座',50,500);
INSERT INTO information VALUES('T36','商务座',50,500);
INSERT INTO information VALUES('Z36','商务座',50,500);
INSERT INTO information VALUES('K36','商务座',50,500);
INSERT INTO information VALUES('T36','硬座',50,500);
INSERT INTO information VALUES('Z36','硬座',50,500);
INSERT INTO information VALUES('K36','硬座',50,500);
INSERT INTO information VALUES('T36','软座',50,500);
INSERT INTO information VALUES('Z36','软座',50,500);
INSERT INTO information VALUES('K36','软座',50,500);
INSERT INTO information VALUES('T36','硬卧',50,500);
INSERT INTO information VALUES('Z36','硬卧',50,500);
INSERT INTO information VALUES('K36','硬卧',50,500);
INSERT INTO information VALUES('T36','软卧',50,500);
INSERT INTO information VALUES('Z36','软卧',50,500);
INSERT INTO information VALUES('K36','软卧',50,500);
INSERT INTO information VALUES('G37','商务座',50,500);
INSERT INTO information VALUES('D37','商务座',50,500);
INSERT INTO information VALUES('T37','商务座',50,500);
INSERT INTO information VALUES('Z37','商务座',50,500);
INSERT INTO information VALUES('K37','商务座',50,500);
INSERT INTO information VALUES('T37','硬座',50,500);
INSERT INTO information VALUES('Z37','硬座',50,500);
INSERT INTO information VALUES('K37','硬座',50,500);
INSERT INTO information VALUES('T37','软座',50,500);
INSERT INTO information VALUES('Z37','软座',50,500);
INSERT INTO information VALUES('K37','软座',50,500);
INSERT INTO information VALUES('T37','硬卧',50,500);
INSERT INTO information VALUES('Z37','硬卧',50,500);
INSERT INTO information VALUES('K37','硬卧',50,500);
INSERT INTO information VALUES('T37','软卧',50,500);
INSERT INTO information VALUES('Z37','软卧',50,500);
INSERT INTO information VALUES('K37','软卧',50,500);
INSERT INTO information VALUES('G38','商务座',50,500);
INSERT INTO information VALUES('D38','商务座',50,500);
INSERT INTO information VALUES('T38','商务座',50,500);
INSERT INTO information VALUES('Z38','商务座',50,500);
INSERT INTO information VALUES('K38','商务座',50,500);
INSERT INTO information VALUES('T38','硬座',50,500);
INSERT INTO information VALUES('Z38','硬座',50,500);
INSERT INTO information VALUES('K38','硬座',50,500);
INSERT INTO information VALUES('T38','软座',50,500);
INSERT INTO information VALUES('Z38','软座',50,500);
INSERT INTO information VALUES('K38','软座',50,500);
INSERT INTO information VALUES('T38','硬卧',50,500);
INSERT INTO information VALUES('Z38','硬卧',50,500);
INSERT INTO information VALUES('K38','硬卧',50,500);
INSERT INTO information VALUES('T38','软卧',50,500);
INSERT INTO information VALUES('Z38','软卧',50,500);
INSERT INTO information VALUES('K38','软卧',50,500);
INSERT INTO information VALUES('G39','商务座',50,500);
INSERT INTO information VALUES('D39','商务座',50,500);
INSERT INTO information VALUES('T39','商务座',50,500);
INSERT INTO information VALUES('Z39','商务座',50,500);
INSERT INTO information VALUES('K39','商务座',50,500);
INSERT INTO information VALUES('T39','硬座',50,500);
INSERT INTO information VALUES('Z39','硬座',50,500);
INSERT INTO information VALUES('K39','硬座',50,500);
INSERT INTO information VALUES('T39','软座',50,500);
INSERT INTO information VALUES('Z39','软座',50,500);
INSERT INTO information VALUES('K39','软座',50,500);
INSERT INTO information VALUES('T39','硬卧',50,500);
INSERT INTO information VALUES('Z39','硬卧',50,500);
INSERT INTO information VALUES('K39','硬卧',50,500);
INSERT INTO information VALUES('T39','软卧',50,500);
INSERT INTO information VALUES('Z39','软卧',50,500);
INSERT INTO information VALUES('K39','软卧',50,500);
INSERT INTO information VALUES('G40','商务座',50,500);
INSERT INTO information VALUES('D40','商务座',50,500);
INSERT INTO information VALUES('T40','商务座',50,500);
INSERT INTO information VALUES('Z40','商务座',50,500);
INSERT INTO information VALUES('K40','商务座',50,500);
INSERT INTO information VALUES('T40','硬座',50,500);
INSERT INTO information VALUES('Z40','硬座',50,500);
INSERT INTO information VALUES('K40','硬座',50,500);
INSERT INTO information VALUES('T40','软座',50,500);
INSERT INTO information VALUES('Z40','软座',50,500);
INSERT INTO information VALUES('K40','软座',50,500);
INSERT INTO information VALUES('T40','硬卧',50,500);
INSERT INTO information VALUES('Z40','硬卧',50,500);
INSERT INTO information VALUES('K40','硬卧',50,500);
INSERT INTO information VALUES('T40','软卧',50,500);
INSERT INTO information VALUES('Z40','软卧',50,500);
INSERT INTO information VALUES('K40','软卧',50,500);
INSERT INTO information VALUES('G41','商务座',50,500);
INSERT INTO information VALUES('D41','商务座',50,500);
INSERT INTO information VALUES('T41','商务座',50,500);
INSERT INTO information VALUES('Z41','商务座',50,500);
INSERT INTO information VALUES('K41','商务座',50,500);
INSERT INTO information VALUES('T41','硬座',50,500);
INSERT INTO information VALUES('Z41','硬座',50,500);
INSERT INTO information VALUES('K41','硬座',50,500);
INSERT INTO information VALUES('T41','软座',50,500);
INSERT INTO information VALUES('Z41','软座',50,500);
INSERT INTO information VALUES('K41','软座',50,500);
INSERT INTO information VALUES('T41','硬卧',50,500);
INSERT INTO information VALUES('Z41','硬卧',50,500);
INSERT INTO information VALUES('K41','硬卧',50,500);
INSERT INTO information VALUES('T41','软卧',50,500);
INSERT INTO information VALUES('Z41','软卧',50,500);
INSERT INTO information VALUES('K41','软卧',50,500);
INSERT INTO information VALUES('G42','商务座',50,500);
INSERT INTO information VALUES('D42','商务座',50,500);
INSERT INTO information VALUES('T42','商务座',50,500);
INSERT INTO information VALUES('Z42','商务座',50,500);
INSERT INTO information VALUES('K42','商务座',50,500);
INSERT INTO information VALUES('T42','硬座',50,500);
INSERT INTO information VALUES('Z42','硬座',50,500);
INSERT INTO information VALUES('K42','硬座',50,500);
INSERT INTO information VALUES('T42','软座',50,500);
INSERT INTO information VALUES('Z42','软座',50,500);
INSERT INTO information VALUES('K42','软座',50,500);
INSERT INTO information VALUES('T42','硬卧',50,500);
INSERT INTO information VALUES('Z42','硬卧',50,500);
INSERT INTO information VALUES('K42','硬卧',50,500);
INSERT INTO information VALUES('T42','软卧',50,500);
INSERT INTO information VALUES('Z42','软卧',50,500);
INSERT INTO information VALUES('K42','软卧',50,500);
INSERT INTO information VALUES('G43','商务座',50,500);
INSERT INTO information VALUES('D43','商务座',50,500);
INSERT INTO information VALUES('T43','商务座',50,500);
INSERT INTO information VALUES('Z43','商务座',50,500);
INSERT INTO information VALUES('K43','商务座',50,500);
INSERT INTO information VALUES('T43','硬座',50,500);
INSERT INTO information VALUES('Z43','硬座',50,500);
INSERT INTO information VALUES('K43','硬座',50,500);
INSERT INTO information VALUES('T43','软座',50,500);
INSERT INTO information VALUES('Z43','软座',50,500);
INSERT INTO information VALUES('K43','软座',50,500);
INSERT INTO information VALUES('T43','硬卧',50,500);
INSERT INTO information VALUES('Z43','硬卧',50,500);
INSERT INTO information VALUES('K43','硬卧',50,500);
INSERT INTO information VALUES('T43','软卧',50,500);
INSERT INTO information VALUES('Z43','软卧',50,500);
INSERT INTO information VALUES('K43','软卧',50,500);
INSERT INTO information VALUES('G44','商务座',50,500);
INSERT INTO information VALUES('D44','商务座',50,500);
INSERT INTO information VALUES('T44','商务座',50,500);
INSERT INTO information VALUES('Z44','商务座',50,500);
INSERT INTO information VALUES('K44','商务座',50,500);
INSERT INTO information VALUES('T44','硬座',50,500);
INSERT INTO information VALUES('Z44','硬座',50,500);
INSERT INTO information VALUES('K44','硬座',50,500);
INSERT INTO information VALUES('T44','软座',50,500);
INSERT INTO information VALUES('Z44','软座',50,500);
INSERT INTO information VALUES('K44','软座',50,500);
INSERT INTO information VALUES('T44','硬卧',50,500);
INSERT INTO information VALUES('Z44','硬卧',50,500);
INSERT INTO information VALUES('K44','硬卧',50,500);
INSERT INTO information VALUES('T44','软卧',50,500);
INSERT INTO information VALUES('Z44','软卧',50,500);
INSERT INTO information VALUES('K44','软卧',50,500);
INSERT INTO information VALUES('G45','商务座',50,500);
INSERT INTO information VALUES('D45','商务座',50,500);
INSERT INTO information VALUES('T45','商务座',50,500);
INSERT INTO information VALUES('Z45','商务座',50,500);
INSERT INTO information VALUES('K45','商务座',50,500);
INSERT INTO information VALUES('T45','硬座',50,500);
INSERT INTO information VALUES('Z45','硬座',50,500);
INSERT INTO information VALUES('K45','硬座',50,500);
INSERT INTO information VALUES('T45','软座',50,500);
INSERT INTO information VALUES('Z45','软座',50,500);
INSERT INTO information VALUES('K45','软座',50,500);
INSERT INTO information VALUES('T45','硬卧',50,500);
INSERT INTO information VALUES('Z45','硬卧',50,500);
INSERT INTO information VALUES('K45','硬卧',50,500);
INSERT INTO information VALUES('T45','软卧',50,500);
INSERT INTO information VALUES('Z45','软卧',50,500);
INSERT INTO information VALUES('K45','软卧',50,500);
INSERT INTO information VALUES('G46','商务座',50,500);
INSERT INTO information VALUES('D46','商务座',50,500);
INSERT INTO information VALUES('T46','商务座',50,500);
INSERT INTO information VALUES('Z46','商务座',50,500);
INSERT INTO information VALUES('K46','商务座',50,500);
INSERT INTO information VALUES('T46','硬座',50,500);
INSERT INTO information VALUES('Z46','硬座',50,500);
INSERT INTO information VALUES('K46','硬座',50,500);
INSERT INTO information VALUES('T46','软座',50,500);
INSERT INTO information VALUES('Z46','软座',50,500);
INSERT INTO information VALUES('K46','软座',50,500);
INSERT INTO information VALUES('T46','硬卧',50,500);
INSERT INTO information VALUES('Z46','硬卧',50,500);
INSERT INTO information VALUES('K46','硬卧',50,500);
INSERT INTO information VALUES('T46','软卧',50,500);
INSERT INTO information VALUES('Z46','软卧',50,500);
INSERT INTO information VALUES('K46','软卧',50,500);
INSERT INTO information VALUES('G47','商务座',50,500);
INSERT INTO information VALUES('D47','商务座',50,500);
INSERT INTO information VALUES('T47','商务座',50,500);
INSERT INTO information VALUES('Z47','商务座',50,500);
INSERT INTO information VALUES('K47','商务座',50,500);
INSERT INTO information VALUES('T47','硬座',50,500);
INSERT INTO information VALUES('Z47','硬座',50,500);
INSERT INTO information VALUES('K47','硬座',50,500);
INSERT INTO information VALUES('T47','软座',50,500);
INSERT INTO information VALUES('Z47','软座',50,500);
INSERT INTO information VALUES('K47','软座',50,500);
INSERT INTO information VALUES('T47','硬卧',50,500);
INSERT INTO information VALUES('Z47','硬卧',50,500);
INSERT INTO information VALUES('K47','硬卧',50,500);
INSERT INTO information VALUES('T47','软卧',50,500);
INSERT INTO information VALUES('Z47','软卧',50,500);
INSERT INTO information VALUES('K47','软卧',50,500);
INSERT INTO information VALUES('G48','商务座',50,500);
INSERT INTO information VALUES('D48','商务座',50,500);
INSERT INTO information VALUES('T48','商务座',50,500);
INSERT INTO information VALUES('Z48','商务座',50,500);
INSERT INTO information VALUES('K48','商务座',50,500);
INSERT INTO information VALUES('T48','硬座',50,500);
INSERT INTO information VALUES('Z48','硬座',50,500);
INSERT INTO information VALUES('K48','硬座',50,500);
INSERT INTO information VALUES('T48','软座',50,500);
INSERT INTO information VALUES('Z48','软座',50,500);
INSERT INTO information VALUES('K48','软座',50,500);
INSERT INTO information VALUES('T48','硬卧',50,500);
INSERT INTO information VALUES('Z48','硬卧',50,500);
INSERT INTO information VALUES('K48','硬卧',50,500);
INSERT INTO information VALUES('T48','软卧',50,500);
INSERT INTO information VALUES('Z48','软卧',50,500);
INSERT INTO information VALUES('K48','软卧',50,500);
INSERT INTO information VALUES('G49','商务座',50,500);
INSERT INTO information VALUES('D49','商务座',50,500);
INSERT INTO information VALUES('T49','商务座',50,500);
INSERT INTO information VALUES('Z49','商务座',50,500);
INSERT INTO information VALUES('K49','商务座',50,500);
INSERT INTO information VALUES('T49','硬座',50,500);
INSERT INTO information VALUES('Z49','硬座',50,500);
INSERT INTO information VALUES('K49','硬座',50,500);
INSERT INTO information VALUES('T49','软座',50,500);
INSERT INTO information VALUES('Z49','软座',50,500);
INSERT INTO information VALUES('K49','软座',50,500);
INSERT INTO information VALUES('T49','硬卧',50,500);
INSERT INTO information VALUES('Z49','硬卧',50,500);
INSERT INTO information VALUES('K49','硬卧',50,500);
INSERT INTO information VALUES('T49','软卧',50,500);
INSERT INTO information VALUES('Z49','软卧',50,500);
INSERT INTO information VALUES('K49','软卧',50,500);
INSERT INTO information VALUES('G50','商务座',50,500);
INSERT INTO information VALUES('D50','商务座',50,500);
INSERT INTO information VALUES('T50','商务座',50,500);
INSERT INTO information VALUES('Z50','商务座',50,500);
INSERT INTO information VALUES('K50','商务座',50,500);
INSERT INTO information VALUES('T50','硬座',50,500);
INSERT INTO information VALUES('Z50','硬座',50,500);
INSERT INTO information VALUES('K50','硬座',50,500);
INSERT INTO information VALUES('T50','软座',50,500);
INSERT INTO information VALUES('Z50','软座',50,500);
INSERT INTO information VALUES('K50','软座',50,500);
INSERT INTO information VALUES('T50','硬卧',50,500);
INSERT INTO information VALUES('Z50','硬卧',50,500);
INSERT INTO information VALUES('K50','硬卧',50,500);
INSERT INTO information VALUES('T50','软卧',50,500);
INSERT INTO information VALUES('Z50','软卧',50,500);
INSERT INTO information VALUES('K50','软卧',50,500);
INSERT INTO information VALUES('G51','商务座',50,500);
INSERT INTO information VALUES('D51','商务座',50,500);
INSERT INTO information VALUES('T51','商务座',50,500);
INSERT INTO information VALUES('Z51','商务座',50,500);
INSERT INTO information VALUES('K51','商务座',50,500);
INSERT INTO information VALUES('T51','硬座',50,500);
INSERT INTO information VALUES('Z51','硬座',50,500);
INSERT INTO information VALUES('K51','硬座',50,500);
INSERT INTO information VALUES('T51','软座',50,500);
INSERT INTO information VALUES('Z51','软座',50,500);
INSERT INTO information VALUES('K51','软座',50,500);
INSERT INTO information VALUES('T51','硬卧',50,500);
INSERT INTO information VALUES('Z51','硬卧',50,500);
INSERT INTO information VALUES('K51','硬卧',50,500);
INSERT INTO information VALUES('T51','软卧',50,500);
INSERT INTO information VALUES('Z51','软卧',50,500);
INSERT INTO information VALUES('K51','软卧',50,500);
INSERT INTO information VALUES('G52','商务座',50,500);
INSERT INTO information VALUES('D52','商务座',50,500);
INSERT INTO information VALUES('T52','商务座',50,500);
INSERT INTO information VALUES('Z52','商务座',50,500);
INSERT INTO information VALUES('K52','商务座',50,500);
INSERT INTO information VALUES('T52','硬座',50,500);
INSERT INTO information VALUES('Z52','硬座',50,500);
INSERT INTO information VALUES('K52','硬座',50,500);
INSERT INTO information VALUES('T52','软座',50,500);
INSERT INTO information VALUES('Z52','软座',50,500);
INSERT INTO information VALUES('K52','软座',50,500);
INSERT INTO information VALUES('T52','硬卧',50,500);
INSERT INTO information VALUES('Z52','硬卧',50,500);
INSERT INTO information VALUES('K52','硬卧',50,500);
INSERT INTO information VALUES('T52','软卧',50,500);
INSERT INTO information VALUES('Z52','软卧',50,500);
INSERT INTO information VALUES('K52','软卧',50,500);
INSERT INTO information VALUES('G53','商务座',50,500);
INSERT INTO information VALUES('D53','商务座',50,500);
INSERT INTO information VALUES('T53','商务座',50,500);
INSERT INTO information VALUES('Z53','商务座',50,500);
INSERT INTO information VALUES('K53','商务座',50,500);
INSERT INTO information VALUES('T53','硬座',50,500);
INSERT INTO information VALUES('Z53','硬座',50,500);
INSERT INTO information VALUES('K53','硬座',50,500);
INSERT INTO information VALUES('T53','软座',50,500);
INSERT INTO information VALUES('Z53','软座',50,500);
INSERT INTO information VALUES('K53','软座',50,500);
INSERT INTO information VALUES('T53','硬卧',50,500);
INSERT INTO information VALUES('Z53','硬卧',50,500);
INSERT INTO information VALUES('K53','硬卧',50,500);
INSERT INTO information VALUES('T53','软卧',50,500);
INSERT INTO information VALUES('Z53','软卧',50,500);
INSERT INTO information VALUES('K53','软卧',50,500);
INSERT INTO information VALUES('G54','商务座',50,500);
INSERT INTO information VALUES('D54','商务座',50,500);
INSERT INTO information VALUES('T54','商务座',50,500);
INSERT INTO information VALUES('Z54','商务座',50,500);
INSERT INTO information VALUES('K54','商务座',50,500);
INSERT INTO information VALUES('T54','硬座',50,500);
INSERT INTO information VALUES('Z54','硬座',50,500);
INSERT INTO information VALUES('K54','硬座',50,500);
INSERT INTO information VALUES('T54','软座',50,500);
INSERT INTO information VALUES('Z54','软座',50,500);
INSERT INTO information VALUES('K54','软座',50,500);
INSERT INTO information VALUES('T54','硬卧',50,500);
INSERT INTO information VALUES('Z54','硬卧',50,500);
INSERT INTO information VALUES('K54','硬卧',50,500);
INSERT INTO information VALUES('T54','软卧',50,500);
INSERT INTO information VALUES('Z54','软卧',50,500);
INSERT INTO information VALUES('K54','软卧',50,500);
INSERT INTO information VALUES('G55','商务座',50,500);
INSERT INTO information VALUES('D55','商务座',50,500);
INSERT INTO information VALUES('T55','商务座',50,500);
INSERT INTO information VALUES('Z55','商务座',50,500);
INSERT INTO information VALUES('K55','商务座',50,500);
INSERT INTO information VALUES('T55','硬座',50,500);
INSERT INTO information VALUES('Z55','硬座',50,500);
INSERT INTO information VALUES('K55','硬座',50,500);
INSERT INTO information VALUES('T55','软座',50,500);
INSERT INTO information VALUES('Z55','软座',50,500);
INSERT INTO information VALUES('K55','软座',50,500);
INSERT INTO information VALUES('T55','硬卧',50,500);
INSERT INTO information VALUES('Z55','硬卧',50,500);
INSERT INTO information VALUES('K55','硬卧',50,500);
INSERT INTO information VALUES('T55','软卧',50,500);
INSERT INTO information VALUES('Z55','软卧',50,500);
INSERT INTO information VALUES('K55','软卧',50,500);
INSERT INTO information VALUES('G56','商务座',50,500);
INSERT INTO information VALUES('D56','商务座',50,500);
INSERT INTO information VALUES('T56','商务座',50,500);
INSERT INTO information VALUES('Z56','商务座',50,500);
INSERT INTO information VALUES('K56','商务座',50,500);
INSERT INTO information VALUES('T56','硬座',50,500);
INSERT INTO information VALUES('Z56','硬座',50,500);
INSERT INTO information VALUES('K56','硬座',50,500);
INSERT INTO information VALUES('T56','软座',50,500);
INSERT INTO information VALUES('Z56','软座',50,500);
INSERT INTO information VALUES('K56','软座',50,500);
INSERT INTO information VALUES('T56','硬卧',50,500);
INSERT INTO information VALUES('Z56','硬卧',50,500);
INSERT INTO information VALUES('K56','硬卧',50,500);
INSERT INTO information VALUES('T56','软卧',50,500);
INSERT INTO information VALUES('Z56','软卧',50,500);
INSERT INTO information VALUES('K56','软卧',50,500);
INSERT INTO information VALUES('G57','商务座',50,500);
INSERT INTO information VALUES('D57','商务座',50,500);
INSERT INTO information VALUES('T57','商务座',50,500);
INSERT INTO information VALUES('Z57','商务座',50,500);
INSERT INTO information VALUES('K57','商务座',50,500);
INSERT INTO information VALUES('T57','硬座',50,500);
INSERT INTO information VALUES('Z57','硬座',50,500);
INSERT INTO information VALUES('K57','硬座',50,500);
INSERT INTO information VALUES('T57','软座',50,500);
INSERT INTO information VALUES('Z57','软座',50,500);
INSERT INTO information VALUES('K57','软座',50,500);
INSERT INTO information VALUES('T57','硬卧',50,500);
INSERT INTO information VALUES('Z57','硬卧',50,500);
INSERT INTO information VALUES('K57','硬卧',50,500);
INSERT INTO information VALUES('T57','软卧',50,500);
INSERT INTO information VALUES('Z57','软卧',50,500);
INSERT INTO information VALUES('K57','软卧',50,500);
INSERT INTO information VALUES('G58','商务座',50,500);
INSERT INTO information VALUES('D58','商务座',50,500);
INSERT INTO information VALUES('T58','商务座',50,500);
INSERT INTO information VALUES('Z58','商务座',50,500);
INSERT INTO information VALUES('K58','商务座',50,500);
INSERT INTO information VALUES('T58','硬座',50,500);
INSERT INTO information VALUES('Z58','硬座',50,500);
INSERT INTO information VALUES('K58','硬座',50,500);
INSERT INTO information VALUES('T58','软座',50,500);
INSERT INTO information VALUES('Z58','软座',50,500);
INSERT INTO information VALUES('K58','软座',50,500);
INSERT INTO information VALUES('T58','硬卧',50,500);
INSERT INTO information VALUES('Z58','硬卧',50,500);
INSERT INTO information VALUES('K58','硬卧',50,500);
INSERT INTO information VALUES('T58','软卧',50,500);
INSERT INTO information VALUES('Z58','软卧',50,500);
INSERT INTO information VALUES('K58','软卧',50,500);
INSERT INTO information VALUES('G59','商务座',50,500);
INSERT INTO information VALUES('D59','商务座',50,500);
INSERT INTO information VALUES('T59','商务座',50,500);
INSERT INTO information VALUES('Z59','商务座',50,500);
INSERT INTO information VALUES('K59','商务座',50,500);
INSERT INTO information VALUES('T59','硬座',50,500);
INSERT INTO information VALUES('Z59','硬座',50,500);
INSERT INTO information VALUES('K59','硬座',50,500);
INSERT INTO information VALUES('T59','软座',50,500);
INSERT INTO information VALUES('Z59','软座',50,500);
INSERT INTO information VALUES('K59','软座',50,500);
INSERT INTO information VALUES('T59','硬卧',50,500);
INSERT INTO information VALUES('Z59','硬卧',50,500);
INSERT INTO information VALUES('K59','硬卧',50,500);
INSERT INTO information VALUES('T59','软卧',50,500);
INSERT INTO information VALUES('Z59','软卧',50,500);
INSERT INTO information VALUES('K59','软卧',50,500);
INSERT INTO information VALUES('G60','商务座',50,500);
INSERT INTO information VALUES('D60','商务座',50,500);
INSERT INTO information VALUES('T60','商务座',50,500);
INSERT INTO information VALUES('Z60','商务座',50,500);
INSERT INTO information VALUES('K60','商务座',50,500);
INSERT INTO information VALUES('T60','硬座',50,500);
INSERT INTO information VALUES('Z60','硬座',50,500);
INSERT INTO information VALUES('K60','硬座',50,500);
INSERT INTO information VALUES('T60','软座',50,500);
INSERT INTO information VALUES('Z60','软座',50,500);
INSERT INTO information VALUES('K60','软座',50,500);
INSERT INTO information VALUES('T60','硬卧',50,500);
INSERT INTO information VALUES('Z60','硬卧',50,500);
INSERT INTO information VALUES('K60','硬卧',50,500);
INSERT INTO information VALUES('T60','软卧',50,500);
INSERT INTO information VALUES('Z60','软卧',50,500);
INSERT INTO information VALUES('K60','软卧',50,500);
INSERT INTO information VALUES('G61','商务座',50,500);
INSERT INTO information VALUES('D61','商务座',50,500);
INSERT INTO information VALUES('T61','商务座',50,500);
INSERT INTO information VALUES('Z61','商务座',50,500);
INSERT INTO information VALUES('K61','商务座',50,500);
INSERT INTO information VALUES('T61','硬座',50,500);
INSERT INTO information VALUES('Z61','硬座',50,500);
INSERT INTO information VALUES('K61','硬座',50,500);
INSERT INTO information VALUES('T61','软座',50,500);
INSERT INTO information VALUES('Z61','软座',50,500);
INSERT INTO information VALUES('K61','软座',50,500);
INSERT INTO information VALUES('T61','硬卧',50,500);
INSERT INTO information VALUES('Z61','硬卧',50,500);
INSERT INTO information VALUES('K61','硬卧',50,500);
INSERT INTO information VALUES('T61','软卧',50,500);
INSERT INTO information VALUES('Z61','软卧',50,500);
INSERT INTO information VALUES('K61','软卧',50,500);
INSERT INTO information VALUES('G62','商务座',50,500);
INSERT INTO information VALUES('D62','商务座',50,500);
INSERT INTO information VALUES('T62','商务座',50,500);
INSERT INTO information VALUES('Z62','商务座',50,500);
INSERT INTO information VALUES('K62','商务座',50,500);
INSERT INTO information VALUES('T62','硬座',50,500);
INSERT INTO information VALUES('Z62','硬座',50,500);
INSERT INTO information VALUES('K62','硬座',50,500);
INSERT INTO information VALUES('T62','软座',50,500);
INSERT INTO information VALUES('Z62','软座',50,500);
INSERT INTO information VALUES('K62','软座',50,500);
INSERT INTO information VALUES('T62','硬卧',50,500);
INSERT INTO information VALUES('Z62','硬卧',50,500);
INSERT INTO information VALUES('K62','硬卧',50,500);
INSERT INTO information VALUES('T62','软卧',50,500);
INSERT INTO information VALUES('Z62','软卧',50,500);
INSERT INTO information VALUES('K62','软卧',50,500);
INSERT INTO information VALUES('G63','商务座',50,500);
INSERT INTO information VALUES('D63','商务座',50,500);
INSERT INTO information VALUES('T63','商务座',50,500);
INSERT INTO information VALUES('Z63','商务座',50,500);
INSERT INTO information VALUES('K63','商务座',50,500);
INSERT INTO information VALUES('T63','硬座',50,500);
INSERT INTO information VALUES('Z63','硬座',50,500);
INSERT INTO information VALUES('K63','硬座',50,500);
INSERT INTO information VALUES('T63','软座',50,500);
INSERT INTO information VALUES('Z63','软座',50,500);
INSERT INTO information VALUES('K63','软座',50,500);
INSERT INTO information VALUES('T63','硬卧',50,500);
INSERT INTO information VALUES('Z63','硬卧',50,500);
INSERT INTO information VALUES('K63','硬卧',50,500);
INSERT INTO information VALUES('T63','软卧',50,500);
INSERT INTO information VALUES('Z63','软卧',50,500);
INSERT INTO information VALUES('K63','软卧',50,500);
INSERT INTO information VALUES('G64','商务座',50,500);
INSERT INTO information VALUES('D64','商务座',50,500);
INSERT INTO information VALUES('T64','商务座',50,500);
INSERT INTO information VALUES('Z64','商务座',50,500);
INSERT INTO information VALUES('K64','商务座',50,500);
INSERT INTO information VALUES('T64','硬座',50,500);
INSERT INTO information VALUES('Z64','硬座',50,500);
INSERT INTO information VALUES('K64','硬座',50,500);
INSERT INTO information VALUES('T64','软座',50,500);
INSERT INTO information VALUES('Z64','软座',50,500);
INSERT INTO information VALUES('K64','软座',50,500);
INSERT INTO information VALUES('T64','硬卧',50,500);
INSERT INTO information VALUES('Z64','硬卧',50,500);
INSERT INTO information VALUES('K64','硬卧',50,500);
INSERT INTO information VALUES('T64','软卧',50,500);
INSERT INTO information VALUES('Z64','软卧',50,500);
INSERT INTO information VALUES('K64','软卧',50,500);
INSERT INTO information VALUES('G65','商务座',50,500);
INSERT INTO information VALUES('D65','商务座',50,500);
INSERT INTO information VALUES('T65','商务座',50,500);
INSERT INTO information VALUES('Z65','商务座',50,500);
INSERT INTO information VALUES('K65','商务座',50,500);
INSERT INTO information VALUES('T65','硬座',50,500);
INSERT INTO information VALUES('Z65','硬座',50,500);
INSERT INTO information VALUES('K65','硬座',50,500);
INSERT INTO information VALUES('T65','软座',50,500);
INSERT INTO information VALUES('Z65','软座',50,500);
INSERT INTO information VALUES('K65','软座',50,500);
INSERT INTO information VALUES('T65','硬卧',50,500);
INSERT INTO information VALUES('Z65','硬卧',50,500);
INSERT INTO information VALUES('K65','硬卧',50,500);
INSERT INTO information VALUES('T65','软卧',50,500);
INSERT INTO information VALUES('Z65','软卧',50,500);
INSERT INTO information VALUES('K65','软卧',50,500);
INSERT INTO information VALUES('G66','商务座',50,500);
INSERT INTO information VALUES('D66','商务座',50,500);
INSERT INTO information VALUES('T66','商务座',50,500);
INSERT INTO information VALUES('Z66','商务座',50,500);
INSERT INTO information VALUES('K66','商务座',50,500);
INSERT INTO information VALUES('T66','硬座',50,500);
INSERT INTO information VALUES('Z66','硬座',50,500);
INSERT INTO information VALUES('K66','硬座',50,500);
INSERT INTO information VALUES('T66','软座',50,500);
INSERT INTO information VALUES('Z66','软座',50,500);
INSERT INTO information VALUES('K66','软座',50,500);
INSERT INTO information VALUES('T66','硬卧',50,500);
INSERT INTO information VALUES('Z66','硬卧',50,500);
INSERT INTO information VALUES('K66','硬卧',50,500);
INSERT INTO information VALUES('T66','软卧',50,500);
INSERT INTO information VALUES('Z66','软卧',50,500);
INSERT INTO information VALUES('K66','软卧',50,500);
INSERT INTO information VALUES('G67','商务座',50,500);
INSERT INTO information VALUES('D67','商务座',50,500);
INSERT INTO information VALUES('T67','商务座',50,500);
INSERT INTO information VALUES('Z67','商务座',50,500);
INSERT INTO information VALUES('K67','商务座',50,500);
INSERT INTO information VALUES('T67','硬座',50,500);
INSERT INTO information VALUES('Z67','硬座',50,500);
INSERT INTO information VALUES('K67','硬座',50,500);
INSERT INTO information VALUES('T67','软座',50,500);
INSERT INTO information VALUES('Z67','软座',50,500);
INSERT INTO information VALUES('K67','软座',50,500);
INSERT INTO information VALUES('T67','硬卧',50,500);
INSERT INTO information VALUES('Z67','硬卧',50,500);
INSERT INTO information VALUES('K67','硬卧',50,500);
INSERT INTO information VALUES('T67','软卧',50,500);
INSERT INTO information VALUES('Z67','软卧',50,500);
INSERT INTO information VALUES('K67','软卧',50,500);
INSERT INTO information VALUES('G68','商务座',50,500);
INSERT INTO information VALUES('D68','商务座',50,500);
INSERT INTO information VALUES('T68','商务座',50,500);
INSERT INTO information VALUES('Z68','商务座',50,500);
INSERT INTO information VALUES('K68','商务座',50,500);
INSERT INTO information VALUES('T68','硬座',50,500);
INSERT INTO information VALUES('Z68','硬座',50,500);
INSERT INTO information VALUES('K68','硬座',50,500);
INSERT INTO information VALUES('T68','软座',50,500);
INSERT INTO information VALUES('Z68','软座',50,500);
INSERT INTO information VALUES('K68','软座',50,500);
INSERT INTO information VALUES('T68','硬卧',50,500);
INSERT INTO information VALUES('Z68','硬卧',50,500);
INSERT INTO information VALUES('K68','硬卧',50,500);
INSERT INTO information VALUES('T68','软卧',50,500);
INSERT INTO information VALUES('Z68','软卧',50,500);
INSERT INTO information VALUES('K68','软卧',50,500);

#给map插入数据
INSERT INTO map VALUES('A-0','G1');
INSERT INTO map VALUES('A-1','D1');
INSERT INTO map VALUES('A-2','C1');
INSERT INTO map VALUES('A-3','G2');
INSERT INTO map VALUES('A-4','D2');
INSERT INTO map VALUES('A-5','C2');
INSERT INTO map VALUES('A-6','G7');
INSERT INTO map VALUES('A-7','D7');
INSERT INTO map VALUES('A-8','G12');
INSERT INTO map VALUES('B-0','T13');
INSERT INTO map VALUES('B-1','K13');
INSERT INTO map VALUES('B-2','Z14');
INSERT INTO map VALUES('B-3','K15');
INSERT INTO map VALUES('B-4','D16');
INSERT INTO map VALUES('B-5','T17');
INSERT INTO map VALUES('B-6','Z18');
INSERT INTO map VALUES('B-7','K19');
INSERT INTO map VALUES('B-8','G20');
INSERT INTO map VALUES('C-0','D21');
INSERT INTO map VALUES('C-1','T22');
INSERT INTO map VALUES('C-2','Z23');
INSERT INTO map VALUES('C-3','K24');
INSERT INTO map VALUES('C-4','D25');
INSERT INTO map VALUES('C-5','T26');
INSERT INTO map VALUES('C-6','Z27');
INSERT INTO map VALUES('C-7','K27');
INSERT INTO map VALUES('C-8','G28');
INSERT INTO map VALUES('D-0','D28');
INSERT INTO map VALUES('D-1','T29');
INSERT INTO map VALUES('D-2','Z29');
INSERT INTO map VALUES('D-3','K30');
INSERT INTO map VALUES('D-4','D31');
INSERT INTO map VALUES('D-5','T32');
INSERT INTO map VALUES('D-6','Z33');
INSERT INTO map VALUES('D-7','K33');
INSERT INTO map VALUES('D-8','G34');
INSERT INTO map VALUES('E-0','D35');
INSERT INTO map VALUES('E-1','T36');
INSERT INTO map VALUES('E-2','Z37');
INSERT INTO map VALUES('E-3','K38');
INSERT INTO map VALUES('E-4','D39');
INSERT INTO map VALUES('E-5','T40');
INSERT INTO map VALUES('E-6','Z40');
INSERT INTO map VALUES('E-7','K40');
INSERT INTO map VALUES('E-8','G41');
INSERT INTO map VALUES('F-0','D42');
INSERT INTO map VALUES('F-1','T43');
INSERT INTO map VALUES('F-2','Z44');
INSERT INTO map VALUES('F-3','K45');
INSERT INTO map VALUES('F-4','K46');
INSERT INTO map VALUES('F-5','T47');
INSERT INTO map VALUES('F-6','Z48');
INSERT INTO map VALUES('F-7','K49');
INSERT INTO map VALUES('F-8','G50');

#事务提交
COMMIT;

#给每个表建立唯一索引
#给account表建立唯一索引
create unique index account_index on account(id);
#给user表建立唯一索引
create unique index user_index on user(id);
#给booking表建立唯一索引
create unique index booking_index on booking(no);
#给train表建立唯一索引
create unique index train_index on train(trips);
#给information表建立唯一索引
create unique index information_index on information(trips,type);

#显示索引
show index from account;
show index from user;
show index from booking;
show index from train;
show index from information;

#建立行列子集视图view1（查询用户10000的所有基本信息）
create view view1
as
select a.id,a.password,u.name,u.gender,u.native_place,u.idcode,u.telephone,u.mail,a.money
from account a,user u
where a.id=u.id and a.id=10000;

#建立行列子集视图view2（查询用户10000的订单详情）
create view view2
as
select u.id,u.name,b.no,b.bookingtime
from user u,booking b
where u.id=b.id and u.id=10000;

#建立行列子集视图view3(查询用户10000的订单号为A-0的车次详情)
create view view3
as
select u.id,u.name,b.no,m.trips,t.originating_station,t.arrival_station,t.departure_time,t.arrival_time,t.driven_distance,t.route
from user u,booking b,map m,train t
where u.id=b.id and b.no=m.no and m.trips=t.trips and u.id=10000 and b.no='A-0';

#建立行列子集视图view4（查询车次为G1，座位类型为商务座的所有信息）
create view view4
as
select t.trips,i.type,t.departure_time,i.price,i.amount
from train t,information i
where t.trips=i.trips and t.trips='G1' and i.type='商务座';

#建立存储过程
#创建多表查询的存储过程 select1:连接查询账号和密码
delimiter //
create procedure select1(newid varchar(10))
begin
     SELECT *
FROM (SELECT a.id,a.password,u.name,u.gender,u.native_place,u.idcode,u.telephone,u.mail
      FROM account a,user u
      WHERE a.id=u.id) t
WHERE t.id=newid; 
end; //

#创建存储过程select2:查询账号和密码
delimiter //
create procedure select2(newid varchar(10),newpassword varchar(20))
begin
     select * from account 
     where id=newid and password=newpassword;
end;//

#创建存储过程select3:查询账号和密码
delimiter //
create procedure select3(newid varchar(10),newpassword varchar(20))
begin
     select * from admin 
     where id=newid and password=newpassword;
end;//

#创建存储过程select4:插入用户信息
delimiter //
create procedure insert4(id varchar(10),name varchar(20),gender char,idcode varchar(100),native_place varchar(20),telephone varchar(20),mail varchar(50))
begin
     insert into user values(id,name,gender,idcode,native_place,telephone,mail);
end;//

#创建存储过程insert5:插入车次信息
delimiter //
create procedure insert5(trips varchar(10),originating_station varchar(20),arrival_station varchar(20),departure_time varchar(20),arrival_time varchar(20),driven_distance int,driven_time varchar(50),route varchar(200))
begin
     insert into train values(trips,originating_station,arrival_station,departure_time,arrival_time,driven_distance,driven_time,route);
end;//

#创建存储过程insert6:插入车票信息
delimiter //
create procedure insert6(trips varchar(20),type varchar(20),price int,amount int)
begin
     insert into information values(trips,type,price,amount);
end;//

#创建存储过程insert7:插入账户信息
delimiter //
create procedure insert7(id varchar(20),password varchar(20),money int,flag varchar(20))
begin
     insert into account values(id,password,money,flag);
end;//

#创建存储过程insert8:插入订购信息
delimiter //
create procedure insert8(no varchar(20),id varchar(20),bookingtime varchar(30))
begin
     insert into booking values(no,id,bookingtime);
end;//

#当然，可以给所有的sql语句建立存储过程，此处不再赘述


#创建触发器(删除父表user表之前，必须先删除子表account表和booking表)
DROP TRIGGER IF EXISTS t_afterdelete_on_tab1;
delimiter //
CREATE TRIGGER t_afterdelete_on_tab1
BEFORE DELETE ON user
FOR EACH ROW
BEGIN
      delete from account where id=old.id;
      delete from booking where id=old.id;
END;//


#创建触发器(删除父表train表之前，必须先删除子表information表)
DROP TRIGGER IF EXISTS t_afterdelete_on_tab2;
delimiter //
CREATE TRIGGER t_afterdelete_on_tab2
BEFORE DELETE ON train
FOR EACH ROW
BEGIN
      delete from information where trips=old.trips;
END;//


