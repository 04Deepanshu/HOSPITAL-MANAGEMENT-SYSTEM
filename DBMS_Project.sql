create database Hospital_Management_System;
use Hospital_Management_System;
create table Hospital(Name varchar(30), Address varchar(100), Hospital_Id varchar(9) primary key);
create table Department(Department_no int primary key, Department_Name varchar(20));
create table Doctor(Doctor_Name varchar(30),sex varchar(1),Dept_num int, Doctor_Id varchar(6) primary key, Hosp_Id varchar(9), foreign key(Hosp_Id) references Hospital(Hospital_Id), foreign key(Dept_num) references Department(Department_no));
create table Bill(Bill_Charges float, Patient_Type varchar(3), Bill_no int primary key, Pat_Id varchar(6), Pat_name varchar(30));
create table Room(Room_no varchar(5) primary key, roomstatus varchar(6));
create table Patient(Patient_Name varchar(30), Disease varchar(20), Sex varchar(1), Doc_Id varchar(6),Hos_Id varchar(9) ,Patient_Id varchar(6) primary key, foreign key(Doc_Id) references Doctor(Doctor_Id), foreign key(Hos_Id) references Hospital(Hospital_Id));
create table Lab_Report(Doctr_Id varchar(6), Report_Id varchar(10) primary key, pat_Id varchar(6), date_of_issue date, foreign key(Doctr_Id) references Doctor(Doctor_Id));
create table Inpatient(IN_Id varchar(6) primary key,Doc_Id varchar(6), R_no varchar(5), Rept_Id  varchar(10), Date_of_adm date, Date_of_dis date, B_no int, foreign key(R_no) references Room(Room_no), foreign key(Rept_Id) references Lab_Report(Report_Id), foreign key(B_no) references Bill(Bill_no), foreign key(IN_Id) references Patient(Patient_Id));
create table Outpatient(OUT_Id varchar(6) primary key,Doc_Id varchar(6), Rept_Id  varchar(10), B_no int, foreign key(B_no) references Bill(Bill_no), foreign key(Rept_Id) references Lab_Report(Report_Id),foreign key(OUT_Id) references Patient(Patient_Id));
create table Nurse(Nurse_name varchar(30), nurse_room varchar(5), foreign key(nurse_room) references Room(Room_no));
create table works_for(H_Id varchar(9), D_no int, foreign key(D_no) references Department(Department_no), foreign key(H_Id) references Hospital(Hospital_Id), primary key(H_Id,D_no));
create table phone_no(Patnt_Id varchar(6), Patnt_phone varchar(10), foreign key(Patnt_Id) references Patient(Patient_Id));

insert into Hospital values("Apex City Hospital","D-440, Hanuman road,West Vinod Nagar, New Delhi, Delhi","DL2413643");
insert into Hospital values("Yashoda Hospital","III-M, Motilal Nehru Nagar, Near Nehru Nagar Stadium, Nehru Nagar, Ghaziabad","GZ5346829");
insert into Hospital values("Pushpanjali Hosptal","Civil Line Rd, near Rajiv Chowk, Civil Lines, Gurugram, Haryana","HR7672845");

describe Hospital;
select* from Hospital;

insert into Department values(1,"Surgery");
insert into Department values(2,"Neurology");
insert into Department values(3,"Psychiatry");
insert into Department values(4,"ENT");
insert into Department values(5,"Eye");
insert into Department values(6,"Dental");
insert into Department values(7,"Orthopedics");
insert into Department values(8,"Cardiology");
insert into Department values(9,"Radiology");
insert into Department values(10,"Gynaecology");


select* from Department;

insert into Doctor values("Chetna Sharma",'F',1,"AC2464","DL2413643");
insert into Doctor values("Amit Saxena",'M',1,"AC2498","DL2413643");
insert into Doctor values("Virendra dua",'M',2,"AC2456","DL2413643");
insert into Doctor values("Sakshi Ahuja",'F',7,"AC2434","DL2413643");
insert into Doctor values("Narendra Gautam",'M',7,"AC2488","DL2413643");
insert into Doctor values("Rashmi Thakur",'F',10,"AC2499","DL2413643");

