------������------
------��ϰ1
------1.дһ����ѯ,������ĸ��д��������ĸСд��ʾ��Ա�� ename����ʾ���ֵĳ��ȣ�����ÿ��һ���ʵ��ı�ǩ���������������й�Ա���ֵĿ�ʼ��ĸ��J��A �� M �Ĺ�Ա�����Բ�ѯ�������Ա��ename�������򡣣���ʾ��ʹ��initcap��length��substr��
select INITCAP(ename) Ա������,LENGTH(ename) ���ֳ���
from emp
where substr(ename,1,1) in('J','A','M')
order by ename;

------��ϰ2
------1.��ѯԱ���������а�����д��Сд��ĸA��Ա��������
select ename,instr(ename,'A')
from emp

------2.��ѯ���ű��Ϊ10��20����ְ������81��5��1��֮�󣬲��������а�����д��ĸA��Ա��������Ա���������ȣ���ʾ��Ҫ��ʹ��INSTR����������ʹ��like�����ж�)
select ename,length(ename)
from emp  
where deptno in (10,20)
and  instr(ename,'A')>0
or  instr(ename,'a') >0
and hiredate>to_date('81-5-1','yy-MM-dd');


------3.��ѯÿ��ְ���ı��,����������
------Ҫ�󽫲�ѯ�������ݰ���һ���ĸ�ʽ�ϲ���һ���ַ���.
------ǰ10λ�����,���㲿����*���,�����
------�м�10λ�����������㲿����*���,�����
------��10λ�����ʣ����㲿����*���,�Ҷ���

select concat(concat(rpad(empno,10,'*'),rpad(ename,10,'*')),lpad(sal,10,'*'))
from emp;

------��ϰ3
------1.дһ����ѯ���ֱ����100.456 �������뵽С������2λ����1λ������λ��ֵ��
select round(100.456,2) С������2λ,round(100.456,1) С������1λ
from dual

------2.дһ����ѯ���ֱ����100.456 ��С������2λ����1λ������λ�ضϵ�ֵ��
select trunc(100.456,2) С������2λ,trunc(100.456,1) С������1λ
from dual

------��ϰ4
------1.��ѯÿ��Ա����ֹ������һ����ְ�����죿
select * from emp
select ename, trunc((sysdate-hiredate),0) ��ְ����
from emp
 
------2.��ǰ����Ϊ2015�ָ꣬�����ڸ�ʽΪDD-MON-RR,ָ������Ϊ01-1��-01��������ʵ�������������Ϊ��
select to_date('01-1��-01','DD-MON-RR') ����Ϊ
from dual;

------3.��ǰ����Ϊ2015�ָ꣬�����ڸ�ʽΪDD-MON-RR,ָ������Ϊ01-1��-95��������ʵ�������������Ϊ��
select to_date('01-1��-95','DD-MON-RR') ����Ϊ
from dual;

------4.��ǰ����Ϊ1998�ָ꣬�����ڸ�ʽΪDD-MON-RR,ָ������Ϊ01-1��-01��������ʵ�������������Ϊ��
select to_date('01-1��-01','DD-MON-RR') ����Ϊ
from dual;

------5.��ǰ����Ϊ1998�ָ꣬�����ڸ�ʽΪDD-MON-RR,ָ������Ϊ01-1��-95��������ʵ�������������Ϊ��
select to_date('01-1��-95','DD-MON-RR') ����Ϊ
from dual;

------6.��ǰ����Ϊ2015�ָ꣬�����ڸ�ʽΪDD-MON-YY,ָ������Ϊ 01-1��-01��������ʵ�������������Ϊ��
select to_date('01-1��-01','DD-MON-RR') ����Ϊ
from dual;

------7.��ǰ����Ϊ1998�ָ꣬�����ڸ�ʽΪDD-MON-YY,ָ������Ϊ01-1��-95��������ʵ�������������Ϊ��
select to_date('01-1��-95','DD-MON-RR') ����Ϊ
from dual;

------��ϰ5
------1.��ѯ��������ǰʱ��
select sysdate
from dual;
select * from emp

