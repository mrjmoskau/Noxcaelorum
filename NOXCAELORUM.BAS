'' This is an old program I have never been able to run before
'' It needed some conversion to work with FreeBasic, but it works now
'' It needs a LOT of work to fix it up, add some limitations, limit the size (for example,
'' you can actually go out of the map), and program the actual steps that are described in the 
'' article.
'' 2024/03/17 - Procrastination Edition - I'm going to work on getting this... uh... working in Gambas, since FreeBasic is not well supported on the Raspberry Pi.

#lang "fblite"

DIM as Integer Z, NI, X, Y, D, T, B, PV, PM, PF, CA
DIM as Single F, C, N
DIM as String A
PRINT "TAPEZ UN NOMBRE (000 - 999) ";
INPUT Z
PRINT "DIFFICULTE (5 A 50) ";
INPUT NI
PRINT "POSITION EN X ";
INPUT X
PRINT "POSITION EN Y ";
INPUT Y
PRINT "DIRECTION : 1=NORD/2=EST/3=SUD/4=OUEST"
D = Z
F = Z + (1 / Z)
C = SQR (Z)
Z = F * C
Z = TAN (Z) * 100
Z = ABS (INT (Z) - (Z)) * 100
Z = INT (Z / 10)
170:
PRINT "+---------------------------+" 
PRINT "POSITION X= ";X;"    Y= ";Y
PRINT "+---------------------------+"
INPUT "ACTION ----->",DI
T = T + 1
IF DI = 1 THEN Y = Y + 1
IF DI = 2 THEN X = X + 1
IF DI = 3 THEN Y = Y - 1
IF DI = 4 THEN X = X - 1
B = INT (ABS ( SIN (D * (X + Y))) * 5)
C = ABS (COS ((X * Y) + (T * D))) * 1000
C = INT (C):C = C / 1000
N = X + Y
IF N = Z AND T > NI THEN B = 7
N = B + C
PRINT "VALEUR--->"; N
IF INT (N) <> 2 THEN GOTO 170
IF INT (N) = 2 THEN PRINT "CHASSE (O/N)";: INPUT A$
IF A = "O" THEN GOTO 380
GOTO 170
PT = INT (RND (1) * 100)
380:
PRINT "COMBIEN DE PV "; 
INPUT PV
PRINT "COMBIEN DE PM ";
INPUT PM
PRINT "COMBIEN DE PF ";
INPUT PF
PRINT "COMBIEN DE CA ";
INPUT CA
PRINT "QUELLE ARME "
PRINT "TAPER LE NOM OU 0 SI AUCUNE"
INPUT A
IF ASC(A) = 65 THEN BN = 40
IF ASC(A) = 67 THEN BN = 20
IF ASC(A) = 80 THEN BN = 10
PT = (PM + PV + PE + 100 + BN ) / CA + .1
FOR I = 1 TO PV: PRINT ".": NEXT I
RT = INT ( RND (1) * 100)
IF RT <= PT THEN PRINT "TOUCHE ! +"; INT (RT / 2.5);" PV OU PM":GOTO 590
PRINT "RATE !"
PRINT : PRINT
590:
GOTO 170 
