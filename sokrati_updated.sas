Options compress=yes;
Options fullstimer;

%let yt_date =  %sysfunc(putn(%sysfunc(intnx(day, %sysfunc(today()), -1)), date9.));
 
%Macro Append(Data=, Link=);
DATA WORK.&Data.;
    LENGTH
        'Attributed Touch Type'n $ 10
        'Attributed Touch Time'n   8
        'Install Time'n    8
        'Event Time'n      8
        'Event Name'n    $ 24
        'Event Value'n   $ 61
        'Event Revenue'n $ 1
        'Event Revenue Currency'n $ 3
        'Event Revenue INR'n $ 1
        'Cost Model'n    $ 3
        'Cost Value'n      8
        'Cost Currency'n $ 3
        'Event Source'n  $ 3
        Partner          $ 10
        'Media Source'n  $ 24
        Channel          $ 15
        Campaign         $ 200
        'Campaign ID'n   $ 17
        Adset            $ 200
        'Adset ID'n      $ 17
        Ad               $ 200
        'Ad ID'n         $ 17
        'Ad Type'n       $ 17
        'Site ID'n       $ 162
        Region           $ 2
        'Country Code'n  $ 2
        State            $ 3
        City             $ 42
        'Postal Code'n   $ 6
        DMA              $ 6
        IP               $ 15
        Operator         $ 16
        Carrier          $ 25
        Language         $ 8
        'AppsFlyer ID'n  $ 33
        'Customer User ID'n   8
        'Android ID'n    $ 16
        IMEI             $ 1
        IDFA             $ 1
        'Advertising ID'n $ 36
        IDFV             $ 1
        'Device Type'n   $ 31
        'Device Category'n $ 1
        Platform         $ 7
        'OS Version'n      8
        'App Version'n     8
        'SDK Version'n   $ 6
        'App ID'n        $ 14
        'App Name'n      $ 32
        'Is Retargeting'n $ 5
        'Retargeting Conversion Type'n $ 1
        'Is Primary Attribution'n $ 5
        'Attribution Lookback'n $ 3
        'Reengagement Window'n $ 1
        'Match Type'n    $ 14
        'User Agent'n    $ 80
        'HTTP Referrer'n $ 995
        'Original URL'n  $ 502 ;
    FORMAT
        'Attributed Touch Type'n $CHAR10.
        'Attributed Touch Time'n DATETIME18.
        'Install Time'n  DATETIME18.
        'Event Time'n    DATETIME18.
        'Event Name'n    $CHAR24.
        'Event Value'n   $CHAR61.
        'Event Revenue'n $CHAR1.
        'Event Revenue Currency'n $CHAR3.
        'Event Revenue INR'n $CHAR1.
        'Cost Model'n    $CHAR3.
        'Cost Value'n    BEST4.
        'Cost Currency'n $CHAR3.
        'Event Source'n  $CHAR3.
        Partner          $CHAR10.
        'Media Source'n  $CHAR24.
        Channel          $CHAR15.
        Campaign         $CHAR200.
        'Campaign ID'n   $CHAR17.
        Adset            $CHAR200.
        'Adset ID'n      $CHAR17.
        Ad               $CHAR200.
        'Ad ID'n         $CHAR17.
        'Ad Type'n       $CHAR17.
        'Site ID'n       $CHAR162.
        Region           $CHAR2.
        'Country Code'n  $CHAR2.
        State            $CHAR3.
        City             $CHAR42.
        'Postal Code'n   $CHAR6.
        DMA              $CHAR6.
        IP               $CHAR15.
        Operator         $CHAR16.
        Carrier          $CHAR25.
        Language         $CHAR8.
        'AppsFlyer ID'n  $CHAR33.
        'Customer User ID'n BEST10.
        'Android ID'n    $CHAR16.
        IMEI             $CHAR1.
        IDFA             $CHAR1.
        'Advertising ID'n $CHAR36.
        IDFV             $CHAR1.
        'Device Type'n   $CHAR31.
        'Device Category'n $CHAR1.
        Platform         $CHAR7.
        'OS Version'n    TIME8.
        'App Version'n   MMDDYY10.
        'SDK Version'n   $CHAR6.
        'App ID'n        $CHAR14.
        'App Name'n      $CHAR32.
        'Is Retargeting'n $CHAR5.
        'Retargeting Conversion Type'n $CHAR1.
        'Is Primary Attribution'n $CHAR5.
        'Attribution Lookback'n $CHAR3.
        'Reengagement Window'n $CHAR1.
        'Match Type'n    $CHAR14.
        'User Agent'n    $CHAR80.
        'HTTP Referrer'n $CHAR995.
        'Original URL'n  $CHAR502.;
    INFORMAT
                'Attributed Touch Type'n $CHAR10.
        'Attributed Touch Time'n DATETIME18.
        'Install Time'n  DATETIME18.
        'Event Time'n    DATETIME18.
        'Event Name'n    $CHAR24.
        'Event Value'n   $CHAR61.
        'Event Revenue'n $CHAR1.
        'Event Revenue Currency'n $CHAR3.
        'Event Revenue INR'n $CHAR1.
        'Cost Model'n    $CHAR3.
        'Cost Value'n    BEST4.
        'Cost Currency'n $CHAR3.
        'Event Source'n  $CHAR3.
        Partner          $CHAR10.
        'Media Source'n  $CHAR24.
        Channel          $CHAR15.
        Campaign         $CHAR200.
        'Campaign ID'n   $CHAR17.
        Adset            $CHAR200.
        'Adset ID'n      $CHAR17.
        Ad               $CHAR200.
        'Ad ID'n         $CHAR17.
        'Ad Type'n       $CHAR17.
        'Site ID'n       $CHAR162.
        Region           $CHAR2.
        'Country Code'n  $CHAR2.
        State            $CHAR3.
        City             $CHAR42.
        'Postal Code'n   $CHAR6.
        DMA              $CHAR6.
        IP               $CHAR15.
        Operator         $CHAR16.
        Carrier          $CHAR25.
        Language         $CHAR8.
        'AppsFlyer ID'n  $CHAR33.
        'Customer User ID'n BEST10.
        'Android ID'n    $CHAR16.
        IMEI             $CHAR1.
        IDFA             $CHAR1.
        'Advertising ID'n $CHAR36.
        IDFV             $CHAR1.
        'Device Type'n   $CHAR31.
        'Device Category'n $CHAR1.
        Platform         $CHAR7.
        'OS Version'n    TIME11.
        'App Version'n   MMDDYY10.
        'SDK Version'n   $CHAR6.
        'App ID'n        $CHAR14.
        'App Name'n      $CHAR32.
        'Is Retargeting'n $CHAR5.
        'Retargeting Conversion Type'n $CHAR1.
        'Is Primary Attribution'n $CHAR5.
        'Attribution Lookback'n $CHAR3.
        'Reengagement Window'n $CHAR1.
        'Match Type'n    $CHAR14.
        'User Agent'n    $CHAR80.
        'HTTP Referrer'n $CHAR995.
        'Original URL'n  $CHAR502.;
    INFILE &Link.
        DLM=','
        MISSOVER
        DSD ;
    INPUT
                'Attributed Touch Type'n : $CHAR10.
        'Attributed Touch Time'n : ?? ANYDTDTM19.
        'Install Time'n  : ?? ANYDTDTM19.
        'Event Time'n    : ?? ANYDTDTM19.
        'Event Name'n    : $CHAR24.
        'Event Value'n   : $CHAR61.
        'Event Revenue'n : $CHAR1.
        'Event Revenue Currency'n : $CHAR3.
        'Event Revenue INR'n : $CHAR1.
        'Cost Model'n    : $CHAR3.
        'Cost Value'n    : ?? COMMA4.
        'Cost Currency'n : $CHAR3.
        'Event Source'n  : $CHAR3.
        Partner          : $CHAR10.
        'Media Source'n  : $CHAR24.
        Channel          : $CHAR15.
        Campaign         : $CHAR200.
        'Campaign ID'n   : $CHAR17.
        Adset            : $CHAR200.
        'Adset ID'n      : $CHAR17.
        Ad               : $CHAR200.
        'Ad ID'n         : $CHAR17.
        'Ad Type'n       : $CHAR17.
        'Site ID'n       : $CHAR162.
        Region           : $CHAR2.
        'Country Code'n  : $CHAR2.
        State            : $CHAR3.
        City             : $CHAR42.
        'Postal Code'n   : $CHAR6.
        DMA              : $CHAR6.
        IP               : $CHAR15.
        Operator         : $CHAR16.
        Carrier          : $CHAR25.
        Language         : $CHAR8.
        'AppsFlyer ID'n  : $CHAR33.
        'Customer User ID'n : ?? BEST10.
        'Android ID'n    : $CHAR16.
        IMEI             : $CHAR1.
        IDFA             : $CHAR1.
        'Advertising ID'n : $CHAR36.
        IDFV             : $CHAR1.
        'Device Type'n   : $CHAR31.
        'Device Category'n : $CHAR1.
        Platform         : $CHAR7.
        'OS Version'n    : ?? TIME5.
        'App Version'n   : ?? MMDDYY6.
        'SDK Version'n   : $CHAR6.
        'App ID'n        : $CHAR14.
        'App Name'n      : $CHAR32.
        'Is Retargeting'n : $CHAR5.
        'Retargeting Conversion Type'n : $CHAR1.
        'Is Primary Attribution'n : $CHAR5.
        'Attribution Lookback'n : $CHAR3.
        'Reengagement Window'n : $CHAR1.
        'Match Type'n    : $CHAR14.
        'User Agent'n    : $CHAR80.
        'HTTP Referrer'n : $CHAR995.
        'Original URL'n  : $CHAR502.;
RUN;
%mend;

%Append(Data=Nov1 ,Link="/sasdata/icfl/lin_data/Ketan/Rawdata/App data &yt_date..csv");
%Append(Data=Nov2 ,Link="/sasdata/icfl/lin_data/Ketan/Rawdata/App1 data &yt_date..csv");

 
 
libname App "/sasdata/icfl/lin_data/Ketan/SAS Database";
 
Data Addon(keep="Customer User ID"n "Event Time"n "Media Source"n
Adset AD "Ad ID"n Campaign "Original URL"n "Sub Site ID"n "Site ID"n Partner "Creative id"n);
set Nov1 Nov2;
if 'App Name'n ^='Instant Business Loan App - Indi';
run;

Data Asokrati;
set App.Asokrati;
run;

data Asokrati2;
set Asokrati Addon;
run;
 
/* proc sort data=App.Asokrati  ; */
/* by "customer user id"n "Event Time"n; */
/* run; */
 
