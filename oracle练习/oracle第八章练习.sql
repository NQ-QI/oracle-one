-----第八章-------
------练习1
------1.分别使用联合运算及完全联合运算完成，按照时间升序顺序，查询员工7839的工作岗位列表。
------union
select job 工作岗位列表, hiredate from emp where empno = 7839
union
select job, begindate from emp_jobhistory ej where empno = 7839 
order by hiredate;

------union all
select job 工作岗位列表, hiredate from emp where empno = 7839
union all
select job, begindate from emp_jobhistory ej where empno = 7839 
order by hiredate; 
    
------2.使用多表连接，查询每个部门的部门编号，部门人数，没有人数的部门显示0。
select d.deptno 部门编号, nvl (count(e.ename), 0) 部门人数
from emp e, dept d
where e.deptno(+) = d.deptno
group by d.deptno;
       
------3.使用联合运算，查询每个部门的部门编号，部门人数，没有人数的部门显示0。
select d.deptno 部门编号, count(e.ename) 部门人数 from emp e, dept d where e.deptno = d.deptno group by d.deptno
union
select deptno, 0 from dept where deptno not in (select distinct deptno from emp where deptno is not null);

------4.使用联合运算，查询10号部门及20号部门的员工姓名，部门编号。
select e.ename 员工姓名, e.deptno 部门编号 from emp e where deptno = 10
union
select e.ename,e.deptno from emp e where deptno = 20;

------5
select d.deptno 部门, null, e.ename 员工姓名, e.hiredate 入职日期 from emp e, dept d where e.deptno = d.deptno
union
select deptno,loc,null,null from dept;
   
------课后作业
------1.用集合运算，列出不包含job为SALESMAN 的部门的部门号。
select deptno from dept
minus
select deptno from emp where job = 'SALESMAN';

------2.写一个联合查询，列出下面的信息：
------EMP表中所有雇员的名字和部门编号,不管他们是否属于任何部门。
------DEPT表中的所有部门编号和部门名称，不管他们是否有员工。
select ename 雇员名字, deptno 部门编号, null 部门名称 from emp
union
select null , deptno, dname from dept d order by 部门编号 desc;

------3.用集合运算查询出职位为SALESMAN和部门编号为10的人员编号、姓名、职位，不排除重复结果。
select empno 人员编号, ename 姓名, job 职位 from emp where job = 'SALESMAN'
union all
select empno,ename,job from emp where deptno = 10;

------4.用集合查询出部门为10和20的所有人员编号、姓名、所在部门名称。
select e.empno 人员编号, e.ename 姓名, d.dname 部门名称 from emp e, dept d where e.deptno = d.deptno and e.deptno = 10
union
select e.empno 人员编号, e.ename 姓名, d.dname 部门名称 from emp e, dept d where e.deptno = d.deptno and e.deptno = 20; 
