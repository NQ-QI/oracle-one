------������------
------��ϰ1
------1.дһ����ѯ����ʾ����Ա�����������ű�ţ��������ơ�
select e.ename,d.deptno,d.dname
from emp e join dept d
     on e.deptno=d.deptno
     
------2.дһ����ѯ����ʾ���й�����CHICAGO���ҽ���Ϊ�յ�Ա�������������ص㣬����
select e.ename,e.comm,d.loc
from emp e join dept d
      on e.deptno=d.deptno
where  e.comm <> 0;

------3.дһ����ѯ����ʾ���������к���A�ַ���Ա�������������ص㡣
select e.ename,d.loc
from emp e join dept d
     on e.deptno=d.deptno
where e.ename like'%A%'

------��ϰ2
------1.��ѯÿ��Ա���ı�ţ����������ʣ����ʵȼ������ڹ������У����չ��ʵȼ�������������
select e.empno,e.ename,e.sal,s.grade,d.loc
from emp e,dept d,salgrade s
where e.deptno=d.deptno and e.sal between s.losal and s.hisal
order by grade

------��������
------˼������ѯÿ��Ա����������ֱ���ϼ�������
select worker.ename,boss.ename �ϼ�����
from emp worker,emp boss
where worker.mgr=boss.empno


------��ϰ3
------1.��ѯ���й�����NEW YORK��CHICAGO��Ա��������Ա����ţ��Լ����ǵľ��������������š�
select e.empno,e.ename,boss.empno,boss.ename
from emp e,emp boss,dept d
where e.mgr = boss.empno
and e.deptno = d.deptno
and d.loc in('NEW YORK','CHICAGO');


------2.����һ��Ļ����ϣ����û�о����Ա��King��������Ա���������
select e.empno,e.ename,boss.empno,boss.ename
from emp e,emp boss,dept d
where e.mgr = boss.empno(+)
and e.deptno = d.deptno
and d.loc in('NEW YORK','CHICAGO');

------3.��ѯ����Ա����ţ��������������ƣ�����û�в��ŵ�Ա��ҲҪ��ʾ������
select * from dept
select e.empno,e.ename,d.deptno
from emp e,dept d
where e.deptno=d.deptno 


------��ϰ4
------ʹ��SQL-99д�������������ϰ
------1.����һ��Ա����Ͳ��ű�Ľ������ӡ�
select emp.empno,emp.ename,emp.sal,emp.deptno,dept.dname
from emp cross join dept

------2.ʹ����Ȼ���ӣ���ʾ��ְ������80��5��1��֮���Ա���������������ƣ���ְ����
select * from salgrade
select empno,ename,hiredate
from emp
natural join  dept
where hiredate<to_date('80-5-1','yy-MM-dd');

------3.ʹ��USING�Ӿ䣬��ʾ������CHICAGO��Ա���������������ƣ������ص�
select e.ename,d.dname,d.loc
from emp e join dept d using (deptno)
where loc = 'CHICAGO'

------4.ʹ��ON�Ӿ䣬��ʾ������CHICAGO��Ա���������������ƣ������ص㣬н�ʵȼ�
select e.ename Ա������,d.dname ��������,d.loc �����ص�,s.grade н�ʵȼ�
from emp e,dept d,salgrade s
where e.deptno=d.deptno
and e.sal between s.losal
and s.hisal

------5.ʹ�������ӣ���ѯÿ��Ա��������������������û�о����KingҲҪ��ʾ������
select e.ename,m.ename  "��������"
from emp e left outer join emp m 
     on e.mgr=m.empno;

------6.ʹ�������ӣ���ѯÿ��Ա��������������������û�о����KingҲҪ��ʾ������
select e.ename,m.ename "��������"
from emp m right outer join emp e 
     on m.mgr=e.empno;


------�κ���ҵ
------1.��ʾԱ��SMITH���������������ƣ�ֱ���ϼ�����
select e.ename,d.dname,m.ename
from emp e join  dept d 
     on e.deptno=d.deptno
     join emp m 
     on e.mgr=m.empno;

------2.��ʾԱ���������������ƣ����ʣ����ʼ���Ҫ���ʼ������4����
select  e.ename "Ա������",dname "��������",e.sal "����",s.grade "���ʼ���"
from emp e, dept d,salgrade s
where e.deptno=d.deptno
and e.sal between s.losal
and s.hisal
and s.grade>4

------3.��ʾԱ��KING��FORD�����Ա���������侭��������
select e.ename "Ա������",m.ename "��������"
from emp e,emp m
where e.mgr=m.empno
and m.ename in('KING','FORD'); 

------4.��ʾԱ���������μӹ���ʱ�䣬���������μӹ���ʱ�䣬Ҫ��μ�ʱ��Ⱦ����硣
select e.ename "Ա������", e.hiredate "�μӹ���ʱ��" ,m.ename "��������", m.hiredate "����μӹ���ʱ��"
from emp e,emp m
where e.mgr=m.empno
and e.hiredate< m.hiredate;
