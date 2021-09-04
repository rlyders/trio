10 Clear: DefInt A-Z
20 KEY 1, Chr$(27) + "LIST" + Chr$(13): KEY 2, Chr$(27) + "LIST ": KEY 3, Chr$(27) + "RUN" + Chr$(13): KEY 4, Chr$(27) + "RUN  " + Chr$(34): KEY 5, Chr$(27) + "SAVE " + Chr$(34) + "T": KEY 6, Chr$(27) + "FILES" + Chr$(13): KEY 7, Chr$(27) + "LOAD " + Chr$(34): KEY 8, Chr$(27) + "RUN "
30 KEY 9, Chr$(27) + "RENUM" + Chr$(13): KEY 10, Chr$(27) + "SCREEN 0,1" + Chr$(13)
40 Rem
50 Rem     TRIO  - Graphics
60 On Error GoTo 5730: Cls: Dim O$(20), OO$(20), OO(20)
70 Screen 1: KEY Off: BCOLOR = 1: PALET = 0: Color BCOLOR, PALET
80 PI! = 22 / 7: C = 2: B = 3: X = 20: Y = 69: GoSub 350: C = 3: B = 1: X = 25: Y = 64: GoSub 350
90 Locate 17, 12, 0: Print "A Game Created By"
100 Locate , 6, 0: Print "Richard Jason Lyders-Gustafson"
110 Locate , 16, 0: Print "With Ideas"
120 Locate , 19, 0: Print "From"
130 Locate , 13, 0: Print "Olaf Schabirosky"
131 Print: Print: Color 1: Locate , 13, 0: Print "[PRESS ANY KEY]";
140 Def Seg = 0: Poke 1050, Peek(1052): While Len(InKey$) = 0: Wend
181 Screen 0, 1: Width 40: Color , 0, 1: Locate , , 0: Cls: O$ = "Instructions-": O$(1) = "no": O$(2) = "yes": O = 2: GoSub 8500
290 If AA = 2 Then GoSub 4460: GoTo 680 Else If AA = 1 Then 680 Else GoTo 10
350 '
360 Circle (X + 45, Y), 10, B, 3 * PI! / 2, PI! / 2
370 Circle (X - 5, Y), 10, B, PI! / 2, 3 * PI! / 2
380 Line (X - 5, Y - 9)-(X + 45, Y - 9), B
390 Line (X - 5, Y + 9)-(X + 10, Y + 9), B
400 Line (X + 30, Y + 9)-(X + 45, Y + 9), B
410 Circle (X + 20, Y + 50), 10, B, PI!, 0
420 Line (X + 30, Y + 50)-(X + 30, Y + 9), B
430 Line (X + 10, Y + 50)-(X + 10, Y + 9), B
440 Paint (X + 20, Y + 50), C, B
450 X = X + 80
460 Circle (X, Y), 10, B, PI! / 2, PI!
470 Circle (X, Y + 50), 10, B, PI!, 0
480 Line (X - 10, Y)-(X - 10, Y + 50), B
490 Line (X + 1, Y - 8)-(X + 30, Y - 8), B
500 Line (X + 10, Y + 45)-(X + 10, Y + 50), B
510 Circle (X + 27, Y + 13), 25, B, 3 * PI! / 2, PI! / 2, 5 / 6
520 Circle (X + 10, Y + 13), 7, B, -3 * PI! / 2, -PI! / 2
530 Circle (X + 29, Y + 50), 10, B, 3 * PI! / 2.5, 2 * PI! / 6.7
540 Line (X + 37, Y + 45)-(X + 27, Y + 35), B
550 Line (X + 22, Y + 56)-(X + 10, Y + 44), B
560 Paint (X, Y), C, B
570 X = X + 80
580 Circle (X, Y + 50), 10, B, PI!, 0
590 Circle (X, Y), 10, B, 0, PI!
600 Line (X - 10, Y)-(X - 10, Y + 50), B
610 Line (X + 10, Y)-(X + 10, Y + 50), B
620 Paint (X, Y), C, B
630 X = X + 70: Y = Y + 25
640 Circle (X, Y), 7, B
650 Circle (X, Y), 40, B
660 Paint (X, Y + 10), C, B
670 Return
680 '##################################
690 '##         main program         ##
700 '##################################
710 Clear: On Error GoTo 5730
720 Dim GN$(22), UNK$(10), KY$(11), A(7, 7), S(40, 3), A$(9): WW = 4
721 Erase O$, OO$, OO
730 Screen 0, 1: Color , 0, 1: Cls: ZZ = 8
740 KEY Off: Width 40: Locate , , 0
750 Rem
760 Rem  load scores/names
770 Dim SCORE(11), NAMES$(11)
780 Open "I", #1, "T.F": For N = 0 To 9: Input #1, NAMES$(N), SCORE(N): Next N: Close #1
790 Screen 0, 1: Color 0, 0, 1: Cls
800 CNAME = 10
810 GoSub 7460
811 If SG Then GoSub 7280: If SG Then GoSub 7510: If SG Then GoSub 7250: GoSub 7680: GoSub 7430: GoTo 1300
820 If ESC Then ESC = 0: GoTo 181 Else Color , 0, 1: Cls
840 NAMES$(CNAME) = ""
850 Y1 = 12: X1 = 20: A = 14: B = 0: C = 14: D = 1: LK = 10: OO$ = LASTNAME$: O$ = "Your Name|": GoSub 20000: SG = 0: If ESC Then ESC = 0: GoSub 7460: If SG Then 811 Else GoTo 181
851 NAMES$(CNAME) = KO$: If NAMES$(CNAME) = Space$(10) Then NAMES$(CNAME) = Chr$(175) + Space$(6) + Chr$(174)
860 Color , 0: Locate Y1, X1 - 10: Print Space$(20)
1300 Color 14, 0
1310 Locate 11, 11: Print " You will now have a"
1320 Locate , 10: Print "  20-second countdown"
1330 Locate , 9: Print "before your game begins..."
1340 For W = 1 To WW
    1342 A$ = Time$
    1345 While A$ = Time$
        1350 If Len(InKey$) Then 1370
    1355 Wend
