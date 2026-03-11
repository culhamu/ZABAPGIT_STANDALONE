*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZMC_T_STD_V11...................................*
DATA:  BEGIN OF STATUS_ZMC_T_STD_V11                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZMC_T_STD_V11                 .
CONTROLS: TCTRL_ZMC_T_STD_V11
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZMC_T_STD_V11                 .
TABLES: ZMC_T_STD_V11                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
