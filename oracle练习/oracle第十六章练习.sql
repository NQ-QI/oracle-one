------��ʮ����------
------��ϰ1
------1.����һ�����У���������ʼֵ��1��ʼ�������ֵ��������1����ѭ����
create sequence test3
start with 1
nomaxvalue
increment by 1
nocycle;

------2.��ѯ���еĵ�ǰֵ����һ��ֵ
select test3.nextval from dual;
select test3.currval from dual;

------3.ʹ�õ�1�����������У����ű��в���������¼�����ű��ʹ������ֵ���������Ʒֱ�Ϊ��Education��Market�����зֱ�Ϊ��DALLAS��WASHTON
select * from dept;
insert into dept (deptno,dname,loc) values (test3.nextval,'Education','DALLAS');
insert into dept (deptno,dname,loc) values ((test3.nextval,'Market','WASHTON');


------��ϰ2
-----1.ʹ���Ӳ�ѯ�ķ�ʽ������test��
create table test as select * from emp;

-----2.���ٸ���test���е����ݣ����Ƶ�100w������
insert into test select * from test;

-----3.����test���е�empno�ֶ�Ϊrownum
update test set empno = rownum;
alter table test modify (empno number(8));
update test set empno = test3.nextval;

-----4.��ѯtest��empnoΪ800000�ļ�¼ֵ����¼��ѯִ��ʱ�䡣

-----5.��test���empno�ֶ��ϴ�������
create index test_empno_index on test(empno);

-----6.����ִ�е�4�⣬�ԱȲ�ѯʱ��


-----��ϰ3
----1.�����¹�ϵģʽ��
student(sno,sname,gender,birthday,email);--ѧ��
course(cno,cname,type,credit);--�γ�
sc��sno,cno,grade);--ѡ��
�Է�����Щ�����ʺϴ���������



-----�κ���ҵ
----1.�������У���ʼλ1������Ϊ1����СֵΪ1�����ֵΪ9999
create sequence addsum
start with 1
increment by 1
minvalue 1
maxvalue 9999;
           
----2.�������У���ʼֵΪ50��ÿ������5��
create sequence add5
start with 50
increment by 5;    
select add5.nextval from dual; 

----3.�ڱ�copy_dept�в����¼�����в��ź��������һ���д������������ɣ�
insert into copy_dept(deptno,dname) values(add5.nextval,'���в���');

----4.��Ϊ���ʴ����������Ƚ�<10000,>1000,��round��sal��>10000,�ĸ�������Ч���ĸ�������Ч��
create index sal_index on emp(sal);
select * from emp where sal < 10000;--������
select * from emp where sal > 1000;--������
select * from emp where round(sal) > 10000;--���������к���
    
----5.���������á�create table copy_emp_index as select * from emp��������500�������ݣ������еġ�Ա���š��ֶ��޸�ΪΨһ��
create table copy_emp_index as select * from emp;
insert into copy_emp_index  select * from copy_emp_index;
alter table copy_emp_index modify(empno number(9));
update copy_emp_index set empno = dept_seq.nextval;

----6.��ѯ��copy_emp_index����Ա����Ϊ200001��Ա�����������ʣ���¼ִ��ʱ�䣻
select ename, sal from copy_emp_index;

----7.��copy_emp_index���empno�ֶ��ϴ����������ٴ�ִ�е�6����䣬��¼ִ��ʱ�䲢���Աȣ�
create index emp_empno_index on copy_emp_index(empno);