1360 Next W
1370 Screen 0, 1: Color 0, 0: Cls
1380 SCRN = 1: GoSub 5840
1390 Color 3, 0
1400 Locate 4, 32, 0: Print Using "\      \"; NAMES$(CNAME)
1410 L = 13
1420 For N = 9 To 0 Step -1: If SCORE(N) = 0 Then Swap NAMES$(CNAME), NAMES$(N): Swap SCORE(CNAME), SCORE(N): CNAME = N
1430 Next N
1440 For S = 0 To 9: L = L + 1: Color 1 - 2 * (CNAME = S), 0: Locate L, 22, 0: Print Using "\        \########"; NAMES$(S), SCORE(S): Next S
1450 If SG = 0 Then 1580
1460 Color 3, 0
1470 Locate 5, 32, 0: Print Using "########"; SCORE(CNAME)
1480 Locate , 32, 0: Print Using "########"; CNSR
1490 Locate , 32, 0: Print Using "########"; WNSR
1500 ROUNDS = ROUNDS + 1
1510 Locate , 32, 0: Print Using "########"; TRYS / ROUNDS
1520 If TRYS = 0 Then AVGSPT = 0: GoTo 1540
1530 AVGSPT = (SECONDS / TRYS)
1540 Locate , 32, 0: Print Using "########"; AVGSPT
1550 Color 7, 1: Locate 3, 2, 0: Print Using "###"; ROUNDS
1560 Locate 3, 18, 0: Print Using "###"; MNSR
1570 Locate 25, 5: Print Using "####"; TIME;
1580 Rem
1590 Rem assign a-array
1600 If SG Then 1650
1610 NEWGAME = 1
1620 MNSR = 0
1630 TIME = 250
1640 SCORE(10) = 0
1650 GRIDCOLOR = 4
1660 Randomize Timer
1670 Color GRIDCOLOR, 0, 1
1680 GV = 6
1690 For GY = 0 To 6
    1700 GH = 2
    1710 For GX = 0 To 6
        1720 A(GX, GY) = Int(Rnd * 9) + 1
        1730 Locate GV, GH, 0
        1740 GH = GH + 3
        1750 Print Using "#"; A(GX, GY)
1760 Next GX: GV = GV + 2: Next GY
1770 Play "mb o1 a45 > a45 > a45 >a45"
1780 Rem
1790 Rem create answer
1800 If SG Then 1830
1810 ROUNDS = 0
1820 ROUNDS = ROUNDS + 1
1830 Randomize Timer
1840 AX1 = Int(Rnd * 7)
1850 AY1 = Int(Rnd * 7)
1860 AYA = 1
1870 AXA = Int(Rnd * 3) - 1: If AYA = 0 Then 1900
1880 If AX1 > 4 And AXA = 1 Then 1870
1890 If AX1 < 2 And AXA = -1 Then 1870
1900 AYA = Int(Rnd * 3) - 1
1910 If AY1 > 4 And AYA = 1 Then 1900
1920 If AY1 < 2 And AYA = -1 Then 1900
1930 If AXA = 0 And AYA = 0 Then 1860
1940 A1 = A(AX1, AY1)
1950 AX2 = AX1 + AXA: AY2 = AY1 + AYA
1960 A2 = A(AX2, AY2)
1970 AX3 = AX2 + AXA: AY3 = AY2 + AYA
1980 A3 = A(AX3, AY3)
1990 AAA = Int(Rnd * 3) - 1
2000 If AAA = 0 Then 1990
2010 ANSWR = A1 * A2 + (AAA * A3)
2020 If NEWGAME Then 2470
2030 Rem
2040 Rem set up score-screen
2050 Color 3, 0
2060 If TRYS = 0 Then AVGSPT = 0: GoTo 2080
2070 AVGSPT = (SECONDS / TRYS)
2080 If AVGSPT = 0 Then SCORE(CNAME) = 0: GoTo 2140
2090 If INCORRECT Then CSCORE = (-1) * ((1 / 3) * (CSECONDS)): GoTo 2120
2100 If CORRECT Then CSCORE = 1000 / ((3 / 4) * (CSECONDS)) Else CSCORE = 0: GoTo 2120
2110 If CSCORE < 50 Then CSCORE = 50
2120 CORRECT = 0
2130 SCORE(CNAME) = SCORE(CNAME) + CSCORE
2140 Locate 5, 32, 0: Print Using "########"; SCORE(CNAME)
2150 Locate , 32, 0: Print Using "########"; CNSR
2160 Locate , 32, 0: Print Using "########"; WNSR
2170 Locate , 32, 0: Print Using "########"; TRYS / ROUNDS
2180 Locate , 32, 0: Print Using "########"; AVGSPT
2190 For D = 1 To 10
    2200 If CNAME = 0 Then 2270
    2210 If SCORE(CNAME) > SCORE(CNAME - 1) Or SCORE(CNAME - 1) = 0 Then 2220 Else GoTo 2260
    2220 Swap SCORE(CNAME), SCORE(CNAME - 1)
    2230 Swap NAMES$(CNAME), NAMES$(CNAME - 1)
    2240 CNAME = CNAME - 1
    2250 GoTo 2310
    2260 If CNAME = 10 Then 2310
    2270 If SCORE(CNAME) < SCORE(CNAME + 1) Then 2280 Else GoTo 2310
    2280 Swap SCORE(CNAME), SCORE(CNAME + 1)
    2290 Swap NAMES$(CNAME), NAMES$(CNAME + 1)
    2300 CNAME = CNAME + 1
2310 Next D
2320 L = 13
2330 For S = 0 To 9: L = L + 1
    2340 If S = CNAME Then Color 3, 0 Else Color 1, 0
    2350 Locate L, 22, 0: Print Using "\        \########"; NAMES$(S), SCORE(S)