proc sort data=Asokrati2 nodupkey ;
by "customer user id"n;
run;
 
data Asokrati2;
set Asokrati2;
Customer_user_id=compress(put('customer user id'n,$10.));
Event_time=Datepart("Event Time"n);
run;

Data app.Asokrati;
set Asokrati2;
run;

proc freq data=App.Asokrati;
tables event_time;
format Event_time date9.;
run;


/* --------------------------    App IOS append        --------------------------- */

Options compress=yes;
%Macro Append(Data=, Link=);
DATA WORK.&Data.;
    LENGTH
        'Attributed Touch Type'n $ 10
        'Attributed Touch Time'n   8
        'Install Time'n    8
        'Event Time'n      8
        'Event Name'n    $ 24
        'Event Value'n   $ 61
        'Event Revenue'n $ 1
        'Event Revenue Currency'n $ 3
        'Event Revenue INR'n $ 1
        'Cost Model'n    $ 3
        'Cost Value'n      8
        'Cost Currency'n $ 3
        'Event Source'n  $ 3
        Partner          $ 10
        'Media Source'n  $ 24
        Channel          $ 15
        Campaign         $ 200
        'Campaign ID'n   $ 17
        Adset            $ 200
        'Adset ID'n      $ 17
        Ad               $ 200
        'Ad ID'n         $ 17
        'Ad Type'n       $ 17
        'Site ID'n       $ 162
        Region           $ 2
        'Country Code'n  $ 2
        State            $ 3
        City             $ 42
        'Postal Code'n   $ 6
        DMA              $ 6
        IP               $ 15
        Operator         $ 16
        Carrier          $ 25
        Language         $ 8
        'AppsFlyer ID'n  $ 33
        'Customer User ID'n   8
        'Android ID'n    $ 16
        IMEI             $ 1
        IDFA             $ 1
        'Advertising ID'n $ 36
        IDFV             $ 1
        'Device Type'n   $ 31
        'Device Category'n $ 1
        Platform         $ 7
        'OS Version'n      8
        'App Version'n     8
        'SDK Version'n   $ 6
        'App ID'n        $ 14
        'App Name'n      $ 32
        'Is Retargeting'n $ 5
        'Retargeting Conversion Type'n $ 1
        'Is Primary Attribution'n $ 5
        'Attribution Lookback'n $ 3
        'Reengagement Window'n $ 1
        'Match Type'n    $ 14
        'User Agent'n    $ 80
        'HTTP Referrer'n $ 995
        'Original URL'n  $ 502 ;
    FORMAT
        'Attributed Touch Type'n $CHAR10.
        'Attributed Touch Time'n DATETIME18.
        'Install Time'n  DATETIME18.
        'Event Time'n    DATETIME18.
        'Event Name'n    $CHAR24.
        'Event Value'n   $CHAR61.
        'Event Revenue'n $CHAR1.
        'Event Revenue Currency'n $CHAR3.
        'Event Revenue INR'n $CHAR1.
        'Cost Model'n    $CHAR3.
        'Cost Value'n    BEST4.
        'Cost Currency'n $CHAR3.
        'Event Source'n  $CHAR3.
        Partner          $CHAR10.
        'Media Source'n  $CHAR24.
        Channel          $CHAR15.
        Campaign         $CHAR200.
        'Campaign ID'n   $CHAR17.
        Adset            $CHAR200.
        'Adset ID'n      $CHAR17.
        Ad               $CHAR200.
        'Ad ID'n         $CHAR17.
        'Ad Type'n       $CHAR17.
        'Site ID'n       $CHAR162.
        Region           $CHAR2.
        'Country Code'n  $CHAR2.
        State            $CHAR3.
        City             $CHAR42.
        'Postal Code'n   $CHAR6.
        DMA              $CHAR6.
        IP               $CHAR15.
        Operator         $CHAR16.
        Carrier          $CHAR25.
        Language         $CHAR8.
        'AppsFlyer ID'n  $CHAR33.
        'Customer User ID'n BEST10.
        'Android ID'n    $CHAR16.
        IMEI             $CHAR1.
        IDFA             $CHAR1.
        'Advertising ID'n $CHAR36.
        IDFV             $CHAR1.
        'Device Type'n   $CHAR31.
        'Device Category'n $CHAR1.
        Platform         $CHAR7.
        'OS Version'n    TIME8.
        'App Version'n   MMDDYY10.
        'SDK Version'n   $CHAR6.
        'App ID'n        $CHAR14.
        'App Name'n      $CHAR32.
        'Is Retargeting'n $CHAR5.
        'Retargeting Conversion Type'n $CHAR1.
        'Is Primary Attribution'n $CHAR5.
        'Attribution Lookback'n $CHAR3.
        'Reengagement Window'n $CHAR1.
        'Match Type'n    $CHAR14.
        'User Agent'n    $CHAR80.
        'HTTP Referrer'n $CHAR995.
        'Original URL'n  $CHAR502.;
    INFORMAT
                'Attributed Touch Type'n $CHAR10.
        'Attributed Touch Time'n DATETIME18.
        'Install Time'n  DATETIME18.
        'Event Time'n    DATETIME18.
        'Event Name'n    $CHAR24.
        'Event Value'n   $CHAR61.
        'Event Revenue'n $CHAR1.
        'Event Revenue Currency'n $CHAR3.
        'Event Revenue INR'n $CHAR1.
        'Cost Model'n    $CHAR3.
        'Cost Value'n    BEST4.
        'Cost Currency'n $CHAR3.
        'Event Source'n  $CHAR3.
        Partner          $CHAR10.
        'Media Source'n  $CHAR24.
        Channel          $CHAR15.
        Campaign         $CHAR200.
        'Campaign ID'n   $CHAR17.
        Adset            $CHAR200.
        'Adset ID'n      $CHAR17.
        Ad               $CHAR200.
        'Ad ID'n         $CHAR17.
        'Ad Type'n       $CHAR17.
        'Site ID'n       $CHAR162.
        Region           $CHAR2.
        'Country Code'n  $CHAR2.
        State            $CHAR3.
        City             $CHAR42.
        'Postal Code'n   $CHAR6.
        DMA              $CHAR6.
        IP               $CHAR15.
        Operator         $CHAR16.
        Carrier          $CHAR25.
        Language         $CHAR8.
        'AppsFlyer ID'n  $CHAR33.
        'Customer User ID'n BEST10.
        'Android ID'n    $CHAR16.
        IMEI             $CHAR1.
        IDFA             $CHAR1.
        'Advertising ID'n $CHAR36.
        IDFV             $CHAR1.
        'Device Type'n   $CHAR31.
        'Device Category'n $CHAR1.
        Platform         $CHAR7.
        'OS Version'n    TIME11.
        'App Version'n   MMDDYY10.
        'SDK Version'n   $CHAR6.
        'App ID'n        $CHAR14.
        'App Name'n      $CHAR32.
        'Is Retargeting'n $CHAR5.
        'Retargeting Conversion Type'n $CHAR1.
        'Is Primary Attribution'n $CHAR5.
        'Attribution Lookback'n $CHAR3.
        'Reengagement Window'n $CHAR1.
        'Match Type'n    $CHAR14.
        'User Agent'n    $CHAR80.
        'HTTP Referrer'n $CHAR995.
        'Original URL'n  $CHAR502.;
    INFILE &Link.
        DLM=','
        MISSOVER
        DSD ;
    INPUT
                'Attributed Touch Type'n : $CHAR10.
        'Attributed Touch Time'n : ?? ANYDTDTM19.
        'Install Time'n  : ?? ANYDTDTM19.
        'Event Time'n    : ?? ANYDTDTM19.
        'Event Name'n    : $CHAR24.
        'Event Value'n   : $CHAR61.
        'Event Revenue'n : $CHAR1.
        'Event Revenue Currency'n : $CHAR3.
        'Event Revenue INR'n : $CHAR1.
        'Cost Model'n    : $CHAR3.
        'Cost Value'n    : ?? COMMA4.
        'Cost Currency'n : $CHAR3.
        'Event Source'n  : $CHAR3.
        Partner          : $CHAR10.
        'Media Source'n  : $CHAR24.
        Channel          : $CHAR15.
        Campaign         : $CHAR200.
        'Campaign ID'n   : $CHAR17.
        Adset            : $CHAR200.
        'Adset ID'n      : $CHAR17.
        Ad               : $CHAR200.
        'Ad ID'n         : $CHAR17.
        'Ad Type'n       : $CHAR17.
        'Site ID'n       : $CHAR162.
        Region           : $CHAR2.
        'Country Code'n  : $CHAR2.
        State            : $CHAR3.
        City             : $CHAR42.
        'Postal Code'n   : $CHAR6.
        DMA              : $CHAR6.
        IP               : $CHAR15.
        Operator         : $CHAR16.
        Carrier          : $CHAR25.
        Language         : $CHAR8.
        'AppsFlyer ID'n  : $CHAR33.
        'Customer User ID'n : ?? BEST10.
        'Android ID'n    : $CHAR16.
        IMEI             : $CHAR1.
        IDFA             : $CHAR1.
        'Advertising ID'n : $CHAR36.
        IDFV             : $CHAR1.
        'Device Type'n   : $CHAR31.
        'Device Category'n : $CHAR1.
        Platform         : $CHAR7.
        'OS Version'n    : ?? TIME5.
        'App Version'n   : ?? MMDDYY6.
        'SDK Version'n   : $CHAR6.
        'App ID'n        : $CHAR14.
        'App Name'n      : $CHAR32.
        'Is Retargeting'n : $CHAR5.
        'Retargeting Conversion Type'n : $CHAR1.
        'Is Primary Attribution'n : $CHAR5.
        'Attribution Lookback'n : $CHAR3.
        'Reengagement Window'n : $CHAR1.
        'Match Type'n    : $CHAR14.
        'User Agent'n    : $CHAR80.
        'HTTP Referrer'n : $CHAR995.
        'Original URL'n  : $CHAR502.;
RUN;
%mend Append();
%Append(data=Nov ,Link="/sasdata/icfl/lin_data/Ketan/Rawdata/&yt_date. IOS.csv");
 
Data IAddon (keep="Customer User ID"n "Event Time"n "Event_time"n "Media Source"n
Adset AD "Ad ID"n Campaign "Original URL"n "Sub Site ID"n "Site ID"n Partner "Creative id"n);
set Nov;
if 'App Name'n ^= 'Indiabulls Dhani Biz Loan App';
run; 


Data App.IOS;
set App.IOS IAddon;
run;
 
