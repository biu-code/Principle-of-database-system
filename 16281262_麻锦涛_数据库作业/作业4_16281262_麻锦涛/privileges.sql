--ʹ��school���ݿ�
use school;

--�����û�C1,C2,C3,C4,C5
CREATE USER C1,C2,C3,C4,C5;

--���û�C1��C2�����ѯ�����룬�޸ģ�ɾ��user���Ȩ��
GRANT SELECT,INSERT,UPDATE,DELETE
ON table user
TO C1,C2;

--�鿴C1��C2��Ȩ��
show grants for C1; 
show grants for C2;

--����C1��C2��Ȩ��
REVOKE SELECT,INSERT,UPDATE,DELETE
ON table user
From C1,C2;

--�ٴβ鿴C1,C2��Ȩ��
show grants for C1;
show grants for C2;

--���û�C3�������user�������Ȩ��
GRANT ALL privileges
ON table user
to C3;

--�鿴�û�C3��Ȩ��
show grants for C3;

--����C3������Ȩ��
REVOKE ALL privileges
ON TABLE user
FROM C3;

--�ٴβ鿴C3��Ȩ��
show grants for C3;

--Ϊ�û�C4�����ѯuser����������޸�user���mail�����Լ���user��������ݵ�Ȩ��
GRANT SELECT(name),UPDATE(mail),INSERT
ON table user
TO C4;

--�鿴�û�C4��Ȩ��
show grants for C4;

--�����û�C4��Ȩ��
REVOKE SELECT(name),UPDATE(mail),INSERT
ON table user
FROM C4;

--�ٴβ鿴�û�C4��Ȩ��
show grants for C4;

--������ɫR1
CREATE role R1;

--����ɫ��Ȩ
GRANT SELECT(name),UPDATE(mail),INSERT
ON TABLE user
TO R1;

--����ɫ�����û�C5
GRANT R1
TO C5
With admin option;

--�鿴�û�C5��Ȩ��
show grants for C5;

--�ջؽ�ɫR1��Ȩ��
REVOKE SELECT(name),UPDATE(mail),INSERT
ON table user
FROM R1;

--�ٴβ鿴�û�C5��Ȩ��
show grants for C5;

--����

