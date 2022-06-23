Options Compress=Yes;

Libname datavish "/sasdata/icfl/lin_data/Ravi/Riddhi/Marketing_Daily_Reports";
Libname SAM1 "/sasdata/icfl/lin_data/Mihir/Dhani_Dukaan";
libname Ketan "/sasdata/icfl/lin_data/Ketan/SAS Database";
Libname Urgent "/sasdata/icfl/lin_data/Ravi/Riddhi/Super_Saver_Urgent";
Libname Doctor "/sasdata/icfl/lin_data/Ravi/Riddhi/Addhoc_analysis1";

/* %let pre_date = %substr(%sysfunc(putn(%sysfunc(intnx(day, %sysfunc(today()), -2)), date9.)),1,5); */
%let cur_date = %substr(%sysfunc(putn(%sysfunc(intnx(day, %sysfunc(today()), -1)), date9.)),1,5);

%put &cur_date.;
/* %put &pre_date.; */

%Macro Samref (Data=,File=);
Proc import datafile=&File.
Out=&Data.
DBMS = CSV
Replace;
Guessingrows=Max;
Run;
%Mend;

%Samref(Data=cancelled,File="/sasdata/icfl/lin_data/Ravi/Riddhi/Marketing_Daily_Reports/cancelled.csv");
%Samref(Data=transaction,File="/sasdata/icfl/lin_data/Ravi/Riddhi/Marketing_Daily_Reports/transaction.csv");

data onefreedom_final;
set datavish.onefreedom_final;
where status="onboarded" and onboarded_date between "01feb2022"d and today()-1;
run;

proc sql;
create table onefreedom_final as
select
a.*,
B.txn_date,
c.cancelled
from onefreedom_final as a
left join
transaction B
On A.Mobile_number1 = input(B.mobile_number,best32.)
left join
cancelled C
On A.Mobile_number1 = input(C.mobile_number,best32.);
quit;

proc sql;
create table of_referrals as
select
"0.OF refferals             " as Final_flag,
onboarded_date,
firstpayment_date,
txn_date,
cancelled,
count(mobile_number1) as count
from
onefreedom_final
where Final_Flag in ("1.refferals")
group by 1,2,3,4,5
order by 6 desc;
quit;

proc sql;
create table of_google_sub as
select
"1.OF Google Sub             " as Final_flag,
onboarded_date,
firstpayment_date,
txn_date,
cancelled,
count(mobile_number1) as count
from
onefreedom_final
where ((upcase(Campaign) contains 'INTERNAL_UAC' and upcase(Campaign) contains 'FREEDOM') or (upcase(Campaign) contains 'INTERNAL_UAC' and upcase(Campaign) contains '001'))
and Final_Flag in ("94.googleadwords_int")
group by 1,2,3,4,5
order by 6 desc;
quit;

proc sql;
create table of_facebook_sub as
select
"2.OF facebook Sub             " as Final_flag,
onboarded_date,
firstpayment_date,
txn_date,
cancelled,
count(mobile_number1) as count
from
onefreedom_final
where ((upcase(Campaign) contains 'INTERNAL_FB' or upcase(Campaign) contains 'SOCIALBEAT_') and upcase(Campaign) contains 'FREEDOM')
and Final_Flag in ("94.FacebookAds")
group by 1,2,3,4,5
order by 6 desc;
quit;

proc sql;
create table of_googleRe_sub as
select
"3.OF googlere Sub             " as Final_flag,
onboarded_date,
firstpayment_date,
txn_date,
cancelled,
count(mobile_number1) as count
from
onefreedom_final
where upcase(Campaign) contains 'INTERNAL_UAC_ENGAGEMENT' and upcase(Campaign) contains 'FREEDOM'
and Final_Flag in ("94.googleadwords_int")
group by 1,2,3,4,5
order by 6 desc;
quit;

proc sql;
create table of_facebookRe_sub as
select
"4.OF facebookRe Sub             " as Final_flag,
onboarded_date,
firstpayment_date,
txn_date,
cancelled,
count(mobile_number1) as count
from
onefreedom_final
where upcase(Campaign) contains 'REMARKETING' and upcase(Campaign) contains 'FREEDOM'
and Final_Flag in ("94.FacebookAds")
group by 1,2,3,4,5
order by 6 desc;
quit;

proc sql;
create table of_branchio_sub as
select
"5.OF BranchIO Sub             " as Final_flag,
onboarded_date,
firstpayment_date,
txn_date,
cancelled,
count(mobile_number1) as count
from
onefreedom_final
where upcase(Media_Source) contains 'HASOFFERS'
group by 1,2,3,4,5
order by 6 desc;
quit;

proc sql;
create table of_MXplayer_sub as
select
"6.OF MXplayer sub           " as Final_flag,
onboarded_date,
firstpayment_date,
txn_date,
cancelled,
count(mobile_number1) as count
from
onefreedom_final
where upcase(Media_Source) contains 'MXPLAYER_INT' and Final_Flag in ("94.mxplayer_int")
group by 1,2,3,4,5
order by 6 desc;
quit;

