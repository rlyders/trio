BASCOM %1; /O /V /E /X
LINK %1,,NUL,B:;
COPY %1.EXE C:
COPY TC.BAT C:
C:
PAUSE PLACE `%1.EXE' DISK IN A: AND `%1.EXE BACKUP DISK IN B:
COPY C:%1.EXE A:
COPY C:%1.EXE B:
                                   :
                                   
  