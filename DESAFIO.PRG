******************************************************************************
*                                                                            *
*                   R O G E R I O     D I A S     L O P E Z                  *
*                   E L A I N E   D A   S I L V A  M O U R A                 *
*                                                                            *
******************************************************************************

clea
@5,5 say "A TECLA NUM LOCK DEVE ESTAR DESATIVADA ! ! ! ! ! ! ! ! ! ! ! ! ! ! !"
WAIT""
SET WRAP ON
SET MESS TO 24 CENTER
DO WHILE .T.
   EXIBIR_TEL()
   EXIBIR_DES()
   LIMPAR_TEL("TUDO")
   EXIBIR_TIT("MENU")
   VMENU_PRIN = MENU_PRIN()
   IF VMENU_PRIN = "EXIBIR CLASSIFICA��O"
      EXIBIR_CLA()
   ELSEIF VMENU_PRIN = "FASE DE CLASSIFICA��O"
      JOGAR_CLAS()
   ELSEIF VMENU_PRIN = "ATIVAR MENU EQUIPE"
      VMENU_EQUI = MENU_EQUI()
      IF VMENU_EQUI = "FASE DE DESEMPATE"
         JOGAR_DESE()
      ELSEIF VMENU_EQUI = "FASE FINAL"
         JOGAR_FINA()
      ELSEIF VMENU_EQUI = "ENCERRA"
         EXIT
      ENDIF
   ENDIF
ENDDO
SET COLOR TO
CLEA
CLOSE ALL
QUIT

******************************************************************************
* EXIBIR A TELA DE FUNDO
******************************************************************************
FUNC EXIBIR_TEL()
SETCOLOR("B/B")
CLEA
SET DATE BRIT
SETCOLOR("G+/")
@0,0 SAY "� Col�gio Fern�o Dias Pais � Feira de Ci�ncias � "+DTOC(DATE())+" �"
SETCOLOR("B/,,W")
@1,1,23,78 BOX "���������"
RETURN""

****************************************************************************
* EXIBIR DESENHO COM V�RIAS CORES
****************************************************************************
FUNC EXIBIR_DES()
SETCOLOR("B/N")
@5,5,21,78 BOX "���������"
SETCOLOR("W+/N")
@4,3 CLEA TO 20,76
@4,3 TO 20,76 DOUB
SETCOLOR("W+/B")
@24,31 SAY "Pressione <ENTER>"
VCONT_COR = 0
DO WHILE 13 # INKEY()
   VCONT_COR = VCONT_COR + 1
   IF VCONT_COR = 10
      VCONT_COR = 1
   ENDIF
   DO CASE
   CASE VCONT_COR = 1
      SETCOLOR("W/N")
   CASE VCONT_COR = 2
      SETCOLOR("G+/N")
   CASE VCONT_COR = 2
      SETCOLOR("R/N")
   CASE VCONT_COR = 3
      SETCOLOR("BG+/N")
   CASE VCONT_COR = 4
      SETCOLOR("RG/N")
   CASE VCONT_COR = 5
      SETCOLOR("W+/N")
   CASE VCONT_COR = 6
      SETCOLOR("G/N")
   CASE VCONT_COR = 7
      SETCOLOR("R+/N")
   CASE VCONT_COR = 8
      SETCOLOR("BG/N")
   CASE VCONT_COR = 9
      SETCOLOR("RG+/N")
   ENDCASE
   @6,5  SAY "     ���������    ��������   �������  ��������  ��������  ��  ��������"
   @7,5  SAY "    ��       ��  ��        ��        ��    ��  ��        ��  ��    ��"
   @8,5  SAY "   ��       ��  �����      �����    ��������  �����     ��  ��    ��"
   @9,5  SAY "  ��       ��  ��              ��  ��    ��  ��        ��  ��    ��"
   @10,5 SAY " ��       ��  ��              ��  ��    ��  ��        ��  ��    ��"
   @11,5 SAY "����������   ��������  �������   ��    ��  ��        ��  ��������"
   @12,5 SAY ""
   @13,5 SAY "       ����  ������   ��������   ��    ��  ��������   ��������   ��"
   @14,5 SAY "      ��  ����  ��   ��         ���   ��     ��      ��    ��   ��"
   @15,5 SAY "     ��   ��   ��   �����      �� �  ��     ��      ��������   ��"
   @16,5 SAY "    ��   ��   ��   ��         �� �  ��     ��      ��    ��   ��"
   @17,5 SAY "   ��   ��   ��   ��         ��  � ��     ��      ��    ��   ��"
   @18,5 SAY "  ��   ��   ��   ��������   ��   ���     ��      ��    ��   ��������"
ENDDO
RETURN""

******************************************************************************
* LIMPAR A TELA COM TAMANHO DEFINIDO
* ENTRADA: "TUDO" OU "PARTE"
******************************************************************************
FUNC LIMPAR_TEL(P1)
IF P1 = "TUDO"
   SETCOLOR("B/")
   @1,1,23,78 BOX "���������"
ELSEIF P1 = "PARTE"
   SETCOLOR("B/")
   @7,1,23,78 BOX "���������"
ENDIF
SETCOLOR("W+/B")
@24,0 CLEA TO 24,79
RETURN""

******************************************************************************
* EXIBIR O TITULO ESPECIFICADO
* ENTRADA: "MENU", "FASE DE CLASIFICA��O", "FASE DE DESEMPATE", "FASE FINAL"
******************************************************************************
FUNC EXIBIR_TIT(P1)
SETCOLOR("B/N")
@3,5,5,78 BOX "���������"
SETCOLOR("W+/B")
@2,3 CLEA TO 4,76
@2,3 TO 4,76 DOUB
SETCOLOR("R+*/B")
IF P1 = "MENU"
   @3,26 SAY "???                      ???"
   SETCOLOR("W+/B")
   @3,33 SAY "DESAFIO MENTAL"
ELSEIF P1 = "FASE DE CLASSIFICA��O"
   @3,15 SAY "???                                            ???"
   SETCOLOR("W+/B")
   @3,21 SAY "DESAFIO MENTAL - "
   SETCOLOR("W+*/B")
   @3,COL() SAY "FASE DE CLASSIFICA��O"
ELSEIF P1 = "FASE DE DESEMPATE"
   @3,17 SAY "???                                        ???"
   SETCOLOR("W+/B")
   @3,23 SAY "DESAFIO MENTAL - "
   SETCOLOR("W+*/B")
   @3,COL() SAY "FASE DE DESEMPATE"
ELSEIF P1 = "FASE FINAL"
   @3,20 SAY "???                                 ???"
   SETCOLOR("W+/B")
   @3,26 SAY "DESAFIO MENTAL - "
   SETCOLOR("W+*/B")
   @3,COL() SAY "FASE FINAL"
ENDIF
RETURN""

******************************************************************************
* MENU PRINCIPAL
* SA�DA: "FASE DE CLASSIFICA��O", "EXIBIR CLASSIFICA��O",
*        "ATIVAR MENU EQUIPE"
******************************************************************************
FUNC MENU_PRIN()
SETCOLOR("B/N")
@8,5,11,78 BOX "���������"
SETCOLOR("W+/B,N/BG")
@7,3 CLEA TO 10,76
@7,3 TO 10,76 DOUB
@8,38 SAY "MENU"
@9,5 PROM "  DESAFIO MENTAL - FASE DE CLASSIFICA��O  " MESS "Pressione <ENTER> para incluir nome do participante"
@9,COL() PROM "  CLASSIFICA��O  " MESS "Pressione <ENTER> para exibir a classifica��o"
@9,COL() PROM "  EQUIPE  " MESS "Pressione <ENTER> para abrir o menu equipe"
VOPCA_MENU = 0
VRESPOSTA = " "
MENU TO VOPCA_MENU
IF VOPCA_MENU = 1
   VRESPOSTA = "FASE DE CLASSIFICA��O"