insert into Doctor values("Aryan Kalra",'M',2,"YA5326","GZ5346829");
insert into Doctor values("Tanishka Khanna",'F',4,"YA5385","GZ5346829");
insert into Doctor values("Himanshu Saxena",'M',4,"YA5396","GZ5346829");
insert into Doctor values("Kartik Singh",'M',8,"YA5322","GZ5346829");
insert into Doctor values("Sarthak Taneja",'M',6,"YA5368","GZ5346829");
insert into Doctor values("Harshita Gupta",'F',8,"YA5377","GZ5346829");
insert into Doctor values("Dinesh Sisaudia",'M',10,"YA5399","GZ5346829");

insert into Doctor values("Hardik Kumar",'M',1,"PU7664","HR7672845");
insert into Doctor values("Srishti Singh",'F',3,"PU7698","HR7672845");
insert into Doctor values("Madhurima Kukreja",'F',3,"PU7656","HR7672845");
insert into Doctor values("Saksham Sinha",'M',5,"PU7634","HR7672845");
insert into Doctor values("Gautam Vig",'M',9,"PU7688","HR7672845");
insert into Doctor values("Saarika Gupta",'F',5,"PU7668","HR7672845");
insert into Doctor values("Shweta Judeja",'F',9,"PU7677","HR7672845");
insert into Doctor values("Ayushman Khurana",'M',10,"PU7699","HR7672845");

select* from Doctor;

insert into Patient values("Kartikey Sharma","Appendicitis",'F',"PU7664","HR7672845","I04241");
insert into Patient values("Pankaj Mishra","Autism",'M',"YA5326","GZ5346829","I18482");
insert into Patient values("Sagar dua","Epilepsy",'M',"AC2456","DL2413643","I11645");
insert into Patient values("Sakshi Taneja","Rheumatoid Arthritis",'F',"AC2434","DL2413643","I27654");
insert into Patient values("Raghvendra Gautam","Periodontal",'M',"YA5368","GZ5346829","I11786");
insert into Patient values("Archana Kalra","Appendicitis",'M',"AC2498","DL2413643","I38249");
insert into Patient values("Trasha Khanna","Alzheimer",'F',"PU7677","HR7672845","I76453");
insert into Patient values("Kabir Saxena","Ear Infections",'M',"YA5396","GZ5346829","O66345");
insert into Patient values("Kartik Gupta","Cataract",'M',"PU7634","HR7672845","O98347");
insert into Patient values("Sarthak Mishra","Osteoarthritis",'M',"AC2488","DL2413643","I34768");
insert into Patient values("Harshita Gor","Heart Attack",'F',"YA5377","GZ5346829","I78602");
insert into Patient values("Sudha Sinha","Dry Eye and pain",'F',"PU7668","HR7672845","O97028");
insert into Patient values("Krishna Gor","Pancreatitis",'M',"AC2464","DL2413643","I45467");
insert into Patient values("Srishti Pal","Depression",'F',"PU7698","HR7672845","O74398");
insert into Patient values("Madhu Jain","BiPolar Disorder",'F',"PU7656","HR7672845","I36985");
insert into Patient values("Mohammad Ali","High Blood Pressure",'M',"YA5322","GZ5346829","O16387");
insert into Patient values("Shalin Chaudhary","Brain tumors",'M',"PU7688","HR7672845","I71493");
insert into Patient values("Anmol Jain","Sinusitis",'F',"YA5385","GZ5346829","O26245");
insert into Patient values("Anuradha Khanna","Hormonal disorders",'F',"YA5399","GZ5346829","O87343");
insert into Patient values("Jasmine Sharma","Hormonal disorders",'F',"PU7699","HR7672845","I34984");
insert into Patient values("Divya Kashyap","Menstrual disorders",'F',"AC2499","DL2413643","O34702");
select* from Patient;


