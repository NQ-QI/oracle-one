------��ʮһ��------
------��ϰ1
------1.���ű�����һ�����ţ����ű��Ϊ50����������ΪHR�������ص�ΪSY��
insert into dept values(50,'HR','SY');
select * from dept;

------2.���ű�����һ�����ţ����ű��Ϊ60����������ΪMARKET��
insert into dept values(60,'MARKET','');


------��ϰ2
------1.��Ա����������һ��Ա����Ա�����Ϊ8888������ΪBOB����λΪCLERK������Ϊ��7788����ְ����Ϊ1985-03-03��н��3000������Ͳ���Ϊ�ա�
insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values(8888,'BOB','CLERK',7788,to_date('1985-03-03', 'yyyy-mm-dd'),
       3000, null, null);
select * from emp;


------��ϰ3
------1.ʹ��CREATE TABLE emp_back as 
------SELECT * FROM EMP WHERE 1=0������emp_back��,�����������ɡ�
create table emp_back as select * from emp where 0 = 1;

------2.��emp������ְ���ڴ���1982��1��1��֮ǰ��Ա����Ϣ���Ƶ�emp_back���С�
insert into emp_back 
select * from emp where hiredate < to_date('1982-1-1','yyyy-mm-dd');
select * from emp_back; 


------��ϰ4
------1.�޸Ĳ���20��Ա����Ϣ����82��֮����ְ��Ա����ְ����������10��
update emp set hiredate = hiredate +10 
where deptno = 20 and hiredate > to_date('1982-12-31', 'yyyy-mm-dd');
select * from emp;


------2.�޸Ľ���Ϊnull��Ա������������Ϊ0
update emp set comm = 0 where comm is null;

------3.�޸Ĺ����ص���NEW YORK��CHICAGO��Ա�����ʣ���������500
update emp set sal = sal + 500
where ename in (select e.ename
                from emp e, dept d
                where e.deptno = d.deptno
                and d.loc in ('NEW YORK', 'CHICAGO'));


------��ϰ6
------1.ɾ��������Ϊ7566��Ա����¼
delete from emp
where mgr = 7566;

------2.ɾ��������NEW YORK��Ա����¼
delete from emp e
where exists (select loc 
              from dept 
              where deptno = e.deptno 
              and loc = 'NEW YORK');


------3.ɾ�����ʴ������ڲ���ƽ�����ʵ�Ա����¼
delete from emp e
where sal > (select avg(sal) 
              from emp
              where deptno = e.deptno);


------�κ���ҵ
create table student (        --ѧ����
      xh char(4),--ѧ��
      xm varchar2(10),--����
     sex char(2),--�Ա�
     birthday date,--��������
     sal number(7,2), --��ѧ��
     studentcid number(2) --ѧ���༶��
)
Create table class (   --�༶��
      classid number(2), --�༶���
      cname varchar2(20),--�༶����
        ccount  number(3) --�༶����
)

------��1����������༶��ϢΪ��1��JAVA1�࣬null   2��JAVA2�࣬null   3��JAVA3�࣬null
                         
insert into class values (1,'JAVA1��',null);
insert into class values (2,'JAVA2��',null);
insert into class values (3,'JAVA3��',null);


select * from class

------��2�����ѧ����Ϣ���£���A001��,��������,���С�,��01-5��-05��,100,1
insert into student values ('A001','����','��','01-5��-05',100,1)

select * from student

------��3�����ѧ����Ϣ���£�'A002','MIKE','��','1905-05-06',10
insert into student (xh,xm,sex,birthday,sal) 
values ('A002','MIKE','��','6-5��-1905',10);

------��4�����벿��ѧ����Ϣ�� 'A003','JOHN','Ů��
insert into student (xh,xm,sex)
values ('A003','JOHN','Ů')

-----ɾ��
(delete from student
where xh='A003')

------��5����A001ѧ���Ա��޸�Ϊ'Ů��
update student
set sex = 'Ů'
where xh = 'A001'

------��6����A001ѧ����Ϣ�޸����£��Ա�Ϊ�У���������Ϊ1980-04-01
update student
set sex = '��',birthday = '1-4��-1980'
where xh = 'A001'

------��7��������Ϊ�յ�ѧ���༶�޸�ΪJava3��
update student set studentcid = 3 
where birthday is null;

------��8����ʹ��һ��SQL��䣬ʹ���Ӳ�ѯ�����°༶����ÿ���༶�������ֶ�
update class c set 
       c.ccount = (select count(xh) from student where studentcid = c.classid)
       
       
       
------3.ʹ��������䣬�������±�
CREATE TABLE copy_emp   (
  empno number(4),
  ename varchar2(20),
  hiredate date default sysdate ,
  deptno number(2),
  sal number(8,2))

select * from copy_emp

------4.�ڵ������Ļ����ϣ������������
------(1)�ڱ�copy_emp�в������ݣ�Ҫ��sal�ֶβ����ֵ�����ź�50���μӹ���ʱ��Ϊ2000��1��1�գ������ֶ�����
insert into copy_emp (empno,ename,hiredate,deptno,sal) 
values (1234, 'one', '1-1��-2000', 50, null);
        
------(2)�ڱ�copy_emp�в������ݣ�Ҫ���emp���в��ź�Ϊ10�Ų��ŵ�Ա����Ϣ����
insert into copy_emp select empno,ename,hiredate,deptno,
sal from emp 
where deptno = 10;

------(3)�޸�copy_emp�������ݣ�Ҫ��10�Ų�������Ա����20%�Ĺ���
update copy_emp
set sal=sal*1.2
where deptno=10

------(4)�޸�copy_emp����salΪ�յļ�¼�������޸�Ϊƽ������
update copy_emp
set sal=(select avg(sal) from copy_emp)
where sal is null;

------(5)�ѹ���Ϊƽ�����ʵ�Ա���������޸�Ϊ��
update copy_emp set sal = null 
where sal = (select avg(sal) from copy_emp);

------(6)����򿪴���2�鿴�����޸�


------(7)ִ��commit������2���ٴβ鿴������Ϣ
commit;

------(8)ɾ������Ϊ�յ�Ա����Ϣ
delete from copy_emp sal where sal is null;

------(9)ִ��rollback
rollback; 
