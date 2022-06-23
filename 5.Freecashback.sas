Libname cc "/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/FCC coupon/";
Libname datavish "/sasdata/icfl/lin_data/Ravi/Riddhi/Marketing_Daily_Reports";
%let cur_date = %substr(%sysfunc(putn(%sysfunc(intnx(day, %sysfunc(today()), -1)), date9.)),1,5);

%Macro Samref (Data=,File=);
Proc import datafile=&File.
Out=&Data.
DBMS = CSV
Replace;
Guessingrows=Max;
Run;
%Mend;

%Samref(Data=datavish.dostfcc,File="/sasdata/icfl/lin_data/Ravi/Riddhi/Marketing_Daily_Reports/dostfcc_&cur_date..csv");
%Samref(Data=cc.couponcode,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/FCC coupon/FCC_coupons_redeemed.csv");

proc sort data=cc.couponcode nodupkey;
by mobile_number;
run;

Data CC.COUPONCODE(keep=mobile_number coupon_desc voucher_redeemed_at1);
Set  CC.COUPONCODE;
voucher_applied_at1 = datepart(voucher_applied_at);
voucher_redeemed_at1 = datepart(voucher_redeemed_at);
Format voucher_applied_at1 voucher_redeemed_at1 Date9.;
run; 

data cc.COUPONCODE_fcc_final;
set cc.couponcode_fcc_final CC.COUPONCODE;
run;

proc sort data=cc.COUPONCODE_fcc_final nodupkey;
by mobile_number;
run;

/* %Samref(Data=SAM1.Rs50CashbackAudience,File="/sasdata/icfl/lin_data/Mihir/Dhani_Dukaan/Rs50CashbackAudience1.csv"); */
/* %Samref(Data=SAM1.NonCashbackBase_26Mar,File="/sasdata/icfl/lin_data/Mihir/Dhani_Dukaan/NonCashbackBase_26Mar.csv"); */
/* %Samref(Data=Part3,File="/sasdata/icfl/lin_data/Mihir/Dhani_Dukaan/Part3.csv"); */
/* %Samref(Data=Part4,File="/sasdata/icfl/lin_data/Mihir/Dhani_Dukaan/Part4.csv"); */
/* %Samref(Data=Part5,File="/sasdata/icfl/lin_data/Mihir/Dhani_Dukaan/Part5.csv"); */
/* %Samref(Data=SAM1.DCL_New_Cust_Dec_HA,File="/sasdata/icfl/lin_data/Mihir/Dhani_Dukaan/DCL_Base.csv"); */
/* %Samref(Data=SAM1.FCC_Dhani_Cash_Users ,File="/sasdata/icfl/lin_data/Mihir/Dhani_Dukaan/Dhani_Cash_Users.csv"); */

/* proc sql outobs=10; */
/* create table final as */
/* select * */
/* from */
/* SAM1.FCC_Dhani_Cash_Users; */
/* quit; */
/*  */
/* data SAM1.FCC_Dhani_Cash_Users(keep=mobile_number); */
/* set SAM1.FCC_Dhani_Cash_Users; */
/* mobile_number=input(substr(" Selected Users: 8853501"n,3,11),best32.); */
/* if mobile_number NE .; */
/* run; */

/*  */
/* data sam1.FULL_KYC_CUST_BASE_24MAR(keep=mobile_number flag); */
/* set Part1 Part2 Part3 Part4 Part5; */
/* run; */
/*  */
/* data NONWALLET_CUSTOMERS_CREDITLINE1(keep=mobile_number); */
/* set SAM1.NONWALLET_CUSTOMERS_CREDITLINE1; */
/* mobile_number="mobile Number"n; */
/* run; */
/*  */
/*  */
/* data SAM1.nonwallet_base_FCC; */
/* set NONWALLET_CUSTOMERS_CREDITLINE1 SAM1.NON_WALLET_CUSTOMERS_supersaver(keep=mobile_number); */
/* run; */
/*  */
/* proc sort data=SAM1.nonwallet_base_FCC nodupkey; */
/* by mobile_number; */
/* run; */

Proc sql;
create table freecashback1 as
Select	A.*,
		B.Campaign, 
		B.Media_Source,
		b.Event_time,
		b.Partner,
		b.Adset,
		b.Site_ID
From datavish.freecashback_&cur_date.  as A
Left Join
(Select  "Customer User ID"n,
          Event_time,
		  Campaign as Campaign, 
		  Partner,
		  Adset,
		  "Media Source"n as Media_Source,
		  "Site ID"n as Site_ID
From KETAN.SOKRATI) B
On input(A.Mobile_number,best32.) = B."Customer user id"n;
Quit;

data freecashback2;
set freecashback1;
created_date1=input(created_date,yymmdd10.);
format created_date1 date9.;
drop created_date;
rename created_date1=created_date;
Onboard_date1=input(Onboard_date,yymmdd10.);
format Onboard_date1 date9.;
drop Onboard_date;
rename Onboard_date1=Onboard_date;
format event_time date9.;
run;

Proc sql;
create table freecashback3 as
Select	A.*,
		B.flag
From freecashback2  as A
Left Join
sam1.FULL_KYC_CUST_BASE_24MAR B
On input(A.Mobile_number,best32.) = B.mobile_number;
Quit;

Proc sql;
create table freecashback4 as
Select	A.*,
		B.DCL_base
From freecashback3  as A
Left Join
(Select  mobile_number,
         "Y" as DCL_base
From SAM1.DCL_New_Cust_Dec_HA) B
On input(A.Mobile_number,best32.) = B.mobile_number;
Quit;

Proc sql;
create table freecashback5 as
Select	A.*,
		B.Dhani_cash
From freecashback4  as A
Left Join
(Select  mobile_number,
         "Y" as Dhani_cash
From SAM1.FCC_Dhani_Cash_Users) B
On input(A.Mobile_number,best32.) = B.mobile_number;
Quit;

Proc sql;
create table freecashback6 as
Select	A.*,
		B.Rs50Cashbackbase
From freecashback5  as A
Left Join
(Select  mobile_number,
         "Y" as Rs50Cashbackbase
From SAM1.Rs50CashbackAudience) B
On input(A.Mobile_number,best32.) = B.mobile_number;
Quit;

Proc sql;
create table freecashback7 as
Select	A.*,
		B.NonCashbackBase
From freecashback6  as A
Left Join
(Select  mobile_number,
         "Y" as NonCashbackBase
From SAM1.NonCashbackBase_26Mar) B
On input(A.Mobile_number,best32.) = B.mobile_number;
Quit;

Proc sql;
create table freecashback8 as
Select	A.*,
		B.nonwallet
From freecashback7  as A
Left Join
(Select  mobile_number,
         "Y" as nonwallet
From SAM1.nonwallet_base_FCC) B
On input(A.Mobile_number,best32.) = B.mobile_number;
Quit;

Proc sql;
create table freecashback9 as
Select	A.*,
		B.Dhani_cash_flag
From freecashback8  as A
Left Join
(Select  mobile_number,
         "Y" as Dhani_cash_flag
From SAM1.dhanicash_registered_jan2021) B
On input(A.Mobile_number,best32.) = B.mobile_number;
Quit;


Proc sql;
create table freecashback10 as
Select	A.*,
		B.Dost
From freecashback9  as A
Left Join
(Select  receiver_mobile_number,
         "Y" as Dost
From datavish.dostfcc) B
On A.mobile_number = B.receiver_mobile_number;
Quit;

Data datavish.freecashback_final;
set freecashback10;
if Media_Source in ("") and Partner not in ("") then Media_Source=Partner;
if flag in ("Digital Active") then Final_Flag="1.FullKYC card DigitalActive      ";else
if flag in ("Both Inactive") then Final_Flag="2.FullKYC card BothInactive        ";else
if DCL_base not in ("") then Final_Flag="3.DCL New Cust Decline & HA";else
if Dhani_cash not in ("") then Final_Flag="4.Dhani Cash Users                                 ";else
if Rs50Cashbackbase not in ("") then Final_Flag="5.Rs50Cashback Base                                 ";else
if NonCashbackBase not in ("") then Final_Flag="6.NonCashback Base                                ";else
if nonwallet not in ("") then Final_Flag="7.Non wallet                                 ";else
if Media_Source not in ("") then Final_Flag=compress("8."||Media_Source);else
Final_Flag="9.Organic";
run;

Proc sql;
create table datavish.freecashback_final as
Select	A.*,
		B.coupon_desc,
		B.voucher_redeemed_at1
From datavish.freecashback_final  as A
Left Join
CC.COUPONCODE B
On A.Mobile_number = B.mobile_number;
Quit;

proc freq data=datavish.freecashback_final(where=(dhani_cash_flag="Y"));
tables onboard_date;
run;

proc freq data=datavish.freecashback_final;
tables final_flag;
run;

data of1 of4;
set datavish.freecashback_final;
if onboard_date>="01Feb2022"d and onboard_date=<"22Feb2022"d then output of1;
else if onboard_date>"22Feb2022"d then output of4;
run;

Proc export data =of1
Outfile = "/sasdata/icfl/lin_data/Ravi/Riddhi/Addhoc_analysis1/freecashbackdump1.csv"
DBMS = CSV
Replace;
Run;

Proc export data =of4
Outfile = "/sasdata/icfl/lin_data/Ravi/Riddhi/Addhoc_analysis1/freecashbackdump2.csv"
DBMS = CSV
Replace;
Run;
