------第七章------
------练习1
------1.查询入职日期最早的员工姓名，入职日期
select ename 员工姓名, hiredate 入职日期
      from emp
     where hiredate = (select min(hiredate) from emp);

------2.查询工资比SMITH工资高并且工作地点在CHICAGO的员工姓名，工资，部门名称
select e.ename 员工姓名,e.sal 工资,d.dname 部门名称
from emp e,dept d
where e.deptno=d.deptno
and e.sal>(select e.sal from emp e where e.ename='SMITH')
and d.loc='CHICAGO'

------3.查询入职日期比20部门入职日期最早的员工还要早的员工姓名，入职日期
select ename 员工姓名,hiredate 入职日期
from emp 
where hiredate<(select min(hiredate) from emp where deptno=20)

------4.查询部门人数大于所有部门平均人数的的部门编号，部门名称，部门人数
select d.deptno 部门编号,d.dname 部门名称,count(1) 部门人数
from emp e,dept d
where e.deptno=d.deptno
group by d.deptno,d.dname
having count(1)>(select avg(count(1) from emp group by deptno)

------练习2
------1.查询入职日期比10部门任意一个员工晚的员工姓名、入职日期，不包括10部门员工
select ename,hiredate
from emp
where hiredate>any(select hiredate from emp where deptno=10)
and deptno<>10

------2.查询入职日期比10部门所有员工晚的员工姓名、入职日期，不包括10部门员工
select ename,hiredate
from emp
where hiredate<any(select hiredate from emp where deptno=10)
and deptno<>10

------3.查询职位和10部门任意一个员工职位相同的员工姓名，职位，不包括10部门员工
select ename,hiredate
from emp
where job =any (select job from emp where deptno=10)
and deptno<>10

------练习3
------1.查询职位及经理和10部门任意一个员工职位及经理相同的员工姓名，职位，不包括10部门员工
select ename 员工姓名, job 职位
from emp
where (job, mgr) in (select job, mgr from emp where deptno = 10)
and deptno <> 10;

------2.查询职位及经理和10部门任意一个员工职位或经理相同的员工姓名，职位，不包括10部门员工
select ename 员工姓名, job 职位
from emp
where (job in( select job from emp where deptno = 10)
       or mgr in (select mgr from emp where deptno = 10))
and deptno <> 10;

------练习4
------1.查询比自己职位平均工资高的员工姓名、职位，部门名称，职位平均工资
select e.ename 员工姓名,e.job 职位,d.dname 部门名称,a.部门平均工资
from emp e,dept d,(select e.job,avg(sal) 部门平均工资 from emp e group by e.job) a
where e.deptno=d.deptno
and e.job=a.job
and e.sal>a.部门平均工资

------2.查询职位和经理同员工SCOTT或BLAKE完全相同的员工姓名、职位，不包括SCOOT和BLAKE本人。
select *
from emp e
where (e.job, e.mgr) in(select e.job, e.mgr from emp e where e.ename in ('SCOTT', 'BLAKE'))
and e.ename not in ('SCOTT', 'BLAKE');

------3.查询不是经理的员工姓名。
select ename 员工姓名
from emp
where empno not in(select distinct mgr from emp where mgr is not null);

------练习5
------1.查询入职日期最早的前5名员工姓名，入职日期。
select rownum,e.ename 员工姓名, e.hiredate 入职日期
from (select ename,hiredate from emp order by hiredate asc) e
where rownum <= 5;
     
------2.查询工作在CHICAGO并且入职日期最早的前2名员工姓名，入职日期。
select rownum, e.ename 员工姓名, e.hiredate 入职日期, e.loc
from (select e.*,d.*
          from emp e, dept d
          where e.deptno = d.deptno
          and d.loc = 'CHICAGO'
          order by hiredate asc) e
where rownum <= 2;


------练习6
------1.按照每页显示5条记录，分别查询第1页，第2页，第3页信息，要求显示员工姓名、入职日期、部门名称。
select e.rn 第1页,e.ename 员工姓名,e.hiredate 入职日期,e.dname 部门名称
from (select rownum rn, e.*, d.*
       from emp e, dept d
       where e.deptno = d.deptno) e
where e.rn <= 5;

select e.rn 第2页,e.ename 员工姓名,e.hiredate 入职日期,e.dname 部门名称
from (select rownum rn, e.*, d.*
        from emp e, dept d
        where e.deptno = d.deptno) e
where e.rn > 5
and rn <= 10;

select e.rn 第3页,e.ename 员工姓名,e.hiredate 入职日期,e.dname 部门名称
from (select rownum rn, e.*, d.*
       from emp e, dept d
       where e.deptno = d.deptno) e
where e.rn > 10
and rn <= 15;

------练习7
------1.按照每页显示5条记录，分别查询工资最高的第1页，第2页，第3页信息，要求显示员工姓名、入职日期、部门名称、工资
select e.rn 第1页, e.ename 员工姓名,e.hiredate 入职日期,e.dname 部门名称,e.sal 工资
from (select rownum rn, ed.*
       from (select e.ename, e.hiredate, d.dname, e.sal
              from emp e, dept d
              where e.deptno = d.deptno
              order by e.sal desc) ed
       where rownum <= 5) e;

select e.rn 第2页,e.ename 员工姓名,e.hiredate 入职日期,e.dname 部门名称,e.sal 工资
from (select rownum rn, ed.*
      from (select e.ename,e.hiredate,d.dname,e.sal
             from emp e, dept d
             where e.deptno = d.deptno
             order by e.sal desc) ed
      where rownum <= 10) e
where e.rn > 5;

select e.rn 第3页,e.ename 员工姓名,e.hiredate 入职日期,e.dname 部门名称,e.sal工资
from (select rownum rn, ed.*
     from (select e.ename,e.hiredate,d.dname,e.sal
            from emp e, dept d
            where e.deptno = d.deptno
            order by e.sal desc) ed
     where rownum <= 15) e
where e.rn > 10;

------课后作业
------1.查询工资高于编号为7782的员工工资，并且和7369号员工从事相同工作的员工的编号、姓名及工资。
select empno 员工编号, ename 姓名, sal 工资
from emp
where sal>(select sal from emp where empno = 7782)
and job=(select job from emp where empno = 7566)
and empno<>7566;

------2.查询工资最高的员工姓名和工资。 
select ename 员工姓名, sal 工资
from emp
where sal=(select max(sal) from emp);

------3.查询部门最低工资高于10号部门最低工资的部门的编号、名称及部门最低工资。 
select emp.deptno 部门编号,dname 部门名称,min(sal) 最低工资   
from emp,dept    
where emp.deptno=dept.deptno  
having min( sal)>(select min(sal) from emp where deptno=10)  
group by emp.deptno,dname;
                        
------4.查询员工工资为其部门最低工资的员工的编号和姓名及工资。
select e.empno 员工编号, e.ename 姓名, e.sal 工资
from emp e join (select deptno,min(sal) 最低工资 from emp group by deptno) a
on e.deptno = a.deptno
where sal = a.最低工资

------5.显示经理是KING的员工姓名，工资。
select e.ename 员工姓名, e.sal 工资
from emp e, emp mgr
where e.mgr = mgr.empno
and mgr.ename = 'KING';

------6.显示比员工SMITH参加工作时间晚的员工姓名，工资，参加工作时间。
select ename 员工姓名,sal 工资,hiredate 参加工作时间
from emp
where hiredate>(select hiredate from emp where ename = 'SMITH')

------7.使用子查询的方式查询哪些职员在NEW YORK工作。
select *
from emp e join dept d
on e.deptno = d.deptno
where loc = (select loc from dept where loc = 'NEW YORK')

------8.写一个查询显示和员工SMITH工作在同一个部门的员工姓名，雇用日期，查询结果中排除SMITH。
select ename 员工姓名,hiredate 雇用日期
from emp
where ename<>'SMITH' and deptno=(select deptno from emp where ename = 'SMITH')

------9.写一个查询显示其工资比全体职员平均工资高的员工编号、姓名。
select empno 员工编号,ename 员工姓名,sal 工资
from emp
where sal >(select avg(sal) from emp)

------10.写一个查询显示其上级领导是King的员工姓名、工资。
select ename 员工姓名,sal 工资
from emp
where mgr=(select empno from emp where ename='KING');
 
------11.显示所有工作在RESEARCH部门的员工姓名，职位。
select ename 员工姓名,job 职位
from emp
where deptno=(select deptno from dept where dname='RESEARCH')

------12.查询每个部门的部门编号、平均工资，要求部门的平均工资高于部门20的平均工资。
------select avg(sal) 平均工资 from emp
------select * from emp
select deptno 部门编号,avg(sal) 平均工资
from emp
having avg(sal)>(select avg(sal) from emp where deptno=20)
group by deptno
 

------13.查询大于自己部门平均工资的员工姓名，工资，所在部门平均工资，高于部门平均工资的额度。工SMITH参加工作时间晚的员工姓名，工资，参加工作时间。
select e.ename 员工姓名,e.sal 工资,ed.avgsal 所在部门平均工资,(e.sal - ed.avgsal) 高与平均工资额度
from emp e,(select deptno, avg(sal) avgsal from emp group by deptno) ed
where e.deptno = ed.deptno
and e.sal > ed.avgsal;

------14. 列出至少有一个雇员的所有部门
select dname 
from dept 
where deptno in(select deptno from emp);

------15. 列出薪金比"SMITH"多的所有雇员
------select * from emp
select ename
from emp
where sal>(select sal from emp where ename='SMITH');

------16. 列出入职日期早于其直接上级的所有雇员
select a.ename
from emp a,emp b
where a.hiredate< b.hiredate
and b.empno=a.mgr;

------17. 找员工姓名和直接上级的名字
select a.ename,b.ename
from emp a,emp b
where a.mgr=b.empno(+);

------18. 显示部门名称和人数
select d.dname 部门名称,count(1) 部门人数
from emp e join dept d
     on e.deptno = d.deptno
group by d.dname

------19. 显示每个部门的最高工资的员工
select deptno 部门编号,ename 员工姓名,sal 工资
from emp
where (deptno,sal) in(select deptno,max(sal)from emp group by deptno)
and deptno is not null

------20. 显示出和员工号7369部门相同的员工姓名，工资
select ename 员工姓名,sal 工资
from emp
where deptno = (select deptno from emp where empno = '7369')

------21. 显示出和姓名中包含"W"的员工相同部门的员工姓名
select ename 员工姓名
from emp
where deptno = (select deptno from emp where ename like '%W%')

------22. 显示出工资大于平均工资的员工姓名，工资
select ename,sal
from emp
where sal>(select avg(sal) from emp);

------23. 显示出工资大于本部门平均工资的员工姓名，工资
select e.ename 员工姓名, e.sal 工资,a.avgsal
from emp e,(select deptno,avg(sal) avgsal from emp group by deptno) a
where e.deptno = a.deptno
and e.sal > a.avgsal;

------24. 显示每位经理管理员工的最低工资，及最低工资者的姓名
select e.sal 最低工资, e.ename 姓名,e.mgr
from emp e
where (e.mgr,e.sal) in (select e.mgr, min(e.sal)
                         from emp e
                         group by e.mgr);
                               
------25. 显示比工资最高的员工参加工作时间晚的员工姓名，参加工作时间
select ename 员工姓名, hiredate 参加工作时间
from emp
where hiredate <(select hiredate
                 from emp
                 where sal = (select max(sal) from emp));

------26. 显示出平均工资最高的的部门平均工资及部门名称
select avg(e.sal) 部门平均工资, d.dname 部门名称
from emp e, dept d
where e.deptno = d.deptno
group by d.deptno,d.dname
having avg(e.sal) = (select max(avg(sal)) from emp group by deptno);


