FUNCTION zabap_fm_001_edu_v11_mc.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_MATNR) TYPE  MATNR OPTIONAL
*"     VALUE(IV_SAYI1) TYPE  INT4 OPTIONAL
*"     VALUE(IV_SAYI2) TYPE  INT4 OPTIONAL
*"  EXPORTING
*"     VALUE(EV_MAKTX) TYPE  MAKTX
*"     VALUE(EV_SONUC) TYPE  INT4
*"  TABLES
*"      IT_MARA STRUCTURE  ZMC_S_MARA_V11 OPTIONAL
*"----------------------------------------------------------------------

  SELECT SINGLE maktx
    FROM makt
    INTO @ev_maktx
    WHERE matnr EQ @iv_matnr.

  SELECT ersda           ,
         created_at_time ,
         ernam           ,
         laeda           ,
         aenam           ,
         vpsta           ,
         pstat           ,
         lvorm           ,
         mtart           ,
         mbrsh           ,
         matkl
  FROM mara
    INTO TABLE @it_mara.

ENDFUNCTION.
