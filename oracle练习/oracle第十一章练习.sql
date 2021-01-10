------第十一章------
------练习1
------1.向部门表新增一个部门，部门编号为50，部门名称为HR，工作地点为SY。
insert into dept values(50,'HR','SY');
select * from dept;

------2.向部门表新增一个部门，部门编号为60，部门名称为MARKET。
insert into dept values(60,'MARKET','');


------练习2
------1.向员工表中新增一个员工，员工编号为8888，姓名为BOB，岗位为CLERK，经理为号7788，入职日期为1985-03-03，薪资3000，奖金和部门为空。
insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values(8888,'BOB','CLERK',7788,to_date('1985-03-03', 'yyyy-mm-dd'),
       3000, null, null);
select * from emp;


------练习3
------1.使用CREATE TABLE emp_back as 
------SELECT * FROM EMP WHERE 1=0，创建emp_back表,拷贝下来即可。
create table emp_back as select * from emp where 0 = 1;

------2.把emp表中入职日期大于1982年1月1日之前的员工信息复制到emp_back表中。
insert into emp_back 
select * from emp where hiredate < to_date('1982-1-1','yyyy-mm-dd');
select * from emp_back; 


------练习4
------1.修改部门20的员工信息，把82年之后入职的员工入职日期向后调整10天
update emp set hiredate = hiredate +10 
where deptno = 20 and hiredate > to_date('1982-12-31', 'yyyy-mm-dd');
select * from emp;


------2.修改奖金为null的员工，奖金设置为0
update emp set comm = 0 where comm is null;

------3.修改工作地点在NEW YORK或CHICAGO的员工工资，工资增加500
update emp set sal = sal + 500
where ename in (select e.ename
                from emp e, dept d
                where e.deptno = d.deptno
                and d.loc in ('NEW YORK', 'CHICAGO'));


------练习6
------1.删除经理编号为7566的员工记录
delete from emp
where mgr = 7566;

------2.删除工作在NEW YORK的员工记录
delete from emp e
where exists (select loc 
              from dept 
              where deptno = e.deptno 
              and loc = 'NEW YORK');


------3.删除工资大于所在部门平均工资的员工记录
delete from emp e
where sal > (select avg(sal) 
              from emp
              where deptno = e.deptno);


------课后作业
create table student (        --学生表
      xh char(4),--学号
      xm varchar2(10),--姓名
     sex char(2),--性别
     birthday date,--出生日期
     sal number(7,2), --奖学金
     studentcid number(2) --学生班级号
)
Create table class (   --班级表
      classid number(2), --班级编号
      cname varchar2(20),--班级名称
        ccount  number(3) --班级人数
)

------（1）添加三个班级信息为：1，JAVA1班，null   2，JAVA2班，null   3，JAVA3班，null
                         
insert into class values (1,'JAVA1班',null);
insert into class values (2,'JAVA2班',null);
insert into class values (3,'JAVA3班',null);


select * from class

------（2）添加学生信息如下：‘A001’,‘张三’,‘男’,‘01-5月-05’,100,1
insert into student values ('A001','张三','男','01-5月-05',100,1)

select * from student

------（3）添加学生信息如下：'A002','MIKE','男','1905-05-06',10
insert into student (xh,xm,sex,birthday,sal) 
values ('A002','MIKE','男','6-5月-1905',10);

------（4）插入部分学生信息： 'A003','JOHN','女’
insert into student (xh,xm,sex)
values ('A003','JOHN','女')

-----删除
(delete from student
where xh='A003')

------（5）将A001学生性别修改为'女‘
update student
set sex = '女'
where xh = 'A001'

------（6）将A001学生信息修改如下：性别为男，生日设置为1980-04-01
update student
set sex = '男',birthday = '1-4月-1980'
where xh = 'A001'

------（7）将生日为空的学生班级修改为Java3班
update student set studentcid = 3 
where birthday is null;

------（8）请使用一条SQL语句，使用子查询，更新班级表中每个班级的人数字段
update class c set 
       c.ccount = (select count(xh) from student where studentcid = c.classid)
       
       
       
------3.使用如下语句，建立以下表
CREATE TABLE copy_emp   (
  empno number(4),
  ename varchar2(20),
  hiredate date default sysdate ,
  deptno number(2),
  sal number(8,2))

select * from copy_emp

------4.在第三题表的基础上，完成下列问题
------(1)在表copy_emp中插入数据，要求sal字段插入空值，部门号50，参加工作时间为2000年1月1日，其他字段随意
insert into copy_emp (empno,ename,hiredate,deptno,sal) 
values (1234, 'one', '1-1月-2000', 50, null);
        
------(2)在表copy_emp中插入数据，要求把emp表中部门号为10号部门的员工信息插入
insert into copy_emp select empno,ename,hiredate,deptno,
sal from emp 
where deptno = 10;

------(3)修改copy_emp表中数据，要求10号部门所有员工涨20%的工资
update copy_emp
set sal=sal*1.2
where deptno=10

------(4)修改copy_emp表中sal为空的记录，工资修改为平均工资
update copy_emp
set sal=(select avg(sal) from copy_emp)
where sal is null;

------(5)把工资为平均工资的员工，工资修改为空
update copy_emp set sal = null 
where sal = (select avg(sal) from copy_emp);

------(6)另外打开窗口2查看以上修改


------(7)执行commit，窗口2中再次查看以上信息
commit;

------(8)删除工资为空的员工信息
delete from copy_emp sal where sal is null;

------(9)执行rollback
rollback; 
