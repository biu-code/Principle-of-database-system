--建立一个名为school的数据库
DROP database if exists school;
CREATE database school;

--使用school数据库
USE school；

--删除数据表
DROP TABLE account;
DROP TABLE train;
DROP TABLE information;
DROP TABLE booking;
DROP TABLE user;

--创建数据表
CREATE TABLE user (
         id             int PRIMARY KEY,
         name           varchar(20) NOT NULL,
         gender         char CHECK(gender IN('男','女')),
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

--给user表插入数据
INSERT INTO user VALUES(10000,'张三','男','360734198003040001','北京',13912761234,'2847239812@qq.com');
INSERT INTO user VALUES(10001,'李四','男','360734199512104523','天津',15778951024,'2712134569@qq.com');
INSERT INTO user VALUES(10002,'赵强','男','360734199704050231','河南',13912560903,'4523908712@qq.com');
INSERT INTO user VALUES(10003,'徐丽','女','360734199604010831','湖北',12712345679,'3569123409@qq.com');
INSERT INTO user VALUES(10004,'何云','女','360734199911051231','江西',15913016031,'1098090812@qq.com');
INSERT INTO user VALUES(10005,'刘亮','男','360734198701020231','北京',13911221145,'0000111134@qq.com');
INSERT INTO user VALUES(10006,'王有','男','360734199008018031','河南',13701560904,'1287123409@qq.com');
INSERT INTO user VALUES(10007,'何帅','女','360734199712058034','福建',15800121212,'2849774125@qq.com');

--给account表插入数据
INSERT INTO account VALUES(10000,'waws1234');
INSERT INTO account VALUES(10001,'asdf4567');
INSERT INTO account VALUES(10002,'197812ac');
INSERT INTO account VALUES(10003,'15280901');
INSERT INTO account VALUES(10004,'08231789');
INSERT INTO account VALUES(10005,'bt120912');
INSERT INTO account VALUES(10006,'11119090');
INSERT INTO account VALUES(10007,'1907aabb');

--给booking表插入数据
INSERT INTO booking VALUES('A-07892345',10000,DATE_FORMAT('2017-03-25 13:24:11','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('A-12361209',10001,DATE_FORMAT('2017-05-26 20:10:12','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('E-16581231',10006,DATE_FORMAT('2017-04-01 07:00:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('E-78121222',10004,DATE_FORMAT('2017-08-31 10:20:19','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('A-01231234',10002,DATE_FORMAT('2017-05-26 10:20:00','%Y-%m-%d %H:%i:%s'));
INSERT INTO booking VALUES('E-00110101',10005,DATE_FORMAT('2017-03-25 22:11:10','%Y-%m-%d %H:%i:%s'));

--给train表插入数据
INSERT INTO train VALUES('G105','北京-天津-济南-徐州-南京-上海',1000,TIME_FORMAT('04:10:00','%H:%i:%s'));
INSERT INTO train VALUES('G120','武汉-郑州-石家庄-北京南',1200,TIME_FORMAT('06:20:00','%H:%i:%s'));
INSERT INTO train VALUES('T3085','广州-惠州-河源-赣州-鹰潭-义乌-杭州东-嘉兴-上海南',1562,TIME_FORMAT('22:15:00','%H:%i:%s'));
INSERT INTO train VALUES('K486','深圳-广州-韶关-郴州-株洲-湘潭-怀化-贵阳-重庆-成都东',2310,TIME_FORMAT('37:16:00','%H:%i:%s'));
INSERT INTO train VALUES('Z43','北京西-石家庄北-延安-西安',1427,TIME_FORMAT('13:40:00','%H:%i:%s'));
INSERT INTO train VALUES('K571','北京西-衡水-聊城-菏泽-阜阳-九江-三明北-莆田-厦门',3100,TIME_FORMAT('18:47:00','%H:%i:%s'));
INSERT INTO train VALUES('D3227','武汉-鄂州-黄石-共青城-永修-南昌西',600,TIME_FORMAT('02:46:00','%H:%i:%s'));
INSERT INTO train VALUES('G7','北京南-济南西-南京南-上海虹桥',1000,TIME_FORMAT('04:10:00','%H:%i:%s'));
INSERT INTO train VALUES('D313','北京南-南京-苏州-上海',1000,TIME_FORMAT('04:10:00','%H:%i:%s'));
INSERT INTO train VALUES('G153','北京南-济南西-泰安-徐州东-苏州北-上海虹桥',1000,TIME_FORMAT('04:10:00','%H:%i:%s'));

--给information表插入数据
INSERT INTO information VALUES('A-07892345','G105',DATE_FORMAT('2017-03-30 12:00:00','%Y-%m-%d %H:%i:%s'),
   DATE_FORMAT('2017-03-30 16:10:00','%Y-%m-%d %H:%i:%s'),'北京','上海','商务座',400,210);
INSERT INTO information VALUES('A-01231234','Z43',DATE_FORMAT('2017-06-01 12:00:00','%Y-%m-%d %H:%i:%s'),
   DATE_FORMAT('2017-06-02 01:40:00','%Y-%m-%d %H:%i:%s'),'北京','西安','特等座',650,300);
INSERT INTO information VALUES('E-00110101','Z43',DATE_FORMAT('2017-06-01 12:00:00','%Y-%m-%d %H:%i:%s'),
   DATE_FORMAT('2017-06-02 01:40:00','%Y-%m-%d %H:%i:%s'),'北京','西安','硬卧',750,100);
INSERT INTO information VALUES('E-16581231','Z43',DATE_FORMAT('2017-06-01 12:00:00','%Y-%m-%d %H:%i:%s'),
   DATE_FORMAT('2017-06-02 01:40:00','%Y-%m-%d %H:%i:%s'),'北京','西安','软卧',780,100);
INSERT INTO information VALUES('E-78121222','K571',DATE_FORMAT('2017-08-01 06:00:00','%Y-%m-%d %H:%i:%s'),
   DATE_FORMAT('2017-08-02 00:47:00','%Y-%m-%d %H:%i:%s'),'北京西','厦门','软卧',780,300);
INSERT INTO information VALUES('A-12361209','K571',DATE_FORMAT('2017-08-01 06:00:00','%Y-%m-%d %H:%i:%s'),
   DATE_FORMAT('2017-08-02 00:47:00','%Y-%m-%d %H:%i:%s'),'北京西','厦门','硬座',400,50);

--事务提交
COMMIT; 

--给train表建立唯一索引
CREATE UNIQUE INDEX train_s ON train(trips);

--聚簇索引是唯一的，每个表都会根据其主键进行聚簇，因此无需再添加聚簇索引 


         