2370 Next S
2380 If Len(UNK$(UNK)) = 2 And Right$(UNK$(UNK), 1) = Chr$(82) Then 2390 Else GoTo 2470
2390 Color GRIDCOLOR, 0
2400 Locate LY1, LX1, 0: Print Using "#"; CA1
2410 Locate LY2, LX2, 0: Print Using "#"; CA2
2420 Locate LY3, LX3, 0: Print Using "#"; CA3
2430 Color 0, 0
2440 Locate 3, 8, 0: Print "        "
2450 Rem
2460 Rem accept info
2470 If SG Then 2520
2480 If NEWGAME Then 2520
2490 Locate 3, 11, 0
2500 Color 0, 0
2510 Print "  "
2520 UNK = 1: UL = 9
2530 If SG Then SG = 0: GoTo 2550
2540 If NEWGAME Then 2550 Else GoTo 2620
2550 Def Seg = 0: Poke 1050, Peek(1052): Color 15, 0: COUNT = 20
2560 On Timer(1) GoSub 7170: Time$ = "0": A$ = Time$: While A$ = Time$: Wend: Timer On
2570 If COUNT > 0 And Len(InKey$) = 0 Then 2570 Else Timer Off: On Timer(1) GoSub 7130
2580 Time$ = "0": A$ = Time$: While A$ = Time$: Wend: Locate 3, 10: Print "  "
2590 Locate 2, 7: Print Spc(9)
2600 Play "MF o3 C16"
2610 Time$ = "0": A$ = Time$: While A$ = Time$: Wend
2620 NEWGAME = 0
2630 Color 14, 1: Locate 3, 11, 0
2640 Play "mF ms o2 d64 f64 >b64"
2650 If ANSWR > 9 Or ANSWR < 0 Then 2670
2660 Print Using "#"; ANSWR: GoTo 2680
2670 Print Using "##"; ANSWR
2680 Color 7, 1: Locate 3, 2, 0: Print Using "###"; ROUNDS
2690 Locate 3, 18, 0: Print Using "###"; MNSR
2700 If INCORRECT Then INCORRECT = 0: GoTo 2720
2710 Time$ = "1": Timer On
2720 If Len(InKey$) Then 2720
2730 '
2740 Color 7, 1: Locate 25, 11, 0: Print Using "&"; Right$(Time$, 5); Mid$(Str$(Timer), 6, 2);
2750 CSECONDS = (60 * (Val(Mid$(Time$, 4, 2))) + (Val(Right$(Time$, 2))))
2760 Locate 25, 5, 0: If TIME >= 20 Then Color 7, 1 Else Color 14, 1
2770 Print Using "####"; TIME;
2780 UNK$(UNK) = InKey$: If Len(UNK$(UNK)) = 0 Then 2740
2790 If Val(UNK$(UNK)) Then 2880
2800 If Len(UNK$(UNK)) = 2 And Right$(UNK$(UNK), 1) = Chr$(83) Then Color 14, 0: Locate 20, 9, 0: Print Chr$(176); " "; Chr$(176); " "; Chr$(176): Locate 20, 9: Print "      ": UNK = 1: UL = 9: Play "mb ms o1 g64 g64 g64": GoTo 2730
2810 If Len(UNK$(UNK)) = 2 And Right$(UNK$(UNK), 1) = Chr$(82) Then Color 0, 0: Locate 20, 2, 0: Print "                   ": GoTo 3620
2820 If Len(UNK$(UNK)) = 2 And Right$(UNK$(UNK), 1) = Chr$(79) Then GoSub 8320: If ED Then End Else GoTo 181
2830 If UNK$(UNK) = Chr$(8) Then Play "mb ms o1 g64": UNK = UNK - 1: UL = UL - 2 Else GoTo 2870
2840 If UNK < 1 Then UNK = 1
2850 If UL < 9 Then UL = 9
2860 Color 14, 0: Locate 20, UL, 0: Print Chr$(176);: Locate , UL, 0: Print " ": GoTo 2720
2870 Play "mb mn o0 c32 c32": GoTo 2720
2880 Play "mb mn o3 c40"
2890 Color 14, 1
2900 Locate 20, UL, 0
2910 Print UNK$(UNK): UL = UL + 2: UNK = UNK + 1
2920 On UNK - 1 GOTO 2930, 2940, 2950
2930 ANSR1 = Val(UNK$(1)): GoTo 2730
2940 ANSR2 = Val(UNK$(2)): GoTo 2730
2950 ANSR3 = Val(UNK$(3))
2960 SECONDS = SECONDS + CSECONDS
2970 Color 0, 0
2980 Locate 3, 11: Print "  "
2990 Locate 20, 9: Print "      "
3000 Timer Off
3010 Rem
3020 Rem find asnr1
3030 For Y = 0 To 6
    3040 For X = 0 To 6
        3050 UNK$ = InKey$
        3060 If Len(UNK$) = 2 And Right$(UNK$, 1) = Chr$(83) Then 3070 Else GoTo 3170
        3070 Play "mb o1 g25 g25 g10"
        3080 UNK = 1
        3090 UL = 9
        3100 Color 14, 1: Locate 3, 11
        3110 If ANSWR > 9 Or ANSWR < 1 Then 3130 Else GoTo 3120
        3120 Print Using "#"; ANSWR: GoTo 3140
        3130 Print Using "##"; ANSWR
        3140 Color 14, 0: Locate 20, 9: Print Chr$(176); " "; Chr$(176); " "; Chr$(176)
        3150 Color 0, 0: Locate 20, 9: Print "     "
        3160 Timer On: GoTo 2740
        3170 If ANSR1 = A(X, Y) Then 3210
3180 Next X, Y: GoTo 3390
3190 Rem
3200 Rem  find ANSR2
3210 For YA = -1 To 1
    3220 Y2 = Y + YA
    3230 For XA = -1 To 1
        3240 If XA = 0 And YA = 0 Then 3280
        3250 X2 = X + XA
        3260 If X2 > 6 Or X2 < 0 Or Y2 > 6 Or Y2 < 0 Then 3280
        3270 If ANSR2 = A(X2, Y2) Then 3320
3280 Next XA, YA
3290 GoTo 3180
3300 Rem
3310 Rem find ANSR3
3320 XA3 = (-1) * (X - X2): YA3 = (-1) * (Y - Y2)
3330 X3 = X2 + XA3: Y3 = Y2 + YA3
3340 If X3 > 6 Or X3 < 0 Or Y3 > 6 Or Y3 < 0 Then 3360
3350 If ANSR3 = A(X3, Y3) Then 3500
3360 GoTo 3280
3370 Rem
3380 Rem  If incorrect
3390 Timer Off: Play "mb ms o2 e16 d16 <<a"
3400 INCORRECT = 1
3410 WNSR = WNSR + 1: TRYS = TRYS + 1
3420 Color 14, 1: Locate 20, 2, 0
3430 Print Using "&"; "Incorrect,try again"
3440 For W = 1 To WW / 2: A$ = Time$: While A$ = Time$: Wend: Next W
3450 SRCH$ = InKey$
3460 Color 0, 0
3470 Locate 20, 2, 0: Print "                   "
3480 If SRCH$ = Chr$(27) Then 3870
3490 Timer On: GoTo 2050
3500 Rem
3510 Rem If correct
3520 If (ANSWR = (ANSR1 * ANSR2) + ANSR3) Or (ANSWR = (ANSR1 * ANSR2) - ANSR3) Then 3530 Else GoTo 3390
3530 Timer Off: Play "mb ms o2 c24 f24 >g"
3540 CORRECT = 1
3550 CNSR = CNSR + 1: TRYS = TRYS + 1
3560 Color 14, 1: Locate 20, 2, 0
3570 Print "     CORRECT!      "
3580 For W = 1 To WW / 2: A$ = Time$: While A$ = Time$: Wend: Next W
3590 Color 0, 0
3600 Locate 20, 2, 0: Print "                   "
3610 Timer On: GoTo 1820
3620 Rem
3630 Rem show answer(answr)
3640 Timer Off: Play "mb ms o2 c64 d64 e64"
3650 Color 11, 1
3660 MNSR = MNSR + 1
3670 Locate 3, 8, 0
3680 If AAA = -1 Then 3720
3690 If ANSWR > 9 Or ANSWR < 0 Then 3710
3700 Print Using "#_*#_+#_=#"; A1, A2, A3, ANSWR: GoTo 3750
3710 Print Using "#_*#_+#_=##"; A1, A2, A3, ANSWR: GoTo 3750
3720 If ANSWR > 9 Or ANSWR < 0 Then 3740
3730 Print Using "#_*#_-#_=#"; A1, A2, A3, ANSWR: GoTo 3750
3740 Print Using "#_*#_-#_=##"; A1, A2, A3, ANSWR
3750 LY1 = 6 + (AY1 * 2): LX1 = 2 + (AX1 * 3)
3760 LY2 = 6 + (AY2 * 2): LX2 = 2 + (AX2 * 3)
3770 LY3 = 6 + (AY3 * 2): LX3 = 2 + (AX3 * 3)
3780 Color 11, 0
3790 Locate LY1, LX1, 0: Print Using "#"; A1
3800 Locate LY2, LX2, 0: Print Using "#"; A2
3810 Locate LY3, LX3, 0: Print Using "#"; A3
3820 CA1 = A1: CA2 = A2: CA3 = A3
3830 For W = 1 To WW: A$ = Time$: While A$ = Time$: Wend: Next W
3840 Timer On: GoTo 1820
3850 Rem
3860 Rem search
3870 Timer Off: Color 10, 1: Locate 2, 7, 0
3880 If ANSWR > 9 Or ANSWR < 0 Then 3900
3890 Print Using "SEARCH_[#_]"; ANSWR: GoTo 3910
3900 Print Using "SEARCH_[##_]"; ANSWR
3910 For COLUMN1 = 0 To 6
    3920 For ROW1 = 0 To 6
        3930 For ACOLUMN = -1 To 1
            3940 For AROW = -1 To 1
                3950 If ROW1 < 2 And AROW = -1 Or ROW1 > 4 And AROW = 1 Or COLUMN1 < 2 And ACOLUMN = -1 Or COLUMN1 > 4 And ACOLUMN = 1 Or ACOLUMN = 0 And AROW = 0 Then 4000
                3960 Z1 = A(ROW1, COLUMN1)
                3970 Z2 = A(ROW1 + AROW, COLUMN1 + ACOLUMN)
                3980 Z3 = A(ROW1 + AROW + AROW, COLUMN1 + ACOLUMN + ACOLUMN)
                3990 If Z1 * Z2 + Z3 = ANSWR Or Z1 * Z2 - Z3 = ANSWR Then 4070
