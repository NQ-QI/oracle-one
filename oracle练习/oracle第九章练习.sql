-------�ھ���------
-------��ϰ1
-------1.��ѯ������ְλƽ�����ʸߵ�Ա��������ְλ��
select ename Ա������,job ְλ
from emp e
where sal>(select avg(sal) from emp where deptno=e.deptno)

-------2.��ѯ����Ϊ�䲿����͹��ʵ�Ա����ţ����������ʡ�
select empno Ա�����,ename ����,sal ����,deptno ���ű��
from emp e
where sal=(select min(sal) from emp where deptno=e.deptno)

------��ϰ2
------1.��ѯ���й�Ա��ţ����ֺͲ������֡�
select empno ��Ա���,ename ����,(select dname from dept where deptno=e.deptno) ��������
from emp e

------2.��ѯ��ЩԱ���Ǿ���
select empno ��Ա���,ename ����,sal ����,deptno ���ű��
from emp e
where 0<(select count(1) from emp where mgr=e.empno)

------3.��ѯ��ЩԱ�����Ǿ���
select empno ��Ա���,ename ����,sal ����,deptno ���ű��
from emp e
where 0>(select count(1) from emp where mgr=e.empno)

------4.��ѯÿ�����Ź�����͵�����Ա����ţ����������ʡ�
select deptno, ename, sal      
from emp e1     
where (select count(*)     
       from emp e2     
       where e2.deptno=e1.deptno and e2.sal<e1.sal  
       )<2
order by deptno, sal; 

------��ϰ3
------1.�г�������һ����Ա�����в������ơ�
select dname
from dept
where deptno in(select deptno 
                from emp
                group by deptno
                having count(deptno)>=1)

------2.�г�һ����Ա��û�е����в������ơ�
select dname
from dept d
where not exists (select '1'
                  from emp
                  where deptno=d.deptno)

------�κ���ҵ
------1.��ѯнˮ���������ڲ���ƽ��нˮ�Ĺ�Ա���֣����źš�
select ename,deptno
from emp e
where sal>(select avg(sal)
           from emp
           where deptno =e.deptno)

------2.��ѯԱ��������ֱ���ϼ������֡�
select a.ename,(select ename
                from emp b
                where b.empno=a.mgr) as boss_name
from emp e;
    
------3.��ѯÿ�����Ź�����ߵ�Ա�����������ʡ�
select e.ename Ա������, e.sal ����
from emp e
where sal = (select max(sal)
             from emp
             where deptno = e.deptno);
             
------4.��ѯÿ�����Ź���ǰ�����ߵ�Ա�����������ʡ�
select ename,sal,deptno
from emp e
where (select count(empno) from emp 
where deptno =e.deptno and sal>e.sal)<=1 
and sal is not null