ELSEIF VOPCA_MENU = 2
   VRESPOSTA = "EXIBIR CLASSIFICA��O"
ELSEIF VOPCA_MENU = 3
   VRESPOSTA = "ATIVAR MENU EQUIPE"
ENDIF
RETURN VRESPOSTA

******************************************************************************
* MENU DA EQUIPE
* SA�DA: "FASE DE DESEMPATE", "FASE FINAL", "ENCERRA"
******************************************************************************
FUNC MENU_EQUI()
SETCOLOR("B/N")
@8,5,17,78 BOX "���������"
SETCOLOR("W+/R")
@7,3 CLEA TO 16,76
@7,3 TO 16,76 DOUB
@24,0 CLEA TO 24,79
SETCOLOR("W+*/R")
@8,34 SAY "MENU EQUIPE"
VSENHA = SPACE(7)
SETCURSOR(0)
SETCOLOR("W+/R,N/N")
@9,5 SAY "Digite a senha da equipe:" GET VSENHA PICT "@!"
READ
IF VSENHA # "QAZWSX "
   SETCOLOR("W+/R")
   @9,39 SAY "SENHA N�O ACEITA !..."
   TONE(900,10)
   TONE(1,70)
   RETURN""
ENDIF
TONE(900,5)
SETCOLOR("W+/R,N/BG")
@9,5 CLEA TO 15,75
@9,21 PROM "  DESAFIO MENTAL - FASE DE DESEMPATE  " MESS " Pressione <ENTER> para ativar a fase de desempate "
@11,24 PROM "  DESAFIO MENTAL - FASE FINAL  " MESS " Pressione <ENTER> para ativar a fase final "
@13,28 PROM "  RETORNA PARA O MENU  " MESS " Pressione <ENTER> para retornar ao menu "
@15,29 PROM "  ENCERRA O PROGRAMA  " MESS " Pressione <ENTER> para encerrar o programa "
VOPCA_MENU = 0
VRESPOSTA = " "
MENU TO VOPCA_MENU
IF VOPCA_MENU = 1
   VRESPOSTA = "FASE DE DESEMPATE"
ELSEIF VOPCA_MENU = 2
   VRESPOSTA = "FASE FINAL"
ELSEIF VOPCA_MENU = 3
   RETURN""
ELSEIF VOPCA_MENU = 4
   VRESPOSTA = "ENCERRA"
ENDIF
RETURN VRESPOSTA


******************************************************************************
* EXIBIR A CLASSIFICA��O
* ENTRADA: VNOME
******************************************************************************
FUNC EXIBIR_CLA(P1)
SELE A
USE CLASSIFI INDEX INDPON, INDNOM
GO BOTT
LIMPAR_TEL("TUDO")
SETCOLOR("B/N")
@2,5,23,78 BOX "���������"
SETCOLOR("W+/B")
@1,3 CLEA TO 22,76
@1,3 TO 22,76 DOUB
@2,25 SAY "CLASSIFICA��O DO DESAFIO MENTAL"
@4,5 SAY "Posi��o Nome                                     Pontos"
VCOR = 1
VCONT_CLAS = 1
VLINHA = 5
VFINALISTA = 2
VCONT_PONT = 0
VCONT=0

DO WHILE VCONT_CLAS-1 # LASTREC()
   IF CLAS_NOME = P1
      SETCOLOR("BG+*/")
   ELSEIF VCOR = 1
      SETCOLOR("B/BG")
      VCOR = 2
   ELSE
      SETCOLOR("B/G")
      VCOR = 1
   ENDIF
   @VLINHA,5 SAY "    "+STR(VCONT_CLAS,2)+"- "+CLAS_NOME+"    "+STR(CLAS_PONT,3)+"               "
   IF VFINALISTA = 1 .OR. VFINALISTA = 2
      SETCOLOR("W+*/R")
      @VLINHA,62 SAY " FINALISTA "
      VCONT_PONT = CLAS_PONT
   ENDIF
   IF VFINALISTA > 0
      VFINALISTA = VFINALISTA - 1
   ENDIF
   SKIP - 1
   IF BOF() = .T.
      EXIT
   ENDIF


   IF VCONT_PONT = CLAS_PONT
      VFINALISTA = 1
   ENDIF
   VLINHA = VLINHA + 1
   VCONT_CLAS = VCONT_CLAS + 1
   VCONT=VCONT+1
   IF VCONT = 15
      VLINHA = 5
      VCONT = 0
      TONE(900,5)
      SETCOLOR("N/BG")
      @21,26 SAY " TECLE <ENTER> PARA MAIS ! "
      ESPERAR_EN()

      LIMPAR_TEL("TUDO")
      SETCOLOR("B/N")
      @2,5,23,78 BOX "���������"
      SETCOLOR("W+/B")
      @1,3 CLEA TO 22,76
      @1,3 TO 22,76 DOUB
      @2,25 SAY "CLASSIFICA��O DO DESAFIO MENTAL"
      @4,5 SAY "Posi��o Nome                                     Pontos"
      VCOR = 1

   ENDIF
ENDDO
TONE(900,5)
SETCOLOR("N/BG")
@21,24 SAY " TECLE <ENTER> PARA RETORNAR ! "
ESPERAR_EN()
RETURN""

******************************************************************************
* ESPERAR A TECLA ENTER
******************************************************************************
FUNC ESPERAR_EN()
SETCURSOR(0)
DO WHILE 13 # INKEY()
ENDDO
RETURN""

******************************************************************************
* JOGAR CLASSIFICA��O 88888888888888888888888888888888888888888888888888888888
*888888888888888888888888888888888888888888888888888888888888888888888888888888
******************************************************************************
FUNC JOGAR_CLAS()
DO WHILE .T.
   EXIBIR_TEL()
   EXIBIR_TIT("FASE DE CLASSIFICA��O")
   VNOME=SPACE(40)
   ACEITAR_NO("FASE DE CLASSIFICA��O")
   IF VNOME = SPACE(40)
      EXIT
   ENDIF
   LIMPAR_TEL("PARTE")
   IF ACHAR_NOME("FASE DE CLASSIFICA��O") = .T.
      AVISAR_CAD("FASE DE CLASSIFICA��O")
      EXIT
   ENDIF
   EXIBIR_NOM("FASE DE CLASSIFICA��O")
   
   LIMPAR_TEL("PARTE")
   SETCOLOR("B/N")
   @8,5,10,78 BOX "���������"
   SETCOLOR("W+/B")
   @7,3 CLEA TO 9,76
   @7,3 TO 9,76 DOUB
   SETCOLOR("N/BG")
   @8,20 SAY " JOGADOR TECLE <ENTER> PARA CONTINUAR ! "
   TONE(700,5)
   ESPERAR_EN()
      
   EXIBIR_APR("FASE DE CLASSIFICA��O")
   LIMPAR_TEL("PARTE")
   EXIBIR_CAR()
   PREPARAR_P("FASE DE CLASSIFICA��O")
   VCONT_PERG = 1
   VPONTO = 0
   DO WHILE VCONT_PERG # 13

      LIMPAR_TEL("PARTE")
      SETCOLOR("B/N")
      @8,5,10,78 BOX "���������"
      SETCOLOR("W+/B")
      @7,3 CLEA TO 9,76
      @7,3 TO 9,76 DOUB
      SETCOLOR("N/BG")
      @8,20 SAY " JOGADOR TECLE <ENTER> PARA CONTINUAR ! "
      TONE(700,5)
      ESPERAR_EN()
   
      EXIBIR_PER("FASE DE CLASSIFICA��O")
      VOPCAO = ACEITAR_OP("FASE DE CLASSIFICA��O")
      IF VOPCAO = "TEMPO ACABOU - CLASSIFICA��O"
         EXIBIR_ALT("TEMPO ACABOU - CLASSIFICA��O")
      ELSEIF SUBSTR(VOPCAO,3) = ALTE_CORR
         EXIBIR_ALT("CORRETA - CLASSIFICA��O")
      ELSE
         EXIBIR_ALT("ERRADA - CLASSIFICA��O")
      ENDIF
      REPL CONT_NOME WITH VNOME
      SKIP
      VCONT_PERG = VCONT_PERG+1
   ENDDO
   GRAVAR_CLA()
   LIMPAR_TEL("PARTE")
   EXIBIR_FIM()
   EXIBIR_CLA(VNOME)
   EXIT
