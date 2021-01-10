------第十七章------
------练习1
------1.自己尝试创建一个用户user1
create user user1 identified by admin;

------2.使用管理员账户为用户user1分配create session和create table的权限。
grant create session, create table to user1;


-----课后作业
----1.建立新用户neu
create user test identified by admin; 

----2.给用户neu授权,使其能够登录到数据库，能够查询scott下的emp表，能修改emp表的sal,ename两个字段
grant create session to test; 
grant select on scott.emp to test; 
grant update(sal,ename) on scott.emp to test;
    
----3.回收用户neu的登录权限
revoke create session from test;

----4.回收用户neu的所有对象权限
revoke select on scott.emp from test;
revoke update on scott.emp from test;

----5.建立角色role_neu
create role role_test;

----6.给角色role_neu授权,使其能够登录到数据库
grant create session to role_test; 

----7.赋角色role_neu给用户neu
grant role_test to test;

----8.删除角色role_neu
drop role role_test;

----9.删除用户neu
drop user test;
