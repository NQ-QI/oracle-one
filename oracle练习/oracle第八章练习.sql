-----�ڰ���-------
------��ϰ1
------1.�ֱ�ʹ���������㼰��ȫ����������ɣ�����ʱ������˳�򣬲�ѯԱ��7839�Ĺ�����λ�б�
------union
select job ������λ�б�, hiredate from emp where empno = 7839
union
select job, begindate from emp_jobhistory ej where empno = 7839 
order by hiredate;

------union all
select job ������λ�б�, hiredate from emp where empno = 7839
union all
select job, begindate from emp_jobhistory ej where empno = 7839 
order by hiredate; 
    
------2.ʹ�ö�����ӣ���ѯÿ�����ŵĲ��ű�ţ�����������û�������Ĳ�����ʾ0��
select d.deptno ���ű��, nvl (count(e.ename), 0) ��������
from emp e, dept d
where e.deptno(+) = d.deptno
group by d.deptno;
       
------3.ʹ���������㣬��ѯÿ�����ŵĲ��ű�ţ�����������û�������Ĳ�����ʾ0��
select d.deptno ���ű��, count(e.ename) �������� from emp e, dept d where e.deptno = d.deptno group by d.deptno
union
select deptno, 0 from dept where deptno not in (select distinct deptno from emp where deptno is not null);

------4.ʹ���������㣬��ѯ10�Ų��ż�20�Ų��ŵ�Ա�����������ű�š�
select e.ename Ա������, e.deptno ���ű�� from emp e where deptno = 10
union
select e.ename,e.deptno from emp e where deptno = 20;

------5
select d.deptno ����, null, e.ename Ա������, e.hiredate ��ְ���� from emp e, dept d where e.deptno = d.deptno
union
select deptno,loc,null,null from dept;
   
------�κ���ҵ
------1.�ü������㣬�г�������jobΪSALESMAN �Ĳ��ŵĲ��źš�
select deptno from dept
minus
select deptno from emp where job = 'SALESMAN';

------2.дһ�����ϲ�ѯ���г��������Ϣ��
------EMP�������й�Ա�����ֺͲ��ű��,���������Ƿ������κβ��š�
------DEPT���е����в��ű�źͲ������ƣ����������Ƿ���Ա����
select ename ��Ա����, deptno ���ű��, null �������� from emp
union
select null , deptno, dname from dept d order by ���ű�� desc;

------3.�ü��������ѯ��ְλΪSALESMAN�Ͳ��ű��Ϊ10����Ա��š�������ְλ�����ų��ظ������
select empno ��Ա���, ename ����, job ְλ from emp where job = 'SALESMAN'
union all
select empno,ename,job from emp where deptno = 10;

------4.�ü��ϲ�ѯ������Ϊ10��20��������Ա��š����������ڲ������ơ�
select e.empno ��Ա���, e.ename ����, d.dname �������� from emp e, dept d where e.deptno = d.deptno and e.deptno = 10
union
select e.empno ��Ա���, e.ename ����, d.dname �������� from emp e, dept d where e.deptno = d.deptno and e.deptno = 20; 