ENDDO
RETURN""

******************************************************************************
* ACEITAR NOME PARA OS JOGOS 
* ENTRADA: "FASE DE CLASSIFICA��O", "FASE DE DESEMPATE", "FASE FINAL"
******************************************************************************
FUNC ACEITAR_NO(P1)
SETCOLOR("B/N")
SETCURSOR(3)
IF P1 = "FASE DE CLASSIFICA��O"
   @8,5,11,78 BOX "���������"
   SETCOLOR("W+/B,N/BG")
   @7,3 CLEA TO 10,76
   @7,3 TO 10,76 DOUB
   @8,5 SAY "Digite o nome completo do participante."
   SETCURSOR(3)
   @9,5 SAY "Nome:" GET VNOME PICT "@!"
   READ
ELSEIF P1 = "FASE DE DESEMPATE"
   @8,5,13,78 BOX "���������"
   SETCOLOR("W+/R,N/BG")
   @7,3 CLEA TO 12,76
   @7,3 TO 12,76 DOUB
   @8,5 SAY "Digite o nome completo do jogador 1 para o desempate."
   @9,5 SAY "Nome:" GET VNOME_JOG1 PICT "@!"
   READ
   IF VNOME_JOG1 = SPACE(40)
      RETURN""
   ENDIF
   @10,5 SAY "Digite o nome completo do jogador 2 para o desempate."
   @11,5 SAY "Nome:" GET VNOME_JOG2 PICT "@!"
   READ
ELSEIF P1 = "FASE FINAL"
   @8,5,13,78 BOX "���������"
   SETCOLOR("W+/R,N/BG")
   @7,3 CLEA TO 12,76
   @7,3 TO 12,76 DOUB
   @8,5 SAY "Digite o nome completo do finalista 1 para a final."
   @9,5 SAY "Nome:" GET VNOME_FIN1 PICT "@!"
   READ
   IF VNOME_FIN1 = SPACE(40)
      RETURN""
   ENDIF
   @10,5 SAY "Digite o nome completo do finalista 2 para a final."
   @11,5 SAY "Nome:" GET VNOME_FIN2 PICT "@!"
   READ
ENDIF
SETCURSOR(0)
RETURN""

******************************************************************************
* ACHAR NOME DOS JOGADORES
* ENTRADA: "FASE DE CLASSIFICA��O", "FASE DE DESEMPATE", "FASE FINAL"
* SA�DA: .T. .F., "1/#" "#/2" "1/2" "PONTOS DIFERENTES", "1/#" "#/2" "1/2" 
******************************************************************************
FUNC ACHAR_NOME(P1)
SELE A
USE CLASSIFI INDEX INDNOM, INDPON
IF P1 = "FASE DE CLASSIFICA��O"
   SEEK VNOME
   IF FOUND() = .T.
      VRESPOSTA = .T.
   ELSE
      VRESPOSTA = .F.
   ENDIF
   RETURN VRESPOSTA
ELSEIF P1 = "FASE DE DESEMPATE"
   SEEK VNOME_JOG1
   IF FOUND() = .T.
      VRESPOSTA = "1/"
      VCLAS_PONT = CLAS_PONT
   ELSE
      VRESPOSTA = "#/"
   ENDIF
   SEEK VNOME_JOG2
   IF FOUND() = .T.
      VRESPOSTA = VRESPOSTA + "2"
   ELSE
      VRESPOSTA = VRESPOSTA + "#"
   ENDIF
   IF VRESPOSTA = "1/2"
      IF VCLAS_PONT # CLAS_PONT
          VRESPOSTA = "PONTOS DIFERENTES"
      ENDIF
   ENDIF
   RETURN VRESPOSTA
ELSEIF P1 = "FASE FINAL"
   SEEK VNOME_FIN1
   IF FOUND() = .T.
      VRESPOSTA = "1/"
   ELSE
      VRESPOSTA = "#/"
   ENDIF
   SEEK VNOME_FIN2
   IF FOUND() = .T.
      VRESPOSTA = VRESPOSTA + "2"
   ELSE
      VRESPOSTA = VRESPOSTA + "#"
   ENDIF
   RETURN VRESPOSTA
ENDIF

******************************************************************************
* AVISAR SE O NOME FOI CADASTRADO
* ENTRADA: "FASE DE CLASSIFICA��O",
* "FASE DE DESEMPATE 1/#" "FASE DE DESEMPATE 2/#" "FASE DE DESEMPATE #/#" 
* "FASE FINAL 1/#" "FASE FINAL #/2" "FASE FINAL #/#"
******************************************************************************
FUNC AVISAR_CAD(P1)
SETCOLOR("B/N")
@8,5,10,78 BOX "���������"
SETCOLOR("W+/R")
@7,3 CLEA TO 9,76
@7,3 TO 9,76 DOUB
IF P1 = "FASE DE CLASSIFICA��O"
   @8,22 SAY "NOME J� CADASTRADO !!! TECLE <ENTER>"
ELSEIF P1 = "FASE DE DESEMPATE 1/#"
   @8,13 SAY "N�O FOI ENCONTRADO NOME DO JOGADOR 2 !!! TECLE <ENTER>"
ELSEIF P1 = "FASE DE DESEMPATE #/2"
   @8,13 SAY "N�O FOI ENCONTRADO NOME DO JOGADOR 1 !!! TECLE <ENTER>"
ELSEIF P1 = "FASE DE DESEMPATE #/#"
   @8,9 SAY "N�O FOI ENCONTRADO NOME DO JOGADOR 1 E DO 2 !!! TECLE <ENTER>"
ELSEIF P1 = "FASE FINAL 1/#"
   @8,12 SAY "N�O FOI ENCONTRADO NOME DO FINALISTA 2 !!! TECLE <ENTER>"
ELSEIF P1 = "FASE FINAL #/2"
   @8,12 SAY "N�O FOI ENCONTRADO NOME DO FINALISTA 1 !!! TECLE <ENTER>"
ELSEIF P1 = "FASE FINAL #/#"
   @8,8 SAY "N�O FOI ENCONTRADO NOME DO FINALISTA 1 E DO 2 !!! TECLE <ENTER>"
ENDIF
TONE(900,10)
ESPERAR_EN()
RETURN""

******************************************************************************
*EXIBIR MENSAGEM DE JOGADORES COM PONTOS DIFERENTES
******************************************************************************
FUNC EXIBIR_IGU()
SETCOLOR("B/N")
@8,5,10,78 BOX "���������"
SETCOLOR("W+/R")
@7,3 CLEA TO 9,76
@7,3 TO 9,76 DOUB
@8,8 SAY "OS JOGADORES N�O TEM O MESMO N�MERO DE PONTOS !!! TECLE <ENTER>"
TONE(900,10)
ESPERAR_EN()
RETURN""


