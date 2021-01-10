------第十四章------
------练习1
------1.学校有一个选课系统，其中包括如下关系模式：
---系(系编号： 主键，
   系名称:  唯一键，
   系主任： 非空约束，
   系所在校去：取值范围只能在南湖校区和浑南校区)
create table college (
           collegeno number(4)     constraint college_cgno_pk primary key,
           cgname    varchar2(20)  constraint college_cgname_unique unique,
           cgdirector varchar2(20) constraint college_cgdirector_null not null,
           cgcampus   varchar2(40) constraint college_cgcampus_ck 
                                   check(cgcampus in ('南湖校区','浑南校区'))
    );
select * from college

---班级(班级编号： 主键，
     班级名称： 唯一键，
     所属系：  外键)
create table class1 (
           classno varchar2(10) constraint class_classno_pk primary key,
           clname  varchar2(40) constraint class_clname_unique unique,
           cgname  varchar2(40) constraint class_cgname_fk 
                                references college(cgname)
    );
select * from class1


------2.创建学生表，包含如下属性:
学号 定长字符型 10位 主键
姓名 变长字符型 20位 非空
性别 定长字符型 2位 取值范围只能为男或女
出生日期 日期型 
所在班级 
create table student2 (
         studentno char(10)     constraint student_stuno_pk primary key,
         stuname   varchar2(10) constraint student_stuname_null not null,
         sex       char(2)      constraint student_sex_ck check(sex in('男','女')),
         birthdate date,
         classno   varchar2(10) constraint student_classno_fk 
                                 references class1(classno)      
  );
select * from student2
------课后作业
-----1.简述5种约束的含义。
not null 非空约束：主要作用为约束列值不能为空
primary key 主键约束：约束列值唯一且不能为空
foreign key 外键约束：约束列值与父项相关
unique 唯一约束：约束列值必须唯一
check 检查约束：约束列值在某一范围

------2.创建学生关系sc，包括属性名：
选课流水号 数值型 主键；
学生编号 非空 外键
课程编号 非空 外键；
成绩     0-100之间；
create table sc (
           scid number(10) constraint sc_scid_pk primary key,--选课
           studentno char(10) constraint sc_scstuno_fk 
                              references student2(studentno),--学生编号
           cid number(4) constraint sc_sccid_fk 
                         references course(cid),--课程编号
           grade number(5,2) constraint sc_grade_ck 
                             check(grade between 0 and 100)--成绩
    );

------3.创建copy_emp，要求格式同emp表完全一样，不包含数据。
create table copy_emp1 as select * from emp where 1=0;
select * from copy_emp1;

------4.创建copy_dept，要求格式同dept表完全一样，不包含数据。
create table copy_dept as select * from dept where 1=0;
select * from copy_dept;

------5.设置copy_emp 表中外键deptno，参照copy_dept中deptno,语句能否成功,为什么？
alter table copy_emp add constraint copy_emp_deptno_fk 
foreign key(deptno) references copy_dept(deptno); 
   
不能，因为copy_dept表中的deptno不是主键或唯一值

------6.追加copy_dept表中主键deptno
alter table copy_dept add constraint copy_dept_deptno_pk primary key(deptno);
select * from copy_dept;
