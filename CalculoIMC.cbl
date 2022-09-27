      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. IMC-CALC.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
           SPECIAL-NAMES.
               DECIMAL-POINT IS COMMA.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 IMC.
           05 PESO PIC 9(06)V99.
           05 ALTURA PIC 9(06)V99.
           05 TOTAL PIC 9(06)V99.
           05 MASCARA PIC ZZ.ZZ9,99.



       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "Digite o seu peso (em kg): "
            ACCEPT PESO.
            DISPLAY "Digite a sua Altura (em metro): "
            ACCEPT ALTURA.

            MULTIPLY ALTURA BY ALTURA.
            DIVIDE ALTURA INTO PESO GIVING TOTAL.

            MOVE TOTAL TO MASCARA.
            DISPLAY PESO.
            DISPLAY ALTURA.
            DISPLAY MASCARA.

            IF TOTAL < 18,5
                DISPLAY "Desnutrido"
            END-IF
            IF TOTAL >= 18,8 AND TOTAL <= 24,9
                DISPLAY "Adequado"
            END-IF
            IF TOTAL >= 25 AND TOTAL <= 29,9
                DISPLAY "Pré-Obeso"
            END-IF
            IF TOTAL >= 30 AND TOTAL <= 34,9
                DISPLAY "Obesidade grau 1"
            END-IF
            IF TOTAL > 35
                DISPLAY "Obesidade grau 2"
            END-IF
            STOP RUN.
       END PROGRAM IMC-CALC.
