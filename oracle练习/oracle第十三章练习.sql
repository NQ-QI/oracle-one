------��ʮ����------
------��ϰ1
------1.ѧУ����һ��ѡ��ϵͳ�������漰���γ̱�ѧ������ֱ𴴽����������Լ�˼������Ӧ�е��м��������͡�
----�γ̱�
create table course(
    cid  number(4),---�γ̱��
    cname varchar(50),---�γ�����
    ctypeID number(4),---�γ�����
    score number(1),---ѧ��
    chour number(2)---��ʱ
    );
    
select * from course
    
----ѧ����
    create table student1(
    sid char(10),---ѧ�� 
    sname varchar2(20),---����
    sex char(4) default '����',---�Ա�
    telephone varchar2(15),---��ϵ��ַ  
    collegeID number(4),---ѧԺ
    majorID number(4), ---רҵ
    classID number(4), ---�༶ 
    inDate date---��ѧ����
    );
    
select * from student1

------��ϰ2
------1.ͨ���Ӳ�ѯ�ķ�ʽ����һ����dept10,�ñ���10�Ų��ŵ�Ա�����ݡ�
create table dept10 as select * from emp where deptno = 10;

select * from dept10
------��ϰ3
------1.��Ա���������һ���Ա��У�����Ϊgender������Ϊchar(2)��Ĭ��ֵΪ���С�
alter table emp add(gender char(2));
alter table emp modify(gender default '��');

------2.�޸�Ա�������Ա��е���������Ϊchar(4)
alter table emp modify(gender char(4));
 
-----3.�޸�Ա�������Ա��е�Ĭ��ֵΪ��Ů��
alter table emp modify(gender default 'Ů');

-----4.ɾ��Ա�����е��Ա���
alter table emp drop (gender);



-------�κ���ҵ
------1.�������������Ҫ����Ҫ����ʲô���͵��ֶ�?
---(1)���2000���ֽڶ����ַ���
char(20)

---(2)������롮������ ����ո�6��
char(10)

---(3)�Ա�����'��'��'Ů��
char(2)

---(4)���4000���ֽڱ䳤�ַ���
varchar2(4000)

---(5)��������ݿ�������'����'����ʾ����'������
nvarchar2(2)

---(6)��ʾ���ַ�ΧΪ- 10��125�η���10��126�η�, ���Ա�ʾС�� Ҳ���Ա�ʾ����
number

---(7)����ʾ4λ����  -9999 �� 9999
number(4)

---(8)��ʾ5λ��Ч���� 2λС���� һ��С��  -999.99 �� 999.99
number(5,2)

---(9)���������պ�ʱ����
date

---(10)���������պ�ʱ�������
timestamp

---(11)�����ƴ����ͼ��/����
blob

------2.������date_test,������d������Ϊdate�͡�����date_test���в���������¼��һ����ǰϵͳ���ڼ�¼��һ����¼Ϊ��1998-08-18����
create table date_test(d date)

select * from date_test

insert into date_test values(sysdate)
insert into date_test values(to_date('1998-08-18','YYYY-MM-DD'))
------3.������dept����ͬ��ṹ�ı�dtest����dept���в��ű����40֮ǰ����Ϣ����ñ�
select * from dept

create table dtest as select * from dept where deptno<40

select * from dtest

------4.������emp��ṹ��ͬ�ı�empl�������䲿�ű��Ϊǰ30�ŵ�Ա����Ϣ���Ƶ�empl��
create table emp1 as select * from emp where deptno<30

select * from emp1

------5.��Ϊѧ����student����һ��ѧ���Ա�gender Ĭ��ֵ ��Ů����
alter table student
add (gender char(2) default 'Ů')

select * from student
