------��ʮ����------
------��ϰ1
------1.�Լ����Դ���һ���û�user1
create user user1 identified by admin;

------2.ʹ�ù���Ա�˻�Ϊ�û�user1����create session��create table��Ȩ�ޡ�
grant create session, create table to user1;


-----�κ���ҵ
----1.�������û�neu
create user test identified by admin; 

----2.���û�neu��Ȩ,ʹ���ܹ���¼�����ݿ⣬�ܹ���ѯscott�µ�emp�����޸�emp���sal,ename�����ֶ�
grant create session to test; 
grant select on scott.emp to test; 
grant update(sal,ename) on scott.emp to test;
    
----3.�����û�neu�ĵ�¼Ȩ��
revoke create session from test;

----4.�����û�neu�����ж���Ȩ��
revoke select on scott.emp from test;
revoke update on scott.emp from test;

----5.������ɫrole_neu
create role role_test;

----6.����ɫrole_neu��Ȩ,ʹ���ܹ���¼�����ݿ�
grant create session to role_test; 

----7.����ɫrole_neu���û�neu
grant role_test to test;

----8.ɾ����ɫrole_neu
drop role role_test;

----9.ɾ���û�neu
drop user test;
