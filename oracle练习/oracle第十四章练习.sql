------��ʮ����------
------��ϰ1
------1.ѧУ��һ��ѡ��ϵͳ�����а������¹�ϵģʽ��
---ϵ(ϵ��ţ� ������
   ϵ����:  Ψһ����
   ϵ���Σ� �ǿ�Լ����
   ϵ����Уȥ��ȡֵ��Χֻ�����Ϻ�У���ͻ���У��)
create table college (
           collegeno number(4)     constraint college_cgno_pk primary key,
           cgname    varchar2(20)  constraint college_cgname_unique unique,
           cgdirector varchar2(20) constraint college_cgdirector_null not null,
           cgcampus   varchar2(40) constraint college_cgcampus_ck 
                                   check(cgcampus in ('�Ϻ�У��','����У��'))
    );
select * from college

---�༶(�༶��ţ� ������
     �༶���ƣ� Ψһ����
     ����ϵ��  ���)
create table class1 (
           classno varchar2(10) constraint class_classno_pk primary key,
           clname  varchar2(40) constraint class_clname_unique unique,
           cgname  varchar2(40) constraint class_cgname_fk 
                                references college(cgname)
    );
select * from class1


------2.����ѧ����������������:
ѧ�� �����ַ��� 10λ ����
���� �䳤�ַ��� 20λ �ǿ�
�Ա� �����ַ��� 2λ ȡֵ��Χֻ��Ϊ�л�Ů
�������� ������ 
���ڰ༶ 
create table student2 (
         studentno char(10)     constraint student_stuno_pk primary key,
         stuname   varchar2(10) constraint student_stuname_null not null,
         sex       char(2)      constraint student_sex_ck check(sex in('��','Ů')),
         birthdate date,
         classno   varchar2(10) constraint student_classno_fk 
                                 references class1(classno)      
  );
select * from student2
------�κ���ҵ
-----1.����5��Լ���ĺ��塣
not null �ǿ�Լ������Ҫ����ΪԼ����ֵ����Ϊ��
primary key ����Լ����Լ����ֵΨһ�Ҳ���Ϊ��
foreign key ���Լ����Լ����ֵ�븸�����
unique ΨһԼ����Լ����ֵ����Ψһ
check ���Լ����Լ����ֵ��ĳһ��Χ

------2.����ѧ����ϵsc��������������
ѡ����ˮ�� ��ֵ�� ������
ѧ����� �ǿ� ���
�γ̱�� �ǿ� �����
�ɼ�     0-100֮�䣻
create table sc (
           scid number(10) constraint sc_scid_pk primary key,--ѡ��
           studentno char(10) constraint sc_scstuno_fk 
                              references student2(studentno),--ѧ�����
           cid number(4) constraint sc_sccid_fk 
                         references course(cid),--�γ̱��
           grade number(5,2) constraint sc_grade_ck 
                             check(grade between 0 and 100)--�ɼ�
    );

------3.����copy_emp��Ҫ���ʽͬemp����ȫһ�������������ݡ�
create table copy_emp1 as select * from emp where 1=0;
select * from copy_emp1;

------4.����copy_dept��Ҫ���ʽͬdept����ȫһ�������������ݡ�
create table copy_dept as select * from dept where 1=0;
select * from copy_dept;

------5.����copy_emp �������deptno������copy_dept��deptno,����ܷ�ɹ�,Ϊʲô��
alter table copy_emp add constraint copy_emp_deptno_fk 
foreign key(deptno) references copy_dept(deptno); 
   
���ܣ���Ϊcopy_dept���е�deptno����������Ψһֵ

------6.׷��copy_dept��������deptno
alter table copy_dept add constraint copy_dept_deptno_pk primary key(deptno);
select * from copy_dept;
