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

%Samref(Data=sam1.dhaniwallet_yt,File="/sasdata/icfl/lin_data/Ravi/Riddhi/Dhani_wallet_Base/dhaniwallet_&cur_date..csv");
%Samref(Data=sam1.kycdata_yt,File="/sasdata/icfl/lin_data/Ravi/Riddhi/Dhani_wallet_Base/kycdata_&cur_date..csv");


data fullkyc;
set sam1.kycdata_yt SAM1.fullkyc;
run;

proc sort data=fullkyc nodupkey;
by mobile_number;
run;

data sam1.fullkyc;
set fullkyc;
run;

data dhani_wallet;
set sam1.dhaniwallet_yt SAM1.dhani_wallet;
run;

proc sort data=dhani_wallet nodupkey;
by mobile_number;
run;

data sam1.dhani_wallet;
set dhani_wallet;
run;