------2.��ѯ����10,20��Ա����ֹ��2000��1��1�գ������˶��ٸ��£���ְ���·ݡ�(��ʾ��ʹ��months_between,extract)
select ename,hiredate,deptno,months_between('1-1��-2000',hiredate),extract(month from hiredate)
from emp
where deptno in(10,20);

------3.���Ա��������6���£���ѯְλ����MANAGER��Ա����������ְ���ڣ�ת�����ڣ���ְ���ں�ĵ�һ������һ,��ְ���µ����һ�����ڡ�����ʾ��ʹ��add_months,next_day,last_day)
select ename,hiredate,
add_months(hiredate,6), 
next_day(hiredate,'����һ'),
last_day(hiredate)
from emp
where job <>'MANAGER';


------��ϰ6
------1.��ʾ������ϵͳ��ǰʱ�䣬��ʽΪ2007-10-12 17:11:11(��ʾ��ʹ��to_char����)
select to_char(sysdate,'YYYY-MM-DD HH:MM:SS')
from dual;

------2.��ʾename��hiredate �� ��Ա��ʼ�����������ڼ����б�ǩDAY(��ʾ��ʹ��to_char����)
select ename,hiredate,to_char(hiredate,'DAY') ���ڼ�
from emp

------3.��ѯԱ�����������ʣ���ʽ���Ĺ��ʣ���999,999.99�� (��ʾ��ʹ��to_char����)
select ename Ա������,sal ����,to_char(sal,'U999,999.99') ��ʽ���Ĺ��� 
from emp;

------4.���ַ���2015-3��-18 13:13:13 ת�������ڸ�ʽ���������ϵͳ��ǰʱ���������졣 (��ʾ��ʹ��to_date����)
select to_date('2015-3��-18 13:13:13','yyyy-mm"��"-dd hh24:mi:ss'),
round(sysdate-to_date('2015-3��-18 13:13:13','yyyy-mm"��"-dd hh24:mi:ss'),0)
from dual;

------�κ���ҵ
------1.����2000��1��1�յ������ж����£������ܣ��������룩��
select MONTHS_BETWEEN(sysdate,'01-1��-2000') months,
round(round(sysdate- to_date('2000-01-01','YYYY-MM-DD'))/7) week
from dual

------2.��ѯԱ��ENAME�ĵ�������ĸ��A��Ա������Ϣ(ʹ��2������)��
select * from emp where substr(ename,3,1)='A';
select * from emp where instr(ename,'A',3)=3;

------3.ʹ��trim�������ַ�����hello������  Hello ������bllb������ hello    ���ֱ���õ������ַ���ello��Hello��ll��hello��
select trim(leading 'h' from 'hello') ,trim(' Hello '),
trim (both'l'  from 'hello'),trim(' hello ')
from dual;

------4.��Ա�����ʰ����¸�ʽ��ʾ��123,234.00 RMB ��
select to_char('123234.00','000,999.00')|| 'RMB'
from dual

------5.��ѯԱ�����������侭���ţ�Ҫ�����û�о������ʾ��No Manager���ַ�����
select ename,nvl(to_char(mgr) , 'No Manager')
from emp;

------6.��Ա���Ĳμӹ������ڰ����¸�ʽ��ʾ���·�/��ݡ� 
select ename,hiredate,to_char(hiredate,'HH/RR')
from emp;

------7.��Ա�����в�ѯ��Ա���Ĺ��ʣ�������Ӧ��˰��������С��1000,˰��Ϊ0��������ʴ��ڵ���1000��С��2000��˰��Ϊ10����������ʴ��ڵ���2000��С��3000��˰��Ϊ15����������ʴ��ڵ���3000��˰��Ϊ20����
select ename,sal,lpad(sal,15,'$'),case
when sal > 0 and sal <1000 THEN sal * 0
when sal > =1000 and sal <2000 THEN sal * 0.1
when sal >= 2000 and sal <3000 THEN sal * 0.15
when sal >= 3000  THEN sal * 0.2
else 0
end Ӧ��˰��
from emp;

------8.����һ����ѯ��ʾ���й�Ա�� ename�� sal����ʽ��salΪ 15 ���ַ����ȣ��� $ ����䣬�б�ǩ SALARY��
select ename,lpad(sal,15,'$')
from emp;
