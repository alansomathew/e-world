# HeidiSQL Dump 
#
# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     db_eworld
# Server version:               10.4.11-MariaDB
# Server OS:                    Win64
# Target compatibility:         ANSI SQL
# HeidiSQL version:             4.0
# Date/time:                    2022-04-13 17:38:01
# --------------------------------------------------------

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ANSI,NO_BACKSLASH_ESCAPES';*/
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;*/


#
# Database structure for database 'db_eworld'
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ "db_eworld" /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE "db_eworld";


#
# Table structure for table 'tbl_admin'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_admin" (
  "admin_id" int(11) NOT NULL AUTO_INCREMENT,
  "admin_username" varchar(50) NOT NULL,
  "admin_password" varchar(50) NOT NULL,
  PRIMARY KEY ("admin_id")
);



#
# Dumping data for table 'tbl_admin'
#

# No data found.



#
# Table structure for table 'tbl_batch'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_batch" (
  "batch_id" int(11) NOT NULL AUTO_INCREMENT,
  "batch_name" varchar(50) NOT NULL,
  "batch_starttime" varchar(50) NOT NULL,
  "batch_endtime" varchar(50) NOT NULL,
  "batch_date" varchar(50) NOT NULL,
  "batch_count" varchar(50) NOT NULL,
  "course_id" int(11) NOT NULL,
  PRIMARY KEY ("batch_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_batch'
#

# No data found.



#
# Table structure for table 'tbl_complaint'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_complaint" (
  "complaint_id" int(11) NOT NULL AUTO_INCREMENT,
  "complaint_status" varchar(50) NOT NULL DEFAULT '0',
  "complaint_content" varchar(50) NOT NULL,
  "complaint_date" varchar(50) NOT NULL,
  "user_id" int(11) NOT NULL DEFAULT 0,
  "projectcenter_id" int(11) NOT NULL DEFAULT 0,
  "staff_id" int(11) NOT NULL DEFAULT 0,
  "reply_date" varchar(50) NOT NULL DEFAULT '0',
  "complaint_reply" varchar(50) NOT NULL DEFAULT 'not yet reply',
  "complainttype_id" int(11) NOT NULL,
  PRIMARY KEY ("complaint_id")
) AUTO_INCREMENT=7;



#
# Dumping data for table 'tbl_complaint'
#

LOCK TABLES "tbl_complaint" WRITE;
/*!40000 ALTER TABLE "tbl_complaint" DISABLE KEYS;*/
REPLACE INTO "tbl_complaint" ("complaint_id", "complaint_status", "complaint_content", "complaint_date", "user_id", "projectcenter_id", "staff_id", "reply_date", "complaint_reply", "complainttype_id") VALUES
	(1,'1','deghjk','2022-04-12',3,0,0,'2022-04-13','try to solve it',4);
REPLACE INTO "tbl_complaint" ("complaint_id", "complaint_status", "complaint_content", "complaint_date", "user_id", "projectcenter_id", "staff_id", "reply_date", "complaint_reply", "complainttype_id") VALUES
	(3,'1','deley in process','2022-04-12',3,0,0,'0','Ok we try to solve it',4);
REPLACE INTO "tbl_complaint" ("complaint_id", "complaint_status", "complaint_content", "complaint_date", "user_id", "projectcenter_id", "staff_id", "reply_date", "complaint_reply", "complainttype_id") VALUES
	(4,'1','deley in process','2022-04-12',0,0,1,'2022-04-13','try to solve it',4);
REPLACE INTO "tbl_complaint" ("complaint_id", "complaint_status", "complaint_content", "complaint_date", "user_id", "projectcenter_id", "staff_id", "reply_date", "complaint_reply", "complainttype_id") VALUES
	(5,'1','slow site','2022-04-12',0,2,0,'2022-04-13','We try to solve it',4);
REPLACE INTO "tbl_complaint" ("complaint_id", "complaint_status", "complaint_content", "complaint_date", "user_id", "projectcenter_id", "staff_id", "reply_date", "complaint_reply", "complainttype_id") VALUES
	(6,'1','connection slow','2022-04-13',0,0,1,'2022-04-13','we try to solve it',4);
