Libname cc "/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/FCC coupon/";
Libname datavish "/sasdata/icfl/lin_data/Ravi/Riddhi/Marketing_Daily_Reports";
libname dost '/sasdata/icfl/lin_data/Ravi/Riddhi/DHANI_DOST_Master';
Libname SAM1 "/sasdata/icfl/lin_data/Mihir/Dhani_Dukaan";
%let cur_date = %substr(%sysfunc(putn(%sysfunc(intnx(day, %sysfunc(today()), -1)), date9.)),1,5);

%Macro Samref (Data=,File=);
Proc import datafile=&File.
Out=&Data.
DBMS = CSV
Replace;
Guessingrows=Max;
Run;
%Mend;

%Samref(Data=dost.refferals,File="/sasdata/icfl/lin_data/Ravi/Riddhi/DHANI_DOST_Master/referral_&cur_date..csv");
%Samref(Data=dost.utm,File="/sasdata/icfl/lin_data/Ravi/Riddhi/DHANI_DOST_Master/UTM_orders.csv");
%Samref(Data=dost.api,File="/sasdata/icfl/lin_data/Ravi/Riddhi/DHANI_DOST_Master/API_data.csv");


Data onefreedom;
Set datavish.onefreedom_&cur_date.;
Mobile_number1 = Input(compress(mobile_number),Best10.);
Onboarded_Date1=input(Onboard_Date,anydtdtm.);
onboarded_date=datepart(Onboarded_Date1);
format onboarded_date date9.;
application_Date1=input(created_date,anydtdtm.);
application_Date=datepart(application_Date1);
format application_Date date9.;
application_submitted1=input(consent_accepted,anydtdtm.);
application_submitted=datepart(application_submitted1);
format application_submitted date9.;
first_payment_date1=input(first_payment_date,anydtdtm.);
firstpayment_date=datepart(first_payment_date1);
format firstpayment_date date9.;
Run;

data datavish.onefreedom_&cur_date.;
set onefreedom;
where mobile_number1 NE .;
run;

Proc sql;
create table onefreedom as
Select	A.*,
		B.registration_date
		
From datavish.onefreedom_&cur_date.  as A
left join		
datavish.registrations_dump_backup B
On A.Mobile_number1 = B.mobile_number;
Quit;

data onefreedom;
set onefreedom(keep= lead_id Mobile_number1 onboarded_date application_date application_submitted registration_date  firstpayment_date status);
run;

Proc sql;
create table onefreedom1 as
Select	A.*,
		B.Campaign, 
		B.Media_Source,
		b.Event_time,
		b.Partner,
		b.Adset,
		b.Site_ID
From onefreedom  as A
Left Join
(Select  "Customer User ID"n,
          Event_time,
		  Campaign as Campaign, 
		  Partner,
		  Adset,
		  "Media Source"n as Media_Source,
		  "Site ID"n as Site_ID
From KETAN.SOKRATI) B
On A.Mobile_number1 = B."Customer user id"n;
Quit;

Proc sql;
create table onefreedom1 as
Select	A.*,
		B.created_date as Created_date_FCC,
		b.onboard_date as Onboard_FCC
/* 		b.segment_new as segment_new_1 */
From onefreedom1  as A
Left Join
(Select  "Mobile_Number"n,
          created_date
From DATAVISH.FREECASHBACK_final B) 
On A.Mobile_number1 = input(B."Mobile_Number"n,best10.);
Quit;

data onefreedom1;
set onefreedom1;
format event_time date9.;
if application_Date < today()-30 then app_flag='N';else app_flag='Y';
appsflyer_flag=abs(intck('DAY',event_time,application_Date));
fcc_promo_flag=abs(intck('DAY',Created_date_FCC,application_Date));
run;

Proc sql;
create table onefreedom1 as
Select	A.*,
		B.coupon_desc as coupon_dof,
		B.voucher_redeemed_at1
From onefreedom1  as A
Left Join
cc.couponcode_dof_final B
On A.Mobile_number1 = input(B.mobile_number,best32.);
Quit;

Proc sql;
create table onefreedom1 as
Select	A.*,
		B.coupon_desc as coupon_fcc,
		B.voucher_redeemed_at1
From onefreedom1  as A
Left Join
cc.COUPONCODE_fcc_final B
On A.Mobile_number1 = input(B.mobile_number,best32.);
Quit;

Proc sql;
create table onefreedom1 as
Select	A.*,
		B.refferal
		
