--使用school数据库
use school;

--创建用户C1,C2,C3,C4,C5
CREATE USER C1,C2,C3,C4,C5;

--给用户C1，C2授予查询，插入，修改，删除user表的权限
GRANT SELECT,INSERT,UPDATE,DELETE
ON table user
TO C1,C2;

--查看C1，C2的权限
show grants for C1; 
show grants for C2;

--撤销C1，C2的权限
REVOKE SELECT,INSERT,UPDATE,DELETE
ON table user
From C1,C2;

--再次查看C1,C2的权限
show grants for C1;
show grants for C2;

--给用户C3授予操作user表的所有权限
GRANT ALL privileges
ON table user
to C3;

--查看用户C3的权限
show grants for C3;

--撤销C3的所有权限
REVOKE ALL privileges
ON TABLE user
FROM C3;

--再次查看C3的权限
show grants for C3;

--为用户C4授予查询user表的姓名，修改user表的mail属性以及给user表插入数据的权限
GRANT SELECT(name),UPDATE(mail),INSERT
ON table user
TO C4;

--查看用户C4的权限
show grants for C4;

--撤销用户C4的权限
REVOKE SELECT(name),UPDATE(mail),INSERT
ON table user
FROM C4;

--再次查看用户C4的权限
show grants for C4;

--创建角色R1
CREATE role R1;

--给角色授权
GRANT SELECT(name),UPDATE(mail),INSERT
ON TABLE user
TO R1;

--将角色授予用户C5
GRANT R1
TO C5
With admin option;

--查看用户C5的权限
show grants for C5;

--收回角色R1的权限
REVOKE SELECT(name),UPDATE(mail),INSERT
ON table user
FROM R1;

--再次查看用户C5的权限
show grants for C5;

--结束

