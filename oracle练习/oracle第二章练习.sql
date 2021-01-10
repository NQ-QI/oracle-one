------第二章------
------练习1
------1.使用两种方式查询所有员工(EMP)信息
select * from emp;

select empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp;

------2.查询(EMP)员工编号、员工姓名、员工职位、员工月薪、工作部门编号。
select empno,ename,job,sal,deptno
from emp;

------练习2
------1.员工转正后，月薪上调20%，请查询出所有员工转正后的月薪。
select ename,sal+(sal*0.2)
from emp;

------2.员工试用期6个月，转正后月薪上调20%，请查询出所有员工工作第一年的年薪所得（不考虑奖金部分,年薪的试用期6个月的月薪+转正后6个月的月薪)
select ename,sal*6+(sal*1.2)*6
from emp;

------练习3
------1.员工试用期6个月，转正后月薪上调20%，请查询出所有员工工作第一年的所有收入（需考虑奖金部分)，要求显示列标题为员工姓名，工资收入，奖金收入，总收入。
select ename "员工名字",sal "工资收入",comm "奖金收入",sal*6+(sal*1.2)*6+comm*12 "总收入"
from emp;

------练习4
------1.员工试用期6个月，转正后月薪上调20%，请查询出所有员工工作第一年的所有收入（需考虑奖金部分)，要求显示格式为:XXX的第一年总收入为XXX。
select ename  || '的第一年总收入为' || (sal*6+(sal*1.2)*6+comm*12) 
from emp;

------2.查询员工表中一共有哪几种岗位类型。
select distinct job
from emp;

------课后作业
------1.分别选择员工表、部门表、薪资等级表中的所有数据。
select * from emp;
select * from dept;
select * from salgrade;