/*!40000 ALTER TABLE "tbl_complaint" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_complainttype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_complainttype" (
  "complainttype_id" int(11) NOT NULL AUTO_INCREMENT,
  "complainttype_name" varchar(50) NOT NULL,
  PRIMARY KEY ("complainttype_id")
) AUTO_INCREMENT=5;



#
# Dumping data for table 'tbl_complainttype'
#

# No data found.



#
# Table structure for table 'tbl_course'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_course" (
  "course_id" int(11) NOT NULL AUTO_INCREMENT,
  "coursetype_id" int(11) NOT NULL,
  "course_name" varchar(50) NOT NULL,
  "course_amount" varchar(50) NOT NULL,
  "language_id" int(11) NOT NULL,
  "projectcenter_id" int(11) NOT NULL,
  "course_duration" varchar(50) NOT NULL,
  PRIMARY KEY ("course_id")
) AUTO_INCREMENT=5;



#
# Dumping data for table 'tbl_course'
#

LOCK TABLES "tbl_course" WRITE;
/*!40000 ALTER TABLE "tbl_course" DISABLE KEYS;*/
REPLACE INTO "tbl_course" ("course_id", "coursetype_id", "course_name", "course_amount", "language_id", "projectcenter_id", "course_duration") VALUES
	(1,4,'dd','5000',6,2,'2');
REPLACE INTO "tbl_course" ("course_id", "coursetype_id", "course_name", "course_amount", "language_id", "projectcenter_id", "course_duration") VALUES
	(3,6,'ss','4000',6,2,'3');
REPLACE INTO "tbl_course" ("course_id", "coursetype_id", "course_name", "course_amount", "language_id", "projectcenter_id", "course_duration") VALUES
	(4,4,'multimedia','5000',6,2,'2');
/*!40000 ALTER TABLE "tbl_course" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_courseassign'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_courseassign" (
  "courseassign_id" int(11) NOT NULL AUTO_INCREMENT,
  "course_id" int(11) NOT NULL,
  "staff_id" int(11) NOT NULL,
  PRIMARY KEY ("courseassign_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_courseassign'
#

LOCK TABLES "tbl_courseassign" WRITE;
/*!40000 ALTER TABLE "tbl_courseassign" DISABLE KEYS;*/
REPLACE INTO "tbl_courseassign" ("courseassign_id", "course_id", "staff_id") VALUES
	(1,1,1);
/*!40000 ALTER TABLE "tbl_courseassign" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_coursetype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_coursetype" (
  "coursetype_id" int(11) NOT NULL AUTO_INCREMENT,
  "coursetype_name" varchar(50) NOT NULL,
  PRIMARY KEY ("coursetype_id")
) AUTO_INCREMENT=7;



#
# Dumping data for table 'tbl_coursetype'
#

LOCK TABLES "tbl_coursetype" WRITE;
/*!40000 ALTER TABLE "tbl_coursetype" DISABLE KEYS;*/
REPLACE INTO "tbl_coursetype" ("coursetype_id", "coursetype_name") VALUES
	(4,'Graphic Designing');
REPLACE INTO "tbl_coursetype" ("coursetype_id", "coursetype_name") VALUES
	(6,'Python');
/*!40000 ALTER TABLE "tbl_coursetype" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_district'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_district" (
  "district_id" int(11) NOT NULL AUTO_INCREMENT,
  "district_name" varchar(50) NOT NULL,
  PRIMARY KEY ("district_id")
) AUTO_INCREMENT=13;



#
# Dumping data for table 'tbl_district'
#

LOCK TABLES "tbl_district" WRITE;
/*!40000 ALTER TABLE "tbl_district" DISABLE KEYS;*/
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(6,'Kannur');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(7,'Kottayam');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(8,'Ernakulam');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(9,'Idukki');
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	(12,'Palakkad');
/*!40000 ALTER TABLE "tbl_district" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_feedback'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_feedback" (
  "feedback_id" int(11) NOT NULL AUTO_INCREMENT,
  "feedback_content" varchar(50) NOT NULL,
  "user_id" int(11) NOT NULL DEFAULT 0,
  "projectcenter_id" int(11) NOT NULL DEFAULT 0,
  "feedback_date" varchar(50) NOT NULL,
  PRIMARY KEY ("feedback_id")
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_feedback'
#

LOCK TABLES "tbl_feedback" WRITE;
/*!40000 ALTER TABLE "tbl_feedback" DISABLE KEYS;*/
REPLACE INTO "tbl_feedback" ("feedback_id", "feedback_content", "user_id", "projectcenter_id", "feedback_date") VALUES
	(1,'hgfgh',1,0,'2022-04-11');