data App.IOS;
set App.IOS;
Customer_user_id=compress(put('customer user id'n,$10.));
Event_time=Datepart("Event Time"n);
run;
 
data IOS_sokrati;
set App.IOS App.Asokrati;
run;

proc sort data=IOS_sokrati;
by Customer_user_id "Event Time"n;
run;

proc sort data=IOS_sokrati nodupkey;
by Customer_user_id Event_time;
run;

Data IOS_sokrati_1;
set IOS_sokrati;
if Compress(Length(Customer_user_id))>=10 then output;
run;
 
proc sort data=IOS_sokrati_1 nodupkey out=App.sokrati;
by customer_user_id;
run;
 
 proc freq data=IOS_sokrati_1;
tables event_time;
format Event_time date9.;
run;

/* --------------------------    Retargetting data append        --------------------------- */


Options compress=yes;
libname App "/sasdata/icfl/lin_data/Ketan/SAS Database";


%Macro Append(Data=, Link=);
DATA WORK.&Data.;
    LENGTH
        'Attributed Touch Type'n $ 10
        'Attributed Touch Time'n   8
        'Install Time'n    8
        'Event Time'n      8
        'Event Name'n    $ 24
        'Event Value'n   $ 61
        'Event Revenue'n $ 1
        'Event Revenue Currency'n $ 3
        'Event Revenue INR'n $ 1
        'Cost Model'n    $ 3
        'Cost Value'n      8
        'Cost Currency'n $ 3
        'Event Source'n  $ 3
        Partner          $ 10
        'Media Source'n  $ 24
        Channel          $ 15
        Campaign         $ 200
        'Campaign ID'n   $ 17
        Adset            $ 200
        'Adset ID'n      $ 17
        Ad               $ 200
        'Ad ID'n         $ 17
        'Ad Type'n       $ 17
        'Site ID'n       $ 162
        Region           $ 2
        'Country Code'n  $ 2
        State            $ 3
        City             $ 42
        'Postal Code'n   $ 6
        DMA              $ 6
        IP               $ 15
        Operator         $ 16
        Carrier          $ 25
        Language         $ 8
        'AppsFlyer ID'n  $ 33
        'Customer User ID'n   8
        'Android ID'n    $ 16
        IMEI             $ 1
        IDFA             $ 1
        'Advertising ID'n $ 36
        IDFV             $ 1
        'Device Type'n   $ 31
        'Device Category'n $ 1
        Platform         $ 7
        'OS Version'n      8
        'App Version'n     8
        'SDK Version'n   $ 6
        'App ID'n        $ 14
        'App Name'n      $ 32
        'Is Retargeting'n $ 5
        'Retargeting Conversion Type'n $ 1
        'Is Primary Attribution'n $ 5
        'Attribution Lookback'n $ 3
        'Reengagement Window'n $ 1
        'Match Type'n    $ 14
        'User Agent'n    $ 80
        'HTTP Referrer'n $ 995
        'Original URL'n  $ 502 ;
    FORMAT
        'Attributed Touch Type'n $CHAR10.
        'Attributed Touch Time'n DATETIME18.
        'Install Time'n  DATETIME18.
        'Event Time'n    DATETIME18.
        'Event Name'n    $CHAR24.
        'Event Value'n   $CHAR61.
        'Event Revenue'n $CHAR1.
        'Event Revenue Currency'n $CHAR3.
        'Event Revenue INR'n $CHAR1.
        'Cost Model'n    $CHAR3.
        'Cost Value'n    BEST4.
        'Cost Currency'n $CHAR3.
        'Event Source'n  $CHAR3.
        Partner          $CHAR10.
        'Media Source'n  $CHAR24.
        Channel          $CHAR15.
        Campaign         $CHAR200.
        'Campaign ID'n   $CHAR17.
        Adset            $CHAR200.
        'Adset ID'n      $CHAR17.
        Ad               $CHAR200.
        'Ad ID'n         $CHAR17.
        'Ad Type'n       $CHAR17.
        'Site ID'n       $CHAR162.
        Region           $CHAR2.
        'Country Code'n  $CHAR2.
        State            $CHAR3.
        City             $CHAR42.
        'Postal Code'n   $CHAR6.
        DMA              $CHAR6.
        IP               $CHAR15.
        Operator         $CHAR16.
        Carrier          $CHAR25.
        Language         $CHAR8.
        'AppsFlyer ID'n  $CHAR33.
        'Customer User ID'n BEST10.
        'Android ID'n    $CHAR16.
        IMEI             $CHAR1.
        IDFA             $CHAR1.
        'Advertising ID'n $CHAR36.
        IDFV             $CHAR1.
        'Device Type'n   $CHAR31.
        'Device Category'n $CHAR1.
        Platform         $CHAR7.
        'OS Version'n    TIME8.
        'App Version'n   MMDDYY10.
        'SDK Version'n   $CHAR6.
        'App ID'n        $CHAR14.
        'App Name'n      $CHAR32.
        'Is Retargeting'n $CHAR5.
        'Retargeting Conversion Type'n $CHAR1.
        'Is Primary Attribution'n $CHAR5.
        'Attribution Lookback'n $CHAR3.
        'Reengagement Window'n $CHAR1.
        'Match Type'n    $CHAR14.
        'User Agent'n    $CHAR80.
        'HTTP Referrer'n $CHAR995.
        'Original URL'n  $CHAR502.;
    INFORMAT
                'Attributed Touch Type'n $CHAR10.
        'Attributed Touch Time'n DATETIME18.
        'Install Time'n  DATETIME18.
        'Event Time'n    DATETIME18.
        'Event Name'n    $CHAR24.
        'Event Value'n   $CHAR61.
        'Event Revenue'n $CHAR1.
        'Event Revenue Currency'n $CHAR3.
        'Event Revenue INR'n $CHAR1.
        'Cost Model'n    $CHAR3.
        'Cost Value'n    BEST4.
        'Cost Currency'n $CHAR3.
        'Event Source'n  $CHAR3.
        Partner          $CHAR10.
        'Media Source'n  $CHAR24.
        Channel          $CHAR15.
        Campaign         $CHAR200.
        'Campaign ID'n   $CHAR17.
        Adset            $CHAR200.
        'Adset ID'n      $CHAR17.
        Ad               $CHAR200.
        'Ad ID'n         $CHAR17.
        'Ad Type'n       $CHAR17.
        'Site ID'n       $CHAR162.
        Region           $CHAR2.
        'Country Code'n  $CHAR2.
        State            $CHAR3.
        City             $CHAR42.
        'Postal Code'n   $CHAR6.
        DMA              $CHAR6.
        IP               $CHAR15.
        Operator         $CHAR16.
        Carrier          $CHAR25.
        Language         $CHAR8.
        'AppsFlyer ID'n  $CHAR33.
        'Customer User ID'n BEST10.
        'Android ID'n    $CHAR16.
        IMEI             $CHAR1.
        IDFA             $CHAR1.
        'Advertising ID'n $CHAR36.
        IDFV             $CHAR1.
        'Device Type'n   $CHAR31.
        'Device Category'n $CHAR1.
        Platform         $CHAR7.
        'OS Version'n    TIME11.
        'App Version'n   MMDDYY10.
        'SDK Version'n   $CHAR6.
        'App ID'n        $CHAR14.
        'App Name'n      $CHAR32.
        'Is Retargeting'n $CHAR5.
        'Retargeting Conversion Type'n $CHAR1.
        'Is Primary Attribution'n $CHAR5.
        'Attribution Lookback'n $CHAR3.
        'Reengagement Window'n $CHAR1.
        'Match Type'n    $CHAR14.
        'User Agent'n    $CHAR80.
        'HTTP Referrer'n $CHAR995.
        'Original URL'n  $CHAR502.;
    INFILE &Link.
        DLM=','
        MISSOVER
        DSD ;
    INPUT
                'Attributed Touch Type'n : $CHAR10.
        'Attributed Touch Time'n : ?? ANYDTDTM19.
        'Install Time'n  : ?? ANYDTDTM19.
        'Event Time'n    : ?? ANYDTDTM19.
        'Event Name'n    : $CHAR24.
        'Event Value'n   : $CHAR61.
        'Event Revenue'n : $CHAR1.
        'Event Revenue Currency'n : $CHAR3.
        'Event Revenue INR'n : $CHAR1.
        'Cost Model'n    : $CHAR3.
        'Cost Value'n    : ?? COMMA4.
        'Cost Currency'n : $CHAR3.
        'Event Source'n  : $CHAR3.
        Partner          : $CHAR10.
        'Media Source'n  : $CHAR24.
        Channel          : $CHAR15.
        Campaign         : $CHAR200.
        'Campaign ID'n   : $CHAR17.
        Adset            : $CHAR200.
        'Adset ID'n      : $CHAR17.
        Ad               : $CHAR200.
        'Ad ID'n         : $CHAR17.
        'Ad Type'n       : $CHAR17.
        'Site ID'n       : $CHAR162.
        Region           : $CHAR2.
        'Country Code'n  : $CHAR2.
        State            : $CHAR3.
        City             : $CHAR42.
        'Postal Code'n   : $CHAR6.
        DMA              : $CHAR6.
        IP               : $CHAR15.
        Operator         : $CHAR16.
        Carrier          : $CHAR25.
        Language         : $CHAR8.
        'AppsFlyer ID'n  : $CHAR33.
        'Customer User ID'n : ?? BEST10.
        'Android ID'n    : $CHAR16.
        IMEI             : $CHAR1.
        IDFA             : $CHAR1.
        'Advertising ID'n : $CHAR36.
        IDFV             : $CHAR1.
        'Device Type'n   : $CHAR31.
        'Device Category'n : $CHAR1.
        Platform         : $CHAR7.
        'OS Version'n    : ?? TIME5.
        'App Version'n   : ?? MMDDYY6.
        'SDK Version'n   : $CHAR6.
        'App ID'n        : $CHAR14.
        'App Name'n      : $CHAR32.
        'Is Retargeting'n : $CHAR5.
        'Retargeting Conversion Type'n : $CHAR1.
        'Is Primary Attribution'n : $CHAR5.
        'Attribution Lookback'n : $CHAR3.
        'Reengagement Window'n : $CHAR1.
        'Match Type'n    : $CHAR14.
        'User Agent'n    : $CHAR80.
        'HTTP Referrer'n : $CHAR995.
        'Original URL'n  : $CHAR502. ;
RUN;
%mend Append();
%Append(Data=A ,Link="/sasdata/icfl/lin_data/Ketan/Rawdata/App data &yt_date. Retargetting.csv");
/* %Append(Data=B ,Link="/sasdata/icfl/lin_data/Ketan/Rawdata/App1 data &yt_date. Retargetting.csv"); */


