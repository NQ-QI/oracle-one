-------��ʮ��------
-------�κ���ҵ
-------1.����һ��������ʾ BLAKE�������¼�������ֱ�Ӻͼ���¼�����Ա�����֡�нˮ�Ͳ��źš�
select ename ��Ա����,sal нˮ,deptno ���ź�
from emp
start with ename = 'BLAKE'
connect by prior empno = mgr; 

-------2.����һ��������ʾ���ڹ�Ա SMITH ����Ĳ�Σ����������������������ʾ����ֱ�Ӿ���
select level ����, ename ����
from emp
where ename <> 'SMITH'
start with ename = 'SMITH'
connect by prior mgr = empno;

-------3.����һ������������ʾ�����Σ�������Ϊ KING�Ĺ�Ա��ʼ����ʾ��Ա�����֡�����ID�Ͳ���ID��
select lpad(ename, length(ename) + level * 2, '-') ��Ա����,
lpad(mgr, length(mgr) + level * 2, '-') ����ID,deptno ����ID
from emp
start with ename = 'KING'
connect by prior empno = mgr;

-------4.����һ����˾��֯ͼ����ʾ�����Ρ���������˿�ʼ���ų�����jobΪCLERK���ˣ���Ҫ�ų�FORD����Щ��FORD����Ĺ�Ա��
select lpad(ename, length(ename) + level * 2, '-')
from emp
where job <> 'CLERK'
start with ename = 'KING'
connect by prior empno = mgr
and ename <> 'FORD';