insert into Room values("AC001","busy");
insert into Room values("AC002","busy");
insert into Room values("AC101","vacant");
insert into Room values("AC102","busy");
insert into Room values("AC201","vacant");
insert into Room values("AC202","busy");
insert into Room values("AC301","vacant");
insert into Room values("AC302","busy");
insert into Room values("PU001","busy");
insert into Room values("PU002","busy");
insert into Room values("PU003","busy");
insert into Room values("PU101","busy");
insert into Room values("PU102","vacant");
insert into Room values("PU103","busy");
insert into Room values("PU201","vacant");
insert into Room values("PU202","vacant");
insert into Room values("PU203","vacant");
insert into Room values("YA001","vacant");
insert into Room values("YA002","busy");
insert into Room values("YA003","vacant");
insert into Room values("YA004","busy");
insert into Room values("YA005","vacant");
insert into Room values("YA101","vacant");
insert into Room values("YA102","vacant");
insert into Room values("YA103","busy");
insert into Room values("YA201","vacant");
insert into Room values("YA202","vacant");
insert into Room values("YA203","vacant");

select* from Room;

insert into Bill values(18000,"INP",04241,"I04241","Kartikey Sharma");
insert into Bill values(20000,"INP",18482,"I18482","Pankaj Mishra");
insert into Bill values(20000,"INP",11645,"I11645","Sagar dua");
insert into Bill values(15000,"INP",27654,"I27654","Sakshi Taneja");
insert into Bill values(3200,"INP",11786,"I11786","Raghvendra Gautam");
insert into Bill values(17500,"INP",38249,"I38249","Archana Kalra");
insert into Bill values(22570,"INP",76453,"I76453","Trasha Khanna");
insert into Bill values(2000,"OUP",66345,"O66345","Kabir Saxena");
insert into Bill values(8000,"OUP",98347,"O98347","Kartik Gupta");
insert into Bill values(15000,"INP",34768,"I34768","Sarthak Mishra");
insert into Bill values(255000,"INP",78602,"I78602","Harshita Gor");
insert into Bill values(2000,"OUP",97028,"O97028","Sudha Sinha");
insert into Bill values(18000,"INP",45467,"I45467","Krishna Gor");
insert into Bill values(5000,"OUP",74398,"O74398","Srishti Pal");
insert into Bill values(8000,"INP",36985,"I36985","Madhu Jain");
insert into Bill values(2800,"OUP",16387,"O16387","Mohammad Ali");
insert into Bill values(256250,"INP",71493,"I71493","Shalin Chaudhary");
insert into Bill values(2250,"OUP",26245,"O26245","Anmol Jain");
insert into Bill values(3250,"OUP",87343,"O87343","Anuradha Khanna");
insert into Bill values(8250,"INP",34984,"I34984","Jasmine Sharma");
insert into Bill values(3370,"OUP",34702,"O34702","Divya Kashyap");

insert into Lab_Report values("PU7664","HR001","I04241","2023-01-01");
insert into Lab_Report values("AC2456","DL001","I11645","2023-01-10");
insert into Lab_Report values("YA5368","GZ001","I11786","2023-01-15");
insert into Lab_Report values("YA5326","GZ002","I18482","2023-02-13");
insert into Lab_Report values("AC2434","DL002","I27654","2023-02-09");
insert into Lab_Report values("AC2488","DL003","I34768","2023-02-01");
insert into Lab_Report values("PU7699","HR002","I34984","2023-03-11");
insert into Lab_Report values("PU7656","HR003","I36985","2023-03-31");
insert into Lab_Report values("AC2498","DL004","I38249","2023-03-21");
insert into Lab_Report values("AC2464","DL005","I45467","2023-04-01");
insert into Lab_Report values("PU7688","HR004","I71493","2023-04-16");
insert into Lab_Report values("PU7677","HR005","I76453","2023-04-18");
insert into Lab_Report values("YA5377","GZ003","I78602","2023-01-01");
insert into Lab_Report values("YA5322","GZ004","O16387","2023-01-01");
insert into Lab_Report values("YA5385","GZ005","O26245","2023-01-08");
insert into Lab_Report values("AC2499","DL006","O34702","2023-02-04");
insert into Lab_Report values("YA5396","GZ006","O66345","2023-02-02");
insert into Lab_Report values("PU7698","HR006","O74398","2023-02-12");
insert into Lab_Report values("YA5399","GZ007","O87343","2023-03-27");
insert into Lab_Report values("PU7668","HR007","O97028","2023-03-23");
insert into Lab_Report values("PU7634","HR008","O98347","2023-03-21");