REPLACE INTO "tbl_feedback" ("feedback_id", "feedback_content", "user_id", "projectcenter_id", "feedback_date") VALUES
	(2,'hjhjhj',0,2,'2022-04-12');
REPLACE INTO "tbl_feedback" ("feedback_id", "feedback_content", "user_id", "projectcenter_id", "feedback_date") VALUES
	(3,'jhkh',3,0,'2022-04-12');
REPLACE INTO "tbl_feedback" ("feedback_id", "feedback_content", "user_id", "projectcenter_id", "feedback_date") VALUES
	(4,'good site',3,0,'2022-04-12');
REPLACE INTO "tbl_feedback" ("feedback_id", "feedback_content", "user_id", "projectcenter_id", "feedback_date") VALUES
	(5,'Good Site',0,3,'2022-04-12');
/*!40000 ALTER TABLE "tbl_feedback" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_language'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_language" (
  "language_id" int(11) NOT NULL AUTO_INCREMENT,
  "language_name" varchar(50) NOT NULL,
  PRIMARY KEY ("language_id")
) AUTO_INCREMENT=9;



#
# Dumping data for table 'tbl_language'
#

LOCK TABLES "tbl_language" WRITE;
/*!40000 ALTER TABLE "tbl_language" DISABLE KEYS;*/
REPLACE INTO "tbl_language" ("language_id", "language_name") VALUES
	(6,'php');
REPLACE INTO "tbl_language" ("language_id", "language_name") VALUES
	(8,'jsp');
/*!40000 ALTER TABLE "tbl_language" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_place'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_place" (
  "place_id" int(11) NOT NULL AUTO_INCREMENT,
  "place_name" varchar(50) NOT NULL,
  "district_id" int(11) NOT NULL,
  PRIMARY KEY ("place_id")
) AUTO_INCREMENT=10;



#
# Dumping data for table 'tbl_place'
#

LOCK TABLES "tbl_place" WRITE;
/*!40000 ALTER TABLE "tbl_place" DISABLE KEYS;*/
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	(2,'Muvattupuzha',8);
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	(5,'Aluva',8);
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	(8,'Maradu',8);
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	(9,'Thodupuzha',9);
/*!40000 ALTER TABLE "tbl_place" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_projectcenter'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_projectcenter" (
  "projectcenter_id" int(11) NOT NULL AUTO_INCREMENT,
  "projectcenter_name" varchar(50) NOT NULL,
  "projectcenter_contact" varchar(50) NOT NULL,
  "projectcenter_email" varchar(50) NOT NULL,
  "projectcenter_address" varchar(50) NOT NULL,
  "place_id" int(11) NOT NULL,
  "projectcenter_password" varchar(50) NOT NULL,
  "projectcenter_doj" varchar(50) NOT NULL,
  "projectcenter_vstatus" varchar(50) NOT NULL DEFAULT '0',
  "projectcenter_photo" varchar(50) NOT NULL,
  "projectcenter_proof" varchar(50) NOT NULL,
  PRIMARY KEY ("projectcenter_id")
) AUTO_INCREMENT=4;



#
# Dumping data for table 'tbl_projectcenter'
#

LOCK TABLES "tbl_projectcenter" WRITE;
/*!40000 ALTER TABLE "tbl_projectcenter" DISABLE KEYS;*/
REPLACE INTO "tbl_projectcenter" ("projectcenter_id", "projectcenter_name", "projectcenter_contact", "projectcenter_email", "projectcenter_address", "place_id", "projectcenter_password", "projectcenter_doj", "projectcenter_vstatus", "projectcenter_photo", "projectcenter_proof") VALUES
	(1,'CYBER PRISM','9674321569','cyberprism@gmail.com','hostel junction',2,'432','2022-03-19','2','ProjectCenterphoto_1179.jpeg','ProjectCenterproof_1341.jpeg');
REPLACE INTO "tbl_projectcenter" ("projectcenter_id", "projectcenter_name", "projectcenter_contact", "projectcenter_email", "projectcenter_address", "place_id", "projectcenter_password", "projectcenter_doj", "projectcenter_vstatus", "projectcenter_photo", "projectcenter_proof") VALUES
	(2,'LCC','9845773289','lcc@gmail.com','Aluva',5,'786','2022-03-19','1','ProjectCenterphoto_1456.jpeg','ProjectCenterproof_1857.jpeg');
