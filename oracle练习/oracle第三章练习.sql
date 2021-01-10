------������------
------��ϰ1
------1.��ѯְλΪSALESMAN��Ա����š�ְλ����ְ���ڡ�
select empno,job
from emp
where job ='SALESMAN';

------2.��ѯ1985��12��31��֮ǰ��ְ��Ա����������ְ���ڡ�
select ename,hiredate
from emp
where hiredate<to_date('31-12-1985','dd-mm-yyyy');

------3.��ѯ���ű�Ų���10���ŵ�Ա�����������ű�š�
select ename,deptno
from emp
where deptno <> 10;

------��ϰ2
------1.��ѯ��ְ������82����85���Ա����������ְ���ڡ�
select ename,hiredate
from emp
where hiredate between '1-1��-1982' and '31-12��-1985';

------2.��ѯ��н��3000��5000��Ա����������н��
select ename,sal
from  emp
where sal between 3000 and 5000;

------3.��ѯ���ű��Ϊ10����20��Ա�����������ű�š�
select ename,deptno
from  emp
where deptno in (10,20);

------4.��ѯ������Ϊ7902, 7566, 7788��Ա�������������š�
select ename,mgr
from emp
where mgr in (7902,7566,7788);


------��ϰ3
------1.��ѯԱ��������W��ͷ��Ա��������
select ename
from emp
where ename like 'W_%';

------2.��ѯԱ������������2���ַ�ΪT��Ա��������
select ename
from emp
where ename like '%_T_';

------3.��ѯ����Ϊ�յ�Ա������������
select ename,comm
from emp
where comm is null;

------��ϰ4
------1.��ѯ���ʳ���2000����ְλ��MANAGER,����ְλ��SALESMAN��Ա��������ְλ������
select ename,job,sal
from emp
where sal >2000
and job='MANAGER' or job='SALESMAN';

------2.��ѯ���ʳ���2000����ְλ�� MANAGER��SALESMAN��Ա��������ְλ�����ʡ�
select ename,job,sal
from emp
where sal >2000
and job='MANAGER' or job='SALESMAN';

------3.��ѯ������10����20�����ҹ�����3000��5000֮���Ա�����������š����ʡ�
select ename,deptno,sal
from emp
where sal >=3000
and sal <=5000
and deptno in (10,20);

------4.��ѯ��ְ������81�꣬����ְλ����SALES��ͷ��Ա����������ְ���ڡ�ְλ��
select ename,hiredate,job
from emp
where job not like 'SALES_%'
and hiredate < '31-12��-81' and hiredate > '1-1��-81';

------5.��ѯְλΪSALESMAN��MANAGER�����ű��Ϊ10����20����������A��Ա��������ְλ�����ű�š�
select ename,job,deptno
from emp
where job ='SALESMAN' or job ='MANAGER'
and deptno in (10,20)
and ename like 'A%';

-----��ϰ5
------1.��ѯ������20��30��Ա�����������ű�ţ������չ�����������
select * from emp;
select ename,sal,deptno
from emp
where deptno ='20' or deptno ='30'
order by sal asc;

------2.��ѯ������2000-3000֮�䣬���Ų���10�ŵ�Ա�����������ű�ţ����ʣ������ղ������򣬹��ʽ�������
select ename,deptno,sal 
from emp 
where sal >=2000 and sal <=3000 and deptno <>10
order by sal asc;

------3.��ѯ��ְ������82����83��֮�䣬ְλ��SALES����MAN��ͷ��Ա����������ְ���ڣ�ְλ����������ְ���ڽ�������
select ename,hiredate,job 
from emp
where hiredate>to_date('1-1-82','dd-MM-yy') and hiredate<to_date('31-12-8','dd-MM-yy' )
and job like  'MAN_%'  or job like 'SALES_%'
order by hiredate asc,sal desc;


------�κ���ҵ
------1.��ѯ��ְʱ����1982-7-9֮�󣬲��Ҳ�����SALESMAN������Ա����������ְʱ�䡢ְλ��
select ename,hiredate,job
from emp
where hiredate>to_date('9-7-1982','dd-MM-yyyy')
and job<>'SALESMAN';

------2.��ѯԱ�������ĵ�������ĸ��a��Ա��������
select ename
from emp
where ename like '__A%'

------3.��ѯ����10��20�Ų��������Ա�����������ű�š�
select ename,deptno
from emp
where deptno not in(10,20);

------4.��ѯ���ź�Ϊ30��Ա������Ϣ���Ȱ����ʽ��������ٰ�������������
select * from emp
where deptno = 30
order by sal desc,ename asc;

------5.��ѯû���ϼ���Ա��(�����Ϊ��)��Ա��������
select * from emp
where mgr is null;

------6.��ѯ���ʴ��ڵ���4500���Ҳ���Ϊ10����20��Ա��������\���ʡ����ű�š�
select ename,sal,deptno
from emp
where sal >= 4500 and (deptno in (10,20));

