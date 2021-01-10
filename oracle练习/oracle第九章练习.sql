-------第九章------
-------练习1
-------1.查询比所在职位平均工资高的员工姓名，职位。
select ename 员工姓名,job 职位
from emp e
where sal>(select avg(sal) from emp where deptno=e.deptno)

-------2.查询工资为其部门最低工资的员工编号，姓名，工资。
select empno 员工编号,ename 姓名,sal 工资,deptno 部门编号
from emp e
where sal=(select min(sal) from emp where deptno=e.deptno)

------练习2
------1.查询所有雇员编号，名字和部门名字。
select empno 雇员编号,ename 名字,(select dname from dept where deptno=e.deptno) 部门名字
from emp e

------2.查询哪些员工是经理？
select empno 雇员编号,ename 名字,sal 工资,deptno 部门编号
from emp e
where 0<(select count(1) from emp where mgr=e.empno)

------3.查询哪些员工不是经理？
select empno 雇员编号,ename 名字,sal 工资,deptno 部门编号
from emp e
where 0>(select count(1) from emp where mgr=e.empno)

------4.查询每个部门工资最低的两个员工编号，姓名，工资。
select deptno, ename, sal      
from emp e1     
where (select count(*)     
       from emp e2     
       where e2.deptno=e1.deptno and e2.sal<e1.sal  
       )<2
order by deptno, sal; 

------练习3
------1.列出至少有一个雇员的所有部门名称。
select dname
from dept
where deptno in(select deptno 
                from emp
                group by deptno
                having count(deptno)>=1)

------2.列出一个雇员都没有的所有部门名称。
select dname
from dept d
where not exists (select '1'
                  from emp
                  where deptno=d.deptno)

------课后作业
------1.查询薪水多于他所在部门平均薪水的雇员名字，部门号。
select ename,deptno
from emp e
where sal>(select avg(sal)
           from emp
           where deptno =e.deptno)

------2.查询员工姓名和直接上级的名字。
select a.ename,(select ename
                from emp b
                where b.empno=a.mgr) as boss_name
from emp e;
    
------3.查询每个部门工资最高的员工姓名，工资。
select e.ename 员工姓名, e.sal 工资
from emp e
where sal = (select max(sal)
             from emp
             where deptno = e.deptno);
             
------4.查询每个部门工资前两名高的员工姓名，工资。
select ename,sal,deptno
from emp e
where (select count(empno) from emp 
where deptno =e.deptno and sal>e.sal)<=1 
and sal is not null