From onefreedom1  as A
Left Join
(Select  mobile_number,
		"Y" as refferal
		
From dost.refferals
) B
On A.Mobile_number1 = input(B.mobile_number,best32.);
Quit;

Proc sql;
create table onefreedom2 as
Select	A.*,
		B.Preapproved
		
From onefreedom1  as A
Left Join
(Select  mobile_number,
		"Y" as Preapproved
		
From sam1.preapproved_09Sep
) B
On A.Mobile_number1 = B.mobile_number;
Quit;

Proc sql;
create table onefreedom3 as
Select	A.*,
		B.full_kyc
From onefreedom2  as A
Left Join
(Select  mobile_number,
         "Y" as full_kyc
From SAM1.fullkyc) B
On A.Mobile_number1 = input(B.mobile_number,best32.);
Quit;

Proc sql;
create table onefreedom4 as
Select	A.*,
		B.dhani_wallet
From onefreedom3  as A
Left Join
(Select  mobile_number,
         "Y" as dhani_wallet
From SAM1.dhani_wallet) B
On A.Mobile_number1 = input(B.Mobile_number,best32.);
Quit;

Proc sql;
create table onefreedom5 as
Select	A.*,
		B.dcl_decline
From onefreedom4  as A
Left Join
(Select  Mobile,
         "Y" as dcl_decline
From SAM1.dcl_decline_27sep) B
On A.Mobile_number1 = B.Mobile;
Quit;

Proc sql;
create table onefreedom6 as
Select	A.*,
		B.ntc_decline
From onefreedom5  as A
Left Join
(Select  Mobile,
         "Y" as ntc_decline
From SAM1.ntc_decline_27sep) B
On A.Mobile_number1 = mobile;
Quit;

Proc sql;
create table onefreedom7 as
Select	A.*,
		B.Non_wallet
From onefreedom6  as A
Left Join
(Select  Mobile_number,
         "Y" as Non_wallet
From SAM1.NON_WALLET_CUSTOMERS_supersaver) B
On A.Mobile_number1 = B.Mobile_number;
Quit;

proc sql;
create table onefreedom8 as
select
a.*,
B.Non_wallet_CL
from onefreedom7 as a
left join
(Select  "Mobile number"n,
		'Y' as Non_wallet_cl
		
From  SAM1.NONWALLET_CUSTOMERS_CREDITLINE1
) B
On A.Mobile_number1 = B."Mobile number"n;
quit;

proc sql;
create table onefreedom9 as
select
a.*,
B.utm,
b.utm_source
from onefreedom8 as a
left join
(Select  "Mobile_number"n,
		'Y' as utm,
		utm_source
From  dost.utm
) B
On A.Mobile_number1 = input(B."Mobile_number"n,best32.);
quit;

proc sql;
create table onefreedom10 as
select
a.*,
B.api,
b.lead_source
from onefreedom9 as a
left join
(Select  "Mobile_number"n,
		'Y' as api,
	    lead_source
From  dost.api
) B
On A.Mobile_number1 = input(B."Mobile_number"n,best32.);
quit;

data final;
set DAAS.CL_DHANI_DAAS_MASTER(keep="C 1 LEADID"n);
run;

Proc sql;
create table onefreedom11 as
Select	A.*,
		B.DAAS_hit
From onefreedom10  as A
Left Join
(Select "C 1 LEADID"n ,
         "Y" as DAAS_hit
From final) B
On A.lead_id = B."C 1 LEADID"n;
Quit;

Data datavish.onefreedom_final;
set onefreedom11;
format final_flag $100.;
format final_flag_sec $100.;
if Media_Source in ("") and Partner not in ("") then Media_Source=Partner;
if lead_source not in ("") then Final_Flag=compress("11."||lead_source);else
if utm_source not in ("") then Final_Flag=compress("12."||utm_source);else
if coupon_dof not in ("") then Final_Flag=compress("90."||coupon_dof);else
if refferal not in ("") then Final_Flag="1.refferals                                    ";else
if coupon_fcc not in ("") and app_flag="Y" and fcc_promo_flag<30 then Final_Flag=compress("93."||coupon_fcc);else
if Media_Source not in ("") and app_flag="Y" and appsflyer_flag<30 then Final_Flag=compress("94."||Media_Source);else
if preapproved not in ("") then Final_Flag="2.Preapproved                                 ";else
if dhani_wallet not in ("") then Final_Flag="4.Dhani Wallet                                 ";else
if non_wallet not in ("") then Final_Flag="7.Non Wallet";else
if Non_wallet_CL  not in ("") then Final_Flag="8.Non Wallet (Reg before Aug 19)";else
if full_kyc not in ("") then Final_Flag="3.full kyc                                 ";else
if dcl_decline not in ("") then Final_Flag="5.DCL Decline                                 ";else
if ntc_decline not in ("") then Final_Flag="6.NTC Decline                                 ";else

