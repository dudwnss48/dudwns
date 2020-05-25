create table contacts (
    contact_name varchar2(100) not null,
    contact_tel varchar2(50) not null,
    contact_email varchar2(256),
    contact_create_date date default sysdate
);

INSERT INTO contacts (CONTACT_NAME, CONTACT_TEL, CONTACT_EMAIL)
VALUES ('ȫ�浿', '010-1234-5678', 'hong@gmail.com');

INSERT INTO contacts (CONTACT_NAME, CONTACT_TEL, CONTACT_EMAIL)
VALUES ('������', '010-6789-3453', 'kim@naver.com');

select *
from contacts;

-- HR ����ڿ��� CONTACTS�� ���� ��ü���� �ο��ϱ�
GRANT SELECT
ON CONTACTS
TO HR;

-- HR ����ڿ��� CONTACTS�� ���� ��ü���� �ο��ϱ�
GRANT UPDATE (CONTACT_TEL, CONTACT_EMAIL)
ON CONTACTS
TO HR;



/* Create Tables */

CREATE TABLE SCHOOL_COURSES
(
	COURSE_NO number(4,0) NOT NULL,
	SUBJECT_NO number(4,0) NOT NULL,
	PROF_NO number(4,0) NOT NULL,
	COURSE_NAME  varchar2(200) NOT NULL,
	COURSE_QUTOA number(3,0) DEFAULT 30,
	COURSE_REG_CNT number(3,0) DEFAULT 0,
	COURSE_CANCEL_CNT number(3,0) DEFAULT 0,
	COURSE_CLOSED char(1) DEFAULT 'N',
	COURSE_CREATE_DATE date DEFAULT SYSDATE,
	PRIMARY KEY (COURSE_NO)
);


CREATE TABLE SCHOOL_COURSE_REGISTRATONS
(
	REG_NO number(5,0) NOT NULL,
	STUD_NO number(4,0) NOT NULL,
	COURSE_NO number(4,0) NOT NULL,
	REG_CANCELED char(1) DEFAULT 'N',
	REG_COMPLITE char(1) DEFAULT 'N',
	REF_SCORE number(2,1),
	REG_CREATE_DATE date DEFAULT SYSDATE,
	PRIMARY KEY (REG_NO),
	CONSTRAINT COURSE_REG_UK UNIQUE (STUD_NO, COURSE_NO)
);


CREATE TABLE SCHOOL_DEPT
(
	DEPT_NO number(4,0) NOT NULL,
	DEPT_NAME varchar2(100) NOT NULL,
	PRIMARY KEY (DEPT_NO)
);


CREATE TABLE SCHOOL_PROFESSORS
(
	PROF_NO number(4,0) NOT NULL,
	PROF_NAME varchar2(100) NOT NULL,
	PROF_POSITION varchar2(50),
	PROF_CREATE_DATE date DEFAULT SYSDATE,
	DEPT_NO number(4,0) NOT NULL,
	PRIMARY KEY (PROF_NO)
);


CREATE TABLE SCHOOL_STUDENTS
(
	STUD_NO number(4,0) NOT NULL,
	STUD_NAME varchar2(100) NOT NULL,
	STUD_GRADE number(1) NOT NULL,
	STUD_CREATE_DATE date DEFAULT SYSDATE,
	DEPT_NO number(4,0) NOT NULL,
	PRIMARY KEY (STUD_NO)
);


CREATE TABLE SCHOOL_SUBJECTS
(
	SUBJECT_NO number(4,0) NOT NULL,
	SUBJECT_NAME varchar2(200) NOT NULL,
	SUBJECT_CREATE_DATE date DEFAULT SYSDATE,
	DEPT_NO number(4,0) NOT NULL,
	PRIMARY KEY (SUBJECT_NO)
);



/* Create Foreign Keys */

ALTER TABLE SCHOOL_COURSE_REGISTRATONS
	ADD FOREIGN KEY (COURSE_NO)
	REFERENCES SCHOOL_COURSES (COURSE_NO)
;


ALTER TABLE SCHOOL_PROFESSORS
	ADD FOREIGN KEY (DEPT_NO)
	REFERENCES SCHOOL_DEPT (DEPT_NO)
;


ALTER TABLE SCHOOL_STUDENTS
	ADD FOREIGN KEY (DEPT_NO)
	REFERENCES SCHOOL_DEPT (DEPT_NO)
;


ALTER TABLE SCHOOL_SUBJECTS
	ADD FOREIGN KEY (DEPT_NO)
	REFERENCES SCHOOL_DEPT (DEPT_NO)
;


ALTER TABLE SCHOOL_COURSES
	ADD FOREIGN KEY (PROF_NO)
	REFERENCES SCHOOL_PROFESSORS (PROF_NO)
;


ALTER TABLE SCHOOL_COURSE_REGISTRATONS
	ADD FOREIGN KEY (STUD_NO)
	REFERENCES SCHOOL_STUDENTS (STUD_NO)
;


ALTER TABLE SCHOOL_COURSES
	ADD FOREIGN KEY (SUBJECT_NO)
	REFERENCES SCHOOL_SUBJECTS (SUBJECT_NO)
;


CREATE SEQUENCE SCHOOL_DEPT_SEQ START WITH 10 INCREMENT BY 10 NOCACHE;
CREATE SEQUENCE SCHOOL_PROF_SEQ START WITH 1000 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE SCHOOL_STUDENT_SEQ START WITH 5000 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE SCHOOL_SUBJECT_SEQ START WITH 100 INCREMENT BY 10 NOCACHE;
CREATE SEQUENCE SCHOOL_COURSE_SEQ START WITH 100 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE SCHOOL_COURES_REG_SEQ START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE VIEW SCHOOL_COUTSE_VIEW
AS
    SELECT a.course_no ������ȣ, a.course_name ������, a.course_qutoa ��������, a.course_reg_cnt ������û�ο�, a.course_closed ��������,
           b.subject_no �а���ȣ, b.subject_name �а��̸�,
           c.prof_no ��米����ȣ, c.prof_name ��米���̸�,
           d.dept_no �а���ȣ, d.dept_name �����а���,
           A.COURSE_CREATE_DATE �����
    FROM school_courses A, school_subjects B, school_professors C, school_dept D
    WHERE a.subject_no = b.subject_no
    AND a.prof_no = c.prof_no
    AND b.dept_no = d.dept_no;

-- �������� ������ ����
GRANT CREATE VIEW TO SCOTT;
SELECT
    *
FROM school_courses_VIEW
WHERE COURSED_NO = ?;

-- ()�а����� ������ ��������
SELECT
    *
FROM school_courses_VIEW
WHERE DEPT_NO = ?;

-- ()������ ������ ��������
SELECT
    *
FROM school_courses_VIEW
WHERE PROF_NO = ?;

-- ()�л��� ��û�� ��������
SELECT
    *
FROM school_courses_VIEW
WHERE STUDENT_NO = ?;























