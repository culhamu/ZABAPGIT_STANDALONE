*&---------------------------------------------------------------------*
*& Report ZMC_R_004_EDU_V11
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmc_r_004_edu_v11.

DATA: gv_matnr TYPE mara-matnr VALUE '000000000000000108'.
DATA: gv_maktx TYPE makt-maktx.



CALL FUNCTION 'ZABAP_FM_001_EDU_V11_MC'
  EXPORTING
    iv_matnr = gv_matnr
  IMPORTING
    ev_maktx = gv_maktx.

IF gv_maktx IS NOT INITIAL. "is not initial bu değer boş değilse demek
  WRITE:/ 'sonuç:' , gv_maktx.

ENDIF.
