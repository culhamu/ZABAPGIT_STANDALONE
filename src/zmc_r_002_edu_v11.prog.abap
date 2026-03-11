*&---------------------------------------------------------------------*
*& Report ZMC_R_002_EDU_V11
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmc_r_002_edu_v11.

DATA: lt_vbap_old TYPE TABLE OF vbap.

SELECT * FROM vbap
INTO TABLE @DATA(lt_vbap_new).

SELECT * FROM vbap
INTO TABLE @lt_vbap_old.

SELECT  matnr,
        matwa,
        pmatn,
        charg,
        matkl,
        arktx,
        pstyv,
        posar,
        process_code
  FROM vbap
  INTO TABLE @DATA(lt_vbap).




***********insert***********************

DATA: ls_student TYPE zmc_t_std_v11.

SELECT MAX( student_number )
  FROM zmc_t_std_v11
  INTO @DATA(lv_max_number).

ls_student-student_number  = lv_max_number + 1.
CONDENSE ls_student-student_number. "condense başındaki boşluğu alacaktır
ls_student-student_name    = 'Ahmet'.
ls_student-student_surname = 'Bulutluöz'.
ls_student-university      = 'ITU'.

INSERT zmc_t_std_v11 FROM ls_student.

IF sy-subrc EQ 0 .
  COMMIT WORK. "tercih edilen yazım şekli bu if bloğunun çalıştığını gösterir.
  WRITE:/ 'Tabloya kayıt yapıldı'.
ELSE.
  ROLLBACK WORK.
  WRITE:/ 'Tabloya kayıt atılmadı. lütfen kayıt ekleyiniz'.

ENDIF.

**********update******************


UPDATE zmc_t_std_v11 SET student_name = 'Mahmut'
                     WHERE student_number = '2'.

IF sy-subrc EQ 0.
  COMMIT WORK.
  WRITE:/ 'Tablo update edildi'.
ELSE.
  ROLLBACK WORK.
  WRITE:/ 'Update işlemi başarısız.'.

ENDIF.




*******************delete ********************

DELETE FROM zmc_t_std_v11 WHERE student_number = '2'.

IF sy-subrc EQ 0.
  COMMIT WORK.
  WRITE:/ 'Tablodan veri silindi'.
ELSE.
  ROLLBACK WORK.
  WRITE:/ 'delete işlemi başarısız.'.

ENDIF.



******************modify*************************


ls_student = VALUE #( student_number  = '3'
                       student_name    = 'Bertuğ'
                       student_surname = 'Bayel'
                       university      = 'Cambridge'

                       ).

MODIFY  zmc_t_std_v11 FROM ls_student.
IF sy-subrc EQ 0.
  COMMIT WORK.
  WRITE:/ 'Tablodan modify edildi'.
ELSE.
  ROLLBACK WORK.
  WRITE:/ 'modify işlemi başarısız.'.

ENDIF.

BREAK-POINT.