******************************************************************************
* EXIBIR NOME DO JOGADOR
* ENTRADA: "FASE DE CLASSIFICA��O", "FASE DE DESEMPATE", "FASE FINAL"
******************************************************************************
FUNC EXIBIR_NOM(P1)
SETCOLOR("B/N")
@2,5,5,78 BOX "���������"
SETCOLOR("W+/B")
@1,3 CLEA TO 4,76
@1,3 TO 4,76 DOUB
SETCOLOR("W+/B,N/BG")
IF P1 = "FASE DE CLASSIFICA��O"
   SETCOLOR("R+*/B")
   @2,15 SAY "???                                            ???"
   SETCOLOR("W+/B")
   @2,21 SAY "DESAFIO MENTAL - "
   SETCOLOR("W+*/B")
   @2,COL() SAY "FASE DE CLASSIFICA��O"
   @3,5 SAY "Jogador(a):"
   SETCOLOR("RG+/B,N/BG")
   @3,17 SAY VNOME
ELSEIF P1 = "FASE DE DESEMPATE"
   SETCOLOR("B/N")
   @6,5,6,78 BOX "���������"
   SETCOLOR("R+*/B")
   @2,17 SAY "???                                        ???"
   SETCOLOR("W+/B")
   @2,23 SAY "DESAFIO MENTAL - "
   SETCOLOR("W+*/B")
   @2,COL() SAY "FASE DE DESEMPATE"
   SETCOLOR("W+/B")
   @4,3 CLEA TO 5,76
   @1,3 TO 5,76 DOUB
   @3,5 SAY "Jogador 1:"
   @4,5 SAY "Jogador 2:"
   SETCOLOR("RG+/B,N/BG")
   @3,16 SAY VNOME_JOG1
   @4,16 SAY VNOME_JOG2
ELSEIF P1 = "FASE FINAL"
   SETCOLOR("B/N")
   @6,5,6,78 BOX "���������"
   SETCOLOR("R+*/B")
   @2,20 SAY "???                                 ???"
   SETCOLOR("W+/B")
   @2,26 SAY "DESAFIO MENTAL - "
   SETCOLOR("W+*/B")
   @2,COL() SAY "FASE FINAL"
   SETCOLOR("W+/B")
   @4,3 CLEA TO 5,76
   @1,3 TO 5,76 DOUB
   @3,5 SAY "Finalista 1:"
   @4,5 SAY "Finalista 2:"
   SETCOLOR("RG+/B,N/BG")
   @3,18 SAY VNOME_FIN1
   @4,18 SAY VNOME_FIN2
ENDIF
TONE(1,30)
RETURN""

******************************************************************************
* EXIBIR APRESENTA��O
* ENTRADA: "FASE DE CLASSIFICA��O", "FASE DE DESEMPATE", "FASE FINAL"
******************************************************************************
FUNC EXIBIR_APR(P1)
SETCOLOR("B/N")
@8,5,22,78 BOX "���������"
SETCOLOR("W+/B")
@7,3 CLEA TO 21,76
@7,3 TO 21,76 DOUB
IF P1 = "FASE DE CLASSIFICA��O"
   @8,5 SAY "Desafio para a classifica��o aceito !"
   TONE(100,40)
   @10,5 SAY "PRESTE ATEN��O NA FORMA DE JOGAR !"
   TONE(900,10)
   TONE(1,70)
   @11,5 SAY "  Quando  a  pergunta  e  as  3  alternativas  aparecerem,  voc�  ter�"
   TONE(1,80)
   @12,5 SAY "  5  segundos  para  escolher  a  alternativa  desejada,  teclando  no"
   TONE(1,80)
   SETCOLOR("G+/B")
   @13,5 SAY "  CANTO SUPERIOR ESQUERDO (1�)TECLADO <1> <2> <3>."
   TONE(1,80)
   SETCOLOR("W+/B")
   @14,5 SAY "  Voc� ter�  12  perguntas  a  responder,  no  final  ser�  exibido  a"
   TONE(1,80)
   @15,5 SAY "  classifica��o da competi��o."
   TONE(1,80)
   @17,5 SAY "Pontua��o:"
   TONE(1,30)
   @18,5 SAY "  Cada pergunta ter� um valor espec�fico."
   TONE(1,60)
   @19,5 SAY "  Caso voc� acerte, o valor � somado."
   TONE(1,60)
   @20,5 SAY "  Caso voc� erre, o valor � subtra�do."
   TONE(1,60)
ELSEIF P1 = "FASE DE DESEMPATE"
   @8,5 SAY "Desafio para desempate aceito !"
   TONE(100,40)
   @10,5 SAY "PRESTEM ATEN��O NA FORMA DE JOGAR !"
   TONE(900,10)
   TONE(1,70)
   @11,5 SAY "  Quando a pergunta  e  as  3  alternativas  aparecerem,  voc�s  ter�o"
   TONE(1,80)
   @12,5 SAY "  5  segundos  para  escolher   a   alternativa   desejada,   teclando"
   TONE(1,80)
   SETCOLOR("G+/B")
   @13,5 SAY "  JOGADOR 1 NO CANTO SUPERIOR ESQUERDO (1�)TECLADO <1> <2> <3>."
   TONE(1,100)
   @14,5 SAY "  JOGADOR 2 NO CANTO INFERIOR DIREITO (2�)TECLADO <1> <2> <3>."
   TONE(1,100)
   SETCOLOR("W+/B")
   @15,5 SAY "  Talvez voc�s responder�o mais de 3 perguntas at� desempatar,  depois"
   TONE(1,80)
   @16,5 SAY "  ser� exibido o resultado do desempate."
   TONE(1,30)
   @17,5 SAY "Pontua��o:"
   TONE(1,30)
   @18,5 SAY "  Cada pergunta vale 1 ponto."
   TONE(1,60)
   @19,5 SAY "  Quem digitar 1� e acertar a resposta, o valor � somado."
   TONE(1,80)
   @20,5 SAY "  Quem digitar 1� e errar, o valor � subtra�do."
   TONE(1,80)
ELSEIF P1 = "FASE FINAL"
   @8,5 SAY "Desafio final aceito !"
   TONE(100,40)
   @10,5 SAY "PRESTEM ATEN��O NA FORMA DE JOGAR !"
   TONE(900,10)
   TONE(1,70)
   @11,5 SAY "  Quando a pergunta  e  as  3  alternativas  aparecerem,  voc�s  ter�o"
   TONE(1,80)
   @12,5 SAY "  5  segundos  para  escolher   a   alternativa   desejada,   teclando"
   TONE(1,80)
   SETCOLOR("G+/B")
   @13,5 SAY "  FINALISTA 1 NO CANTO SUPERIOR ESQUERDO (1�)TECLADO <1> <2> <3>."
   TONE(1,100)
   @14,5 SAY "  FINALISTA 2 NO CANTO INFERIOR DIREITO (2�)TECLADO <1> <2> <3>."
   TONE(1,100)
   SETCOLOR("W+/B")
   @15,5 SAY "  Voc�s ter�o 24 perguntas  a  responder,  no  final  ser�  exibido  o"
   TONE(1,80)
   @16,5 SAY "  resultado final."
   TONE(1,30)
   @17,5 SAY "Pontua��o:"
   TONE(1,30)
   @18,5 SAY "  Cada pergunta ter� um valor espec�fico."
   TONE(1,60)
   @19,5 SAY "  Quem digitar 1� e acertar a resposta, o valor � somado."
   TONE(1,80)
   @20,5 SAY "  Quem digitar 1� e errar, o valor � subtra�do."
   TONE(1,80)
