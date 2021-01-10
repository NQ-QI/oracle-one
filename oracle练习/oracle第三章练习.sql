------第三章------
------练习1
------1.查询职位为SALESMAN的员工编号、职位、入职日期。
select empno,job
from emp
where job ='SALESMAN';

------2.查询1985年12月31日之前入职的员工姓名及入职日期。
select ename,hiredate
from emp
where hiredate<to_date('31-12-1985','dd-mm-yyyy');

------3.查询部门编号不在10部门的员工姓名、部门编号。
select ename,deptno
from emp
where deptno <> 10;

------练习2
------1.查询入职日期在82年至85年的员工姓名，入职日期。
select ename,hiredate
from emp
where hiredate between '1-1月-1982' and '31-12月-1985';

------2.查询月薪在3000到5000的员工姓名，月薪。
select ename,sal
from  emp
where sal between 3000 and 5000;

------3.查询部门编号为10或者20的员工姓名，部门编号。
select ename,deptno
from  emp
where deptno in (10,20);

------4.查询经理编号为7902, 7566, 7788的员工姓名，经理编号。
select ename,mgr
from emp
where mgr in (7902,7566,7788);


------练习3
------1.查询员工姓名以W开头的员工姓名。
select ename
from emp
where ename like 'W_%';

------2.查询员工姓名倒数第2个字符为T的员工姓名。
select ename
from emp
where ename like '%_T_';

------3.查询奖金为空的员工姓名，奖金。
select ename,comm
from emp
where comm is null;

------练习4
------1.查询工资超过2000并且职位是MANAGER,或者职位是SALESMAN的员工姓名、职位、工资
select ename,job,sal
from emp
where sal >2000
and job='MANAGER' or job='SALESMAN';

------2.查询工资超过2000并且职位是 MANAGER或SALESMAN的员工姓名、职位、工资。
select ename,job,sal
from emp
where sal >2000
and job='MANAGER' or job='SALESMAN';

------3.查询部门在10或者20，并且工资在3000到5000之间的员工姓名、部门、工资。
select ename,deptno,sal
from emp
where sal >=3000
and sal <=5000
and deptno in (10,20);

------4.查询入职日期在81年，并且职位不是SALES开头的员工姓名、入职日期、职位。
select ename,hiredate,job
from emp
where job not like 'SALES_%'
and hiredate < '31-12月-81' and hiredate > '1-1月-81';

------5.查询职位为SALESMAN或MANAGER，部门编号为10或者20，姓名包含A的员工姓名、职位、部门编号。
select ename,job,deptno
from emp
where job ='SALESMAN' or job ='MANAGER'
and deptno in (10,20)
and ename like 'A%';

-----练习5
------1.查询部门在20或30的员工姓名，部门编号，并按照工资升序排序。
select * from emp;
select ename,sal,deptno
from emp
where deptno ='20' or deptno ='30'
order by sal asc;

------2.查询工资在2000-3000之间，部门不在10号的员工姓名，部门编号，工资，并按照部门升序，工资降序排序。
select ename,deptno,sal 
from emp 
where sal >=2000 and sal <=3000 and deptno <>10
order by sal asc;

------3.查询入职日期在82年至83年之间，职位以SALES或者MAN开头的员工姓名，入职日期，职位，并按照入职日期降序排序。
select ename,hiredate,job 
from emp
where hiredate>to_date('1-1-82','dd-MM-yy') and hiredate<to_date('31-12-8','dd-MM-yy' )
and job like  'MAN_%'  or job like 'SALES_%'
order by hiredate asc,sal desc;


------课后作业
------1.查询入职时间在1982-7-9之后，并且不从事SALESMAN工作的员工姓名、入职时间、职位。
select ename,hiredate,job
from emp
where hiredate>to_date('9-7-1982','dd-MM-yyyy')
and job<>'SALESMAN';

------2.查询员工姓名的第三个字母是a的员工姓名。
select ename
from emp
where ename like '__A%'

------3.查询除了10、20号部门以外的员工姓名、部门编号。
select ename,deptno
from emp
where deptno not in(10,20);

------4.查询部门号为30号员工的信息，先按工资降序排序，再按姓名升序排序
select * from emp
where deptno = 30
order by sal desc,ename asc;

------5.查询没有上级的员工(经理号为空)的员工姓名。
select * from emp
where mgr is null;

------6.查询工资大于等于4500并且部门为10或者20的员工的姓名\工资、部门编号。
select ename,sal,deptno
from emp
where sal >= 4500 and (deptno in (10,20));