4000 Next AROW, ACOLUMN, ROW1, COLUMN1
4010 Color 10, 1: Locate 3, 8, 0
4020 Print "Finished"
4030 For W = 1 To WW: A$ = Time$: While A$ = Time$: Wend: Next W
4040 Color 0, 0: Locate 2, 6, 0: Print "           "
4050 Color 0, 0: Locate 3, 8, 0: Print "         "
4060 Timer On: GoTo 1820
4070 Q = Q + 1
4080 S(Q, 1) = Z1
4090 S(Q, 2) = Z2
4100 S(Q, 3) = Z3
4110 Play "mb o1 c30"
4120 Color 10, 0
4130 Locate 3, 8, 0
4140 If Z1 * Z2 + Z3 = ANSWR Then 4180
4150 If ANSWR > 9 Or ANSWR < 0 Then 4170
4160 Print Using "#_*#_-#_=#"; S(Q, 1), S(Q, 2), S(Q, 3), ANSWR: GoTo 4210
4170 Print Using "#_*#_-#_=##"; S(Q, 1), S(Q, 2), S(Q, 3), ANSWR: GoTo 4210
4180 If ANSWR > 9 Or ANSWR < 0 Then 4200
4190 Print Using "#_*#_+#_=#"; S(Q, 1), S(Q, 2), S(Q, 3), ANSWR: GoTo 4210
4200 Print Using "#_*#_+#_=##"; S(Q, 1), S(Q, 2), S(Q, 3), ANSWR
4210 SY1 = 6 + (COLUMN1 * 2): SX1 = 2 + (ROW1 * 3)
4220 SY2 = 6 + ((ACOLUMN + COLUMN1) * 2): SX2 = 2 + ((AROW + ROW1) * 3)
4230 SY3 = 6 + ((ACOLUMN + ACOLUMN + COLUMN1) * 2): SX3 = 2 + ((AROW + AROW + ROW1) * 3)
4240 Color 10, 0
4250 Play "mb o3 c30 d30 e30"
4260 Locate SY1, SX1, 0: Print Using "#"; Z1
4270 Locate SY2, SX2, 0: Print Using "#"; Z2
4280 Locate SY3, SX3, 0: Print Using "#"; Z3
4290 For W = 1 To WW: A$ = Time$: While A$ = Time$: Wend: Next W
4300 Color GRIDCOLOR, 0
4310 Locate SY1, SX1, 0: Print Using "#"; Z1
4320 Locate SY2, SX2, 0: Print Using "#"; Z2
4330 Locate SY3, SX3, 0: Print Using "#"; Z3
4340 Color 0, 0
4350 Locate 3, 8, 0: Print "        "
4360 GoTo 4000
4370 Rem
4380 Rem  Save scores/names
4390 Open "O", #1, "T.F"
4400 For N = 0 To 9: If SCORE(N) <= 0 Then SCORE(N) = 0: NAMES$(N) = Space$(8): GoTo 4420
    4410 If Left$(NAMES$(N), 8) = Chr$(175) + Space$(6) + Chr$(174) Then NAMES$(N) = Space$(8)