ENDIF
RETURN""
               
        
******************************************************************************
* EXIBIR DE CARREGAMENTO
******************************************************************************
FUNC EXIBIR_CAR()
SETCOLOR("B/N")
@8,5,16,78 BOX "���������"
SETCOLOR("W+/B")
@7,3 CLEA TO 15,76
@7,3 TO 15,76 DOUB
@8,29 SAY "CARREGANDO DESAFIO ..."
TONE(200,22)
TONE(300,22)
@10,27 SAY "SELECIONANDO PERGUNTAS ..."
TONE(400,22)
TONE(500,22)
@12,29 SAY  "PREPARE SUA MENTE ..."
TONE(600,22)
TONE(700,22)
SETCOLOR("R+*/B")
@14,29 SAY "DESAFIO OK ! ATIVAR ..."
TONE(800,44)
RETURN""
                 
******************************************************************************
*PREPARAR SEQUENCIA DE PERGUNTAS
* ENTRADA: "FASE DE CLASSIFICA��O", "FASE DE DESEMPATE", "FASE FINAL"
******************************************************************************
FUNC PREPARAR_P(P1)
IF P1 = "FASE DE CLASSIFICA��O"
   SELE B
   USE PERGUNT1
ELSEIF P1 = "FASE DE DESEMPATE"
   SELE D
   USE PERGUNT3
ELSEIF P1 = "FASE FINAL"
   SELE C
   USE PERGUNT2
ENDIF
GO TOP
DO WHILE CONT_NOME # SPACE(40)
   SKIP
ENDDO
RETURN""

******************************************************************************
* EXIBIR PERGUNTA
* ENTRADA: "FASE DE CLASSIFICA��O", "FASE DE DESEMPATE", "FASE FINAL"
******************************************************************************
FUNC EXIBIR_PER(P1)



*SETCOLOR("B/N")
*@8,5,10,78 BOX "���������"
*SETCOLOR("W+/B")
*@7,3 CLEA TO 9,76
*@7,3 TO 9,76 DOUB
*SETCOLOR("N/BG")
*@8,24 SAY " TECLE <ENTER> PARA CONTINUAR ! "
*TONE(700,5)
*ESPERAR_EN()




LIMPAR_TEL("PARTE")
SETCOLOR("B/N")
@20,5,23,78 BOX "���������"
SETCOLOR("W+/B")
@19,3 CLEA TO 22,76
@19,3 TO 22,76 DOUB
@20,5 SAY STR(VCONT_PERG,2)+"-"
TONE(600,20)
IF P1 = "FASE DE CLASSIFICA��O"
   @20,9 SAY "A pergunta vale: "+STR(PONTO,2)+" ponto(s)"
   SETCOLOR("R+*/B")
   @21,20 SAY "N�O DIGITE AINDA !"
   TONE(1,45)
   SETCOLOR("W+/B")
   @20,39 SAY "� Total de pontos jogador(a): "+STR(VPONTO,4)
   @21,39 SAY "�"
   TONE(1,35)
ELSEIF P1 = "FASE DE DESEMPATE"
   @20,9 SAY "A pergunta vale: 1 ponto    "
   SETCOLOR("R+*/B")
   @21,19 SAY "N�O DIGITEM AINDA !"
   TONE(1,45)
   SETCOLOR("W+/B")
   @20,39 SAY "� Jogador 1: "+STR(VPONT_JOG1,2)+" Jogador 2: "+STR(VPONT_JOG2,2)
   @21,39 SAY "�"
   TONE(1,35)
ELSEIF P1 = "FASE FINAL"
   @20,9 SAY "A pergunta vale: "+STR(PONTO,2)+" ponto(s)"
   SETCOLOR("R+*/B")
   @21,19 SAY "N�O DIGITEM AINDA !"
   TONE(1,50)
   SETCOLOR("W+/B")
   @20,39 SAY "�"
   @21,39 SAY "�"
   SETCOLOR("R+*/B")
   @21,19 SAY "N�O DIGITEM AINDA !"
ENDIF
SETCOLOR("B/N")
@8,5,10,78 BOX "���������"
SETCOLOR("W+/B")
@7,3 CLEA TO 9,76
@7,3 TO 9,76 DOUB
@8,5 SAY PERGUNTA
TONE(900,2)
TONE(1,1)
TONE(900,2)
TONE(1,1)
TONE(900,2)
TONE(1,1)
TONE(900,2)
TONE(1,90)
SETCOLOR("B/N")
@13,5,17,78 BOX "���������"
SETCOLOR("W+/B")
@12,3 CLEA TO 16,76
@12,3 TO 16,76 DOUB
SETCOLOR("R+/B")
@13,5 SAY "1-"
@14,5 SAY "2-"
@15,5 SAY "3-"
SETCOLOR("W+/B")
@21,19 CLEA TO 21,38
@13,8 SAY ALTERNATI1
TONE(600,5)
TONE(1,35)
@14,8 SAY ALTERNATI2
TONE(600,5)
TONE(1,35)
@15,8 SAY ALTERNATI3
TONE(600,5)
TONE(1,35)
RETURN""

******************************************************************************
*ACEITAR OPCAO
* ENTRADA: "FASE DE CLASSIFICA��O", "FASE DE DESEMPATE", "FASE FINAL"
******************************************************************************
FUNC ACEITAR_OP(P1)
VTEMPO=VAL(SUBSTR(TIME(),7,2))
VSEGUNDO=5
SETCOLOR("R+/B")
@21,41 SAY "Tempo "+ STR(VSEGUNDO,1)
TONE(1,15)
VTECLA = 0
DO WHILE VTECLA # 49 .AND. VTECLA # 50 .AND. VTECLA # 51 .AND. VTECLA # 6 .AND. VTECLA # 24 .AND. VTECLA # 3 .AND. VSEGUNDO # 0
   IF VTEMPO # VAL(SUBSTR(TIME(),7,2))
      VTEMPO = VAL(SUBSTR(TIME(),7,2))
      VSEGUNDO = VSEGUNDO - 1
   ENDIF
   SETCOLOR("R+*/B")
   @21,41 SAY "Tempo"
   SETCOLOR("R+/B")
   @21,47 SAY STR(VSEGUNDO,1)
   VTECLA = INKEY()
ENDDO
IF VSEGUNDO = 0
   IF P1 = "FASE DE CLASSIFICA��O"
      VRESPOSTA = "TEMPO ACABOU - CLASSIFICA��O"
   ELSE
      VRESPOSTA = "TEMPO ACABOU - DESEMPATE E FINAL"
   ENDIF  
ELSEIF VTECLA = 49
   VRESPOSTA = "1/1"
ELSEIF VTECLA = 50
   VRESPOSTA = "1/2"
ELSEIF VTECLA = 51
   VRESPOSTA = "1/3"
ELSEIF VTECLA = 6
   VRESPOSTA = "2/1"
ELSEIF VTECLA = 24
   VRESPOSTA = "2/2"
ELSEIF VTECLA = 3
   VRESPOSTA = "2/3"
ENDIF
RETURN VRESPOSTA

