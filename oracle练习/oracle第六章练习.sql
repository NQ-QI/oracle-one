-------第六章------
-------练习1
-------1.查询部门20的员工，每个月的工资总和及平均工资。
select sum(sal) 工资总和,avg(sal) 平均工资
from emp
where deptno = 20
-------2.查询工作在CHICAGO的员工人数，最高工资及最低工资。
select max(sal) 最高工资,min(sal) 最低工资
from emp e,dept d
where e.deptno=d.deptno
and d.loc in('CHICAGO')
-------3.查询员工表中一共有几种岗位类型。
select * from emp
select count(distinct job)
from emp

------练习2
------1.查询每个部门的部门编号，部门名称，部门人数，最高工资，最低工资，工资总和，平均工资。
select d.deptno 部门编号,d.dname 部门名称,count(e.empno) 门人数,max(sal) 最高工资,min(sal) 最低工资,sum(e.sal) 工资总和,avg(sal)平均工资
from emp e, dept d
where e.deptno=d.deptno
group by d.deptno,d.dname

------2.查询每个部门，每个岗位的部门编号，部门名称，岗位名称，部门人数，最高工资，最低工资，工资总和，平均工资。
select d.deptno,d.dname,e.job,count(e.empno),max(sal),min(sal),avg(sal),sum(sal)
from emp e,dept d
where e.deptno=d.deptno
group by d.deptno,d.dname,e.job;

------3.查询每个经理所管理的人数，经理编号，经理姓名，要求包括没有经理的人员信息。
select count(a.empno) 经理所管理的人数,b.empno 经理编号,b.ename 经理姓名
from emp a left join emp b 
     on a.mgr=b.empno
group by b.empno，b.ename

------练习3
------1.查询部门人数大于2的部门编号，部门名称，部门人数。
select e.deptno 部门编号,d.dname 部门名称,count(dname) 部门人数
from emp e,dept d
where e.deptno=d.deptno
group by e.deptno,d.dname
having count(ename)>2

------2.查询部门平均工资大于2000，且人数大于2的部门编号，部门名称，部门人数，部门平均工资，并按照部门人数升序排序
select e.deptno 部门编号,d.dname 部门名称,count(dname) 部门人数,avg(sal) 部门平均工资
from emp e,dept d
where e.deptno=d.deptno
group by e.deptno,d.dname
having avg(sal)>2000 and count(ename)>2
order by count(e.empno) asc;

------课后作业
------1.查询部门平均工资在2500元以上的部门名称及平均工资。
select d.dname,d.deptno,avg(sal)
from dept d,emp e
where d.deptno=e.deptno
group by d.deptno,d.dname
having avg(sal)>2500;

------2.查询员工岗位中不是以“SA”开头并且平均工资在2500元以上的岗位及平均工资，并按平均工资降序排序。
select e.job,avg(e.sal)
from emp e
where e.job not like 'SA%'
group by e.job
having avg(e.sal)>2500
order by avg(e.sal) desc;

------3.查询部门人数在2人以上的部门名称、最低工资、最高工资,并对求得的工资进行四舍五入到整数位。
select d.dname,round(min(e.sal),0),round(max(e.sal),0)
from emp e,dept d
where e.deptno=d.deptno
group by d.dname
having count(e.empno)>2

------4.查询岗位不为SALESMAN，工资和大于等于2500的岗位及每种岗位的工资和。 
select job,sum(sal)
from emp
where job<>'salesman'
group by job
having sum(sal)>=2500;

------5.显示经理号码和经理姓名，这个经理所管理员工的最低工资，没有经理的KING也要显示，不包括最低工资小于3000的，按最低工资由高到低排序。
select m.empno,m.ename,min(e.sal)
from emp e left join emp m
on e.mgr = m.empno
group by m.empno,m.ename,m.mgr 
having min(e.sal)>=3000
order by min(e.sal) desc

------6.写一个查询，显示每个部门最高工资和最低工资的差额。
select max(sal),min(sal),deptno
from emp
group by deptno
