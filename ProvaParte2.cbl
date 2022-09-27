      ******************************************************************
      * Author: MARCELLO LIMA BENTO
      * Date: 27/11/2021
      * Purpose: PROVA
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ProvaParte2.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT PROVA ASSIGN TO
               'C:\TEMP\ARQUIVOS\PROVA.txt'
           ORGANIZATION IS INDEXED
           ACCESS IS DYNAMIC
           RECORD KEY IS NOME-ALUNO
           FILE STATUS IS WS-FS.
       DATA DIVISION.
       FILE SECTION.
       FD PROVA.
       01 REG-ALUNO.
           03 NOME-ALUNO PIC X(50).
           03 IDADE-ALUNO PIC X(03).
           03 SOMA-VALORES PIC 9(09).
           03 VETOR1 PIC S99 OCCURS 10 TIMES.
           03 VETOR2 PIC 99 OCCURS 10 TIMES.
       WORKING-STORAGE SECTION.
       77 WS-FS PIC 99.
       77 WS-COUNT PIC 99.

       01 WS-ALUNO.
           03 WS-NOME PIC X(50).
           03 WS-IDADE PIC X(03).
           03 WS-TOTAL PIC 9(09).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "Digite seu nome:"
            ACCEPT NOME-ALUNO.
            DISPLAY "Digite sua idade:"
            ACCEPT IDADE-ALUNO
            COMPUTE WS-COUNT = 1

            PERFORM UNTIL WS-COUNT EQUAL 11
            DISPLAY "Digite o " WS-COUNT " numero:"
            ACCEPT VETOR1(WS-COUNT)
            IF VETOR1(WS-COUNT) LESS 0
                MOVE 1 TO VETOR2(WS-COUNT)
                ELSE
                    COMPUTE VETOR2(WS-COUNT) = VETOR1(WS-COUNT)
            END-IF
            ADD VETOR2(WS-COUNT) TO WS-TOTAL
            ADD 1 TO WS-COUNT
            END-PERFORM
            COMPUTE WS-COUNT EQUAL 1
            DISPLAY "NOME: ", NOME-ALUNO, " IDADE: ", IDADE-ALUNO
            DISPLAY " VETOR 1: "
            PERFORM UNTIL WS-COUNT EQUAL 11
            DISPLAY VETOR1(WS-COUNT) " " WITH NO ADVANCING
            ADD 1 TO WS-COUNT
            END-PERFORM
            DISPLAY " "
            DISPLAY "VETOR 2:"
            COMPUTE WS-COUNT EQUAL 1
            PERFORM UNTIL WS-COUNT EQUAL 11
            DISPLAY VETOR2(WS-COUNT) " " WITH NO ADVANCING
            ADD 1 TO WS-COUNT
            END-PERFORM
            DISPLAY " "
            DISPLAY "TOTAL: ", WS-TOTAL
            MOVE WS-TOTAL TO SOMA-VALORES

            SET WS-FS TO 0.

            OPEN I-O PROVA
            IF WS-FS EQUAL 35 THEN
                OPEN OUTPUT PROVA
            END-IF
            WRITE REG-ALUNO

            IF WS-FS NOT EQUAL ZEROS
                    DISPLAY "ERRO AO REGISTRAR!"
                    DISPLAY "FILE STATUS: " WS-FS
             ELSE
                    DISPLAY "REGISTRO GRAVADO COM SUCESSO!"
            END-IF
            CLOSE PROVA.

            OPEN I-O PROVA.
            READ PROVA RECORD INTO WS-ALUNO
               KEY IS NOME-ALUNO
                   INVALID KEY
                       DISPLAY "CHAVE INVALIDA"
                   NOT INVALID KEY
                   DISPLAY "NOME: " WS-NOME
                   DISPLAY "IDADE: " WS-IDADE
                   DISPLAY "TOTAL: " WS-TOTAL
            CLOSE PROVA.
            STOP RUN.
       END PROGRAM ProvaParte2.
