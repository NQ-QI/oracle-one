------第五章------
------练习1
------1.写一个查询，显示所有员工姓名，部门编号，部门名称。
select e.ename,d.deptno,d.dname
from emp e join dept d
     on e.deptno=d.deptno
     
------2.写一个查询，显示所有工作在CHICAGO并且奖金不为空的员工姓名，工作地点，奖金
select e.ename,e.comm,d.loc
from emp e join dept d
      on e.deptno=d.deptno
where  e.comm <> 0;

------3.写一个查询，显示所有姓名中含有A字符的员工姓名，工作地点。
select e.ename,d.loc
from emp e join dept d
     on e.deptno=d.deptno
where e.ename like'%A%'

------练习2
------1.查询每个员工的编号，姓名，工资，工资等级，所在工作城市，按照工资等级进行升序排序。
select e.empno,e.ename,e.sal,s.grade,d.loc
from emp e,dept d,salgrade s
where e.deptno=d.deptno and e.sal between s.losal and s.hisal
order by grade

------自身连接
------思考：查询每个员工的姓名和直接上级姓名？
select worker.ename,boss.ename 上级姓名
from emp worker,emp boss
where worker.mgr=boss.empno


------练习3
------1.查询所有工作在NEW YORK和CHICAGO的员工姓名，员工编号，以及他们的经理姓名，经理编号。
select e.empno,e.ename,boss.empno,boss.ename
from emp e,emp boss,dept d
where e.mgr = boss.empno
and e.deptno = d.deptno
and d.loc in('NEW YORK','CHICAGO');


------2.第上一题的基础上，添加没有经理的员工King，并按照员工编号排序。
select e.empno,e.ename,boss.empno,boss.ename
from emp e,emp boss,dept d
where e.mgr = boss.empno(+)
and e.deptno = d.deptno
and d.loc in('NEW YORK','CHICAGO');

------3.查询所有员工编号，姓名，部门名称，包括没有部门的员工也要显示出来。
select * from dept
select e.empno,e.ename,d.deptno
from emp e,dept d
where e.deptno=d.deptno 


------练习4
------使用SQL-99写法，完成如下练习
------1.创建一个员工表和部门表的交叉连接。
select emp.empno,emp.ename,emp.sal,emp.deptno,dept.dname
from emp cross join dept

------2.使用自然连接，显示入职日期在80年5月1日之后的员工姓名，部门名称，入职日期
select * from salgrade
select empno,ename,hiredate
from emp
natural join  dept
where hiredate<to_date('80-5-1','yy-MM-dd');

------3.使用USING子句，显示工作在CHICAGO的员工姓名，部门名称，工作地点
select e.ename,d.dname,d.loc
from emp e join dept d using (deptno)
where loc = 'CHICAGO'

------4.使用ON子句，显示工作在CHICAGO的员工姓名，部门名称，工作地点，薪资等级
select e.ename 员工姓名,d.dname 部门名称,d.loc 工作地点,s.grade 薪资等级
from emp e,dept d,salgrade s
where e.deptno=d.deptno
and e.sal between s.losal
and s.hisal

------5.使用左连接，查询每个员工的姓名，经理姓名，没有经理的King也要显示出来。
select e.ename,m.ename  "经理名字"
from emp e left outer join emp m 
     on e.mgr=m.empno;

------6.使用右连接，查询每个员工的姓名，经理姓名，没有经理的King也要显示出来。
select e.ename,m.ename "经理名字"
from emp m right outer join emp e 
     on m.mgr=e.empno;


------课后作业
------1.显示员工SMITH的姓名，部门名称，直接上级名称
select e.ename,d.dname,m.ename
from emp e join  dept d 
     on e.deptno=d.deptno
     join emp m 
     on e.mgr=m.empno;

------2.显示员工姓名，部门名称，工资，工资级别，要求工资级别大于4级。
select  e.ename "员工姓名",dname "部门名称",e.sal "工资",s.grade "工资级别"
from emp e, dept d,salgrade s
where e.deptno=d.deptno
and e.sal between s.losal
and s.hisal
and s.grade>4

------3.显示员工KING和FORD管理的员工姓名及其经理姓名。
select e.ename "员工姓名",m.ename "经理姓名"
from emp e,emp m
where e.mgr=m.empno
and m.ename in('KING','FORD'); 

------4.显示员工姓名，参加工作时间，经理名，参加工作时间，要求参加时间比经理早。
select e.ename "员工姓名", e.hiredate "参加工作时间" ,m.ename "经理姓名", m.hiredate "经理参加工作时间"
from emp e,emp m
where e.mgr=m.empno
and e.hiredate< m.hiredate;