insert into Inpatient values("I04241","PU7664","PU001","HR001","2023-01-01","2023-01-05",04241);
insert into Inpatient values("I18482","YA5326","YA002","GZ002","2023-02-13","2023-02-23",18482);
insert into Inpatient values("I11645","AC2456","AC001","DL001","2023-01-10","2023-01-18",11645);
insert into Inpatient values("I27654","AC2434","AC102","DL002","2023-02-09","2023-02-12",27654);
insert into Inpatient values("I11786","YA5368","YA004","GZ001","2023-01-15","2023-01-21",11786);
insert into Inpatient values("I38249","AC2498","AC302","DL004","2023-03-21","2023-03-28",38249);
insert into Inpatient values("I76453","PU7677","PU002","HR005","2023-04-18","2023-04-23",76453);
insert into Inpatient values("I34768","AC2488","AC002","DL003","2023-02-01","2023-02-08",34768);
insert into Inpatient values("I78602","YA5377","YA103","GZ003","2023-01-01","2023-01-13",78602);
insert into Inpatient values("I45467","AC2464","AC202","DL005","2023-04-01","2023-04-05",45467);
insert into Inpatient values("I36985","PU7656","PU101","HR003","2023-03-31","2023-04-4",36985);
insert into Inpatient values("I71493","PU7688","PU003","HR004","2023-04-16","2023-04-20",71493);
insert into Inpatient values("I34984","PU7699","PU103","HR002","2023-03-11","2023-03-12",34984);

select* from room;
insert into Outpatient values("O66345","YA5396","GZ006",66345);
insert into Outpatient values("O98347","PU7634","HR008",98347);
insert into Outpatient values("O97028","PU7668","HR007",97028);
insert into Outpatient values("O74398","PU7698","HR006",74398);
insert into Outpatient values("O16387","YA5322","GZ004",16387);
insert into Outpatient values("O26245","YA5385","GZ005",26245);
insert into Outpatient values("O87343","YA5399","GZ007",87343);
insert into Outpatient values("O34702","AC2499","DL006",34702);

insert into phone_no values("I04241",9981234567);
insert into phone_no values("I04241",9821238762);
insert into phone_no values("I04241",8982245612);
insert into phone_no values("I18482",8826543972);
insert into phone_no values("I18482",9825324434);
insert into phone_no values("I11645",9821456780);
insert into phone_no values("I27654",9350952320);
insert into phone_no values("I27654",8723983768);
insert into phone_no values("I27654",9389817874);
insert into phone_no values("I11786",8368169426);
insert into phone_no values("I38249",9818402198);
insert into phone_no values("I76453",9971068412);
insert into phone_no values("I76453",8973278152);
insert into phone_no values("I34768",7428318429);
insert into phone_no values("I34768",9021838967);
insert into phone_no values("I78602",7838016872);
insert into phone_no values("I45467",8865720432);
insert into phone_no values("I36985",7754904332);
insert into phone_no values("I71493",9900655442);
insert into phone_no values("I34984",8809065242);
insert into phone_no values("I34984",9893728678);
insert into phone_no values("O66345",9898956562);
insert into phone_no values("O98347",8888743256);
insert into phone_no values("O98347",7865746290);
insert into phone_no values("O98347",9778878687);
insert into phone_no values("O97028",7766234091);
insert into phone_no values("O97028",7864646765);
insert into phone_no values("O74398",7723498723);
insert into phone_no values("O16387",8368724231);
insert into phone_no values("O16387",7867857646);
insert into phone_no values("O16387",9885675644);
insert into phone_no values("O26245",9878815463);
insert into phone_no values("O87343",8696217856);
insert into phone_no values("O34702",9862387892);

