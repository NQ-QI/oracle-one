------��ʮ����------
------��ϰ1
-----1.����һ����ͼ��ͨ������ͼ���Բ�ѯ��������2000-5000�ڲ��������а�����A��Ա����ţ����������ʡ�
create view sal2 as select empno Ա�����,ename ����,sal ����
from emp
where sal between 2000 and 5000
and ename like '%A%';

----2.ͨ��������������ͼ��ѯ����
select * from sal2; 



------��ϰ2
-----1.����һ����ͼ��ͨ������ͼ���Բ�ѯ��������NEW YORK��CHICAGO��Ա����ţ����������ű�ţ���ְ���ڡ�
create or replace view dept_loc_ve (Ա�����, ����, ���ű��, ��ְ����)
        as select e.empno, e.ename, e.deptno, e.hiredate
from emp e, dept d
where e.deptno = d.deptno and d.loc 
in ('NEW YORK', 'CHICAGO');

select * from dept_loc_ve;

-----2.����һ����ͼ��ͨ������ͼ���Բ�ѯ��ÿ�����ŵĲ������Ƽ���͹��ʡ�
create or replace view dept_minsal_ve(�������ƣ� ��͹���)
        as select d.dname, min(nvl(e.sal, 0))
from emp e, dept d
where e.deptno(+) = d.deptno
group by d.dname;

select * from dept_minsal_ve;
            
-----3.ͨ��������ͼ����ѯÿ�����Ź�����͵�Ա����������������
select e.ename ����, m.�������� 
from emp e, dept_minsal_ve m, dept d
where e.deptno = d.deptno
and d.dname = m.��������
and m.��͹��� = e.sal;



------�κ���ҵ
-----1.������ͼv_emp_20������20�Ų��ŵ�Ա����ţ���������н��(��н=12*(����+���𣩣�
create or replace view v_emp20
        as select empno,ename,12*(nvl(sal,0)+nvl(comm,0)) ��н
from emp;

select * from v_emp20;

-----2.����ͼv_emp_20�в�ѯ��н����1��ԪԱ������Ϣ��
select * from v_emp20 where ��н > 10000;

-----3.��Ϊ���ʴ���2000��Ա��������ͼ��Ҫ����ʾԱ���Ĳ�����Ϣ��ְλ��Ϣ�������ص㣻
create or replace view sal2_ve
        as select e.deptno,e.job,d.loc
from emp e,dept d
where e.deptno = d.deptno;

select * from sal2_ve;

-----4.���������ͼִ��insert,update,delete,����ܷ�ɹ���Ϊʲô��
----v_emp20 ��ͼִ�в���
insert into v_emp20 values (1214,'С��',2000);--������ ������������
update v_emp20 set empno = 1214 where empno = 1234; --����
delete v_emp20;--����

----sal2_ve ��ͼִ�в���
insert into sal2_ve values (12,'С��','����');--������ �޷�ͨ��������ͼ�޸Ķ������
update sal2_ve set deptno = 20 where deptno = 10; --����
delete sal2_ve;--����
