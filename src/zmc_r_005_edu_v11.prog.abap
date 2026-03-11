*&---------------------------------------------------------------------*
*& Report ZMC_R_005_EDU_V11
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmc_r_005_edu_v11 MESSAGE-ID zmc_v11_abap.

START-OF-SELECTION.

*  MESSAGE 'This is append message'  TYPE 'A'.
*  MESSAGE 'This is exit message'    TYPE 'X'.
*  MESSAGE 'This is Warning message' TYPE 'W'.
*  MESSAGE 'This is info message'    TYPE 'I'.
*  MESSAGE 'This is success message' TYPE 'S'.
*  MESSAGE 'This is error message'   TYPE 'E'.

*  MESSAGE 'BU BIR UYARI MESAJIDIR' TYPE 'I' DISPLAY LIKE 'S'

*  MESSAGE TEXT-001 TYPE 'I'.

*  MESSAGE i001(zmc_v11_abap).
*  MESSAGE i004.
*
*  data(lv_datum) = sy-datum.
*  data(lv_uzeit) = sy-uzeit.
*
*  data(lv_tanim) = |{ 'Bugünün Tarihi:' } { lv_datum } { 'saat:' } { lv_uzeit }|.
*
*  message i002 WITH lv_datum.
*  message i003 WITH lv_uzeit.
*  message lv_tanim type 'I'.

  DATA lt_attribute TYPE TABLE OF casdayattr.

  CALL FUNCTION 'DAY_ATTRIBUTES_GET'
    EXPORTING
      date_from                  = sy-datum
      date_to                    = sy-datum
      language                   = sy-langu
    TABLES
      day_attributes             = lt_attribute
    EXCEPTIONS
      factory_calendar_not_found = 1
      holiday_calendar_not_found = 2
      date_has_invalid_format    = 3
      date_inconsistency         = 4
      OTHERS                     = 5.
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.

  LOOP AT lt_attribute ASSIGNING FIELD-SYMBOL(<lfs_attribute>).
    DATA(lv_gun) = <lfs_attribute>-weekday_L.

  ENDLOOP.

  MESSAGE i004 WITH lv_gun.
  .