******************************************************************************
* EXIBIR ALTERNATIA
******************************************************************************
FUNC EXIBIR_ALT(P1)
SETCOLOR("B/")
@12,1,23,78 BOX "���������"
SETCOLOR("B/N")
@13,5,21,78 BOX "���������"
SETCOLOR("W+/B")
@12,3 CLEA TO 20,76
@12,3 TO 20,76 DOUB
IF P1 = "TEMPO ACABOU - CLASSIFICA��O"
   SETCOLOR("R+*/B")
   @13,31 SAY "O TEMPO ACABOU !!!"
   TONE(700,30)
   TONE(1,30)
   SETCOLOR("W+/B")
   @19,27 SAY "VOC� PERDEU "+STR(PONTO,2)+" PONTO(S) !"
   VPONTO = VPONTO - PONTO
   TONE(1,40)
ELSEIF P1 = "CORRETA - CLASSIFICA��O"
   SETCOLOR("W+/B")
   @13,31 SAY "Op��o digitada < >"
   SETCOLOR("R+*/B")
   @13,47 SAY SUBSTR(VOPCAO,3)
   SETCOLOR("RG+*/B")
   TONE(1,20)
   @14,27 SAY "PARAB�NS VOC� ACERTOU !!!"
   TONE(900,30)
   TONE(1,30)
   SETCOLOR("W+/B")
   @19,27 SAY "VOC� GANHOU "+STR(PONTO,2)+" PONTO(S) !"
   VPONTO = VPONTO + PONTO
   TONE(1,40)
ELSEIF P1 = "ERRADA - CLASSIFICA��O"
   SETCOLOR("W+/B")
   @13,31 SAY "Op��o digitada < >"
   SETCOLOR("R+*/B")
   @13,47 SAY SUBSTR(VOPCAO,3)
   SETCOLOR("R+*/B")
   TONE(1,20)
   SETCOLOR("R+*/B")
   @14,33 SAY "VOC� ERROU !!!"
   TONE(700,30)
   TONE(1,30)
   SETCOLOR("W+/B")
   @19,27 SAY "VOC� PERDEU "+STR(PONTO,2)+" PONTO(S) !"
   VPONTO = VPONTO - PONTO
   TONE(1,40)
ELSEIF P1 = "TEMPO ACABOU - DESEMPATE E FINAL"
   SETCOLOR("R+*/B")
   @13,31 SAY "O TEMPO ACABOU !!!"
   TONE(700,30)
   TONE(1,30)
ELSEIF P1 = "CORRETA - DESEMPATE"
   SETCOLOR("W+/B")
   IF SUBSTR(VOPCAO,1,1) = "1" 
      @13,25 SAY "Jogador 1 Op��o digitada < >"
      SETCOLOR("G+/B")
      @13,33 SAY "1"
      VPONT_JOG1 = VPONT_JOG1 + 1
   ELSEIF SUBSTR(VOPCAO,1,1) = "2" 
      @13,25 SAY "Jogador 2 Op��o digitada < >"
      SETCOLOR("G+/B")
      @13,33 SAY "2"
      VPONT_JOG2 = VPONT_JOG2 + 1
   ENDIF
   SETCOLOR("R+*/B")
   @13,51 SAY SUBSTR(VOPCAO,3)
   SETCOLOR("RG+*/B")
   TONE(1,35)
   @14,27 SAY "PARAB�NS VOC� ACERTOU !!!"
   TONE(900,30)
   TONE(1,30)
   SETCOLOR("W+/B")
   @19,29 SAY "VOC� GANHOU 1 PONTO !"
   TONE(1,40)
ELSEIF P1 = "ERRADA - DESEMPATE"
   SETCOLOR("W+/B")
   IF SUBSTR(VOPCAO,1,1) = "1" 
      @13,25 SAY "Jogador 1 Op��o digitada < >"
      SETCOLOR("G+/B")
      @13,33 SAY "1"
      VPONT_JOG1 = VPONT_JOG1 - 1
   ELSEIF SUBSTR(VOPCAO,1,1) = "2" 
      @13,25 SAY "Jogador 2 Op��o digitada < >"
      SETCOLOR("G+/B")
      @13,33 SAY "2"
      VPONT_JOG2 = VPONT_JOG2 - 1
   ENDIF
   SETCOLOR("R+*/B")
   @13,51 SAY SUBSTR(VOPCAO,3)
   TONE(1,35)
   SETCOLOR("R+*/B")
   @14,33 SAY "VOC� ERROU !!!"
   TONE(700,30)
   TONE(1,30)
   SETCOLOR("W+/B")
   @19,29 SAY "VOC� PERDEU 1 PONTO !"
   TONE(1,40)
ELSEIF P1 = "CORRETA - FINAL"
   SETCOLOR("W+/B")
   IF SUBSTR(VOPCAO,1,1) = "1" 
      @13,24 SAY " Finalista 1 Op��o digitada < >"
      SETCOLOR("G+/B")
      @13,35 SAY "1"
      VPONT_FIN1 = VPONT_FIN1 + PONTO
   ELSEIF SUBSTR(VOPCAO,1,1) = "2" 
      @13,24 SAY " Finalista 2 Op��o digitada < >"
      SETCOLOR("G+/B")
      @13,35 SAY "2"
      VPONT_FIN2 = VPONT_FIN2 + PONTO
   ENDIF
   SETCOLOR("R+*/B")
   @13,53 SAY SUBSTR(VOPCAO,3)
   SETCOLOR("RG+*/B")
   TONE(1,35)
   @14,27 SAY "PARAB�NS VOC� ACERTOU !!!"
   TONE(900,30)
   TONE(1,30)
   SETCOLOR("W+/B")
   @19,27 SAY "VOC� GANHOU "+STR(PONTO,2)+" PONTO(S) !"
   TONE(1,40)
ELSEIF P1 = "ERRADA - FINAL"
   SETCOLOR("W+/B")
   IF SUBSTR(VOPCAO,1,1) = "1" 
      @13,24 SAY " Finalista 1 Op��o digitada < >"
      SETCOLOR("G+/B")
      @13,35 SAY "1"
      VPONT_FIN1 = VPONT_FIN1 - PONTO
   ELSEIF SUBSTR(VOPCAO,1,1) = "2" 
      @13,24 SAY " Finalista 2 Op��o digitada < >"
      SETCOLOR("G+/B")
      @13,35 SAY "2"
      VPONT_FIN2 = VPONT_FIN2 - PONTO
   ENDIF
   SETCOLOR("R+*/B")
   @13,53 SAY SUBSTR(VOPCAO,3)
   TONE(1,35)
   SETCOLOR("R+*/B")
   @14,33 SAY "VOC� ERROU !!!"
   TONE(700,30)
   TONE(1,30)
   SETCOLOR("W+/B")
   @19,27 SAY "VOC� PERDEU "+STR(PONTO,2)+" PONTO(S) !"
   TONE(1,40)
ENDIF
SETCOLOR("R+/B")
@16,5 SAY "1-"
@17,5 SAY "2-"
@18,5 SAY "3-"
SETCOLOR("W/B")
@16,8 SAY ALTERNATI1
@17,8 SAY ALTERNATI2
@18,8 SAY ALTERNATI3
SETCOLOR("W+/B")
@15,30 SAY "Alternativa correta:"
SETCOLOR("N/BG")
IF ALTE_CORR = "1"
   @16,5 SAY "1- "+ALTERNATI1
ELSEIF ALTE_CORR = "2"
   @17,5 SAY "2- "+ALTERNATI2
ELSE
   @18,5 SAY "3- "+ALTERNATI3
ENDIF
TONE(1,80)
RETURN""

******************************************************************************
*GRAVA CLASSIFICA��O
******************************************************************************
FUNC GRAVAR_CLA()
SELE A
APPE BLAN
REPL CLAS_NOME WITH VNOME
REPL CLAS_PONT WITH VPONTO
RETURN""

