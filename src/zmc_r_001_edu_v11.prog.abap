*&---------------------------------------------------------------------*
*& Report ZMC_R_001_EDU_V11
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmc_r_001_edu_v11.
DATA: gv_data1 TYPE p DECIMALS 2 VALUE '123.35'.   "decimal tanımlamalar"
DATA: gv_data2 TYPE p DECIMALS 3.

DATA: gv_data3 TYPE n,
      gv_data4 TYPE char100.    "numeric tek bir değer tutuyor integer daha fazla değer tutuyor"


DATA: gv_data5 TYPE string.

DATA: gv_data6 TYPE int4 VALUE 800.
DATA: gv_data7 TYPE int4 VALUE 10.

gv_data2 = '21.123'.
gv_data3 = 5.
gv_data4 = 'ABAP IS THE BEST'.
gv_data5 = 'HELLO WORLD'.

WRITE: / gv_data1.
WRITE: / gv_data2.
WRITE: / gv_data3.
WRITE: / gv_data4.
WRITE: / gv_data5.

DATA(gv_data9) = 21.

DATA(gv_toplama) = gv_data6 + gv_data7.
DATA(gv_cikarma) = gv_data6 - gv_data7.
DATA(gv_bolme) = gv_data6 / gv_data7.
DATA(gv_carpma) = gv_data6 * gv_data7.

WRITE: / 'Toplama islemi sonucu :', gv_toplama.
WRITE: / 'Cikarmaa islemi sonucu :', gv_cikarma.
WRITE: / 'Bolme islemi sonucu :', gv_bolme.
WRITE: / 'Carpmama islemi sonucu :',gv_carpma.
WRITE: / gv_data9.




****************** IF ENDIF *******************

IF gv_data6 IS NOT INITIAL.
  DATA(gv_mix_calc) = ( 500 + 200 ) * 3.
  WRITE:/ gv_mix_calc.
ENDIF.

IF gv_data6 EQ 800.
  WRITE:/ 'Sayi 800 e eşittir'.
ENDIF.

IF gv_data6 NE 600.
  WRITE:/ 'Sayi 600 e eşit değildir'.
ENDIF.

IF gv_data6 > 600.
  WRITE:/ 'Sayi 600 den büyüktür'.
ENDIF.

IF gv_data6 < 900.
  WRITE:/ 'Sayi 900 den küçüktür'.
ENDIF.

IF gv_data6 < 700.
  WRITE:/ 'Sayi 900 den küçüktür'.
ELSEIF gv_data6 NE gv_data7.
  WRITE:/ 'Sayilar birbirine eşit değildir'.
ENDIF.


************CASE ENCASE*************************



CASE gv_data6.
  WHEN 600.
    WRITE:/ ' Sayı 600 e eşittir.'.
  WHEN '700'.
    WRITE:/ ' Sayı 700 e eşittir.'.
  WHEN '900'.
    WRITE:/ ' Sayı 900 e eşittir.'.
  WHEN OTHERS.
    WRITE:/ ' Sayı farklı bir sayıya eşittir.'.
ENDCASE.



****************DO ENDDO***************

DATA(gv_tabix) = sy-tabix.  "new syntax ile tanımlama işlemei(inline syntax)"
DATA gv_tabix2 TYPE int4.

DO 100 TIMES.
*  gv_tabix += 1.                       "new syntax ile toplama"
*  gv_tabix = 1 + gv_tabix.             "eski syntax ile toplama"
  gv_tabix2 = 1 + gv_tabix2.
  IF gv_tabix2 EQ 55.
    WRITE:/ ' 55 Değeri bulundu.'.
    EXIT.
  ENDIF.
ENDDO.

*SELECT matnr FROM mara
*INTO TABLE @DATA(lt_mara).
*
*LOOP AT lt_mara ASSIGNING FIELD-SYMBOL (<lfs_mara>).
*ENDLOOP.



********MOD******************


DATA(gv_sayi) = 15.
IF gv_sayi MOD 2 = 0.
  WRITE:/ 'Çift Sayıdır.'.
ELSE.
  WRITE:/ 'Tek sayıdır.'.
ENDIF.


**********SİSTEM PARAMETRELERİ************


DATA(gv_system1) = sy-datum.
DATA(gv_system2) = sy-uzeit.
DATA(gv_system3) = sy-uname.
DATA(gv_system4) = sy-title.
DATA(gv_system5) = sy-tabix.
DATA(gv_system6) = sy-subrc.
DATA(gv_system7) = sy-cprog.
DATA(gv_system8) = sy-tcode.
DATA(gv_system9) = sy-ucomm.


WRITE:/ gv_system1.
WRITE:/ gv_system2.
WRITE:/ gv_system3.
WRITE:/ gv_system4.
WRITE:/ gv_system5.
WRITE:/ gv_system6.
WRITE:/ gv_system7.
WRITE:/ gv_system8.
WRITE:/ gv_system9.


*SELECT matnr FROM mara
*INTO TABLE @DATA(lt_mara).
*
*READ TABLE lt_mara ASSIGNING FIELD-SYMBOL (<Ifs_mara>) index 3362.
*IF sy-subrc EQ 0.
*ENDIF.




**************CONCANCATE **************

DATA gv_tanim TYPE char100.
DATA(gv_formated_date) = sy-uzeit(2) && '/' && sy-uzeit+2(2) && '/' && sy-uzeit+4(2).

CONCATENATE 'Kullanıcı Adı' sy-uname ',' 'Sistem T-Code:'sy-tcode INTO gv_tanım SEPARATED BY space.
WRITE:/ gv_tanim.


DATA(gv_tanim_new) = | { ' Bugünün saati' } { gv_formated_date } |.
WRITE:/ gv_tanim_new.
 



***********STRC/INTERNAL TABLE/RANGE*********
DATA: gt_mara TYPE TABLE OF mara.    "internal table   (birden fazla satır ve kolon içerir.)
DATA: gc_mara TYPE mara.             "strc             (birden fazla satır ve tek bir kolon içeriri.)
DATA: gv_matnr TYPE mara-matnr.      "local variable   (tek bir satır ve tek bir sütun içerir.)

DATA: gr_matnr TYPE mara-matnr.      "Range ( Birden fazla içine değer alabilir.)