proc sql;
create table of_sharechat_sub as
select
"7.OF Sharechat sub           " as Final_flag,
onboarded_date,
firstpayment_date,
txn_date,
cancelled,
count(mobile_number1) as count
from
onefreedom_final
where upcase(Media_Source) contains 'SHARECHAT_INT' and Final_Flag in ("94.sharechat_int")
group by 1,2,3,4,5
order by 6 desc;
quit;

proc sql;
create table of_Timesinternet_sub as
select
"8.OF Timesinternet Sub             " as Final_flag,
onboarded_date,
firstpayment_date,
txn_date,
cancelled,
count(mobile_number1) as count
from
onefreedom_final
where upcase(Media_Source) contains 'TIMESINTERNETVNATIVE_INT' and Final_Flag in ("94.timesinternetvnative_int")
group by 1,2,3,4,5
order by 6 desc;
quit;

proc sql;
create table OF_Affliates_sub as
select
"9.OF Affiliates Sub             " as Final_flag,
onboarded_date,
firstpayment_date,
txn_date,
cancelled,
count(mobile_number1) as count
from
onefreedom_final
where (upcase(Campaign) contains 'ONE')
and Final_Flag in (
'94.mobavenue',
'94.appnext_int',
'94.xyadsagenc',
'94.collectcen',
'94.rtbdemand',
'94.shareit_int',
'94.affleagenc',
'94.hexawebony_int',
'94.axponentme',
'94.adapptmobi',
'94.adsplayint',
'94.valueleaf_int',
'94.Way2News',
'94.inmobi_int',
'94.pokktmkt',
'94.globalemedia_int',
'94.mobavenue_int',
'94.3dot14',
'94.xaprio_int',
'94.opicle_int',
'94.adcountryi',
'94.pokktperformance_int',
'94.optimise_int',
'94.automate36',
'94.Way2Online',
'94.sgsglobals',
'94.mobupps_int',
'94.mobuppagen',
'94.xyads_int',
'94.Cashinf',
'94.glance_int',
'94.click2cage',
'94.prudigital_int',
'94.themobiadz',
'94.oneenginemedia_int',
'94.oneenginem',
'94.mintegral_int',
'94.optimiseme',
'94.sense_int',
'94.mfaas_int'
)
group by 1,2,3,4,5
order by 6 desc;
quit;

proc sql;
create table of_internal as
select
Final_flag,
onboarded_date,
firstpayment_date,
txn_date,
cancelled,
count(mobile_number1) as count
from
onefreedom_final
where Final_Flag in ("2.Preapproved",
"3.full kyc",                                 
"4.Dhani Wallet",
"5.DCL Decline",
"6.NTC Decline"                               
"7.Non Wallet",
"8.Non Wallet (Reg before Aug 19)")
group by 1,2,3,4,5
order by 6 desc;
quit;

/* proc transpose data = of_internal out= of_internal(drop=_NAME_); */
/* by Final_flag; */
/* id firstpayment_date; */
/* var count; */
/* run; */

data of_summary;
set of_referrals of_google_sub of_facebook_sub of_googleRe_sub of_facebookRe_sub of_branchio_sub of_MXplayer_sub of_sharechat_sub of_Timesinternet_sub OF_Affliates_sub of_internal;
run;

/* proc transpose data = of_summary out= of_summary(drop=_NAME_); */
/* by Final_flag; */
/* id firstpayment_date; */
/* var count; */
/* run; */
/*  */
/* data of_summary_final; */
/* set of_summary of_internal; */
/* run; */

proc sql;
create table coupon_code as
select
Final_flag,
onboarded_date,
firstpayment_date,
txn_date,
cancelled,
count(mobile_number1) as count
from
onefreedom_final
where Final_Flag contains ("90.") or Final_Flag contains ("93.") or Final_Flag contains ("11.") or Final_flag contains ("12.")
group by 1,2,3,4,5
order by 6 desc;
quit;

proc sql;
create table total as
select
Final_flag,
onboarded_date,
firstpayment_date,
txn_date,
cancelled,
count(mobile_number1) as count
from
onefreedom_final
group by 1,2,3,4,5
order by 6 desc;
quit;
/*  */
/* proc sql; */
/* create table utm_onboard as */
/* select */
/* Final_flag, */
/* firstpayment_date, */
/* count(mobile_number1) as count */
/* from */
/* onefreedom_final */
/* where Final_Flag contains ("12.") */
/* group by 1,2 */
/* order by 2 desc; */
/* quit; */

Proc export data = of_summary
Outfile = "/sasdata/icfl/lin_data/Ravi/Riddhi/Marketing_Daily_Reports/ofsummary.csv"
DBMS = CSV
Replace;
Run;

Proc export data = coupon_code
Outfile = "/sasdata/icfl/lin_data/Ravi/Riddhi/Marketing_Daily_Reports/coupon_code.csv"
DBMS = CSV
Replace;
Run;

Proc export data = total
Outfile = "/sasdata/icfl/lin_data/Ravi/Riddhi/Marketing_Daily_Reports/total.csv"
DBMS = CSV
Replace;
Run;