if Media_Source not in ("") then Final_Flag=compress("94."||Media_Source);else
Final_Flag="999.Organic";

/* if Media_Source in ("") and Partner not in ("") then Media_Source=Partner; */
/* if lead_source not in ("") then final_flag_sec=compress("11."||lead_source);else */
/* if coupon_dof not in ("") then final_flag_sec=compress("90."||coupon_dof);else */
/* if utm_source not in ("") then final_flag_sec=compress("12."||utm_source);else */
/* if refferal not in ("") then final_flag_sec="1.refferals                                    ";else */
/* if coupon_fcc not in ("") and app_flag="Y" and fcc_promo_flag<30 then final_flag_sec=compress("93."||coupon_fcc);else */
/* if Media_Source not in ("") and app_flag="Y" and appsflyer_flag<30 then final_flag_sec=compress("94."||Media_Source);else */
/* if preapproved not in ("") then final_flag_sec="2.Preapproved                                 ";else */
/* if dhani_wallet not in ("") then final_flag_sec="4.Dhani Wallet                                 ";else */
/* if non_wallet not in ("") then final_flag_sec="7.Non Wallet";else */
/* if Non_wallet_CL  not in ("") then final_flag_sec="8.Non Wallet (Reg before Aug 19)";else */
/* if full_kyc not in ("") then final_flag_sec="3.full kyc                                 ";else */
/* if dcl_decline not in ("") then final_flag_sec="5.DCL Decline                                 ";else */
/* if ntc_decline not in ("") then final_flag_sec="6.NTC Decline                                 ";else */
/*  */
/* if Media_Source not in ("") then final_flag_sec=compress("94."||Media_Source);else */
/* final_flag_sec="999.Organic"; */

if Onboard_FCC>0 then First="FCC"; else First="DOF";
run;

proc sort data=datavish.onefreedom_final nodupkey;
by mobile_number1;
run;

proc sort data=datavish.onefreedom_final;
by application_date;
run;

data of2;
set datavish.onefreedom_final;
if onboarded_date>0 and status="onboarded";
run;

proc freq data=of2;
tables final_flag*onboarded_date/norow nopercent nocol;
where onboarded_date between "01feb2022"d and today()-1;
run;

data of1 of4;
set datavish.onefreedom_final;
if application_date>="01feb2022"d and application_date=<"22feb2022"d then output of1;
else if application_date>"22feb2022"d then output of4;
run;

data of3;
set datavish.onefreedom_final;
where onboarded_date between "01feb2022"d and today()-1;
run;

/* data of5; */
/* set datavish.onefreedom_final; */
/* if application_date>="01feb2022"d ; */
/* run; */
/*  */
/* data of2; */
/* set datavish.onefreedom_final; */
/* if onboarded_date>0; */
/* run; */
/*  */
/*  */
/*  */
/* proc freq data=of3; */
/* tables final_flag*onboarded_date/nopercent norow nocol; */
/* where status="onboarded" and onboarded_date between "01feb2022"d and today()-1; */
/* run; */
/*  */
/* Proc export data = datavish.onefreedom_final */
/* Outfile = "/sasdata/icfl/lin_data/Ravi/Riddhi/Marketing_Daily_Reports/onefreedom_dump_&cur_date..csv" */
/* DBMS = CSV */
/* Replace; */
/* Run; */

Proc export data = of1
Outfile = "/sasdata/icfl/lin_data/Ravi/Riddhi/Marketing_Daily_Reports/onefreedom_dump1_&cur_date..csv"
DBMS = CSV
Replace;
Run;

Proc export data = of4
Outfile = "/sasdata/icfl/lin_data/Ravi/Riddhi/Marketing_Daily_Reports/onefreedom_dump2_&cur_date..csv"
DBMS = CSV
Replace;
Run;


Proc export data = of3
Outfile = "/sasdata/icfl/lin_data/Ravi/Riddhi/Marketing_Daily_Reports/onefreedom_disb_&cur_date..csv"
DBMS = CSV
Replace;
Run;

   