      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAMA_CADASTRO_PRODUTOS.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT PRODUTOS ASSIGN TO
               'C:\programas\ARQUIVOS\produtos.txt'
           ORGANIZATION IS INDEXED
           ACCESS IS RANDOM
           RECORD KEY IS COD-PRODUTO
           FILE STATUS IS WS-FS.
       DATA DIVISION.
       FILE SECTION.
       FD PRODUTOS.
       01 REG-PRODUTO.
          03 COD-PRODUTO           PIC 9(03).
          03 NOME-PRODUTO          PIC X(20).
          03 ESTOQUE-PRODUTO       PIC 9(09).
       WORKING-STORAGE SECTION.
       77 WS-FS            PIC 99.
       77 WS-SN            PIC A(9).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "---------- CADASTRO DE PRODUTOS ----------"
            SET WS-FS      TO 0.
            OPEN I-O PRODUTOS
            IF WS-FS EQUAL 35 THEN
                OPEN OUTPUT PRODUTOS
            END-IF
            PERFORM UNTIL WS-SN = 'N' OR WS-SN = 'n'
                IF WS-FS EQUAL ZEROS
                DISPLAY 'INFORME O CODIGO DO PRODUTO:'
                ACCEPT COD-PRODUTO
                DISPLAY 'INFORME O NOME DO PRODUTO'
                ACCEPT NOME-PRODUTO
                DISPLAY 'INFORME A QUANTIDADE EM ESTOQUE DO PRODUTO'
                ACCEPT ESTOQUE-PRODUTO
      ********  COMANDO PARA INSERIR DADOS NO ARQUIVO ******************
                WRITE REG-PRODUTO
      ********* VERIFICANDO SE O REGISTRO FOI REALIZADO ****************
                IF WS-FS NOT EQUAL ZEROS
                    DISPLAY 'ERRO - NÃO FOI POSSIVEL GRAVAR O REGISTRO'
                    DISPLAY 'FILE STATUS: ' WS-FS
                ELSE
                    DISPLAY 'REGISTRO GRAVADO COM SUCESSO!'
                END-IF
             ELSE
                DISPLAY 'ERRO AO CRIAR O ARQUIVO'
                DISPLAY 'FILE STATUS: ' WS-FS
             END-IF
                DISPLAY 'GRAVAR OUTRO REGISTRO? (S/N)'
                ACCEPT WS-SN
            END-PERFORM.
             CLOSE PRODUTOS
            STOP RUN.
       END PROGRAM PROGRAMA_CADASTRO_PRODUTOS.