REPLACE INTO "tbl_projectcenter" ("projectcenter_id", "projectcenter_name", "projectcenter_contact", "projectcenter_email", "projectcenter_address", "place_id", "projectcenter_password", "projectcenter_doj", "projectcenter_vstatus", "projectcenter_photo", "projectcenter_proof") VALUES
	(3,'Black chain','9456745679','blackchain@gmail.com','9456745679',9,'234','2022-03-19','1','ProjectCenterphoto_1729.jpeg','ProjectCenterproof_2053.jpeg');
/*!40000 ALTER TABLE "tbl_projectcenter" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_request'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_request" (
  "request_id" int(11) NOT NULL AUTO_INCREMENT,
  "user_id" int(11) NOT NULL,
  "request_date" varchar(50) NOT NULL,
  "course_id" int(11) NOT NULL,
  "request_status" varchar(50) NOT NULL DEFAULT '0',
  "request_dob" varchar(50) NOT NULL,
  "request_pstatus" varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY ("request_id")
) AUTO_INCREMENT=6;



#
# Dumping data for table 'tbl_request'
#

LOCK TABLES "tbl_request" WRITE;
/*!40000 ALTER TABLE "tbl_request" DISABLE KEYS;*/
REPLACE INTO "tbl_request" ("request_id", "user_id", "request_date", "course_id", "request_status", "request_dob", "request_pstatus") VALUES
	(1,1,'2022-04-07',1,'0','2022-04-07','0');
REPLACE INTO "tbl_request" ("request_id", "user_id", "request_date", "course_id", "request_status", "request_dob", "request_pstatus") VALUES
	(2,1,'2022-04-07',1,'1','2022-04-07','0');
REPLACE INTO "tbl_request" ("request_id", "user_id", "request_date", "course_id", "request_status", "request_dob", "request_pstatus") VALUES
	(3,1,'2022-04-06',1,'2','2022-04-07','0');
REPLACE INTO "tbl_request" ("request_id", "user_id", "request_date", "course_id", "request_status", "request_dob", "request_pstatus") VALUES
	(4,1,'2022-04-14',1,'1','2022-04-07','0');
REPLACE INTO "tbl_request" ("request_id", "user_id", "request_date", "course_id", "request_status", "request_dob", "request_pstatus") VALUES
	(5,3,'2022-04-13',1,'1','2022-04-12','0');
/*!40000 ALTER TABLE "tbl_request" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_staff'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_staff" (
  "staff_id" int(11) NOT NULL AUTO_INCREMENT,
  "staff_name" varchar(50) NOT NULL,
  "staff_contact" varchar(50) NOT NULL,
  "staff_email" varchar(50) NOT NULL,
  "staff_address" varchar(50) NOT NULL,
  "staff_photo" varchar(50) NOT NULL,
  "staff_password" varchar(50) NOT NULL,
  "staff_isactive" varchar(50) NOT NULL DEFAULT '0',
  "staff_doj" varchar(50) NOT NULL,
  "projectcenter_id" int(11) NOT NULL,
  "language_id" int(11) NOT NULL,
  PRIMARY KEY ("staff_id")
) AUTO_INCREMENT=10;



#
# Dumping data for table 'tbl_staff'
#

LOCK TABLES "tbl_staff" WRITE;
/*!40000 ALTER TABLE "tbl_staff" DISABLE KEYS;*/
REPLACE INTO "tbl_staff" ("staff_id", "staff_name", "staff_contact", "staff_email", "staff_address", "staff_photo", "staff_password", "staff_isactive", "staff_doj", "projectcenter_id", "language_id") VALUES
	(1,'shihana T.K','9845663288','shihanatk@gmail.com','Green villa','Staffphoto_1157.jpeg','567','0','2022-03-25',0,8);
REPLACE INTO "tbl_staff" ("staff_id", "staff_name", "staff_contact", "staff_email", "staff_address", "staff_photo", "staff_password", "staff_isactive", "staff_doj", "projectcenter_id", "language_id") VALUES
	(2,'Ashna','985677889','ashna@gmail.com','Vytila hub','Staffphoto_1168.jpg','4545','0','2022-03-25',2,6);
REPLACE INTO "tbl_staff" ("staff_id", "staff_name", "staff_contact", "staff_email", "staff_address", "staff_photo", "staff_password", "staff_isactive", "staff_doj", "projectcenter_id", "language_id") VALUES
	(4,'Hanna','9845663289','hanna@gmail.com','Rose villa','Staffphoto_1916.jpeg','231','0','2022-03-25',2,6);