data Ap (drop="Media Source"n rename=("Media Source_1"n="Media Source"n));
set  A;
"Media Source_1"n=compress("Media Source"n||"_Retargetting");
run;
 
 
data App.Retargetting ;
set App.Retargetting Ap;

event_time=Datepart("Event Time"n);
format Event_time ddmmyy10.;
run;

proc freq data=App.Retargetting;
tables ("Event_Time"n);
run;



/* --------------------------   Yaari Append       --------------------------- */


Options compress= yes;
Libname mis "/sasdata/icfl/lin_data/Ketan/SAS Database";


%Macro Partner(Data=, Link=);
DATA WORK.&Data.;
          LENGTH
              'Attributed Touch Type'n $ 10
              'Attributed Touch Time'n   8
              'Install Time'n    8
              'Event Time'n      8
              'Event Name'n    $ 21
              'Event Value'n   $ 37
              'Event Revenue'n $ 1
              'Event Revenue Currency'n $ 3
              'Event Revenue INR'n $ 1
              'Event Source'n  $ 3
              'Is Receipt Validated'n $ 1
              Partner          $ 7
              'Media Source'n  $ 42
              Channel          $ 15
              Keywords         $ 1
              Campaign         $ 48
              'Campaign ID'n   $ 17
              Adset            $ 100
              'Adset ID'n      $ 17
              Ad               $ 62
              'Ad ID'n         $ 17
              'Ad Type'n       $ 17
              'Site ID'n       $ 13
              'Sub Site ID'n   $ 1
              'Sub Param 1'n   $ 1
              'Sub Param 2'n   $ 1
              'Sub Param 3'n   $ 1
              'Sub Param 4'n   $ 1
              'Sub Param 5'n   $ 1
              'Cost Model'n    $ 1
              'Cost Value'n    $ 1
              'Cost Currency'n $ 1
              'Contributor 1 Partner'n $ 1
              'Contributor 1 Media Source'n $ 1
              'Contributor 1 Campaign'n $ 1
              'Contributor 1 Touch Type'n $ 1
              'Contributor 1 Touch Time'n $ 1
              'Contributor 2 Partner'n $ 1
              'Contributor 2 Media Source'n $ 1
              'Contributor 2 Campaign'n $ 1
              'Contributor 2 Touch Type'n $ 1
              'Contributor 2 Touch Time'n $ 1
              'Contributor 3 Partner'n $ 1
              'Contributor 3 Media Source'n $ 1
              'Contributor 3 Campaign'n $ 1
              'Contributor 3 Touch Type'n $ 1
              'Contributor 3 Touch Time'n $ 1
              Region           $ 2
              'Country Code'n  $ 2
              State            $ 9
              City             $ 42
              'Postal Code'n   $ 7
              DMA              $ 6
              IP               $ 15
              WIFI             $ 5
              Operator         $ 18
              Carrier          $ 27
              Language         $ 7
              'AppsFlyer ID'n  $ 33
              'Advertising ID'n $ 36
              IDFA             $ 1
              'Android ID'n    $ 16
              'Customer User ID'n   8
              IMEI             $ 1
              IDFV             $ 1
              Platform         $ 7
              'Device Type'n   $ 31
              'OS Version'n    $ 9
              'App Version'n     8
              'SDK Version'n   $ 6
              'App ID'n        $ 27
              'App Name'n      $ 50
              'Bundle ID'n     $ 27
              'Is Retargeting'n $ 5
              'Retargeting Conversion Type'n $ 1
              'Attribution Lookback'n $ 3
              'Reengagement Window'n $ 1
              'Is Primary Attribution'n $ 5
              'User Agent'n    $ 132
              'HTTP Referrer'n $ 35
              'Original URL'n  $ 491
              'Install App Store'n $ 1
              'Match Type'n    $ 14
              'Contributor 1 Match Type'n $ 1
              'Contributor 2 Match Type'n $ 1
              'Contributor 3 Match Type'n $ 1
              'Device Category'n $ 1
              'Google Play Referrer'n $ 1
              'Google Play Click Time'n $ 1
              'Google Play Install Begin Time'n $ 1 ;
          FORMAT
              'Attributed Touch Type'n $CHAR10.
              'Attributed Touch Time'n DATETIME18.
              'Install Time'n  DATETIME18.
              'Event Time'n    DATETIME18.
              'Event Name'n    $CHAR21.
              'Event Value'n   $CHAR37.
              'Event Revenue'n $CHAR1.
              'Event Revenue Currency'n $CHAR3.
              'Event Revenue INR'n $CHAR1.
              'Event Source'n  $CHAR3.
              'Is Receipt Validated'n $CHAR1.
              Partner          $CHAR7.
              'Media Source'n  $CHAR42.
              Channel          $CHAR15.
              Keywords         $CHAR1.
              Campaign         $CHAR48.
              'Campaign ID'n   $CHAR17.
              Adset            $CHAR100.
              'Adset ID'n      $CHAR17.
              Ad               $CHAR62.
              'Ad ID'n         $CHAR17.
              'Ad Type'n       $CHAR17.
              'Site ID'n       $CHAR13.
              'Sub Site ID'n   $CHAR1.
              'Sub Param 1'n   $CHAR1.
              'Sub Param 2'n   $CHAR1.
              'Sub Param 3'n   $CHAR1.
              'Sub Param 4'n   $CHAR1.
              'Sub Param 5'n   $CHAR1.
              'Cost Model'n    $CHAR1.
              'Cost Value'n    $CHAR1.
              'Cost Currency'n $CHAR1.
              'Contributor 1 Partner'n $CHAR1.
              'Contributor 1 Media Source'n $CHAR1.
              'Contributor 1 Campaign'n $CHAR1.
              'Contributor 1 Touch Type'n $CHAR1.
              'Contributor 1 Touch Time'n $CHAR1.
              'Contributor 2 Partner'n $CHAR1.
              'Contributor 2 Media Source'n $CHAR1.
              'Contributor 2 Campaign'n $CHAR1.
              'Contributor 2 Touch Type'n $CHAR1.
              'Contributor 2 Touch Time'n $CHAR1.
              'Contributor 3 Partner'n $CHAR1.
              'Contributor 3 Media Source'n $CHAR1.
              'Contributor 3 Campaign'n $CHAR1.
              'Contributor 3 Touch Type'n $CHAR1.
              'Contributor 3 Touch Time'n $CHAR1.
              Region           $CHAR2.
              'Country Code'n  $CHAR2.
              State            $CHAR9.
              City             $CHAR42.
              'Postal Code'n   $CHAR7.
              DMA              $CHAR6.
              IP               $CHAR15.
              WIFI             $CHAR5.
              Operator         $CHAR18.
              Carrier          $CHAR27.
              Language         $CHAR7.
              'AppsFlyer ID'n  $CHAR33.
              'Advertising ID'n $CHAR36.
              IDFA             $CHAR1.
              'Android ID'n    $CHAR16.
              'Customer User ID'n BEST10.
              IMEI             $CHAR1.
              IDFV             $CHAR1.
              Platform         $CHAR7.
              'Device Type'n   $CHAR31.
              'OS Version'n    $CHAR9.
              'App Version'n   TIME8.
              'SDK Version'n   $CHAR6.
              'App ID'n        $CHAR27.
              'App Name'n      $CHAR50.
              'Bundle ID'n     $CHAR27.
              'Is Retargeting'n $CHAR5.
              'Retargeting Conversion Type'n $CHAR1.
              'Attribution Lookback'n $CHAR3.
              'Reengagement Window'n $CHAR1.
              'Is Primary Attribution'n $CHAR5.
              'User Agent'n    $CHAR132.
              'HTTP Referrer'n $CHAR35.
              'Original URL'n  $CHAR491.
              'Install App Store'n $CHAR1.
              'Match Type'n    $CHAR14.
              'Contributor 1 Match Type'n $CHAR1.
              'Contributor 2 Match Type'n $CHAR1.
              'Contributor 3 Match Type'n $CHAR1.
              'Device Category'n $CHAR1.
              'Google Play Referrer'n $CHAR1.
              'Google Play Click Time'n $CHAR1.
              'Google Play Install Begin Time'n $CHAR1. ;
          INFORMAT
              'Attributed Touch Type'n $CHAR10.
              'Attributed Touch Time'n DATETIME18.
              'Install Time'n  DATETIME18.
              'Event Time'n    DATETIME18.
              'Event Name'n    $CHAR21.
              'Event Value'n   $CHAR37.
              'Event Revenue'n $CHAR1.
              'Event Revenue Currency'n $CHAR3.
              'Event Revenue INR'n $CHAR1.
              'Event Source'n  $CHAR3.
              'Is Receipt Validated'n $CHAR1.
              Partner          $CHAR7.
              'Media Source'n  $CHAR42.
             Channel          $CHAR15.
              Keywords         $CHAR1.
              Campaign         $CHAR48.
              'Campaign ID'n   $CHAR17.
              Adset            $CHAR100.
              'Adset ID'n      $CHAR17.
              Ad               $CHAR62.
              'Ad ID'n         $CHAR17.
              'Ad Type'n       $CHAR17.
              'Site ID'n       $CHAR13.
              'Sub Site ID'n   $CHAR1.
              'Sub Param 1'n   $CHAR1.
              'Sub Param 2'n   $CHAR1.
              'Sub Param 3'n   $CHAR1.
              'Sub Param 4'n   $CHAR1.
              'Sub Param 5'n   $CHAR1.
              'Cost Model'n    $CHAR1.
              'Cost Value'n    $CHAR1.
              'Cost Currency'n $CHAR1.
              'Contributor 1 Partner'n $CHAR1.
              'Contributor 1 Media Source'n $CHAR1.
              'Contributor 1 Campaign'n $CHAR1.
              'Contributor 1 Touch Type'n $CHAR1.
              'Contributor 1 Touch Time'n $CHAR1.
              'Contributor 2 Partner'n $CHAR1.
              'Contributor 2 Media Source'n $CHAR1.
              'Contributor 2 Campaign'n $CHAR1.
              'Contributor 2 Touch Type'n $CHAR1.
              'Contributor 2 Touch Time'n $CHAR1.
              'Contributor 3 Partner'n $CHAR1.
              'Contributor 3 Media Source'n $CHAR1.
              'Contributor 3 Campaign'n $CHAR1.
              'Contributor 3 Touch Type'n $CHAR1.
              'Contributor 3 Touch Time'n $CHAR1.
              Region           $CHAR2.
              'Country Code'n  $CHAR2.
              State            $CHAR9.
              City             $CHAR42.
              'Postal Code'n   $CHAR7.
              DMA              $CHAR6.
              IP               $CHAR15.
              WIFI             $CHAR5.
              Operator         $CHAR18.
              Carrier          $CHAR27.
              Language         $CHAR7.
              'AppsFlyer ID'n  $CHAR33.
              'Advertising ID'n $CHAR36.
              IDFA             $CHAR1.
              'Android ID'n    $CHAR16.
              'Customer User ID'n BEST10.
              IMEI             $CHAR1.
              IDFV             $CHAR1.
              Platform         $CHAR7.
              'Device Type'n   $CHAR31.
              'OS Version'n    $CHAR9.
              'App Version'n   TIME11.
              'SDK Version'n   $CHAR6.
              'App ID'n        $CHAR27.
              'App Name'n      $CHAR50.
              'Bundle ID'n     $CHAR27.
              'Is Retargeting'n $CHAR5.
              'Retargeting Conversion Type'n $CHAR1.
              'Attribution Lookback'n $CHAR3.
              'Reengagement Window'n $CHAR1.
              'Is Primary Attribution'n $CHAR5.
              'User Agent'n    $CHAR132.
              'HTTP Referrer'n $CHAR35.
              'Original URL'n  $CHAR491.
              'Install App Store'n $CHAR1.
              'Match Type'n    $CHAR14.
              'Contributor 1 Match Type'n $CHAR1.
              'Contributor 2 Match Type'n $CHAR1.
              'Contributor 3 Match Type'n $CHAR1.
              'Device Category'n $CHAR1.
              'Google Play Referrer'n $CHAR1.
              'Google Play Click Time'n $CHAR1.
              'Google Play Install Begin Time'n $CHAR1. ;
 
    INFILE &Link.
        DLM=','
        MISSOVER
        DSD  ;
          INPUT
              'Attributed Touch Type'n : $CHAR10.
              'Attributed Touch Time'n : ?? ANYDTDTM19.
              'Install Time'n  : ?? ANYDTDTM19.
              'Event Time'n    : ?? ANYDTDTM19.
              'Event Name'n    : $CHAR21.
              'Event Value'n   : $CHAR37.
              'Event Revenue'n : $CHAR1.
              'Event Revenue Currency'n : $CHAR3.
              'Event Revenue INR'n : $CHAR1.
              'Event Source'n  : $CHAR3.
              'Is Receipt Validated'n : $CHAR1.
              Partner          : $CHAR7.
              'Media Source'n  : $CHAR42.
              Channel          : $CHAR15.
              Keywords         : $CHAR1.
              Campaign         : $CHAR48.
              'Campaign ID'n   : $CHAR17.
              Adset            : $CHAR100.
              'Adset ID'n      : $CHAR17.
              Ad               : $CHAR62.
              'Ad ID'n         : $CHAR17.
              'Ad Type'n       : $CHAR17.
              'Site ID'n       : $CHAR13.
              'Sub Site ID'n   : $CHAR1.
              'Sub Param 1'n   : $CHAR1.
              'Sub Param 2'n   : $CHAR1.
              'Sub Param 3'n   : $CHAR1.
              'Sub Param 4'n   : $CHAR1.
              'Sub Param 5'n   : $CHAR1.
              'Cost Model'n    : $CHAR1.
              'Cost Value'n    : $CHAR1.
              'Cost Currency'n : $CHAR1.
              'Contributor 1 Partner'n : $CHAR1.
              'Contributor 1 Media Source'n : $CHAR1.
              'Contributor 1 Campaign'n : $CHAR1.
              'Contributor 1 Touch Type'n : $CHAR1.
              'Contributor 1 Touch Time'n : $CHAR1.
              'Contributor 2 Partner'n : $CHAR1.
              'Contributor 2 Media Source'n : $CHAR1.
              'Contributor 2 Campaign'n : $CHAR1.
              'Contributor 2 Touch Type'n : $CHAR1.
              'Contributor 2 Touch Time'n : $CHAR1.
              'Contributor 3 Partner'n : $CHAR1.
              'Contributor 3 Media Source'n : $CHAR1.
              'Contributor 3 Campaign'n : $CHAR1.
              'Contributor 3 Touch Type'n : $CHAR1.
              'Contributor 3 Touch Time'n : $CHAR1.
              Region           : $CHAR2.
              'Country Code'n  : $CHAR2.
              State            : $CHAR9.
              City             : $CHAR42.
              'Postal Code'n   : $CHAR7.
              DMA              : $CHAR6.
              IP               : $CHAR15.
              WIFI             : $CHAR5.
              Operator         : $CHAR18.
              Carrier          : $CHAR27.
              Language         : $CHAR7.
              'AppsFlyer ID'n  : $CHAR33.
              'Advertising ID'n : $CHAR36.
              IDFA             : $CHAR1.
              'Android ID'n    : $CHAR16.
              'Customer User ID'n : ?? BEST10.
              IMEI             : $CHAR1.
              IDFV             : $CHAR1.
              Platform         : $CHAR7.
              'Device Type'n   : $CHAR31.
              'OS Version'n    : $CHAR9.
              'App Version'n   : ?? TIME5.
              'SDK Version'n   : $CHAR6.
              'App ID'n        : $CHAR27.
              'App Name'n      : $CHAR50.
              'Bundle ID'n     : $CHAR27.
              'Is Retargeting'n : $CHAR5.
              'Retargeting Conversion Type'n : $CHAR1.
              'Attribution Lookback'n : $CHAR3.
              'Reengagement Window'n : $CHAR1.
              'Is Primary Attribution'n : $CHAR5.
              'User Agent'n    : $CHAR132.
              'HTTP Referrer'n : $CHAR35.
              'Original URL'n  : $CHAR491.
              'Install App Store'n : $CHAR1.
              'Match Type'n    : $CHAR14.
              'Contributor 1 Match Type'n : $CHAR1.
              'Contributor 2 Match Type'n : $CHAR1.
              'Contributor 3 Match Type'n : $CHAR1.
              'Device Category'n : $CHAR1.
              'Google Play Referrer'n : $CHAR1.
              'Google Play Click Time'n : $CHAR1.
              'Google Play Install Begin Time'n : $CHAR1. ;
      RUN;