4420 Write #1, NAMES$(N), SCORE(N): Next N: Close #1: GoTo 710
4430 Rem
4440 Rem  Save  game
4450 Open "O", #2, "TT.F": Write #2, MNSR, ROUND, SCORE(CNAME), TIME, TRYS, SECONDS, NAMES$(CNAME), CNSR, WNSR: Close #2: Return
4460 '##################################
4470 '##        TRIO INSTRUCTIONS     ##
4480 '##################################
4490 Width 80
4500 Screen 0, 1: Color 0, 0, 1: Cls
4510 Locate , , 0
4520 SCRN = 2: GoSub 5840
4530 H = 45
4540 Color 7, 0: Locate 10, 51
4550 Print "The object of ";: Color 14: Print "TRIO ";: Color 7: Print ":"
4560 Print: Locate , H + 1: Color 8: Print "Complete as many rounds of play"
4570 Locate , H + 3: Print "as possible within the given"
4580 Locate , H + 9: Print "250-count time."
4590 If Len(InKey$) = 0 Then 4590
4600 Color 7, 0: Locate 8, 48
4610 Print "The object of each round"
4620 Print: Locate , H: Color 8: Print "Locate three numbers(`";
4630 Color 7: Print "GUESSES";
4640 Color 8: Print "')"
4650 Locate , H + 2: Print "in a straight line where:"
4660 Color 7: Locate , H - 2: Print "GUESS 1 x GUESS 2 + GUESS 3 = ANSWER"
4670 Color 8: Locate , H - 2: Print "                  or                "
4680 Color 7: Locate , H - 2: Print "GUESS 1 x GUESS 2 - GUESS 3 = ANSWER"
4690 Color 8: Print: Print: Locate , H - 1: Print "(`";
4700 Color 7: Print "ANSWER";
4710 Color 8: Print "' is yellow on blue print)"
4720 Color 7, 1: Locate 3, 2: Print Using "###"; 1
4730 Color 14, 0: Locate 3, 13: Print Chr$(17), Chr$(205);
4740 Color , 1: Print " ANSWER ";
4750 If Len(InKey$) Then 4750
4760 If Len(InKey$) Then 4770 Else GoTo 4760
4770 Color 7, 0: Locate 4, 42: Print "             A sample round:          "
4780 Color 8: Print: Locate , 42: Print "   1)The `";
4790 Color 7: Print "ANSWER";
4800 Color 8: Print "' is displayed.       "
4810 Locate , 42: Print "     In this example it is `";
4820 Color 14, 1: Print "7";
4830 Color 8, 0: Print "'.       "
4840 Locate , 42: Print "   2)Search for your three guesses. "
4850 Locate , 42: Print "          In this example:          "
4860 Locate , 42: Print "          `";
4870 Color 7: Print "GUESS 1";
4880 Color 8: Print "' is `";
4890 Color 12: Print "6";
4900 Color 8: Print "'            "
4910 Locate , 42: Print "          `";
4920 Color 7: Print "GUESS 2";
4930 Color 8: Print "' is `";
4940 Color 12: Print "2";
4950 Color 8: Print "'            "
4960 Locate , 42: Print "          `";
4970 Color 7: Print "GUESS 3";
4980 Color 8: Print "' is `";
4990 Color 12: Print "5";
5000 Color 8: Print "'            "
5010 Color 12: Locate , 42: Print "            6 ";
5020 Color 8: Print "x ";
5030 Color 12: Print "2 ";
5040 Color 8: Print "- ";
5050 Color 12: Print "5 ";
5060 Color 8: Print "= ";
5070 Color 14, 1: Print "7";: Color , 0: Print "             "
5080 Color 8, 0: Locate , 42: Print "   3)Enter your guesses in order of:  "
5090 Locate , 42: Print "     `";
5100 Color 7: Print "GUESS 1";
5110 Color 8: Print "', `";
5120 Color 7: Print "GUESS 2";
5130 Color 8: Print "', `";
5140 Color 7: Print "GUESS 3";
5150 Color 8: Print "'. "
5160 Locate , 42: Print "   4)The computer will check your     "
5170 Locate , 42: Print "     set of guesses.                  "
5180 Locate , 42: Print "   5)If correct, a new round begins.  "
5190 Locate , 42: Print "   6)If incorrect, the same round     "
5200 Locate , 42: Print "     continues.                       "
5210 Color 12, 0: Locate 6, 8: Print "5"
5220 Locate 8, 5: Print "2"
5230 Locate 10, 2: Print "6"
5240 If Len(InKey$) Then 5240
5250 If Len(InKey$) Then 5260 Else GoTo 5250
5260 Color 7: Locate 3, 42: Print "            SPECIAL KEYS              "
5270 Color 7: Locate , 42: Print "                                      "
5280 Locate 5, 42: Print "  `DEL':";
5290 Color 8: Print "Erases guesses                "
5300 Color 7: Locate , 42: Print "  `BACKSPACE':";
5310 Color 8: Print "Erases last guess       "
5320 Color 7: Locate , 42: Print "  `FN'-`END':";
5330 Color 8: Print "Ends & saves game        "
5340 Color 7: Locate , 42: Print "  `INS':";
5350 Color 8: Print "Ends current round,           "
5360 Locate , 42: Print "        displays correct guesses      "
5370 Color 7: Locate , 42: Print "  `ESC':";
5380 Color 8: Print "Searches for correct guesses, "
5390 Locate , 42: Print "        if pressed while displaying   "
5400 Locate , 42: Print "        `";
5410 Color 14, 1: Print "Incorrect,try again";
5420 Color 8, 0: Print "'         "
5430 Color 7: Locate , 42: Print "                                      "
5440 Locate , 42: Print "            GAME FORMAT               "
5450 Locate , 42: Print "                                      "
5460 Locate , 42: Print "   RND:";
5470 Color 8: Print "Current round                  "
5480 Color 7: Locate , 42: Print "   INS:";
5490 Color 8: Print "# of times `";
5500 Color 7: Print "INS";
5510 Color 8: Print "'-key is used   "
5520 Color 7: Locate , 42: Print "   AVGTRYS/R:";
5530 Color 8: Print "Average trys per round   "
5540 Color 7: Locate , 42: Print "   AVGSECS/T:";
5550 Color 8: Print "Average seconds per try  "
5560 Color 7: Locate , 42: Print "   CORRECT:";
5570 Color 8: Print "# of correct guesses       "
5580 Color 7: Locate , 42: Print "   INCORRECT:";
5590 Color 8: Print "# of incorrect guesses   "
5600 Color 7: Locate , 42: Print "   TIME:";
5610 Color 8: Print "Remaining game time         "
5620 Color 7: Locate , 42: Print "   TIMER:";
5630 Color 8: Print "Elapsed round time           ";
5640 If Len(InKey$) Then 5640
5650 If Len(InKey$) Then 5660 Else GoTo 5650
5660 For ZZ = 3 To 24: Locate ZZ, 42: Print Space$(38);: Next ZZ
5670 Color 8: Locate 10, 42: Print "     Next, once you press any key,"
5680 Locate , 42: Print "             your game of"
5690 Locate , 42: Color 14: Print "                 TRIO"
5700 Locate , 42: Color 8: Print "              will begin."
5710 Def Seg = 0: Poke 1050, Peek(1052)
5720 If Len(InKey$) Then Return Else GoTo 5720
5730 Color 14, 1: Screen 0, 1, 0: Cls: Color 14, 4: Locate 12, 15
5740 If Err = 53 Then Print "Insert Game Disk": GoTo 5830
5750 If Err = 7 Then Print "Note enough memory": GoTo 5830
5760 If Err = 57 Or Err = 71 Then Print "Check Diskdrive": GoTo 5830
5770 If Err = 63 Then Print "Disk is full": GoTo 5830
5780 If Err = 67 Then Print "Too many files": GoTo 5830
5790 If Err = 68 Then Print "No diskdrive": GoTo 5830
5800 If Err = 70 Then Print "Disk is write protected": GoTo 5830
5810 Locate 12, 7: Print "Severe Error...Reset Game:"
5820 If Len(InKey$) Then Print Erl; Err: End Else Play "mf b64 p32": GoTo 5820
5830 If Len(InKey$) Then Color 14, 1: Cls: Resume Else Play "mf b64 p32": GoTo 5830
5840 Screen 0, 1: Color 0, 0: Cls
5850 '
5860 '@@@@ GAME SCREEN @@@@
5870 '
5880 Color 6
5890 If SCRN = 2 Then 5930
5900 Color 6
5910 Locate 25, 40: Print Chr$(188);
5920 Locate 24, 40: Print Chr$(186);
5930 If SCRN = 1 Then 6000
5940 Color 8
5950 Locate 25, 80: Print Chr$(188);
5960 Locate 24, 80: Print Chr$(186);
5970 Color 6
5980 Locate 25, 40: Print Chr$(188);
5990 Locate 24, 40: Print Chr$(186);
6000 Color 6
6010 For LNE = 2 To 39
    6020 If LNE < 3 Then Locate 25, LNE: Print Chr$(205);
    6030 If LNE > 19 And LNE < 21 Then Locate 25, LNE: Print Chr$(205);
    6040 If LNE > 3 And LNE < 19 Then Locate 23, LNE: Print Chr$(205);
    6050 If LNE > 5 And LNE < 17 Then Locate 21, LNE: Print Chr$(205);
    6060 Locate 1, LNE: Print Chr$(205);
    6070 If LNE > 21 Then 6080 Else GoTo 6120
    6080 Locate 3, LNE: Print Chr$(205);
    6090 Locate 10, LNE: Print Chr$(205);
    6100 Locate 12, LNE: Print Chr$(205);
    6110 Locate 25, LNE: Print Chr$(205);
    6120 If LNE < 21 Then 6130 Else GoTo 6140
    6130 Locate 4, LNE: Print Chr$(205);