REPLACE INTO "tbl_staff" ("staff_id", "staff_name", "staff_contact", "staff_email", "staff_address", "staff_photo", "staff_password", "staff_isactive", "staff_doj", "projectcenter_id", "language_id") VALUES
	(6,'Appu','878799988','appu@gmail.com','Abcd villa','Staffphoto_1694.jpg','666','0','2022-03-25',2,8);
REPLACE INTO "tbl_staff" ("staff_id", "staff_name", "staff_contact", "staff_email", "staff_address", "staff_photo", "staff_password", "staff_isactive", "staff_doj", "projectcenter_id", "language_id") VALUES
	(8,'Gouri S Nair','985674598','gsn@gmail.com','GR villa
Muvattupuzha
Ernakulam','Staffphoto_1776.jpg','9898','0','2022-04-11',2,6);
REPLACE INTO "tbl_staff" ("staff_id", "staff_name", "staff_contact", "staff_email", "staff_address", "staff_photo", "staff_password", "staff_isactive", "staff_doj", "projectcenter_id", "language_id") VALUES
	(9,'Achu K','878787899','achu@gmail.com','KTK villa,
Ernakulam','Staffphoto_2007.jpg','888','0','2022-04-11',3,6);
/*!40000 ALTER TABLE "tbl_staff" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_subject'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_subject" (
  "subject_id" int(11) NOT NULL AUTO_INCREMENT,
  "subject_name" varchar(50) NOT NULL,
  "course_id" int(11) NOT NULL,
  PRIMARY KEY ("subject_id")
) AUTO_INCREMENT=5;



#
# Dumping data for table 'tbl_subject'
#

LOCK TABLES "tbl_subject" WRITE;
/*!40000 ALTER TABLE "tbl_subject" DISABLE KEYS;*/
REPLACE INTO "tbl_subject" ("subject_id", "subject_name", "course_id") VALUES
	(1,'Tally',0);
REPLACE INTO "tbl_subject" ("subject_id", "subject_name", "course_id") VALUES
	(3,'3d animation',4);
REPLACE INTO "tbl_subject" ("subject_id", "subject_name", "course_id") VALUES
	(4,'fg',1);
/*!40000 ALTER TABLE "tbl_subject" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_syllabus'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_syllabus" (
  "syllabus_id" int(11) NOT NULL AUTO_INCREMENT,
  "syllabus_file" varchar(50) NOT NULL,
  "course_id" int(11) DEFAULT NULL,
  PRIMARY KEY ("syllabus_id")
) AUTO_INCREMENT=15;



#
# Dumping data for table 'tbl_syllabus'
#

# No data found.



#
# Table structure for table 'tbl_user'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_user" (
  "user_id" int(11) NOT NULL AUTO_INCREMENT,
  "user_name" varchar(50) NOT NULL,
  "user_email" varchar(50) NOT NULL,
  "user_contact" varchar(50) NOT NULL,
  "user_address" varchar(50) NOT NULL,
  "place_id" int(11) NOT NULL,
  "user_photo" varchar(50) NOT NULL,
  "user_password" varchar(50) NOT NULL,
  "user_doj" varchar(50) NOT NULL,
  "user_vstatus" varchar(50) DEFAULT '0',
  PRIMARY KEY ("user_id")
) AUTO_INCREMENT=5;



#
# Dumping data for table 'tbl_user'
#

LOCK TABLES "tbl_user" WRITE;
/*!40000 ALTER TABLE "tbl_user" DISABLE KEYS;*/
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_email", "user_contact", "user_address", "place_id", "user_photo", "user_password", "user_doj", "user_vstatus") VALUES
	(1,'Beema Yoosaf','beemayoosaf@gmail.com','9847356219','Giri(H)',2,'Userphoto_1984.jpg','1213','2022-03-17','1');
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_email", "user_contact", "user_address", "place_id", "user_photo", "user_password", "user_doj", "user_vstatus") VALUES
	(3,'Alfiya ','alfiyaa@gmail.com','9856743289','TDA(H)',9,'Userphoto_1389.jpg','4321','2022-03-17','1');
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_email", "user_contact", "user_address", "place_id", "user_photo", "user_password", "user_doj", "user_vstatus") VALUES
	(4,'AMMU','ammu@gmail.com','9845329859','Afg(H)',9,'Userphoto_1204.jpg','4444','2022-03-17','2');
/*!40000 ALTER TABLE "tbl_user" ENABLE KEYS;*/
UNLOCK TABLES;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE;*/
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;*/