%mend Partner();
%Partner(Data=A ,Link="/sasdata/icfl/lin_data/Ketan/Yaarii Data/&yt_date..csv");


Data Yarri;
set 
A;
where "Event Name"n="Mobile Registered";
run;
 
proc sort data=Yarri ;
by "Customer User ID"n "Event Time"n ;
run;
 
proc sort data=Yarri nodupkey;
by "Customer User ID"n  ;
run;
 
Data mis.Yarri_Appflyerdata;
set mis.Yarri_Appflyerdata Yarri;
run;
 
data mis.Yarri_Appflyerdata;
set mis.Yarri_Appflyerdata;
Customer_user_id=compress(put('customer user id'n,$10.));
format Event_time date9.;
Event_time=Datepart("Event Time"n);
run;

proc freq data=mis.Yarri_Appflyerdata;
tables Event_time;
format Event_time date9.;
run;



/* --------------------------   Partner data  Append       --------------------------- */

libname App "/sasdata/icfl/lin_data/Ketan/SAS Database";

%Macro Partner(Data=, Link=);
DATA WORK.&Data.;
          LENGTH
              'Attributed Touch Type'n $ 10
              'Attributed Touch Time'n   8
              'Install Time'n    8
              'Event Time'n      8
              'Event Name'n    $ 21
              'Event Value'n   $ 37
              'Event Revenue'n $ 1
              'Event Revenue Currency'n $ 3
              'Event Revenue INR'n $ 1
              'Event Source'n  $ 3
              'Is Receipt Validated'n $ 1
              Partner          $ 7
              'Media Source'n  $ 42
              Channel          $ 15
              Keywords         $ 1
              Campaign         $ 150
              'Campaign ID'n   $ 17
              Adset            $ 100
              'Adset ID'n      $ 17
              Ad               $ 62
              'Ad ID'n         $ 17
              'Ad Type'n       $ 17
              'Site ID'n       $ 13
              'Sub Site ID'n   $ 1
              'Sub Param 1'n   $ 1
              'Sub Param 2'n   $ 1
              'Sub Param 3'n   $ 1
              'Sub Param 4'n   $ 1
              'Sub Param 5'n   $ 1
              'Cost Model'n    $ 1
              'Cost Value'n    $ 1
              'Cost Currency'n $ 1
              'Contributor 1 Partner'n $ 1
              'Contributor 1 Media Source'n $ 1
              'Contributor 1 Campaign'n $ 1
              'Contributor 1 Touch Type'n $ 1
              'Contributor 1 Touch Time'n $ 1
              'Contributor 2 Partner'n $ 1
              'Contributor 2 Media Source'n $ 1
              'Contributor 2 Campaign'n $ 1
              'Contributor 2 Touch Type'n $ 1
              'Contributor 2 Touch Time'n $ 1
              'Contributor 3 Partner'n $ 1
              'Contributor 3 Media Source'n $ 1
              'Contributor 3 Campaign'n $ 1
              'Contributor 3 Touch Type'n $ 1
              'Contributor 3 Touch Time'n $ 1
              Region           $ 2
              'Country Code'n  $ 2
              State            $ 9
              City             $ 42
              'Postal Code'n   $ 7
              DMA              $ 6
              IP               $ 15
              WIFI             $ 5
              Operator         $ 18
              Carrier          $ 27
              Language         $ 7
              'AppsFlyer ID'n  $ 33
              'Advertising ID'n $ 36
              IDFA             $ 1
              'Android ID'n    $ 16
              'Customer User ID'n   8
              IMEI             $ 1
              IDFV             $ 1
              Platform         $ 7
              'Device Type'n   $ 31
              'OS Version'n    $ 9
              'App Version'n     8
              'SDK Version'n   $ 6
              'App ID'n        $ 27
              'App Name'n      $ 50
              'Bundle ID'n     $ 27
              'Is Retargeting'n $ 5
              'Retargeting Conversion Type'n $ 1
              'Attribution Lookback'n $ 3
              'Reengagement Window'n $ 1
              'Is Primary Attribution'n $ 5
              'User Agent'n    $ 132
              'HTTP Referrer'n $ 35
              'Original URL'n  $ 491
              'Install App Store'n $ 1
              'Match Type'n    $ 14
              'Contributor 1 Match Type'n $ 1
              'Contributor 2 Match Type'n $ 1
              'Contributor 3 Match Type'n $ 1
              'Device Category'n $ 1
              'Google Play Referrer'n $ 1
              'Google Play Click Time'n $ 1
              'Google Play Install Begin Time'n $ 1 ;
          FORMAT
              'Attributed Touch Type'n $CHAR10.
              'Attributed Touch Time'n DATETIME18.
              'Install Time'n  DATETIME18.
              'Event Time'n    DATETIME18.
              'Event Name'n    $CHAR21.
              'Event Value'n   $CHAR37.
              'Event Revenue'n $CHAR1.
              'Event Revenue Currency'n $CHAR3.
              'Event Revenue INR'n $CHAR1.
              'Event Source'n  $CHAR3.
              'Is Receipt Validated'n $CHAR1.
              Partner          $CHAR7.
              'Media Source'n  $CHAR42.
              Channel          $CHAR15.
              Keywords         $CHAR1.
              Campaign         $CHAR150.
              'Campaign ID'n   $CHAR17.
              Adset            $CHAR100.
              'Adset ID'n      $CHAR17.
              Ad               $CHAR62.
              'Ad ID'n         $CHAR17.
              'Ad Type'n       $CHAR17.
              'Site ID'n       $CHAR13.
             'Sub Site ID'n   $CHAR1.
              'Sub Param 1'n   $CHAR1.
              'Sub Param 2'n   $CHAR1.
              'Sub Param 3'n   $CHAR1.
              'Sub Param 4'n   $CHAR1.
              'Sub Param 5'n   $CHAR1.
              'Cost Model'n    $CHAR1.
              'Cost Value'n    $CHAR1.
              'Cost Currency'n $CHAR1.
              'Contributor 1 Partner'n $CHAR1.
              'Contributor 1 Media Source'n $CHAR1.
              'Contributor 1 Campaign'n $CHAR1.
              'Contributor 1 Touch Type'n $CHAR1.
              'Contributor 1 Touch Time'n $CHAR1.
              'Contributor 2 Partner'n $CHAR1.
              'Contributor 2 Media Source'n $CHAR1.
              'Contributor 2 Campaign'n $CHAR1.
              'Contributor 2 Touch Type'n $CHAR1.
              'Contributor 2 Touch Time'n $CHAR1.
              'Contributor 3 Partner'n $CHAR1.
              'Contributor 3 Media Source'n $CHAR1.
              'Contributor 3 Campaign'n $CHAR1.
              'Contributor 3 Touch Type'n $CHAR1.
              'Contributor 3 Touch Time'n $CHAR1.
              Region           $CHAR2.
              'Country Code'n  $CHAR2.
              State            $CHAR9.
              City             $CHAR42.
              'Postal Code'n   $CHAR7.
              DMA              $CHAR6.
              IP               $CHAR15.
              WIFI             $CHAR5.
              Operator         $CHAR18.
              Carrier          $CHAR27.
              Language         $CHAR7.
              'AppsFlyer ID'n  $CHAR33.
              'Advertising ID'n $CHAR36.
              IDFA             $CHAR1.
              'Android ID'n    $CHAR16.
              'Customer User ID'n BEST10.
              IMEI             $CHAR1.
              IDFV             $CHAR1.
              Platform         $CHAR7.
              'Device Type'n   $CHAR31.
              'OS Version'n    $CHAR9.
              'App Version'n   TIME8.
              'SDK Version'n   $CHAR6.
              'App ID'n        $CHAR27.
              'App Name'n      $CHAR50.
              'Bundle ID'n     $CHAR27.
              'Is Retargeting'n $CHAR5.
              'Retargeting Conversion Type'n $CHAR1.
              'Attribution Lookback'n $CHAR3.
              'Reengagement Window'n $CHAR1.
              'Is Primary Attribution'n $CHAR5.
              'User Agent'n    $CHAR132.
              'HTTP Referrer'n $CHAR35.
              'Original URL'n  $CHAR491.
              'Install App Store'n $CHAR1.
              'Match Type'n    $CHAR14.
              'Contributor 1 Match Type'n $CHAR1.
              'Contributor 2 Match Type'n $CHAR1.
              'Contributor 3 Match Type'n $CHAR1.
              'Device Category'n $CHAR1.
              'Google Play Referrer'n $CHAR1.
              'Google Play Click Time'n $CHAR1.
              'Google Play Install Begin Time'n $CHAR1. ;
          INFORMAT
              'Attributed Touch Type'n $CHAR10.
              'Attributed Touch Time'n DATETIME18.
              'Install Time'n  DATETIME18.
              'Event Time'n    DATETIME18.
              'Event Name'n    $CHAR21.
              'Event Value'n   $CHAR37.
              'Event Revenue'n $CHAR1.
              'Event Revenue Currency'n $CHAR3.
              'Event Revenue INR'n $CHAR1.
              'Event Source'n  $CHAR3.
              'Is Receipt Validated'n $CHAR1.
              Partner          $CHAR7.
              'Media Source'n  $CHAR42.
              Channel          $CHAR15.
              Keywords         $CHAR1.
              Campaign         $CHAR150.
              'Campaign ID'n   $CHAR17.
              Adset            $CHAR100.
              'Adset ID'n      $CHAR17.
              Ad               $CHAR62.
              'Ad ID'n         $CHAR17.
              'Ad Type'n       $CHAR17.
              'Site ID'n       $CHAR13.
              'Sub Site ID'n   $CHAR1.
              'Sub Param 1'n   $CHAR1.
              'Sub Param 2'n   $CHAR1.
              'Sub Param 3'n   $CHAR1.
              'Sub Param 4'n   $CHAR1.
              'Sub Param 5'n   $CHAR1.
              'Cost Model'n    $CHAR1.
              'Cost Value'n    $CHAR1.
              'Cost Currency'n $CHAR1.
              'Contributor 1 Partner'n $CHAR1.
              'Contributor 1 Media Source'n $CHAR1.
              'Contributor 1 Campaign'n $CHAR1.
              'Contributor 1 Touch Type'n $CHAR1.
              'Contributor 1 Touch Time'n $CHAR1.
              'Contributor 2 Partner'n $CHAR1.
              'Contributor 2 Media Source'n $CHAR1.
              'Contributor 2 Campaign'n $CHAR1.
              'Contributor 2 Touch Type'n $CHAR1.
              'Contributor 2 Touch Time'n $CHAR1.
              'Contributor 3 Partner'n $CHAR1.
              'Contributor 3 Media Source'n $CHAR1.
              'Contributor 3 Campaign'n $CHAR1.
              'Contributor 3 Touch Type'n $CHAR1.
              'Contributor 3 Touch Time'n $CHAR1.
              Region           $CHAR2.
              'Country Code'n  $CHAR2.
              State            $CHAR9.
              City             $CHAR42.
              'Postal Code'n   $CHAR7.
              DMA              $CHAR6.
              IP               $CHAR15.
              WIFI             $CHAR5.
              Operator         $CHAR18.
              Carrier          $CHAR27.
              Language         $CHAR7.
              'AppsFlyer ID'n  $CHAR33.
              'Advertising ID'n $CHAR36.
              IDFA             $CHAR1.
              'Android ID'n    $CHAR16.
              'Customer User ID'n BEST10.
              IMEI             $CHAR1.
              IDFV             $CHAR1.
              Platform         $CHAR7.
              'Device Type'n   $CHAR31.
              'OS Version'n    $CHAR9.
              'App Version'n   TIME11.
              'SDK Version'n   $CHAR6.
              'App ID'n        $CHAR27.
              'App Name'n      $CHAR50.
              'Bundle ID'n     $CHAR27.
              'Is Retargeting'n $CHAR5.
              'Retargeting Conversion Type'n $CHAR1.
              'Attribution Lookback'n $CHAR3.
              'Reengagement Window'n $CHAR1.
              'Is Primary Attribution'n $CHAR5.
              'User Agent'n    $CHAR132.
              'HTTP Referrer'n $CHAR35.
              'Original URL'n  $CHAR491.
              'Install App Store'n $CHAR1.
              'Match Type'n    $CHAR14.
              'Contributor 1 Match Type'n $CHAR1.
              'Contributor 2 Match Type'n $CHAR1.
              'Contributor 3 Match Type'n $CHAR1.
              'Device Category'n $CHAR1.
              'Google Play Referrer'n $CHAR1.
              'Google Play Click Time'n $CHAR1.
              'Google Play Install Begin Time'n $CHAR1. ;
 
    INFILE &Link.
        DLM=','
        MISSOVER
        DSD  ;
          INPUT
              'Attributed Touch Type'n : $CHAR10.
              'Attributed Touch Time'n : ?? ANYDTDTM19.
              'Install Time'n  : ?? ANYDTDTM19.
              'Event Time'n    : ?? ANYDTDTM19.
              'Event Name'n    : $CHAR21.
              'Event Value'n   : $CHAR37.
              'Event Revenue'n : $CHAR1.
              'Event Revenue Currency'n : $CHAR3.
              'Event Revenue INR'n : $CHAR1.
              'Event Source'n  : $CHAR3.
              'Is Receipt Validated'n : $CHAR1.
              Partner          : $CHAR7.
              'Media Source'n  : $CHAR42.
              Channel          : $CHAR15.
              Keywords         : $CHAR1.
              Campaign         : $CHAR150.
              'Campaign ID'n   : $CHAR17.
              Adset            : $CHAR100.
              'Adset ID'n      : $CHAR17.
              Ad               : $CHAR62.
              'Ad ID'n         : $CHAR17.
              'Ad Type'n       : $CHAR17.
              'Site ID'n       : $CHAR13.
              'Sub Site ID'n   : $CHAR1.
              'Sub Param 1'n   : $CHAR1.
              'Sub Param 2'n   : $CHAR1.
              'Sub Param 3'n   : $CHAR1.
              'Sub Param 4'n   : $CHAR1.
              'Sub Param 5'n   : $CHAR1.
              'Cost Model'n    : $CHAR1.
              'Cost Value'n    : $CHAR1.
              'Cost Currency'n : $CHAR1.
              'Contributor 1 Partner'n : $CHAR1.
              'Contributor 1 Media Source'n : $CHAR1.
              'Contributor 1 Campaign'n : $CHAR1.
              'Contributor 1 Touch Type'n : $CHAR1.
              'Contributor 1 Touch Time'n : $CHAR1.
              'Contributor 2 Partner'n : $CHAR1.
              'Contributor 2 Media Source'n : $CHAR1.
              'Contributor 2 Campaign'n : $CHAR1.
              'Contributor 2 Touch Type'n : $CHAR1.
              'Contributor 2 Touch Time'n : $CHAR1.
              'Contributor 3 Partner'n : $CHAR1.
              'Contributor 3 Media Source'n : $CHAR1.
              'Contributor 3 Campaign'n : $CHAR1.
              'Contributor 3 Touch Type'n : $CHAR1.
              'Contributor 3 Touch Time'n : $CHAR1.
              Region           : $CHAR2.
              'Country Code'n  : $CHAR2.
              State            : $CHAR9.
              City             : $CHAR42.
              'Postal Code'n   : $CHAR7.
              DMA              : $CHAR6.
              IP               : $CHAR15.
              WIFI             : $CHAR5.
              Operator         : $CHAR18.
              Carrier          : $CHAR27.
              Language         : $CHAR7.
              'AppsFlyer ID'n  : $CHAR33.
              'Advertising ID'n : $CHAR36.
              IDFA             : $CHAR1.
              'Android ID'n    : $CHAR16.
              'Customer User ID'n : ?? BEST10.
              IMEI             : $CHAR1.
              IDFV             : $CHAR1.
              Platform         : $CHAR7.
              'Device Type'n   : $CHAR31.
              'OS Version'n    : $CHAR9.
              'App Version'n   : ?? TIME5.
              'SDK Version'n   : $CHAR6.
              'App ID'n        : $CHAR27.
              'App Name'n      : $CHAR50.
              'Bundle ID'n     : $CHAR27.
              'Is Retargeting'n : $CHAR5.
              'Retargeting Conversion Type'n : $CHAR1.
              'Attribution Lookback'n : $CHAR3.
              'Reengagement Window'n : $CHAR1.
              'Is Primary Attribution'n : $CHAR5.
              'User Agent'n    : $CHAR132.
              'HTTP Referrer'n : $CHAR35.
              'Original URL'n  : $CHAR491.
              'Install App Store'n : $CHAR1.
              'Match Type'n    : $CHAR14.
              'Contributor 1 Match Type'n : $CHAR1.
              'Contributor 2 Match Type'n : $CHAR1.
              'Contributor 3 Match Type'n : $CHAR1.
              'Device Category'n : $CHAR1.
              'Google Play Referrer'n : $CHAR1.
              'Google Play Click Time'n : $CHAR1.
              'Google Play Install Begin Time'n : $CHAR1. ;
      RUN;
