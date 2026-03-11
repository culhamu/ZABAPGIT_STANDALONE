class ZCL_001_EDU_V11_MC definition
  public
  final
  create public .

public section.

  methods TOPLAMA
    importing
      value(IV_SAYI1) type INT4 optional
      value(IV_SAYI2) type INT4 optional
    exporting
      !EV_SONUC type INT4 .
protected section.
private section.
ENDCLASS.



CLASS ZCL_001_EDU_V11_MC IMPLEMENTATION.


  method TOPLAMA.
    ev_sonuc = iv_sayi1 + iv_sayi2.
  endmethod.
ENDCLASS.
