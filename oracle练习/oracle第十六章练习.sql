------第十六章------
------练习1
------1.创建一个序列，该序列起始值从1开始，无最大值，增量是1，不循环。
create sequence test3
start with 1
nomaxvalue
increment by 1
nocycle;

------2.查询序列的当前值及下一个值
select test3.nextval from dual;
select test3.currval from dual;

------3.使用第1题所建的序列，向部门表中插入两条记录，部门编号使用序列值，部门名称分别为：Education、Market，城市分别为：DALLAS、WASHTON
select * from dept;
insert into dept (deptno,dname,loc) values (test3.nextval,'Education','DALLAS');
insert into dept (deptno,dname,loc) values ((test3.nextval,'Market','WASHTON');


------练习2
-----1.使用子查询的方式，创建test表。
create table test as select * from emp;

-----2.快速复制test表中的数据，复制到100w条左右
insert into test select * from test;

-----3.更新test表中的empno字段为rownum
update test set empno = rownum;
alter table test modify (empno number(8));
update test set empno = test3.nextval;

-----4.查询test中empno为800000的记录值，记录查询执行时间。

-----5.在test表的empno字段上创建索引
create index test_empno_index on test(empno);

-----6.重新执行第4题，对比查询时间


-----练习3
----1.有如下关系模式，
student(sno,sname,gender,birthday,email);--学生
course(cno,cname,type,credit);--课程
sc（sno,cno,grade);--选课
试分析哪些列上适合创建索引？



-----课后作业
----1.创建序列，起始位1，自增为1，最小值为1，最大值为9999
create sequence addsum
start with 1
increment by 1
minvalue 1
maxvalue 9999;
           
----2.创建序列，起始值为50，每次增加5；
create sequence add5
start with 50
increment by 5;    
select add5.nextval from dual; 

----3.在表copy_dept中插入记录，其中部门号码采用上一步中创建的序列生成；
insert into copy_dept(deptno,dname) values(add5.nextval,'序列测试');

----4.请为工资创建索引，比较<10000,>1000,与round（sal）>10000,哪个索引有效，哪个索引无效；
create index sal_index on emp(sal);
select * from emp where sal < 10000;--有索引
select * from emp where sal > 1000;--有索引
select * from emp where round(sal) > 10000;--无索引，有函数
    
----5.创建表，采用“create table copy_emp_index as select * from emp”，生成500万条数据，把其中的“员工号”字段修改为唯一；
create table copy_emp_index as select * from emp;
insert into copy_emp_index  select * from copy_emp_index;
alter table copy_emp_index modify(empno number(9));
update copy_emp_index set empno = dept_seq.nextval;

----6.查询表copy_emp_index表中员工号为200001的员工姓名，工资，记录执行时间；
select ename, sal from copy_emp_index;

----7.在copy_emp_index表的empno字段上创建索引，再次执行第6题语句，记录执行时间并做对比；
create index emp_empno_index on copy_emp_index(empno);