%mend Partner();

%Partner(Data=A,Link="/sasdata/icfl/lin_data/Ketan/PartnerApp/PARTNER IOS _&yt_date..csv");
%Partner(Data=B,Link="/sasdata/icfl/lin_data/Ketan/PartnerApp/PARTNER APP _&yt_date..csv");



Data Partner_App;
set 
A B
;
run;

 
Data App.Partner_App;
set App.Partner_App Partner_App;
event_time=Datepart("Event time"n);
where "event Name"n="Mobile Registered";
run;

proc freq data=App.Partner_App;
tables event_time;
format Event_time date9.;
run;



/* --------------------------   Partner Retargetting     --------------------------- */


Options compress=yes;
libname App "/sasdata/icfl/lin_data/Ketan/SAS Database";

%Macro Append(Data=, Link=);
DATA WORK.&Data.;
    LENGTH
        'Attributed Touch Type'n $ 10
        'Attributed Touch Time'n   8
        'Install Time'n    8
        'Event Time'n      8
        'Event Name'n    $ 24
        'Event Value'n   $ 61
        'Event Revenue'n $ 1
        'Event Revenue Currency'n $ 3
        'Event Revenue INR'n $ 1
        'Event Source'n  $ 3
        'Is Receipt Validated'n $ 1
        Partner          $ 10
       'Media Source'n  $ 24
        Channel          $ 15
        Keywords         $ 1
        Campaign         $ 200
        'Campaign ID'n   $ 17
        Adset            $ 200
        'Adset ID'n      $ 17
        Ad               $ 200
        'Ad ID'n         $ 17
        'Ad Type'n       $ 17
        'Site ID'n       $ 162
        'Sub Site ID'n   $ 54
        'Sub Param 1'n   $ 16
        'Sub Param 2'n   $ 1
        'Sub Param 3'n   $ 1
        'Sub Param 4'n   $ 1
        'Sub Param 5'n   $ 1
        'Cost Model'n    $ 3
        'Cost Value'n      8
        'Cost Currency'n $ 3
        'Contributor 1 Partner'n $ 1
        'Contributor 1 Media Source'n $ 1
        'Contributor 1 Campaign'n $ 1
        'Contributor 1 Touch Type'n $ 1
        'Contributor 1 Touch Time'n $ 1
        'Contributor 2 Partner'n $ 1
        'Contributor 2 Media Source'n $ 1
        'Contributor 2 Campaign'n $ 1
        'Contributor 2 Touch Type'n $ 1
        'Contributor 2 Touch Time'n $ 1
        'Contributor 3 Partner'n $ 1
        'Contributor 3 Media Source'n $ 1
        'Contributor 3 Campaign'n $ 1
        'Contributor 3 Touch Type'n $ 1
        'Contributor 3 Touch Time'n $ 1
        Region           $ 2
        'Country Code'n  $ 2
        State            $ 3
        City             $ 42
        'Postal Code'n   $ 6
        DMA              $ 6
        IP               $ 15
        WIFI             $ 5
        Operator         $ 16
        Carrier          $ 25
        Language         $ 8
        'AppsFlyer ID'n  $ 33
        'Advertising ID'n $ 36
        IDFA             $ 1
        'Android ID'n    $ 16
        'Customer User ID'n   8
        IMEI             $ 1
        IDFV             $ 1
        Platform         $ 7
        'Device Type'n   $ 31
        'OS Version'n      8
        'App Version'n     8
        'SDK Version'n   $ 6
        'App ID'n        $ 14
        'App Name'n      $ 32
        'Bundle ID'n     $ 14
        'Is Retargeting'n $ 5
        'Retargeting Conversion Type'n $ 1
        'Attribution Lookback'n $ 3
        'Reengagement Window'n $ 1
        'Is Primary Attribution'n $ 5
        'User Agent'n    $ 80
        'HTTP Referrer'n $ 995
        'Original URL'n  $ 502
        'Install App Store'n $ 1
        'Match Type'n    $ 14
        'Contributor 1 Match Type'n $ 1
        'Contributor 2 Match Type'n $ 1
        'Contributor 3 Match Type'n $ 1
        'Device Category'n $ 1
        'Google Play Referrer'n $ 1
        'Google Play Click Time'n $ 1
        'Google Play Install Begin Time'n $ 1 ;
    FORMAT
        'Attributed Touch Type'n $CHAR10.
        'Attributed Touch Time'n DATETIME18.
        'Install Time'n  DATETIME18.
        'Event Time'n    DATETIME18.
        'Event Name'n    $CHAR24.
        'Event Value'n   $CHAR61.
        'Event Revenue'n $CHAR1.
        'Event Revenue Currency'n $CHAR3.
        'Event Revenue INR'n $CHAR1.
        'Event Source'n  $CHAR3.
        'Is Receipt Validated'n $CHAR1.
        Partner          $CHAR10.
        'Media Source'n  $CHAR24.
        Channel          $CHAR15.
        Keywords         $CHAR1.
        Campaign         $CHAR200.
        'Campaign ID'n   $CHAR17.
        Adset            $CHAR200.
        'Adset ID'n      $CHAR17.
        Ad               $CHAR200.
        'Ad ID'n         $CHAR17.
        'Ad Type'n       $CHAR17.
        'Site ID'n       $CHAR162.
        'Sub Site ID'n   $CHAR54.
        'Sub Param 1'n   $CHAR16.
        'Sub Param 2'n   $CHAR1.
        'Sub Param 3'n   $CHAR1.
        'Sub Param 4'n   $CHAR1.
        'Sub Param 5'n   $CHAR1.
        'Cost Model'n    $CHAR3.
        'Cost Value'n    BEST4.
        'Cost Currency'n $CHAR3.
        'Contributor 1 Partner'n $CHAR1.
        'Contributor 1 Media Source'n $CHAR1.
        'Contributor 1 Campaign'n $CHAR1.
        'Contributor 1 Touch Type'n $CHAR1.
        'Contributor 1 Touch Time'n $CHAR1.
        'Contributor 2 Partner'n $CHAR1.
        'Contributor 2 Media Source'n $CHAR1.
        'Contributor 2 Campaign'n $CHAR1.
        'Contributor 2 Touch Type'n $CHAR1.
        'Contributor 2 Touch Time'n $CHAR1.
        'Contributor 3 Partner'n $CHAR1.
        'Contributor 3 Media Source'n $CHAR1.
        'Contributor 3 Campaign'n $CHAR1.
        'Contributor 3 Touch Type'n $CHAR1.
        'Contributor 3 Touch Time'n $CHAR1.
        Region           $CHAR2.
        'Country Code'n  $CHAR2.
        State            $CHAR3.
        City             $CHAR42.
        'Postal Code'n   $CHAR6.
        DMA              $CHAR6.
        IP               $CHAR15.
        WIFI             $CHAR5.
        Operator         $CHAR16.
        Carrier          $CHAR25.
        Language         $CHAR8.
        'AppsFlyer ID'n  $CHAR33.
        'Advertising ID'n $CHAR36.
        IDFA             $CHAR1.
        'Android ID'n    $CHAR16.
        'Customer User ID'n BEST10.
        IMEI             $CHAR1.
        IDFV             $CHAR1.
        Platform         $CHAR7.
        'Device Type'n   $CHAR31.
        'OS Version'n    TIME8.
        'App Version'n   MMDDYY10.
        'SDK Version'n   $CHAR6.
        'App ID'n        $CHAR14.
        'App Name'n      $CHAR32.
        'Bundle ID'n     $CHAR14.
        'Is Retargeting'n $CHAR5.
        'Retargeting Conversion Type'n $CHAR1.
        'Attribution Lookback'n $CHAR3.
        'Reengagement Window'n $CHAR1.
        'Is Primary Attribution'n $CHAR5.
        'User Agent'n    $CHAR80.
        'HTTP Referrer'n $CHAR995.
        'Original URL'n  $CHAR502.
        'Install App Store'n $CHAR1.
        'Match Type'n    $CHAR14.
        'Contributor 1 Match Type'n $CHAR1.
        'Contributor 2 Match Type'n $CHAR1.
        'Contributor 3 Match Type'n $CHAR1.
        'Device Category'n $CHAR1.
        'Google Play Referrer'n $CHAR1.
        'Google Play Click Time'n $CHAR1.
        'Google Play Install Begin Time'n $CHAR1. ;
    INFORMAT
        'Attributed Touch Type'n $CHAR10.
        'Attributed Touch Time'n DATETIME18.
        'Install Time'n  DATETIME18.
        'Event Time'n    DATETIME18.
        'Event Name'n    $CHAR24.
        'Event Value'n   $CHAR61.
        'Event Revenue'n $CHAR1.
        'Event Revenue Currency'n $CHAR3.
        'Event Revenue INR'n $CHAR1.
        'Event Source'n  $CHAR3.
        'Is Receipt Validated'n $CHAR1.
        Partner          $CHAR10.
        'Media Source'n  $CHAR24.
        Channel          $CHAR15.
        Keywords         $CHAR1.
        Campaign         $CHAR200.
        'Campaign ID'n   $CHAR17.
        Adset            $CHAR200.
        'Adset ID'n      $CHAR17.
        Ad               $CHAR200.
        'Ad ID'n         $CHAR17.
        'Ad Type'n       $CHAR17.
        'Site ID'n       $CHAR162.
        'Sub Site ID'n   $CHAR54.
        'Sub Param 1'n   $CHAR16.
        'Sub Param 2'n   $CHAR1.
        'Sub Param 3'n   $CHAR1.
        'Sub Param 4'n   $CHAR1.
        'Sub Param 5'n   $CHAR1.
        'Cost Model'n    $CHAR3.
        'Cost Value'n    BEST4.
        'Cost Currency'n $CHAR3.
        'Contributor 1 Partner'n $CHAR1.
        'Contributor 1 Media Source'n $CHAR1.
        'Contributor 1 Campaign'n $CHAR1.
        'Contributor 1 Touch Type'n $CHAR1.
        'Contributor 1 Touch Time'n $CHAR1.
        'Contributor 2 Partner'n $CHAR1.
        'Contributor 2 Media Source'n $CHAR1.
        'Contributor 2 Campaign'n $CHAR1.
        'Contributor 2 Touch Type'n $CHAR1.
        'Contributor 2 Touch Time'n $CHAR1.
        'Contributor 3 Partner'n $CHAR1.
        'Contributor 3 Media Source'n $CHAR1.
        'Contributor 3 Campaign'n $CHAR1.
        'Contributor 3 Touch Type'n $CHAR1.
        'Contributor 3 Touch Time'n $CHAR1.
        Region           $CHAR2.
        'Country Code'n  $CHAR2.
        State            $CHAR3.
        City             $CHAR42.
        'Postal Code'n   $CHAR6.
        DMA              $CHAR6.
        IP               $CHAR15.
        WIFI             $CHAR5.
        Operator         $CHAR16.
        Carrier          $CHAR25.
        Language         $CHAR8.
        'AppsFlyer ID'n  $CHAR33.
        'Advertising ID'n $CHAR36.
        IDFA             $CHAR1.
        'Android ID'n    $CHAR16.
        'Customer User ID'n BEST10.
        IMEI             $CHAR1.
        IDFV             $CHAR1.
        Platform         $CHAR7.
        'Device Type'n   $CHAR31.
        'OS Version'n    TIME11.
        'App Version'n   MMDDYY10.
        'SDK Version'n   $CHAR6.
        'App ID'n        $CHAR14.
        'App Name'n      $CHAR32.
        'Bundle ID'n     $CHAR14.
        'Is Retargeting'n $CHAR5.
        'Retargeting Conversion Type'n $CHAR1.
        'Attribution Lookback'n $CHAR3.
        'Reengagement Window'n $CHAR1.
        'Is Primary Attribution'n $CHAR5.
        'User Agent'n    $CHAR80.
        'HTTP Referrer'n $CHAR995.
        'Original URL'n  $CHAR502.
        'Install App Store'n $CHAR1.
        'Match Type'n    $CHAR14.
        'Contributor 1 Match Type'n $CHAR1.
        'Contributor 2 Match Type'n $CHAR1.
        'Contributor 3 Match Type'n $CHAR1.
        'Device Category'n $CHAR1.
        'Google Play Referrer'n $CHAR1.
        'Google Play Click Time'n $CHAR1.
        'Google Play Install Begin Time'n $CHAR1. ;
    INFILE &Link.
        DLM=','
        MISSOVER
        DSD ;
    INPUT
        'Attributed Touch Type'n : $CHAR10.
        'Attributed Touch Time'n : ?? ANYDTDTM19.
        'Install Time'n  : ?? ANYDTDTM19.
       'Event Time'n    : ?? ANYDTDTM19.
        'Event Name'n    : $CHAR24.
        'Event Value'n   : $CHAR61.
        'Event Revenue'n : $CHAR1.
        'Event Revenue Currency'n : $CHAR3.
        'Event Revenue INR'n : $CHAR1.
        'Event Source'n  : $CHAR3.
        'Is Receipt Validated'n : $CHAR1.
        Partner          : $CHAR10.
        'Media Source'n  : $CHAR24.
        Channel          : $CHAR15.
        Keywords         : $CHAR1.
        Campaign         : $CHAR200.
        'Campaign ID'n   : $CHAR17.
        Adset            : $CHAR200.
        'Adset ID'n      : $CHAR17.
        Ad               : $CHAR200.
        'Ad ID'n         : $CHAR17.
        'Ad Type'n       : $CHAR17.
        'Site ID'n       : $CHAR162.
        'Sub Site ID'n   : $CHAR54.
        'Sub Param 1'n   : $CHAR16.
        'Sub Param 2'n   : $CHAR1.
        'Sub Param 3'n   : $CHAR1.
        'Sub Param 4'n   : $CHAR1.
        'Sub Param 5'n   : $CHAR1.
        'Cost Model'n    : $CHAR3.
        'Cost Value'n    : ?? COMMA4.
        'Cost Currency'n : $CHAR3.
        'Contributor 1 Partner'n : $CHAR1.
        'Contributor 1 Media Source'n : $CHAR1.
        'Contributor 1 Campaign'n : $CHAR1.
        'Contributor 1 Touch Type'n : $CHAR1.
        'Contributor 1 Touch Time'n : $CHAR1.
        'Contributor 2 Partner'n : $CHAR1.
        'Contributor 2 Media Source'n : $CHAR1.
        'Contributor 2 Campaign'n : $CHAR1.
        'Contributor 2 Touch Type'n : $CHAR1.
        'Contributor 2 Touch Time'n : $CHAR1.
        'Contributor 3 Partner'n : $CHAR1.
        'Contributor 3 Media Source'n : $CHAR1.
        'Contributor 3 Campaign'n : $CHAR1.
        'Contributor 3 Touch Type'n : $CHAR1.
        'Contributor 3 Touch Time'n : $CHAR1.
        Region           : $CHAR2.
        'Country Code'n  : $CHAR2.
        State            : $CHAR3.
        City             : $CHAR42.
        'Postal Code'n   : $CHAR6.
        DMA              : $CHAR6.
        IP               : $CHAR15.
        WIFI             : $CHAR5.
        Operator         : $CHAR16.
        Carrier          : $CHAR25.
        Language         : $CHAR8.
        'AppsFlyer ID'n  : $CHAR33.
        'Advertising ID'n : $CHAR36.
        IDFA             : $CHAR1.
        'Android ID'n    : $CHAR16.
        'Customer User ID'n : ?? BEST10.
        IMEI             : $CHAR1.
        IDFV             : $CHAR1.
        Platform         : $CHAR7.
       'Device Type'n   : $CHAR31.
        'OS Version'n    : ?? TIME5.
        'App Version'n   : ?? MMDDYY6.
        'SDK Version'n   : $CHAR6.
        'App ID'n        : $CHAR14.
        'App Name'n      : $CHAR32.
        'Bundle ID'n     : $CHAR14.
        'Is Retargeting'n : $CHAR5.
        'Retargeting Conversion Type'n : $CHAR1.
        'Attribution Lookback'n : $CHAR3.
        'Reengagement Window'n : $CHAR1.
        'Is Primary Attribution'n : $CHAR5.
        'User Agent'n    : $CHAR80.
        'HTTP Referrer'n : $CHAR995.
        'Original URL'n  : $CHAR502.
        'Install App Store'n : $CHAR1.
        'Match Type'n    : $CHAR14.
        'Contributor 1 Match Type'n : $CHAR1.
        'Contributor 2 Match Type'n : $CHAR1.
        'Contributor 3 Match Type'n : $CHAR1.
        'Device Category'n : $CHAR1.
        'Google Play Referrer'n : $CHAR1.
        'Google Play Click Time'n : $CHAR1.
        'Google Play Install Begin Time'n : $CHAR1. ;