insert into works_for values("DL2413643",1);
insert into works_for values("DL2413643",2);
insert into works_for values("DL2413643",7);
insert into works_for values("DL2413643",10);

insert into works_for values("GZ5346829",2);
insert into works_for values("GZ5346829",4);
insert into works_for values("GZ5346829",6);
insert into works_for values("GZ5346829",8);
insert into works_for values("GZ5346829",10);

insert into works_for values("HR7672845",1);
insert into works_for values("HR7672845",3);
insert into works_for values("HR7672845",5);
insert into works_for values("HR7672845",9);
insert into works_for values("HR7672845",10);

insert into Nurse values("Manisha Thakur","PU001");
insert into Nurse values("Vineeta Kumari","YA002");
insert into Nurse values("Sonali Phogat","AC001");
insert into Nurse values("Arti Singh","AC102");
insert into Nurse values("Pooja Sharma","YA004");
insert into Nurse values("Heena Sharma","AC302");
insert into Nurse values("Shefali Singh","PU002");
insert into Nurse values("Garima Saxena","AC002");
insert into Nurse values("Pranjal Dua","YA103");
insert into Nurse values("Diya Verma","AC202");
insert into Nurse values("Khushi Kohli","PU101");
insert into Nurse values("Divya Sharma","PU003");
insert into Nurse values("Daya Shankar","PU103");
insert into Nurse values("Anjali Rathore",NULL);
insert into Nurse values("Komal Singh",NULL);
insert into Nurse values("Sarika Jaiswal",NULL);
insert into Nurse values("Kiran Singh",NULL);
insert into Nurse values("Mahira Sharma",NULL);

select name from doctor, hospital
where Hospital_Id = Hosp_Id;

select name from hospital, patient
where Hospital_Id = Hos_Id and max(count(*))
group by name;

select Nurse_name, Nurse_room from Nurse
where Nurse_room like 'YA%';

select Doctor_name, sex, dept_num, Doctor_Id, Hosp_Id from Doctor, inpatient, lab_report
where Doctor_Id=Doc_Id and Rept_Id = Report_Id and rept_Id = 'HR002';

select patient_name, room_no, roomstatus, Report_Id,disease, date_of_issue
from Patient,Inpatient, room, Lab_report
where Patient_Id=In_Id and R_no = room_no and Rept_Id = Report_Id and patient_name = "Sagar Dua";

select patient_name, disease, sex, doc_Id, Hos_Id, Patient_Id, Rept_Id 
from Patient, Inpatient, outpatient, Lab_report, phone_no ;

select patient_name, disease, sex, patient.doc_id, hos_id, patient_id
from patient,phone_no
where patient_id = patnt_id and
patient_id in (select patnt_id from phone_no group by patnt_id having count(*)>1)
group by patient_id;



Select name, COUNT(name) as mycount
from hospital,patient where hos_Id=hospital_Id  group by name 
having mycount=(select max(mycount)
from (select name, COUNT(name) as mycount 
  from hospital, patient 
  where hos_Id = hospital_Id 
  group by name)as maxCount);

  
SELECT name, COUNT(name) as mycount
FROM hospital,patient where hos_Id=hospital_Id
GROUP BY name
HAVING max(mycount);
  
  
  

  use Hospital_Management_System;
  
SELECT patient_name, disease, sex, patient.doc_id, hos_id, patient_id
FROM patient
WHERE (SELECT COUNT(*)
 FROM phone_no
 WHERE patient_Id=patnt_id)>1;
 
 SELECT patient_name, disease, sex, patient.doc_id, hos_id, patient_id
FROM patient,phone_no
WHERE  patient_Id=patnt_id
GROUP BY patient_id
HAVING COUNT(patnt_id)>1;

SELECT name
FROM Hospital, Patient
WHERE Hospital_id=hos_id
GROUP BY hospital_id
HAVING max(count(hospital_id));