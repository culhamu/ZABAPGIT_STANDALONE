*&---------------------------------------------------------------------*
*& Report ZMC_R_003_EDU_V11
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmc_r_003_edu_v11.

TABLES: vbak.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.  " çerçeve oluşturuyoruz

  PARAMETERS: p_matnr TYPE mara-matnr.   "tekli seçim

SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.

  SELECT-OPTIONS s_vbeln FOR vbak-vbeln.   "çoklu seçim

SELECTION-SCREEN END OF BLOCK b2.

SELECTION-SCREEN BEGIN OF BLOCK b3 WITH FRAME TITLE TEXT-003.

  PARAMETERS: c_check AS CHECKBOX DEFAULT 'X'.

SELECTION-SCREEN END OF BLOCK b3.

SELECTION-SCREEN BEGIN OF BLOCK b4 WITH FRAME TITLE TEXT-004.

  PARAMETERS: r_rad1 RADIOBUTTON GROUP 1 DEFAULT 'X',
              r_rad2 RADIOBUTTON GROUP 1.

SELECTION-SCREEN END OF BLOCK b4.

SELECTION-SCREEN BEGIN OF BLOCK b5 WITH FRAME TITLE TEXT-005.

  PARAMETERS: r_rad3 RADIOBUTTON GROUP 2 DEFAULT 'X',
              r_rad4 RADIOBUTTON GROUP 2,
              r_rad5 RADIOBUTTON GROUP 3 DEFAULT 'X',
              r_rad6 RADIOBUTTON GROUP 3.

SELECTION-SCREEN END OF BLOCK b5.