6140 Next LNE
6150 For LNE = 2 To 24
    6160 Locate LNE, 1: Print Chr$(186);
    6170 Locate LNE, 21: Print Chr$(186);
    6180 If LNE < 24 Then Locate LNE, 40: Print Chr$(186);
6190 Next LNE
6200 Locate 1, 1: Print Chr$(201);
6210 Locate 1, 5: Print Chr$(209);
6220 Locate 1, 17: Print Chr$(209);
6230 Locate 1, 21: Print Chr$(203);
6240 Locate 1, 40: Print Chr$(187);
6250 Locate 3, 40: Print Chr$(185);
6260 Locate 3, 21: Print Chr$(204);
6270 Locate 4, 1: Print Chr$(204);
6280 Locate 4, 21: Print Chr$(185);
6290 Locate 4, 5: Print Chr$(207);
6300 Locate 4, 17: Print Chr$(207);
6310 Locate 24, 3: Print Chr$(186); Spc(15); Chr$(186);
6320 Locate 22, 5: Print Chr$(186); Spc(11); Chr$(186);
6330 Locate 2, 5: Print Chr$(179); Spc(11); Chr$(179);
6340 Locate 3, 5: Print Chr$(179); Spc(11); Chr$(179);
6350 Locate 10, 21: Print Chr$(204);
6360 Locate 10, 40: Print Chr$(185);
6370 Locate 12, 21: Print Chr$(204);
6380 Locate 12, 40: Print Chr$(185);
6390 Locate 21, 5: Print Chr$(201);
6400 Locate 21, 17: Print Chr$(187);
6410 Locate 23, 3: Print Chr$(201);
6420 Locate 23, 19: Print Chr$(187);
6430 Locate 23, 5: Print Chr$(202);
6440 Locate 23, 17: Print Chr$(202);
6450 Locate 25, 19: Print Chr$(200);
6460 Locate 25, 3: Print Chr$(188);
6470 Locate 25, 1: Print Chr$(200);
6480 Locate 25, 21: Print Chr$(202);
6490 Color 7
6500 Locate 2, 2: Print "RND"
6510 Locate 2, 18: Print "INS"
6520 Locate 24, 5: Print "TIME";
6530 Locate 24, 12: Print "TIMER";
6540 Color 14
6550 Locate 22, 8: Print "T R I O"
6560 Color 7, 1
6570 Locate 3, 2: Print Using "###"; 0
6580 Locate 3, 18: Print Using "###"; 0
6590 Locate 25, 5: Print Using "####"; 250;
6600 Locate 25, 11: Print "00:00.0";
6610 Color 3, 0
6620 Locate 2, 25: Print "YOUR SCORES"
6630 Locate 4, 27: Print "NAME:"
6640 Locate 5, 26: Print "SCORE:       0"
6650 Locate 6, 24: Print "CORRECT:       0"
6660 Locate 7, 22: Print "INCORRECT:       0"
6670 Locate 8, 22: Print "AVGTRYS/R:       0"
6680 Locate 9, 22: Print "AVGSECS/T:       0"
6690 Color 1
6700 Locate 11, 25: Print "HIGH SCORES"
6710 For LNE = 14 To 23
    6720 Locate LNE, 39: Print "0";
6730 Next LNE
6740 If SCRN = 1 Then Color 15 Else GoTo 6780
6750 Locate 2, 7: Print "COUNTDOWN"
6760 Locate 3, 10: Print "20"
6770 Return
6780 '
6790 '@@@@ INSTRUCTION SCREEN @@@@
6800 '
6810 Color 8
6820 For LNE = 42 To 79
    6830 Locate 1, LNE: Print Chr$(205);
    6840 Locate 25, LNE: Print Chr$(205);
6850 Next LNE
6860 For LNE = 2 To 24
    6870 Locate LNE, 41: Print Chr$(186);
    6880 If LNE < 24 Then Locate LNE, 80: Print Chr$(186);
6890 Next LNE
6900 Locate 1, 41: Print Chr$(201);
6910 Locate 1, 80: Print Chr$(187);
6920 Locate 25, 41: Print Chr$(200);
6930 Color 7
6940 Locate 1, 55: Print "INSTRUCTIONS"
6950 Locate 25, 54: Print "PRESS ANY KEY";
6960 GRIDCOLOR = 4
6970 Randomize Timer
6980 Color GRIDCOLOR, 0, 1
6990 GV = 6
7000 For GY = 0 To 6
    7010 GH = 2
    7020 For GX = 0 To 6
        7030 If GX = 2 And GY = 0 Then A(GX, GY) = 5: GoTo 7070
        7040 If GX = 1 And GY = 1 Then A(GX, GY) = 2: GoTo 7070
        7050 If GX = 0 And GY = 2 Then A(GX, GY) = 6: GoTo 7070
        7060 A(GX, GY) = Int(Rnd * 9) + 1
        7070 Locate GV, GH, 0
        7080 GH = GH + 3
        7090 Print Using "#"; A(GX, GY)