******************************************************************************
*EXIBIR FIM DE DESAFIO
******************************************************************************
FUNC EXIBIR_FIM()
SETCOLOR("B/N")
@8,5,10,78 BOX "���������"
SETCOLOR("W+/B")
@7,3 CLEA TO 9,76
@7,3 TO 9,76 DOUB
SETCOLOR("W+*/B")
@8,30 SAY "FINAL DE DESAFIO !!!"
TONE(900,20)
TONE(1,40)
RETURN""

******************************************************************************
* JOGAR FASE DE DESEMPATE  888888888888888888888888888888888888888888888888888
*88888888888888888888888888888888888888888888888888888888888888888888888888888
******************************************************************************
FUNC JOGAR_DESE()
DO WHILE .T.
   EXIBIR_TEL()
   EXIBIR_TIT("FASE DE DESEMPATE")
   VNOME_JOG1 = SPACE(40)
   VNOME_JOG2 = SPACE(40)
   ACEITAR_NO("FASE DE DESEMPATE")
   IF VNOME_JOG1 = SPACE(40).OR. VNOME_JOG2 = SPACE(40)
      EXIT
   ENDIF
   LIMPAR_TEL("PARTE")
   VACHAR_NOME = ACHAR_NOME("FASE DE DESEMPATE")
   IF VACHAR_NOME = "PONTOS DIFERENTES"
      EXIBIR_IGU()
      EXIT
   ENDIF
   IF VACHAR_NOME # "1/2"
      AVISAR_CAD("FASE DE DESEMPATE "+VACHAR_NOME)
      EXIT
   ENDIF
   VPONT_JOG1 = 0
   VPONT_JOG2 = 0
   LIMPAR_TEL("PARTE")
   EXIBIR_NOM("FASE DE DESEMPATE")
   
   LIMPAR_TEL("PARTE")
   SETCOLOR("B/N")
   @8,5,10,78 BOX "���������"
   SETCOLOR("W+/B")
   @7,3 CLEA TO 9,76
   @7,3 TO 9,76 DOUB
   SETCOLOR("N/BG")
   @8,19 SAY " JOGADOR 2 TECLE <ENTER> PARA CONTINUAR ! "
   TONE(700,5)
   ESPERAR_EN()
   
   EXIBIR_APR("FASE DE DESEMPATE")
   LIMPAR_TEL("PARTE")
   EXIBIR_CAR()
   PREPARAR_P("FASE DE DESEMPATE")
   VCONT_PERG = 1
   VPERGUNTAS = 1
   DO WHILE VPERGUNTAS # 4

      LIMPAR_TEL("PARTE")
      SETCOLOR("B/N")
      @8,5,10,78 BOX "���������"
      SETCOLOR("W+/B")
      @7,3 CLEA TO 9,76
      @7,3 TO 9,76 DOUB
      SETCOLOR("N/BG")
      @8,19 SAY " JOGADOR 2 TECLE <ENTER> PARA CONTINUAR ! "
      TONE(700,5)
      ESPERAR_EN()
    
      EXIBIR_PER("FASE DE DESEMPATE")
      VOPCAO = ACEITAR_OP("FASE DE DESEMPATE")
      IF VOPCAO = "TEMPO ACABOU - DESEMPATE E FINAL"
         EXIBIR_ALT("TEMPO ACABOU - DESEMPATE E FINAL")
      ELSEIF SUBSTR(VOPCAO,3) = ALTE_CORR
         EXIBIR_ALT("CORRETA - DESEMPATE")
      ELSE
         EXIBIR_ALT("ERRADA - DESEMPATE")
      ENDIF
      REPL CONT_NOME WITH "JOGADORES"
      SKIP
      VPERGUNTAS = VPERGUNTAS + 1
      VCONT_PERG = VCONT_PERG+1
      IF VPERGUNTAS = 4 .AND. VPONT_JOG1 = VPONT_JOG2
         VPERGUNTAS = VPERGUNTAS - 1
      ENDIF
   ENDDO
   LIMPAR_TEL("PARTE")
   EXIBIR_FIM()
   LIMPAR_TEL("PARTE")
   GRAVAR_DES()
   EXIBIR_VEN()
   EXIBIR_CLA()
   EXIT
ENDDO
RETURN""

******************************************************************************
* EXIBIR VENCEDOR DO DESEMPATE 
******************************************************************************
FUNC EXIBIR_VEN()
SETCOLOR("B/N")
@2,5,9,78 BOX "���������"
SETCOLOR("W+/B,BG/N")
@1,3 CLEA TO 8,76
@1,3 TO 8,76 DOUB
@2,29 SAY "RESULTADO DO DESEMPATE"
@6,15 SAY "N�O FIQUE TRISTE VOC� TEVE UMA BELA PARTICIPA��O !"
SETCOLOR("W+*/B")
@3,24 SAY "**** VENCEDOR DO DESEMPATE ****"
IF VPONT_JOG1 > VPONT_JOG2
   @4,5 SAY "Nome:" GET VNOME_JOG1
   @7,5 SAY "Nome:" GET VNOME_JOG2
ELSE
   @4,5 SAY "Nome:" GET VNOME_JOG2
   @7,5 SAY "Nome:" GET VNOME_JOG1
ENDIF
CLEA GETS
SETCOLOR("B/N")
@12,5,14,78 BOX "���������"
SETCOLOR("W+/R")
@11,3 CLEA TO 13,76
@11,3 TO 13,76 DOUB
SETCOLOR("W+/R")
@12,20 SAY " EQUIPE TECLE <ENTER> PARA CONTINUAR ! "
TONE(700,5)
ESPERAR_EN()
RETURN""


******************************************************************************
*GRAVAR DESEMPATE  
******************************************************************************
FUNC GRAVAR_DES()
SELE A
USE CLASSIFI INDEX INDNOM, INDPON
IF VPONT_JOG1 > VPONT_JOG2
   SEEK VNOME_JOG1
ELSE
   SEEK VNOME_JOG2
ENDIF
REPL CLAS_PONT WITH CLAS_PONT + 1
RETURN""

