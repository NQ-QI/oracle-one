-------������------
-------��ϰ1
-------1.��ѯ����20��Ա����ÿ���µĹ����ܺͼ�ƽ�����ʡ�
select sum(sal) �����ܺ�,avg(sal) ƽ������
from emp
where deptno = 20
-------2.��ѯ������CHICAGO��Ա����������߹��ʼ���͹��ʡ�
select max(sal) ��߹���,min(sal) ��͹���
from emp e,dept d
where e.deptno=d.deptno
and d.loc in('CHICAGO')
-------3.��ѯԱ������һ���м��ָ�λ���͡�
select * from emp
select count(distinct job)
from emp

------��ϰ2
------1.��ѯÿ�����ŵĲ��ű�ţ��������ƣ�������������߹��ʣ���͹��ʣ������ܺͣ�ƽ�����ʡ�
select d.deptno ���ű��,d.dname ��������,count(e.empno) ������,max(sal) ��߹���,min(sal) ��͹���,sum(e.sal) �����ܺ�,avg(sal)ƽ������
from emp e, dept d
where e.deptno=d.deptno
group by d.deptno,d.dname

------2.��ѯÿ�����ţ�ÿ����λ�Ĳ��ű�ţ��������ƣ���λ���ƣ�������������߹��ʣ���͹��ʣ������ܺͣ�ƽ�����ʡ�
select d.deptno,d.dname,e.job,count(e.empno),max(sal),min(sal),avg(sal),sum(sal)
from emp e,dept d
where e.deptno=d.deptno
group by d.deptno,d.dname,e.job;

------3.��ѯÿ������������������������ţ�����������Ҫ�����û�о������Ա��Ϣ��
select count(a.empno) ���������������,b.empno ������,b.ename ��������
from emp a left join emp b 
     on a.mgr=b.empno
group by b.empno��b.ename

------��ϰ3
------1.��ѯ������������2�Ĳ��ű�ţ��������ƣ�����������
select e.deptno ���ű��,d.dname ��������,count(dname) ��������
from emp e,dept d
where e.deptno=d.deptno
group by e.deptno,d.dname
having count(ename)>2

------2.��ѯ����ƽ�����ʴ���2000������������2�Ĳ��ű�ţ��������ƣ���������������ƽ�����ʣ������ղ���������������
select e.deptno ���ű��,d.dname ��������,count(dname) ��������,avg(sal) ����ƽ������
from emp e,dept d
where e.deptno=d.deptno
group by e.deptno,d.dname
having avg(sal)>2000 and count(ename)>2
order by count(e.empno) asc;

------�κ���ҵ
------1.��ѯ����ƽ��������2500Ԫ���ϵĲ������Ƽ�ƽ�����ʡ�
select d.dname,d.deptno,avg(sal)
from dept d,emp e
where d.deptno=e.deptno
group by d.deptno,d.dname
having avg(sal)>2500;

------2.��ѯԱ����λ�в����ԡ�SA����ͷ����ƽ��������2500Ԫ���ϵĸ�λ��ƽ�����ʣ�����ƽ�����ʽ�������
select e.job,avg(e.sal)
from emp e
where e.job not like 'SA%'
group by e.job
having avg(e.sal)>2500
order by avg(e.sal) desc;

------3.��ѯ����������2�����ϵĲ������ơ���͹��ʡ���߹���,������õĹ��ʽ����������뵽����λ��
select d.dname,round(min(e.sal),0),round(max(e.sal),0)
from emp e,dept d
where e.deptno=d.deptno
group by d.dname
having count(e.empno)>2

------4.��ѯ��λ��ΪSALESMAN�����ʺʹ��ڵ���2500�ĸ�λ��ÿ�ָ�λ�Ĺ��ʺ͡� 
select job,sum(sal)
from emp
where job<>'salesman'
group by job
having sum(sal)>=2500;

------5.��ʾ�������;����������������������Ա������͹��ʣ�û�о����KINGҲҪ��ʾ����������͹���С��3000�ģ�����͹����ɸߵ�������
select m.empno,m.ename,min(e.sal)
from emp e left join emp m
on e.mgr = m.empno
group by m.empno,m.ename,m.mgr 
having min(e.sal)>=3000
order by min(e.sal) desc

------6.дһ����ѯ����ʾÿ��������߹��ʺ���͹��ʵĲ�
select max(sal),min(sal),deptno
from emp
group by deptno