RUN;
%mend Append();

%Append(Data=AB ,Link="/sasdata/icfl/lin_data/Ketan/PartnerApp/Partner App Retargeting &yt_date..csv");

data A (drop="Media Source"n rename=("Media Source_1"n="Media Source"n));
set  AB;
"Media Source_1"n=compress("Media Source"n||"_Retargetting");
run;
 

data App.Retargetting_Partner;
set App.Retargetting_Partner A;
run;

data App.Retargetting_Partner ;
set App.Retargetting_Partner ;
Customer_user_id=compress(put('customer user id'n,$10.));
 
event_time=Datepart("Event Time"n);
format Event_time ddmmyy10.;
run;
 
proc freq data=App.Retargetting_Partner;
tables ("Event_Time"n) "Media Source"n ;
run;
 
Proc sort data=App.Retargetting_Partner nodupkey;
by "Customer User ID"n  Event_time;
run;
 
Proc sort data=App.Retargetting_Partner nodupkey;
by "Customer User ID"n ;
run;

data App.Retargetting_Partner;
set App.Retargetting_Partner;
if Compress(Length("Customer_user_id"n))>=10 then output;
run;


	libname App "/sasdata/icfl/lin_data/Ketan/SAS Database";
	libname mis "/sasdata/icfl/lin_data/Shiva/FOS_data/sasdata";

Data Sokrati_Retargetting;
Set App.Sokrati App.Retargetting (keep="Customer User ID"n "Event Time"n "Event_time"n "Media Source"n
Adset AD "Ad ID"n "Advertising ID"n Campaign "Original URL"n "Sub Site ID"n "Site ID"n Partner) ;
Event_time=datepart('Event time'n);
run;

proc sort data=Sokrati_Retargetting nodupkey;
by 'customer user id'n;
run;

Data Sokrati_Retargetting;
set Sokrati_Retargetting;
Customer_user_id=compress(put('customer user id'n,$10.));
if Compress(Length('Customer_user_id'n))>=10 then output;
run; 

data App.Sokrati_Retargetting;
set Sokrati_Retargetting;
run;