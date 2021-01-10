------第十五章------
------练习1
-----1.创建一个视图，通过该视图可以查询到工资在2000-5000内并且姓名中包含有A的员工编号，姓名，工资。
create view sal2 as select empno 员工编号,ename 姓名,sal 工资
from emp
where sal between 2000 and 5000
and ename like '%A%';

----2.通过上述创建的视图查询数据
select * from sal2; 



------练习2
-----1.创建一个视图，通过该视图可以查询到工作在NEW YORK和CHICAGO的员工编号，姓名，部门编号，入职日期。
create or replace view dept_loc_ve (员工编号, 姓名, 部门编号, 入职日期)
        as select e.empno, e.ename, e.deptno, e.hiredate
from emp e, dept d
where e.deptno = d.deptno and d.loc 
in ('NEW YORK', 'CHICAGO');

select * from dept_loc_ve;

-----2.创建一个视图，通过该视图可以查询到每个部门的部门名称及最低工资。
create or replace view dept_minsal_ve(部门名称， 最低工资)
        as select d.dname, min(nvl(e.sal, 0))
from emp e, dept d
where e.deptno(+) = d.deptno
group by d.dname;

select * from dept_minsal_ve;
            
-----3.通过如上视图，查询每个部门工资最低的员工姓名及部门名称
select e.ename 姓名, m.部门名称 
from emp e, dept_minsal_ve m, dept d
where e.deptno = d.deptno
and d.dname = m.部门名称
and m.最低工资 = e.sal;



------课后作业
-----1.创建视图v_emp_20，包含20号部门的员工编号，姓名，年薪列(年薪=12*(工资+奖金）；
create or replace view v_emp20
        as select empno,ename,12*(nvl(sal,0)+nvl(comm,0)) 年薪
from emp;

select * from v_emp20;

-----2.从视图v_emp_20中查询年薪大于1万元员工的信息；
select * from v_emp20 where 年薪 > 10000;

-----3.请为工资大于2000的员工创建视图，要求显示员工的部门信息，职位信息，工作地点；
create or replace view sal2_ve
        as select e.deptno,e.job,d.loc
from emp e,dept d
where e.deptno = d.deptno;

select * from sal2_ve;

-----4.针对以上视图执行insert,update,delete,语句能否成功，为什么？
----v_emp20 视图执行操作
insert into v_emp20 values (1214,'小明',2000);--不可以 不允许虚拟列
update v_emp20 set empno = 1214 where empno = 1234; --可以
delete v_emp20;--可以

----sal2_ve 视图执行操作
insert into sal2_ve values (12,'小火','北京');--不可以 无法通过联接视图修改多个基表
update sal2_ve set deptno = 20 where deptno = 10; --可以
delete sal2_ve;--可以