7100 Next GX: GV = GV + 2: Next GY
7110 Color 14, 1: Locate 3, 11: Print "7"
7120 Return
7130 TIME = TIME - 1: If TIME = 0 Then Play "mb ml o4 c2": Locate 25, 5: Color 14, 1: Print Using "####"; TIME;: Locate 20, 7, 0: Color 3, 0: Print "GAME OVER": NEWGAME = 0: LASTNAME$ = NAMES$(CNAME): GoTo 4370
7140 If TIME >= 20 Then 7160
7150 If PLY = 0 Then PLY = 1: Play "MB MS O4 C64" Else PLY = 0
7160 Return
7170 COUNT = COUNT - 1: Locate 3, 10, 0: Print Using "##"; COUNT
7180 If COUNT > 3 Then Play "MF ms O3 A64" Else Play "mF o3 a32"
7190 Return
7200 Color 14, 0: Cls: End
7210 Rem
7220 Rem ****SAVE GAME IN - GN$****
7230 Open "O", #1, GN$ + ".TF": Write #1, MNSR, ROUND, SCORE(CNAME), TIME, TRYS, SECONDS, NAMES$(CNAME), CNSR, WNSR: Close #1: Return
7240 Rem
7250 Rem ****LOAD GAME IN - GN$****
7260 Open "I", #1, GN$ + ".TF": Input #1, MNSR, ROUND, SCORE(CNAME), TIME, TRYS, SECONDS, NAMES$(CNAME), CNSR, WNSR: Close #1: Return
7270 Rem
7280 Rem
7290 Rem LOAD SAVED GAME?
7291 O$ = "Load a Game-": O$(1) = "no": O$(2) = "yes": O = 2: GoSub 8500: SG = AA - 1: Color 0, 0, 1: Cls: If AA = 0 Then SG = 0: Return 181 Else Return
7420 Rem
7430 Rem
7440 Rem save file names
7450 Open "O", #1, "T.FF": For A = 1 To GN: Write #1, GN$(A): Next A: Close #1: Return
7460 Rem
7470 Rem load file names
7480 Open "I", #1, "T.FF"
    7485 For A = 1 To 20
        7490 If EOF(1) Then GN = A - 1 Else Input #1, GN$(A)
    7495 Next A
    7500 Close #1: If GN = 0 Then SG = 0: Return Else SG = 1: Return
    7510 Rem
    7520 Rem choose from saved game list
    7530 Poke 1050, Peek(1052): If GN = 0 Then SG = 0: Color , 0: Cls: Return
    7540 Color 8, 0: Locate 2, 12: Print "�����������ͻ"
    7550 For A = 1 To 20: Locate 2 + A, 12: Print "�           �";: Next A
    7560 Locate 23, 12: Print "�����������ͼ";
    7570 X1 = 13: Color ZZ, 0: For A = 1 To GN: Locate A + 2, X1: Print Using "##)"; A;: Print GN$(A);: Next: A = 1: LA = 1
    7580 Color ZZ, 0: Locate LA + 2, X1: Print Using "##)"; LA;: Print GN$(LA) + Space$(8 - Len(GN$(LA)));: Color 14, 1: Locate A + 2, X1: Print Using "##)"; A;: Print GN$(A) + Space$(8 - Len(GN$(A)));
    7590 A$ = InKey$: On Len(A$) + 1 GOTO 7590, 7600, 7620
    7600 If A$ = Chr$(13) Then 7670
    7610 If A$ = Chr$(27) Then SG = 0: Color , 0: Cls: Return 810 Else GoTo 7590
    7620 A$ = Right$(A$, 1): If A$ = Chr$(80) Then LA = A: A = A + 1: GoTo 7650
    7630 If A$ = Chr$(83) Then Kill GN$(A) + ".TF": For C = A To GN: GN$(C) = GN$(C + 1): Next C: GN = GN - 1: GoSub 7430: GoTo 7510
    7640 If A$ = Chr$(72) Then LA = A: A = A - 1 Else GoTo 7590
    7650 If A > GN Then A = 1 Else If A < 1 Then A = GN
    7660 GoTo 7580
    7670 GN$ = GN$(A): Color , 0: Cls: Return
    7680 Rem
    7690 Rem ERASE GAME FILE
