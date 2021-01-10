------������------
------��ϰ1
------1.��ѯ��ְ���������Ա����������ְ����
select ename Ա������, hiredate ��ְ����
      from emp
     where hiredate = (select min(hiredate) from emp);

------2.��ѯ���ʱ�SMITH���ʸ߲��ҹ����ص���CHICAGO��Ա�����������ʣ���������
select e.ename Ա������,e.sal ����,d.dname ��������
from emp e,dept d
where e.deptno=d.deptno
and e.sal>(select e.sal from emp e where e.ename='SMITH')
and d.loc='CHICAGO'

------3.��ѯ��ְ���ڱ�20������ְ���������Ա����Ҫ���Ա����������ְ����
select ename Ա������,hiredate ��ְ����
from emp 
where hiredate<(select min(hiredate) from emp where deptno=20)

------4.��ѯ���������������в���ƽ�������ĵĲ��ű�ţ��������ƣ���������
select d.deptno ���ű��,d.dname ��������,count(1) ��������
from emp e,dept d
where e.deptno=d.deptno
group by d.deptno,d.dname
having count(1)>(select avg(count(1) from emp group by deptno)

------��ϰ2
------1.��ѯ��ְ���ڱ�10��������һ��Ա�����Ա����������ְ���ڣ�������10����Ա��
select ename,hiredate
from emp
where hiredate>any(select hiredate from emp where deptno=10)
and deptno<>10

------2.��ѯ��ְ���ڱ�10��������Ա�����Ա����������ְ���ڣ�������10����Ա��
select ename,hiredate
from emp
where hiredate<any(select hiredate from emp where deptno=10)
and deptno<>10

------3.��ѯְλ��10��������һ��Ա��ְλ��ͬ��Ա��������ְλ��������10����Ա��
select ename,hiredate
from emp
where job =any (select job from emp where deptno=10)
and deptno<>10

------��ϰ3
------1.��ѯְλ�������10��������һ��Ա��ְλ��������ͬ��Ա��������ְλ��������10����Ա��
select ename Ա������, job ְλ
from emp
where (job, mgr) in (select job, mgr from emp where deptno = 10)
and deptno <> 10;

------2.��ѯְλ�������10��������һ��Ա��ְλ������ͬ��Ա��������ְλ��������10����Ա��
select ename Ա������, job ְλ
from emp
where (job in( select job from emp where deptno = 10)
       or mgr in (select mgr from emp where deptno = 10))
and deptno <> 10;

------��ϰ4
------1.��ѯ���Լ�ְλƽ�����ʸߵ�Ա��������ְλ���������ƣ�ְλƽ������
select e.ename Ա������,e.job ְλ,d.dname ��������,a.����ƽ������
from emp e,dept d,(select e.job,avg(sal) ����ƽ������ from emp e group by e.job) a
where e.deptno=d.deptno
and e.job=a.job
and e.sal>a.����ƽ������

------2.��ѯְλ�;���ͬԱ��SCOTT��BLAKE��ȫ��ͬ��Ա��������ְλ��������SCOOT��BLAKE���ˡ�
select *
from emp e
where (e.job, e.mgr) in(select e.job, e.mgr from emp e where e.ename in ('SCOTT', 'BLAKE'))
and e.ename not in ('SCOTT', 'BLAKE');

------3.��ѯ���Ǿ����Ա��������
select ename Ա������
from emp
where empno not in(select distinct mgr from emp where mgr is not null);

------��ϰ5
------1.��ѯ��ְ���������ǰ5��Ա����������ְ���ڡ�
select rownum,e.ename Ա������, e.hiredate ��ְ����
from (select ename,hiredate from emp order by hiredate asc) e
where rownum <= 5;
     
------2.��ѯ������CHICAGO������ְ���������ǰ2��Ա����������ְ���ڡ�
select rownum, e.ename Ա������, e.hiredate ��ְ����, e.loc
from (select e.*,d.*
          from emp e, dept d
          where e.deptno = d.deptno
          and d.loc = 'CHICAGO'
          order by hiredate asc) e
where rownum <= 2;


------��ϰ6
------1.����ÿҳ��ʾ5����¼���ֱ��ѯ��1ҳ����2ҳ����3ҳ��Ϣ��Ҫ����ʾԱ����������ְ���ڡ��������ơ�
select e.rn ��1ҳ,e.ename Ա������,e.hiredate ��ְ����,e.dname ��������
from (select rownum rn, e.*, d.*
       from emp e, dept d
       where e.deptno = d.deptno) e
where e.rn <= 5;

select e.rn ��2ҳ,e.ename Ա������,e.hiredate ��ְ����,e.dname ��������
from (select rownum rn, e.*, d.*
        from emp e, dept d
        where e.deptno = d.deptno) e
where e.rn > 5
and rn <= 10;

select e.rn ��3ҳ,e.ename Ա������,e.hiredate ��ְ����,e.dname ��������
from (select rownum rn, e.*, d.*
       from emp e, dept d
       where e.deptno = d.deptno) e
where e.rn > 10
and rn <= 15;

------��ϰ7
------1.����ÿҳ��ʾ5����¼���ֱ��ѯ������ߵĵ�1ҳ����2ҳ����3ҳ��Ϣ��Ҫ����ʾԱ����������ְ���ڡ��������ơ�����
select e.rn ��1ҳ, e.ename Ա������,e.hiredate ��ְ����,e.dname ��������,e.sal ����
from (select rownum rn, ed.*
       from (select e.ename, e.hiredate, d.dname, e.sal
              from emp e, dept d
              where e.deptno = d.deptno
              order by e.sal desc) ed
       where rownum <= 5) e;

select e.rn ��2ҳ,e.ename Ա������,e.hiredate ��ְ����,e.dname ��������,e.sal ����
from (select rownum rn, ed.*
      from (select e.ename,e.hiredate,d.dname,e.sal
             from emp e, dept d
             where e.deptno = d.deptno
             order by e.sal desc) ed
      where rownum <= 10) e
where e.rn > 5;

select e.rn ��3ҳ,e.ename Ա������,e.hiredate ��ְ����,e.dname ��������,e.sal����
from (select rownum rn, ed.*
     from (select e.ename,e.hiredate,d.dname,e.sal
            from emp e, dept d
            where e.deptno = d.deptno
            order by e.sal desc) ed
     where rownum <= 15) e
where e.rn > 10;

------�κ���ҵ
------1.��ѯ���ʸ��ڱ��Ϊ7782��Ա�����ʣ����Һ�7369��Ա��������ͬ������Ա���ı�š����������ʡ�
select empno Ա�����, ename ����, sal ����
from emp
where sal>(select sal from emp where empno = 7782)
and job=(select job from emp where empno = 7566)
and empno<>7566;

------2.��ѯ������ߵ�Ա�������͹��ʡ� 
select ename Ա������, sal ����
from emp
where sal=(select max(sal) from emp);

------3.��ѯ������͹��ʸ���10�Ų�����͹��ʵĲ��ŵı�š����Ƽ�������͹��ʡ� 
select emp.deptno ���ű��,dname ��������,min(sal) ��͹���   
from emp,dept    
where emp.deptno=dept.deptno  
having min( sal)>(select min(sal) from emp where deptno=10)  
group by emp.deptno,dname;
                        
------4.��ѯԱ������Ϊ�䲿����͹��ʵ�Ա���ı�ź����������ʡ�
select e.empno Ա�����, e.ename ����, e.sal ����
from emp e join (select deptno,min(sal) ��͹��� from emp group by deptno) a
on e.deptno = a.deptno
where sal = a.��͹���

------5.��ʾ������KING��Ա�����������ʡ�
select e.ename Ա������, e.sal ����
from emp e, emp mgr
where e.mgr = mgr.empno
and mgr.ename = 'KING';

------6.��ʾ��Ա��SMITH�μӹ���ʱ�����Ա�����������ʣ��μӹ���ʱ�䡣
select ename Ա������,sal ����,hiredate �μӹ���ʱ��
from emp
where hiredate>(select hiredate from emp where ename = 'SMITH')

------7.ʹ���Ӳ�ѯ�ķ�ʽ��ѯ��ЩְԱ��NEW YORK������
select *
from emp e join dept d
on e.deptno = d.deptno
where loc = (select loc from dept where loc = 'NEW YORK')

------8.дһ����ѯ��ʾ��Ա��SMITH������ͬһ�����ŵ�Ա���������������ڣ���ѯ������ų�SMITH��
select ename Ա������,hiredate ��������
from emp
where ename<>'SMITH' and deptno=(select deptno from emp where ename = 'SMITH')

------9.дһ����ѯ��ʾ�乤�ʱ�ȫ��ְԱƽ�����ʸߵ�Ա����š�������
select empno Ա�����,ename Ա������,sal ����
from emp
where sal >(select avg(sal) from emp)

------10.дһ����ѯ��ʾ���ϼ��쵼��King��Ա�����������ʡ�
select ename Ա������,sal ����
from emp
where mgr=(select empno from emp where ename='KING');
 
------11.��ʾ���й�����RESEARCH���ŵ�Ա��������ְλ��
select ename Ա������,job ְλ
from emp
where deptno=(select deptno from dept where dname='RESEARCH')

------12.��ѯÿ�����ŵĲ��ű�š�ƽ�����ʣ�Ҫ���ŵ�ƽ�����ʸ��ڲ���20��ƽ�����ʡ�
------select avg(sal) ƽ������ from emp
------select * from emp
select deptno ���ű��,avg(sal) ƽ������
from emp
having avg(sal)>(select avg(sal) from emp where deptno=20)
group by deptno
 

------13.��ѯ�����Լ�����ƽ�����ʵ�Ա�����������ʣ����ڲ���ƽ�����ʣ����ڲ���ƽ�����ʵĶ�ȡ���SMITH�μӹ���ʱ�����Ա�����������ʣ��μӹ���ʱ�䡣
select e.ename Ա������,e.sal ����,ed.avgsal ���ڲ���ƽ������,(e.sal - ed.avgsal) ����ƽ�����ʶ��
from emp e,(select deptno, avg(sal) avgsal from emp group by deptno) ed
where e.deptno = ed.deptno
and e.sal > ed.avgsal;

------14. �г�������һ����Ա�����в���
select dname 
from dept 
where deptno in(select deptno from emp);

------15. �г�н���"SMITH"������й�Ա
------select * from emp
select ename
from emp
where sal>(select sal from emp where ename='SMITH');

------16. �г���ְ����������ֱ���ϼ������й�Ա
select a.ename
from emp a,emp b
where a.hiredate< b.hiredate
and b.empno=a.mgr;

------17. ��Ա��������ֱ���ϼ�������
select a.ename,b.ename
from emp a,emp b
where a.mgr=b.empno(+);

------18. ��ʾ�������ƺ�����
select d.dname ��������,count(1) ��������
from emp e join dept d
     on e.deptno = d.deptno
group by d.dname

------19. ��ʾÿ�����ŵ���߹��ʵ�Ա��
select deptno ���ű��,ename Ա������,sal ����
from emp
where (deptno,sal) in(select deptno,max(sal)from emp group by deptno)
and deptno is not null

------20. ��ʾ����Ա����7369������ͬ��Ա������������
select ename Ա������,sal ����
from emp
where deptno = (select deptno from emp where empno = '7369')

------21. ��ʾ���������а���"W"��Ա����ͬ���ŵ�Ա������
select ename Ա������
from emp
where deptno = (select deptno from emp where ename like '%W%')

------22. ��ʾ�����ʴ���ƽ�����ʵ�Ա������������
select ename,sal
from emp
where sal>(select avg(sal) from emp);

------23. ��ʾ�����ʴ��ڱ�����ƽ�����ʵ�Ա������������
select e.ename Ա������, e.sal ����,a.avgsal
from emp e,(select deptno,avg(sal) avgsal from emp group by deptno) a
where e.deptno = a.deptno
and e.sal > a.avgsal;

------24. ��ʾÿλ�������Ա������͹��ʣ�����͹����ߵ�����
select e.sal ��͹���, e.ename ����,e.mgr
from emp e
where (e.mgr,e.sal) in (select e.mgr, min(e.sal)
                         from emp e
                         group by e.mgr);
                               
------25. ��ʾ�ȹ�����ߵ�Ա���μӹ���ʱ�����Ա���������μӹ���ʱ��
select ename Ա������, hiredate �μӹ���ʱ��
from emp
where hiredate <(select hiredate
                 from emp
                 where sal = (select max(sal) from emp));

------26. ��ʾ��ƽ��������ߵĵĲ���ƽ�����ʼ���������
select avg(e.sal) ����ƽ������, d.dname ��������
from emp e, dept d
where e.deptno = d.deptno
group by d.deptno,d.dname
having avg(e.sal) = (select max(avg(sal)) from emp group by deptno);