******************************************************************************
*DESAFIO FASE FINAL   88888888888888888888888888888888888888888888888888888888
******************************************************************************
FUNC JOGAR_FINA()
DO WHILE .T.
   EXIBIR_TEL()
   EXIBIR_TIT("FASE FINAL")
   VNOME_FIN1 = SPACE(40)
   VNOME_FIN2 = SPACE(40)
   ACEITAR_NO("FASE FINAL")
   IF VNOME_FIN1 = SPACE(40).OR. VNOME_FIN2 = SPACE(40)
      EXIT
   ENDIF
   LIMPAR_TEL("PARTE")
   VACHAR_NOME = ACHAR_NOME("FASE FINAL")
   IF VACHAR_NOME # "1/2"
      AVISAR_CAD("FASE FINAL "+VACHAR_NOME)
      EXIT
   ENDIF
   VPONT_FIN1 = 0
   VPONT_FIN2 = 0
   LIMPAR_TEL("PARTE")
   EXIBIR_NOM("FASE FINAL")

   LIMPAR_TEL("PARTE")
   SETCOLOR("B/N")
   @8,5,10,78 BOX "���������"
   SETCOLOR("W+/B")
   @7,3 CLEA TO 9,76
   @7,3 TO 9,76 DOUB
   SETCOLOR("N/BG")
   @8,18 SAY " FINALISTA 2 TECLE <ENTER> PARA CONTINUAR ! "
   TONE(700,5)
   ESPERAR_EN()

   EXIBIR_APR("FASE FINAL")
   LIMPAR_TEL("PARTE")
   EXIBIR_CAR()
   PREPARAR_P("FASE FINAL")
   VCONT_PERG = 1
   DO WHILE VCONT_PERG # 25
      LIMPAR_TEL("PARTE")

      SETCOLOR("B/N")
      @8,5,10,78 BOX "���������"
      SETCOLOR("W+/B")
      @7,3 CLEA TO 9,76
      @7,3 TO 9,76 DOUB
      SETCOLOR("N/BG")
      @8,18 SAY " FINALISTA 2 TECLE <ENTER> PARA CONTINUAR ! "
      TONE(700,5)
      ESPERAR_EN()

      EXIBIR_PER("FASE FINAL")
      VOPCAO = ACEITAR_OP("FASE FINAL")
      IF VOPCAO = "TEMPO ACABOU - DESEMPATE E FINAL"
         EXIBIR_ALT("TEMPO ACABOU - DESEMPATE E FINAL")
      ELSEIF SUBSTR(VOPCAO,3) = ALTE_CORR
         EXIBIR_ALT("CORRETA - FINAL")
      ELSE
         EXIBIR_ALT("ERRADA - FINAL")
      ENDIF
      REPL CONT_NOME WITH "FINALISTAS"
      SKIP
      VCONT_PERG = VCONT_PERG+1
   ENDDO
   LIMPAR_TEL("PARTE")
   EXIBIR_FIM()
   EXIBIR_TOT()
   LIMPAR_TEL("TUDO")
   EXIBIR_CAM()
   VTECLA=0
   DO WHILE VTECLA # 27
      SETCOLOR("B+/N")
      VTECLA=INKEY()
      EXIBIR_FOG(5)
      SETCOLOR("W+/N")
      VTECLA=INKEY()
      EXIBIR_FOG(10)
      SETCOLOR("G+/N")
      VTECLA=INKEY()
      EXIBIR_FOG(42)
      SETCOLOR("B/N")
      VTECLA=INKEY()
      EXIBIR_FOG(24)
      SETCOLOR("BG+/N")
      VTECLA=INKEY()
      EXIBIR_FOG(18)
      SETCOLOR("R+/N")
      VTECLA=INKEY()
      EXIBIR_FOG(5)
      SETCOLOR("RG+/N")
      VTECLA=INKEY()
      EXIBIR_FOG(35)
      VTECLA=INKEY()
      SETCOLOR("G/N")
      VTECLA=INKEY()
      EXIBIR_FOG(42)
   ENDDO
   EXIT
ENDDO
RETURN""
SET COLOR TO
CLEA
QUIT
RETURN""

******************************************************************************
* EXIBIR TOTAL DE PONTOS
******************************************************************************
FUNC EXIBIR_TOT()
SETCOLOR("B/N")
@8,5,10,78 BOX "���������"
SETCOLOR("W+/B")
@7,3 CLEA TO 9,76
@7,3 TO 9,76 DOUB
@8,14 SAY "TOTAL DE PONTOS FINALISTA 1: "+STR(VPONT_FIN1,4)+"  FINALISTA 2: "+STR(VPONT_FIN2,4)
TONE(900,30)
TONE(1,70)
RETURN""

******************************************************************************
*EXIBIR CAMPE�O
******************************************************************************
FUNC EXIBIR_CAM()
SETCOLOR("B/N")
@2,5,23,78 BOX "���������"
SETCOLOR("W+/N,N/BG")
@1,3 CLEA TO 22,76
@1,3 TO 22,76 DOUB
@2,32 SAY "RESULTADO FINAL"
IF VPONT_FIN1 = VPONT_FIN2
   SETCOLOR("W+*/B,N/BG")
   @3,20 SAY " **** CAMPE�ES DO DESAFIO MENTAL **** "
   SETCOLOR("W+/N,BG/")
   @4,5 SAY "Nome:" GET VNOME_FIN1 
   @6,5 SAY "Nome:" GET VNOME_FIN2 
   @4,11 GET VNOME_FIN1
   @6,11 GET VNOME_FIN2
   CLEA GETS
ELSEIF VPONT_FIN1 > VPONT_FIN2
   SETCOLOR("W+*/B,N/BG")
   @3,20 SAY " **** CAMPE�O DO DESAFIO MENTAL **** "
   SETCOLOR("W+/N,BG/")
   @4,5 SAY "Nome:" GET VNOME_FIN1 
   @4,11 GET VNOME_FIN1
   CLEA GETS
ELSE
   SETCOLOR("W+*/B,N/BG")
   @3,20 SAY " **** CAMPE�O DO DESAFIO MENTAL **** "
   SETCOLOR("W+/n,BG+/N")
   @4,5 SAY "Nome:" GET VNOME_FIN2 
   @4,11 GET VNOME_FIN2
   CLEA GETS
ENDIF
RETURN""

*****************************************************************************
FUNC TEMPO()
V=0
DO WHILE V # 10000
   V=V+1
ENDDO
RETURN

*****************************************************************************

FUNC EXIBIR_FOG(P1)
SETCURSOR(0)
@7,5 CLEA TO 21,75
@21,16+P1 SAY "�"
TEMPO()
@7,5 CLEA TO 21,75
@20,16+P1 SAY "�"
@19,16+P1 SAY "�"
TEMPO()
@7,5 CLEA TO 21,75
@18,16+P1 SAY "�"
@17,16+P1 SAY "�"
TEMPO()
@7,5 CLEA TO 21,75
@16,16+P1 SAY "�"
@15,16+P1 SAY "�"
TEMPO()
@7,5 CLEA TO 21,75
@14,16+P1 SAY "�"
@13,16+P1 SAY "�"
TEMPO()
@7,5 CLEA TO 21,75
@13,16+P1 SAY ""
TEMPO()
@12,14+P1 SAY "  *  "
@13,14+P1 SAY "*  *"
@14,14+P1 SAY "  *  "
TEMPO()
@11,11+P1 SAY "  *     *  "
@12,11+P1 SAY "*   * *   *"
@13,11+P1 SAY "*  *   *  *"
@14,11+P1 SAY "*   * *   *"
@15,11+P1 SAY "  *  *  *  "
TEMPO()
@10,8+P1 SAY  "  *     *     *"
@11,8+P1 SAY "*    *  *  *    *"
@12,8+P1 SAY "   *         *"
@13,8+P1 SAY "*  *         *  *"
@14,8+P1 SAY "   *         *"
@15,8+P1 SAY "*    *  *  *    *"
@16,8+P1 SAY "  *     *     *"
TEMPO()
@8,2+P1  SAY "              *                "
@9,2+P1  SAY "       *             *         "
@10,2+P1 SAY "  *     *     *     *     *    "
@11,2+P1 SAY "      *               *        "
@12,2+P1 SAY "*                           *  "
@13,2+P1 SAY "      *               *        "
@14,2+P1 SAY "*                           *  "
@15,2+P1 SAY "      *               *        "
@16,2+P1 SAY "  *     *     *     *    *     "
@17,2+P1 SAY "       *             *         "
@18,2+P1 SAY "              *                "
TEMPO()
@7,0+P1  SAY "                *                 "
@8,0+P1  SAY "        *              *          "
@9,0+P1  SAY "                                  "
@10,0+P1 SAY "  *                          *    "
@11,0+P1 SAY "                                  "
@12,0+P1 SAY "*                              *  "
@13,0+P1 SAY "                                  "
@14,0+P1 SAY "*                              *  "
@15,0+P1 SAY "                                  "
@16,0+P1 SAY "  *                          *    "
@17,0+P1 SAY "                                  "
@18,0+P1 SAY "        *              *          "
@19,0+P1 SAY "                *                 "
TEMPO()
RETURN""
        
*8888888888888888888888888888888888888888888888888888888888888888888888888888
