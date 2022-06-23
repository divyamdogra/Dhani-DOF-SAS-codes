Libname datavish "/sasdata/icfl/lin_data/Ravi/Riddhi/Marketing_Daily_Reports";

/* Supersaver and games import */

%Macro Samref (Data=,File=);
Proc import datafile=&File.
Out=&Data.
DBMS = CSV
Replace;
Guessingrows=Max;
Run;
%Mend;

%Samref(Data=datavish.registrations_&cur_date.,File="/sasdata/icfl/lin_data/Ravi/Riddhi/Marketing_Daily_Reports/registrations_&cur_date..csv");

/*Appending Marketing Dump */
Data Datavish.registrations_dump_backup;
set  Datavish.registrations_dump_backup
/* 	 DATAVISH.REGISTRATIONS_&pre_date. (in=a) */
     DATAVISH.REGISTRATIONS_&cur_date. (in=b);
/* if a then Registration_Date=Today()-2;      */
/* if b then Registration_Date=Today()-1; */
format registration_date date9.;
run;

Proc sort data=Datavish.registrations_dump_backup nodupkey;
by Mobile_number;
run;

proc sql;
create table Registration_Referra as
select
a.*,
B.Referee_Match
from datavish.registrations_dump_backup as a
left join
(Select  referee,
		'Y' as Referee_Match
		
From SAM1.REFEREE_EARNED_SO_FAR_02JUL
) B
On A.Mobile_number = B.referee;
quit;

proc sql;
create table Registration_Referra_1 as
select
a.*,
B.Pre_qualified_date
from Registration_Referra as a
left join
(Select  Mobile_number,
		Pre_qualified_date
		
From  Datavish.Super_Pre_Qualififed
) B
On A.Mobile_number = B.Mobile_number;
quit;

Proc sql;
create table Registration_Referra_3 as
Select	A.*,
		B.Campaign, 
		B.Media_Source,
		b.Event_time,
		b.Partner,
		b.Adset,
		b.Site_ID
From Registration_Referra_1  as A
Left Join
(Select  "Customer User ID"n,
          Event_time,
		  Campaign as Campaign, 
		  Partner,
		  Adset,
		  "Media Source"n as Media_Source,
		   "Site ID"n as Site_ID
From KETAN.SOKRATI) B
On A.Mobile_number = B."Customer user id"n;
Quit;

Data Datavish.Registration_Dump_final;
set Registration_Referra_3;
format Registration_Date date9.;
format Pre_qualified_date date9.;
Format Contact_Date date9.;
format Event_time date9.;

if Media_Source in ("") and Partner not in ("") then Media_Source=Partner;

if Referee_Match not in ("") then Final_Flag="1.Referee                                 ";else 
if Pre_qualified_date-Registration_Date<=7 and Pre_qualified_date not in ("") then Final_Flag="2.Super Pre Qualified";else
/* if Contact_Date-Registration_Date<=7 and Contact_Date not in ("") then Final_Flag="3.Contact List";else */
if Media_Source not in ("") then Final_Flag=compress("3."||Media_Source);else
Final_Flag="4.Organic";
run;

proc freq data=Datavish.Registration_Dump_final;
tables Final_Flag*Registration_date/norow nocol nopercent;
where Registration_date>="01jan2022"d;
run;

data REGISTRATION_DUMP_FINAL;
set DATAVISH.REGISTRATION_DUMP_FINAL;
where registration_date>='01feb2022'd;
run;

proc sort data=REGISTRATION_DUMP_FINAL;
by registration_date;
run;


/**If you want to create 2 files because data is more than 1M***/
Data REG_DUMP_FINAL_1 REG_DUMP_FINAL_2;
set REGISTRATION_DUMP_FINAL;
If registration_date<='22feb2022'd then output REG_DUMP_FINAL_1; else
output REG_DUMP_FINAL_2;
run;

Proc export data = REGISTRATION_DUMP_FINAL
Outfile = "/sasdata/icfl/lin_data/Ravi/Riddhi/Marketing_Daily_Reports/REGISTRATION_DUMP_FINAL1_&cur_date..csv"
DBMS = CSV
Replace;
Run;


%macro expo(data=);
Proc export data= work.&data.
 outfile="/sasdata/icfl/lin_data/Ravi/Riddhi/Marketing_Daily_Reports/&data..csv"
 dbms=csv replace;
 run;
 %mend;
 
%expo(data=REG_DUMP_FINAL_1);
%expo(data=REG_DUMP_FINAL_2);
/* %expo(data=REG_DUMP_FINAL_3); */









