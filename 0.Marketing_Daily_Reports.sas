Options Compress=Yes;

Libname datavish "/sasdata/icfl/lin_data/Ravi/Riddhi/Marketing_Daily_Reports";
Libname SAM1 "/sasdata/icfl/lin_data/Mihir/Dhani_Dukaan";
libname Ketan "/sasdata/icfl/lin_data/Ketan/SAS Database";
Libname Urgent "/sasdata/icfl/lin_data/Ravi/Riddhi/Super_Saver_Urgent";
Libname DOF "/sasdata/icfl/lin_data/Darshan/SAS DATA Set";
Libname Addhoc "/sasdata/icfl/lin_data/Ravi/Riddhi/Addhoc_analysis1";
libname DAAS "/sasdata/icfl/lin_data/Shiva/FOS_data/DAAS";

/* %let pre_date = %substr(%sysfunc(putn(%sysfunc(intnx(day, %sysfunc(today()), -2)), date9.)),1,5); */
%let cur_date = %substr(%sysfunc(putn(%sysfunc(intnx(day, %sysfunc(today()), -1)), date9.)),1,5);

%put &cur_date.;
/* %put &pre_date.; */

/* Data sam1.dhanicash_registered_jan2021_old; */
/* set sam1.dhanicash_registered_jan2021;; */
/* run; */

data SAM1.dhanicash_registered_jan2021;
set Sam1.final_kyc_Dhani;
run;



/* ====================================================================================== */

/* Marketing campaign Creditline import */

Libname SAM1 "/sasdata/icfl/lin_data/Mihir/Dhani_Dukaan";

%Macro Samref (Data=,File=);
Proc import datafile=&File.
Out=&Data.
DBMS = CSV
Replace;
Guessingrows=Max;
Run;
%Mend;

/* %Samref(Data=SAM1.dhani_cares_availed_&pre_date.,File="/sasdata/icfl/lin_data/Mihir/Dhani_Dukaan/dhani_cares_availed_&pre_date..csv"); */
/* %Samref(Data=SAM1.Appflyer_Appln_SUBM_&pre_date.,File="/sasdata/icfl/lin_data/Mihir/Dhani_Dukaan/Application_Submitted_Inorganic_&pre_date..csv"); */

%Samref(Data=SAM1.dhani_cares_availed_&cur_date.,File="/sasdata/icfl/lin_data/Mihir/Dhani_Dukaan/dhani_cares_availed_&cur_date..csv");
%Samref(Data=SAM1.referee_earned_so_far_&cur_date.,File="/sasdata/icfl/lin_data/Mihir/Dhani_Dukaan/referee_earned_so_far_&cur_date..csv");
%Samref(Data=SAM1.dhani_cares_lifetime_&cur_date.,File="/sasdata/icfl/lin_data/Mihir/Dhani_Dukaan/dhani_cares_lifetime_dump_&cur_date..csv");
%Samref(Data=SAM1.Appflyer_Appln_SUBM_&cur_date.,File="/sasdata/icfl/lin_data/Mihir/Dhani_Dukaan/Application_Submitted_Inorganic_&cur_date..csv");


/* ===================================================================================== */

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
/* %Samref(Data=datavish.registrations_&pre_date.,File="/sasdata/icfl/lin_data/Ravi/Riddhi/Marketing_Daily_Reports/registrations_&pre_date..csv"); */
/* %Samref(Data=datavish.games_users_non_loan_&pre_date.,File="/sasdata/icfl/lin_data/Ravi/Riddhi/Marketing_Daily_Reports/Games_user_first_time_non_loan_&pre_date..csv"); */

%Samref(Data=datavish.registrations_&cur_date.,File="/sasdata/icfl/lin_data/Ravi/Riddhi/Marketing_Daily_Reports/registrations_&cur_date..csv");
%Samref(Data=datavish.supersaver_lifetime_&cur_date.,File="/sasdata/icfl/lin_data/Ravi/Riddhi/Marketing_Daily_Reports/supersaver_lifetime_data_&cur_date..csv");
%Samref(Data=datavish.games_users_non_loan_&cur_date.,File="/sasdata/icfl/lin_data/Ravi/Riddhi/Marketing_Daily_Reports/Games_user_first_time_non_loan_&cur_date..csv");
%Samref(Data=datavish.renewal_&cur_date.,File="/sasdata/icfl/lin_data/Ravi/Riddhi/Marketing_Daily_Reports/renewal_&cur_date..csv");
%Samref(Data=datavish.freecashback_&cur_date.,File="/sasdata/icfl/lin_data/Ravi/Riddhi/Marketing_Daily_Reports/fcc_&cur_date..csv");
%Samref(Data=datavish.onefreedom_&cur_date.,File="/sasdata/icfl/lin_data/Ravi/Riddhi/Marketing_Daily_Reports/onefreedom_&cur_date..csv");
/* =================================================================== */

