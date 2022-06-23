Libname cc "/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/FCC coupon/";

%Macro Samref (Data=,File=);
Proc import datafile=&File.
Out=&Data.
DBMS = CSV
Replace;
Guessingrows=Max;
Run;
%Mend;

%Samref(Data=cc.couponcode_dof_oct,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/dof_onboarded_through_coupon.csv");

/* %Samref(Data=cc.telegram_dof_300cb      ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/telegram_dof_300cb_DOF_DHANI300_163.csv"); */
/* %Samref(Data=cc.telegram_dof_200cb      ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/telegram_dof_200cb_DOF_DHANI200_164.csv"); */
/* %Samref(Data=cc.phonepe_400cb      ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/phonepe_unique_codes_400_cb_DOF__108.csv"); */
/* %Samref(Data=cc.phonepe_ppe400_400cb      ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/phonepe_ppe400_dofbanner_400cb_DOF_PPE400_167.csv"); */
/* %Samref(Data=cc.phonepe_pp500_500cb      ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/phonepe_pp500_dofcoupon_500cb_DOF_PP500_218.csv"); */
/* %Samref(Data=cc.phonepe_pp400_400cb      ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/phonepe_pp400_dof_400cb_DOF_PP400_146.csv"); */
/* %Samref(Data=cc.paisawapas_pw200_DOF      ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/paisawapas_-_pw200_DOF_PW200_111.csv"); */
/* %Samref(Data=cc.paisawapas_pw400_DOF      ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/paisawapas_dof_new400_DOF_NEW400_207.csv"); */
/* %Samref(Data=cc.onecode200      ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/onecode200_dof_DOF_ONECODE200_53.csv"); */
/* %Samref(Data=cc.marcedo_dof_400cb      ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/marcedo_dof_400cb_DOF_DOF400_166.csv"); */
/* %Samref(Data=cc.marcedo_dof_200cb      ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/marcedo_dof_200cb_DOF_DOF200_165.csv"); */
/* %Samref(Data=cc.magicpin_mp200      ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/magicpin_unique_codes_DOF__107.csv"); */
/* %Samref(Data=cc.influencer_dof_400cb      ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/influencer_dof_400cb_DOF_GET400_154.csv"); */
/* %Samref(Data=cc.influencer_dof_400cb_DOF      ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/influencer_dof_400cb_DOF_DHANI400_155.csv"); */
/* %Samref(Data=cc.influencer_dof_400cb_CJ400      ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/influencer_dof_400cb_DOF_CJ400_156.csv"); */
/* %Samref(Data=cc.influencer_dof_400cb_CASH400      ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/influencer_dof_400cb_DOF_CASH400_157.csv"); */
/* %Samref(Data=cc.gpay_dof_400_cb      ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/gpay_dof_unique_codes_400_cb_DOF__114.csv"); */
/* %Samref(Data=cc.freecharge_fc400_400cb      ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/freecharge_fc400_dof_400cb_DOF_FC400_145.csv"); */
/* %Samref(Data=cc.freecharge_fc200_DOF      ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/freecharge_-_fc200_DOF_FC200_106.csv"); */
/* %Samref(Data=cc.facebook_dof_300cb      ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/facebook_dof_300cb_DOF_FB300_160.csv"); */
/* %Samref(Data=cc.dhani_dof_500cb      ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/dhani_dof_500cb_DOF_DHANI500_212.csv"); */
/* %Samref(Data=cc.cpvk_DOF      ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/cpvk_DOF_CPVK_64.csv"); */
/* %Samref(Data=cc.cpjej_DOF     ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/cpjej_DOF_CPJEJ_58.csv"); */
/* %Samref(Data=cc.cpbs_DOF     ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/cpbs_DOF_CPBS_55.csv"); */
/* %Samref(Data=cc.cpmg_DOF      ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/cpmg_DOF_CPMG_93.csv"); */
/* %Samref(Data=cc.cpdti_DOF     ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/cpdti_DOF_CPDTI_57.csv"); */
/* %Samref(Data=cc.cj_DOF_500cb    ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/cj_dof_500cb_DOF_CJ500_225.csv"); */
/* %Samref(Data=cc.cj_DOF_400cb     ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/cj_dof_400cb_DOF_FREE400_211.csv"); */
/* %Samref(Data=cc.cashkaro_dof_200      ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/cashkaro_dof_200_DOF_CC200_50.csv"); */
/* %Samref(Data=cc.cashkaro_ck400_dof     ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/cashkaro_ck400_dof_400cb_DOF_CK400_144.csv"); */
/* %Samref(Data=cc.aldify_dof_200cb      ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/aldify_dof_200cb_DOF_OAH200_142.csv"); */
/* %Samref(Data=cc.affiliates_dof_200cb      ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/affiliates_dof_200cb_DOF_GET200_159.csv"); */
/* %Samref(Data=cc.omg3_dof_400cb_fd400      ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/omg3_dof_400cb_DOF_FD400_210.csv"); */
/* %Samref(Data=cc.omg3_dof_400cb_cb400      ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/omg2_dof_400cb_DOF_CB400_209.csv"); */
/* %Samref(Data=cc.omg1_dof_400cb     ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/omg1_dof_400cb_DOF_BT400_208.csv"); */
/* %Samref(Data=cc.mdsmedia_dof    ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/mdsmedia_dof_mds200_DOF_MDS200_206.csv"); */
/* %Samref(Data=cc.admitad_dof   ,File="/sasdata/icfl/lin_data/Ravi/Riddhi/coupon/DOF coupon/admitad_dof_400cb_DOF_CREDIT400_228.csv"); */
/*  */
/*  */
/*  */
/*  */
/* data cc.couponcode_dof_oct; */
/* set  */
/* cc.admitad_dof */
/* cc.cashkaro_ck400_dof */
/* cc.cj_DOF_500cb */
/* cc.cj_DOF_400cb */
/* cc.cpjej_DOF */
/* cc.dhani_dof_500cb */
/* cc.mdsmedia_dof */
/* cc.omg1_dof_400cb */
/* cc.influencer_dof_400cb_CASH400 */
/* cc.influencer_dof_400cb_CJ400 */
/* cc.influencer_dof_400cb_DOF  */
/* cc.marcedo_dof_200cb */
/* cc.telegram_dof_300cb       */
/* cc.phonepe_400cb       */
/* cc.phonepe_ppe400_400cb       */
/* cc.phonepe_pp400_400cb */
/* cc.phonepe_pp500_500cb       */
/* cc.paisawapas_pw200_DOF */
/* cc.paisawapas_pw400_DOF       */
/* cc.onecode200       */
/* cc.marcedo_dof_400cb       */
/* cc.magicpin_mp200       */
/* cc.influencer_dof_400cb       */
/* cc.gpay_dof_400_cb       */
/* cc.freecharge_fc400_400cb       */
/* cc.freecharge_fc200_DOF      */
/* cc.facebook_dof_300cb      */
/* cc.cpvk_DOF      */
/* cc.cppc_DOF       */
/* cc.cpmg_DOF */
/* cc.cpjej_DOF       */
/* cc.cpdti_DOF */
/* cc.cpbs_DOF      */
/* cc.cashkaro_dof_200  */
/* cc.aldify_dof_200cb */
/* cc.affiliates_dof_200cb */
/* ; */
/* run; */

proc sort data=cc.couponcode_dof_oct nodupkey;
by mobile_number;
run;

Data cc.COUPONCODE_dof_oct(keep=mobile_number coupon_desc voucher_redeemed_at1);
Set  CC.couponcode_dof_oct;
voucher_applied_at1 = datepart(voucher_applied_at);
voucher_redeemed_at1 = datepart(input(voucher_redeemed_at,anydtdtm.));
Format voucher_applied_at1 voucher_redeemed_at1 Date9.;
run; 

data cc.COUPONCODE_dof_final;
set cc.COUPONCODE_dof_final cc.COUPONCODE_dof_oct;
run;

proc sort data=cc.couponcode_dof_final nodupkey;
by mobile_number;
run;