7700 FOR A=1 TO 20:IF GN$<>GN$(A) THEN NEXT A
7710 FOR A=A TO 20:GN$(A)=GN$(A+1):NEXT A:GN=GN-1:KILL GN$+".TF":RETURN
7720 REM
7730 REM ACCEPT INFORMATION
7731 A=14:B=0:C=14:D=1:LK=8:OO$=GN$:O$="File Name|":X1=12:Y1=20:KY$="":GOSUB 20000:IF ESC THEN RETURN
8100 KY$=KO$:IF KY$=SPACE$(8) THEN GOSUB 8121:RETURN ELSE K$=KY$:GOSUB 8210:GOSUB 8170:GOSUB 8250
8110 IF K$<>KY$ THEN GN$=KY$:GOTO 7731 ELSE GOSUB 8130:GOSUB 8121
8120 IF KY$<>"" THEN GN=GN+1:GN$(GN)=KY$:GN$=KY$:GOSUB 7430:RETURN ELSE 7731
8121 LOCATE Y1,X1-10:COLOR 7,0:PRINT SPACE$(18);:RETURN
8130 REM
8140 REM SEARCH FOR DUPLICATE FILES
8150 FOR A=1 TO GN:IF KY$=GN$(A) THEN KY$=""
8160 NEXT A:IF KY$="" THEN LOCATE 20,2:COLOR 14,4:PRINT "DUPLICATE FILE NAME":FOR W=1 TO 3:A$=TIME$:WHILE A$=TIME$:WEND:NEXT W:COLOR ,0:LOCATE 20,2:PRINT SPACE$(19):RETURN ELSE RETURN
8170 REM
8180 REM ERASE SPACES IN FILE NAME
8190 FOR A=1 TO 8:IF LEFT$(KY$,1)=CHR$(32) THEN KY$=RIGHT$(KY$,8-A):NEXT A
8200 RETURN
8210 REM
8220 REM capitalize file names
8230 FOR A=1 TO 8:A$=RIGHT$(KY$,A):IF ASC(A$)=>97 AND ASC(A$)<=122 THEN KY$=LEFT$(KY$,(8-A))+CHR$(ASC(A$)-32)+RIGHT$(A$,A-1)
8240 NEXT A:RETURN
8250 REM
8260 REM create a valid file name
8270 FOR A=1 TO 8:AA=ASC(RIGHT$(KY$,A))
8280 IF AA=33 OR (AA>34 AND AA<42) OR AA=45 OR (AA>46 AND AA<58) OR (AA>63 AND AA<91) OR (AA>93 AND AA<97) OR AA=123 OR AA=125 THEN 8310
8290 IF AA=32 THEN IF RIGHT$(KY$,A)=SPACE$(A) THEN 8310
8300 KY$=LEFT$(KY$,8-A)+"_"+RIGHT$(KY$,A-1)
8310 NEXT A:RETURN
8320 REM
8330 REM END/SAVE/NEW GAME OPTIONS
8331 A=7:B=0:C=14:D=1:ED=0:X1=10:Y1=20:O$(1)="save":O$(2)="end":O$(3)="new":O=3:GOSUB 8530
8440 COLOR 0,0:LOCATE Y1,X1-8:PRINT SPACE$(19)
8480 IF AA=0 THEN RETURN 2720
8490 IF AA=1 THEN GOSUB 7460:GOSUB 7720:IF GN$<>"" AND ESC=0 THEN GOSUB 7210:GOTO 8320 ELSE ESC=0:GOTO 8320 ELSE IF AA=2 THEN COLOR 8,0:CLS:ED=1:RETURN ELSE ED=0:RETURN
8500 REM
8510 REM menus
8520 Y1=12:X1=20:A=7:B=0:C=14:D=1
8530 REM O$=Text:O$()=Options 1-5:O=# of options:a=forgnd:b=bakgnd:c=fore-high:d=bkgnd-high:x1=cntr x pos:y1=y pos:aa=current option #
8540 DEF SEG=0:POKE 1050,PEEK(1052):AA=1
8550 XX=LEN(O$):FOR F=1 TO O:XX=XX+LEN(O$(F))+3:NEXT F:XX=X1-INT((XX-3)/2)
8560 COLOR A,B:LOCATE Y1,XX:PRINT O$+"[";:FOR AA=1 TO O-1:GOSUB 8740:PRINT O$(AA)+" | ";:NEXT:GOSUB 8740:PRINT O$(O)+"]";:AA=1
8570 XXX=XX+LEN(O$)+1:LOCATE Y1,XXX:FOR F=1 TO O:IF AA=F THEN COLOR C,D:PRINT OO$(F); ELSE IF OO(F) THEN COLOR ZZ,B:PRINT O$(F) ELSE COLOR A,B:PRINT O$(F);
8580 XXX=XXX+LEN(O$(F))+3:LOCATE Y1,XXX:NEXT
8590 A$=INKEY$:ON LEN(A$)+1 GOTO 8590,8600,8630
8600 IF A$=CHR$(13) THEN 8710
8610 IF A$=CHR$(27) THEN AA=0:GOTO 8710
8620 FOR F=1 TO O:IF ASC(A$)=ASC(O$(F)) OR ASC(A$)=ASC(OO$(F)) THEN AA=F:GOTO 8710 ELSE NEXT:GOTO 8590
8630 A$=RIGHT$(A$,1):IF A$<>CHR$(77) THEN  8660
8640 IF AA=O THEN AA=1 ELSE AA=AA+1
8650 IF OO(AA) THEN 8640 ELSE 8570
8660 IF A$<>CHR$(75) THEN 8690
8670 IF AA=1 THEN AA=O ELSE AA=AA-1
8680 IF OO(AA) THEN 8670 ELSE 8570
8690 IF ASC(A$)=>120 AND ASC(A$)<=129 THEN WW=(ASC(A$)-120):GOTO 8590
8700 IF A$=CHR$(79) THEN GOSUB 8320:IF ED THEN END ELSE 10 ELSE 8590
8710 XXX=XX+LEN(O$)+1:LOCATE Y1,XXX:FOR F=1 TO O:IF AA=F THEN COLOR C,D:PRINT OO$(F); ELSE IF OO(F) THEN COLOR ZZ,B:PRINT O$(F) ELSE COLOR A,B:PRINT O$(F);
8720 XXX=XXX+LEN(O$(F))+3:LOCATE Y1,XXX:NEXT
8730 FOR F=1 TO O:O$(F)="":OO(F)=0:NEXT:O$="":RETURN
8740 REM
8750 REM Capitalizing
8760 OO$(AA)=O$(AA):OO=LEN(OO$(AA)):FOR F=1 TO OO:A$=RIGHT$(OO$(AA),F):IF ASC(A$)=>97 AND ASC(A$)<=122 THEN OO$(AA)=LEFT$(OO$(AA),(OO-F))+CHR$(ASC(A$)-32)+RIGHT$(A$,F-1)
8770 NEXT:RETURN
20000 REM ENTER **************
20001 REM A=7:B=0:C=14:D=1:Y1=13:X1=20:O$="Your name|":LK=10
20010 ESC=0:LK=LK-1:COLOR C,B:LOCATE Y1,X1-LEN(O$),0:PRINT O$;:COLOR C,D:PRINT USING"\"+SPACE$(LK-1)+"\";OO$
20020 LOCATE Y1,X1,0
20030 KY=0
20040 IF KY>LK THEN KY=0
20050 IF INS THEN LOCATE ,,,3,7 ELSE LOCATE ,,,7,0
20060 KY$(KY)=INKEY$
20070 LOCATE Y1,X1+KY,1
20080 IF LEN(KY$(KY)) THEN 20090 ELSE 20040
20090 LOCATE ,,0
20100 IF KY$(KY)=CHR$(13) THEN 20220
20110 IF KY$(KY)=CHR$(9) THEN 20040
20120 IF KY$(KY)=CHR$(27) THEN ESC=1:KY$=SPACE$(LK+1):INS=0:COLOR ,0:LOCATE Y1,X1-LEN(O$):PRINT SPACE$(LEN(O$)+LK+1):KY=0:SG=0:O$="":RETURN
20130 IF LEN(KY$(KY))<>2 OR RIGHT$(KY$(KY),1)<>CHR$(83) THEN 20150
20140 INS=0:FOR I=KY TO LK:LOCATE Y1,X1+I:PRINT CHR$(SCREEN(Y1,X1+1+I)):NEXT:GOTO 20040
20150 IF LEN(KY$(KY))=2 AND RIGHT$(KY$(KY),1)=CHR$(82) THEN IF INS THEN INS=0:GOTO 20040 ELSE INS=1:GOTO 20040
20160 IF LEN(KY$(KY))=2 AND RIGHT$(KY$(KY),1)=CHR$(75) THEN KY=KY-1:INS=0:IF KY<0 THEN KY=LK:GOTO 20040 ELSE 20040
20170 IF LEN(KY$(KY))=1 AND KY$(KY)=CHR$(8) THEN KY=KY-1:IF KY<0 THEN KY=0:GOTO 20140 ELSE 20140
20180 IF LEN(KY$(KY))=2 AND RIGHT$(KY$(KY),1)=CHR$(77) THEN INS=0:KY=KY+1:GOTO 20040
20190 IF LEN(KY$(KY))<>1 THEN 20040 ELSE IF INS=0 THEN 20210 ELSE FOR I=LK TO KY STEP -1:LOCATE Y1,X1+I:PRINT CHR$(SCREEN(Y1,X1+I-1)):NEXT
20200 LOCATE Y1,X1+KY
20210 PRINT KY$(KY):KY=KY+1:GOTO 20040
20220 KO$="":FOR KY=0 TO LK:KO$=KO$+CHR$(SCREEN(Y1,X1+KY)):NEXT:OO$="":O$="":LK=0:RETURN