/* SSU - Organic and inorganic import */

Libname URGENT "/sasdata/icfl/lin_data/Ravi/Riddhi/Super_Saver_Urgent";

%Macro Samssu (Data=,File=);
Proc import datafile=&File.
Out=&Data.
DBMS = CSV
Replace;
Guessingrows=Max;
Run;
%Mend;
/* %Samssu(Data=URGENT.Appflyer_Inorganic_&pre_date.,File="/sasdata/icfl/lin_data/Ravi/Riddhi/Super_Saver_Urgent/Super_saver_introdu_event_Inorganic_&pre_date..csv"); */
/* %Samssu(Data=URGENT.Appflyer_organic_&pre_date.,File="/sasdata/icfl/lin_data/Ravi/Riddhi/Super_Saver_Urgent/Super_saver_introdu_event_Organic_&pre_date..csv"); */

%Samssu(Data=URGENT.Appflyer_Inorganic_&cur_date.,File="/sasdata/icfl/lin_data/Ravi/Riddhi/Super_Saver_Urgent/Super_saver_introdu_event_Inorganic_&cur_date..csv");
%Samssu(Data=URGENT.Appflyer_organic_&cur_date.,File="/sasdata/icfl/lin_data/Ravi/Riddhi/Super_Saver_Urgent/Super_saver_introdu_event_Organic_&cur_date..csv");



/* ================================================================================== */

proc sort data=SAM1.Appflyer_Appln_SUBM_&cur_date. nodupkey;
by "Customer User ID"n;
run;

proc sort data=SAM1.Appflyer_Appln_SUBM_&cur_date. nodupkey;
by "AppsFlyer ID"n;
run;

proc sort data=URGENT.Appflyer_Inorganic_&cur_date. nodupkey;
by "Customer User ID"n;
run;

proc sort data=URGENT.Appflyer_Inorganic_&cur_date. nodupkey;
by "AppsFlyer ID"n;
run;

proc sort data=URGENT.Appflyer_organic_&cur_date. nodupkey;
by "Customer User ID"n;
run;

proc sort data=URGENT.Appflyer_organic_&cur_date. nodupkey;
by "AppsFlyer ID"n;
run;


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

/*Appending Non Loan User Dump  */
Data Datavish.Non_Loan_User_Dump;
set Datavish.Non_Loan_User_Dump
/* 	DATAVISH.GAMES_USERS_NON_LOAN_&pre_date. (in=a) */
    DATAVISH.GAMES_USERS_NON_LOAN_&cur_date. (in=b);
/* if a then Registration_Date=Today()-2; */
if b then Registration_Date=Today()-1;
run;

Proc sort data=Datavish.Non_Loan_User_Dump nodupkey;
by Mobile_number;
run;

/*Marketing Appflyer Append, use single Naming Convention for ease  */
Data SAM1.APPFLYER_APPLN_SUBM_&cur_date. (Drop="Install Time"n  "Event Time"n);
 Set 
/*  SAM1.APPFLYER_APPLN_SUBM_&pre_date. */
	SAM1.APPFLYER_APPLN_SUBM_&cur_date. 
(Drop= "Postal Code"n IMEI "APP Version"n ) ;

Keep "Install Time"n  "Event Time"n
Install_Date Event_Date "Media Source"n Campaign Partner adset "Customer user id"n;
adset1=put(adset,10.);
drop adset;
rename adset1=adset;
Install_Date=Datepart("Install Time"n);
Event_Date=Datepart("Event Time"n);
format Install_date date9.;
Format event_date Date9.;
run;

data SAM1.APPFLYER_APPLN_SUBM_&cur_date.;
set SAM1.APPFLYER_APPLN_SUBM_&cur_date.;
test1=input("customer user id"n,best32.);
drop "customer user id"n;
rename test1="customer user id"n;
run;

Data SAM1.APPFLYER_APPLN_13AUG ;
Set  SAM1.APPFLYER_APPLN_13AUG
/* 	 SAM1.APPFLYER_APPLN_SUBM_&pre_date.		 */
     SAM1.APPFLYER_APPLN_SUBM_&cur_date.  ;
run;

proc sort data=SAM1.APPFLYER_APPLN_13AUG ;
 by Descending Event_date;
 run;

proc sort data=SAM1.APPFLYER_APPLN_13AUG nodupkey;
 by "Customer user id"n;
 run;

/*Appending Credit Line Availed Data  */

Data SAM1.Dhani_Care_Availed;
set 
SAM1.Dhani_Care_Availed
/* SAM1.DHANI_CARES_AVAILED_&pre_date. (in=a) */
SAM1.DHANI_CARES_AVAILED_&cur_date. (in=b);
/* if a then Disbursal_date=today()-2; */
if b then Disbursal_date=today()-1;

format Disbursal_date ddmmyy10.;
run;

proc sort data=SAM1.Dhani_Care_Availed nodup;
by Mobile_Number;
run;