-------第十章------
-------课后作业
-------1.产生一个报告显示 BLAKE的所有下级（包括直接和间接下级）雇员的名字、薪水和部门号。
select ename 雇员名字,sal 薪水,deptno 部门号
from emp
start with ename = 'BLAKE'
connect by prior empno = mgr; 

-------2.创建一个报告显示对于雇员 SMITH 经理的层次，包括级别和姓名，首先显示他的直接经理。
select level 级别, ename 姓名
from emp
where ename <> 'SMITH'
start with ename = 'SMITH'
connect by prior mgr = empno;

-------3.创建一个缩进报告显示经理层次，从名字为 KING的雇员开始，显示雇员的名字、经理ID和部门ID。
select lpad(ename, length(ename) + level * 2, '-') 雇员姓名,
lpad(mgr, length(mgr) + level * 2, '-') 经理ID,deptno 部门ID
from emp
start with ename = 'KING'
connect by prior empno = mgr;

-------4.产生一个公司组织图表显示经理层次。从最顶级的人开始，排除所有job为CLERK的人，还要排除FORD和那些对FORD报告的雇员。
select lpad(ename, length(ename) + level * 2, '-')
from emp
where job <> 'CLERK'
start with ename = 'KING'
connect by prior empno = mgr
and ename <> 'FORD';
