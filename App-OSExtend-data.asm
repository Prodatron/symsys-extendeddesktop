;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@                                                                            @
;@               S y m b O S   S y s t e m   E x t e n s i o n                @
;@                              EXAMPLE INI FILE                              @
;@                                                                            @
;@             (c) 2005-2022 by Prodatron / SymbiosiS (Jörn Mika)             @
;@                                                                            @
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


nolist
READ "c:\archive\projekte\symbos\SVN-Main\trunk\SymbOS-Constants.asm"
write "e:\symbos\symbosxt.ini"

;### HEADER ###################################################################

dicarraut   db 0    ;1=auto arrange
dicarrgrd   db 4    ;grid type

            ds 256-$+dicarraut

;### START MENU ###############################################################

stmdatbeg
dw stmdatend-stmdatbeg

;entry type -> 0=line, 1=link (+text, +link, +workdirectory, +opentype), 2=special link (+text, +2B code; 0=inactive), 3=submenu (+1B index, +text)

stamen0     dw stamen0z-stamen0-1,0                                         ;length of whole block data, temp pointer to menu data record
stamen01    db stamen02-stamen01,3,5,"Favourites",0
stamen02    db stamen03-stamen02,0
stamen03    db stamen04-stamen03,3,2,"Programs",0
stamen04    db stamen05-stamen04,3,3,"Documents",0
stamen05    db stamen06-stamen05,3,1,"Settings",0
stamen06    db stamen07-stamen06,2,"Help",0,            MSC_SYS_SYSHLP,0
stamen07    db stamen08-stamen07,2,"Run...",0,          MSC_SYS_PRGSTA,0
stamen08    db stamen09-stamen08,0
stamen09    db stamen0a-stamen09,2,"Security...",0,     MSC_SYS_SYSSEC,0
stamen0a    db stamen0z-stamen0a,2,"Shut down...",0,    MSC_SYS_SYSQIT,0
stamen0z    db 0                                                            ;end marker

stamen1     dw stamen1z-stamen1-1,0
stamen11    db stamen12-stamen11,1,"Control panel",0,   "%cp.exe",0,0,0
stamen13    db stamen14-stamen13,0
stamen12    db stamen13-stamen12,1,"Display",0,         "%cpdisply.exe",0,0,0
stamen14    db stamen15-stamen14,1,"Date and Time",0,   "%cptime.exe",0,0,0
stamen15    db stamen16-stamen15,1,"Startmenu",0,       "%cpstartm.exe",0,0,0
stamen16    db stamen17-stamen16,0
stamen17    db stamen18-stamen17,2,"Load",0,            MSC_SYS_SYSCFG,0
stamen18    db stamen1z-stamen18,2,"Save",0,            MSC_SYS_SYSCFG,1
stamen1z    db 0

stamen2     dw stamen2z-stamen2-1,0
stamen21    db stamen22-stamen21,3,4,"Autostart",0
stamen22    db stamen23-stamen22,3,6,"Accessories",0
stamen23    db stamen24-stamen23,3,7,"Games",0
stamen24    db stamen25-stamen24,3,8,"Multimedia",0
stamen25    db stamen26-stamen25,3,9,"CPC specific",0
stamen26    db stamen27-stamen26,1,"SymCommander",0,    "%symcmder.exe",0,0,0
stamen27    db stamen2z-stamen27,1,"SymShell",0,        "%cmd.exe",0,0,0
stamen2z    db 0

stamen3     dw stamen3z-stamen3-1,0
stamen31    db stamen32-stamen31,1,"GATES.TXT",0,       "c:\gates.txt",0,0,0
stamen32    db stamen33-stamen32,1,"CALLONME.VID",0,    "c:\video\callonme.vid",0,0,0
stamen33    db stamen3z-stamen33,1,"FIRESEA.SGX",0,     "c:\graphics\fantasy\firesea.sgx",0,0,0
stamen3z    db 0

stamen4     dw stamen4z-stamen4-1,0
;stamen41    db stamen4z-stamen41,1,"Task Manager",0,    "%taskmgr.exe",0,0,0
stamen4z    db 0

stamen5     dw stamen5z-stamen5-1,0
;stamen51    db stamen52-stamen51,1,"Tetris",0,          "%apps\edoz\tetris.exe",0,0,0
;stamen52    db stamen5z-stamen52,1,"SymAmp",0,          "%appsyamp.exe",0,0,0
stamen5z    db 0

stamen6     dw stamen6z-stamen6-1,0
stamen61    db stamen62-stamen61,1,"Notepad",0,         "%apps\notepad.exe",0,0,0
stamen62    db stamen63-stamen62,1,"SymZilla",0,        "%apps\symzilla.exe",0,0,0
stamen63    db stamen64-stamen63,1,"Pocket Calculator",0,"%apps\calc.exe",0,0,0
stamen64    db stamen6z-stamen64,1,"Conways' Game of Life",0,"%apps\gamelife.exe",0,0,0
stamen6z    db 0

stamen7     dw stamen7z-stamen7-1,0
stamen71    db stamen72-stamen71,1,"MineSweeper",0,     "%apps\mineswep.exe",0,"test",0,0
stamen72    db stamen73-stamen72,1,"PacMan",0,          "%apps\pacman.exe",0,0,0
stamen73    db stamen74-stamen73,1,"Tetris",0,          "%apps\edoz\tetris.exe",0,0,0
stamen74    db stamen7z-stamen74,1,"4-in-a-row",0,      "%apps\edoz\sym4row.exe",0,0,0
stamen7z    db 0

stamen8     dw stamen8z-stamen8-1,0
stamen81    db stamen82-stamen81,1,"SymSee Picture",0,  "%apps\symsee.exe",0,0,0
stamen82    db stamen83-stamen82,1,"SymAmp Music",0,    "%apps\symamp.exe",0,0,0
stamen83    db stamen8z-stamen83,1,"SymPlay Video",0,   "%apps\symvideo.exe",0,0,0
stamen8z    db 0

stamen9     dw stamen9z-stamen9-1,0
stamen91    db stamen92-stamen91,1,"SymSnap",0,         "%apps\cpc\symsnap.exe",0,0,0
stamen92    db stamen93-stamen92,1,"Speech",0,          "%apps\cpc\speech.exe",0,0,0
stamen93    db stamen94-stamen93,1,"DiskDeDumper",0,    "%apps\dskddump.exe",0,0,0
stamen94    db stamen9z-stamen94,1,"SYMBiFACE II Rom Manager",0,"%apps\cpc\rommanag.exe",0,0,0
stamen9z    db 0

            dw 0

stmdatend

;### ICONS ####################################################################

icndatbeg
dw icndatend-icndatbeg

dw icntetpth0-icntettx1+2+4
dw 0,0
icntettx1   db "Tetris":    ds 12-6
icntettx2   db "Game":      ds 12-4
            db 6,24,24
            db #00,#00,#00,#00,#00,#00,#FF,#FF,#FF,#FF,#80,#00,#8F,#0F,#0F,#1F,#80,#00,#8F,#0F,#0F,#1F,#80,#00,#9E,#F0,#87,#1F,#80,#00,#9E,#10,#8F,#1F,#80,#00,#9E,#B0,#9F,#FF,#80,#00,#9E,#E0,#AE,#12,#80,#00
            db #9E,#73,#BF,#FE,#B0,#00,#9F,#CE,#E2,#7E,#C2,#80,#8F,#4D,#66,#7E,#8D,#80,#8F,#6A,#2A,#7E,#1B,#80,#8F,#EA,#62,#7E,#95,#80,#BF,#CE,#A2,#7E,#42,#E0,#AF,#05,#62,#7E,#85,#14,#BD,#EE,#3A,#F1,#1A,#FE
            db #BD,#FD,#05,#05,#36,#FE,#BD,#CA,#79,#3A,#82,#F6,#9E,#E7,#F7,#35,#DD,#E0,#F0,#D6,#FF,#39,#FF,#C0,#00,#56,#F9,#FC,#F7,#80,#00,#56,#91,#EC,#73,#80,#00,#30,#10,#EC,#30,#00,#00,#00,#10,#E0,#00,#00
icntetpth   db "c:\symbos\apps\edoz\tetris.exe",0,0,0:icntetpth0

dw icntskpth0-icntsktx1+2+4
dw 0,44
icntsktx1   db "Task":      ds 12-4
icntsktx2   db "Manager":   ds 12-7
db 12,24,24:dw $+7:dw $+4,12*24:db 5
db #88,#88,#88,#88,#88,#88,#88,#88,#88,#88,#88,#88,#88,#88,#81,#11,#11,#11,#11,#11,#11,#11,#11,#88,#88,#88,#1D,#DD,#DD,#DD,#DD,#DD,#DD,#DD,#61,#38,#88,#81,#DD,#DD,#DD,#DD,#DD,#DD,#DD,#D6,#11,#38
db #88,#16,#66,#66,#66,#66,#66,#66,#66,#61,#11,#38,#88,#16,#D1,#55,#55,#55,#55,#55,#51,#D1,#11,#38,#88,#16,#D5,#55,#55,#55,#55,#55,#55,#D1,#11,#38,#88,#16,#D5,#55,#55,#55,#55,#55,#55,#D1,#11,#38
db #88,#16,#D5,#55,#5A,#55,#55,#55,#55,#D1,#11,#38,#88,#16,#D5,#55,#A5,#A5,#55,#55,#55,#D1,#11,#38,#88,#16,#D1,#AA,#55,#5A,#55,#5A,#A1,#D1,#11,#38,#88,#16,#D5,#55,#55,#55,#A5,#A5,#55,#D1,#11,#38
db #88,#16,#D5,#55,#55,#55,#5A,#55,#55,#D1,#11,#38,#88,#16,#D5,#55,#55,#55,#55,#55,#55,#D1,#11,#38,#88,#16,#D1,#55,#55,#55,#55,#55,#51,#D1,#11,#38,#88,#16,#DD,#DD,#DD,#DD,#DD,#DD,#DD,#D1,#13,#18
db #88,#11,#11,#11,#11,#11,#11,#11,#11,#11,#31,#13,#83,#33,#33,#33,#33,#33,#33,#33,#33,#33,#11,#13,#1D,#DD,#DD,#DD,#DD,#DD,#DD,#DD,#DD,#DD,#11,#13,#1D,#66,#66,#66,#66,#66,#66,#66,#66,#66,#11,#13
db #1D,#61,#16,#6F,#FF,#FF,#66,#FF,#FF,#F6,#11,#13,#1D,#66,#66,#66,#66,#16,#66,#66,#61,#66,#11,#38,#11,#11,#11,#11,#11,#11,#11,#11,#11,#11,#13,#88,#83,#33,#33,#33,#33,#33,#33,#33,#33,#33,#38,#88
db "c:\symbos\taskmgr.exe",0,0,0:icntskpth0

dw icnseepth0-icnseetx1+2+4
dw 0,88
icnseetx1 db "SymSee":      ds 12-6
icnseetx2 db "Viewer":      ds 12-6
db 12,24,24:dw $+7:dw $+4,12*24:db 5
db #00,#00,#00,#00,#0E,#0E,#EE,#EE,#EE,#EE,#EE,#EE,#0E,#EE,#EE,#33,#EE,#EE,#EE,#EE,#EE,#EE,#EE,#EE,#E0,#E0,#EE,#EE,#33,#33,#3E,#EE,#EE,#EE,#EE,#EE,#EE,#EE,#EE,#EE,#EE,#EE,#E3,#33,#3E,#EE,#EE,#EE
db #33,#E3,#3E,#3E,#EE,#EE,#EE,#EE,#33,#33,#EE,#EE,#33,#33,#33,#33,#3E,#EE,#EE,#EE,#EE,#EE,#3E,#EE,#33,#33,#31,#13,#33,#33,#EE,#EE,#EE,#EE,#33,#E3,#11,#11,#1E,#11,#11,#11,#11,#1E,#EE,#EE,#0E,#33
db #08,#88,#88,#33,#66,#66,#11,#11,#11,#EE,#E0,#E3,#88,#88,#8E,#36,#66,#63,#33,#33,#31,#11,#E0,#00,#88,#88,#8E,#36,#66,#33,#33,#33,#36,#61,#11,#E0,#08,#88,#8E,#36,#66,#33,#11,#33,#36,#66,#31,#1E
db #18,#88,#8E,#36,#66,#11,#11,#33,#66,#66,#3E,#11,#1E,#88,#80,#36,#66,#61,#13,#33,#66,#63,#38,#81,#11,#E8,#88,#33,#66,#66,#16,#66,#66,#63,#E8,#88,#11,#1E,#88,#03,#E6,#66,#66,#66,#66,#63,#08,#88
db #3E,#31,#10,#8E,#3E,#66,#66,#66,#66,#3E,#88,#88,#EE,#E3,#11,#10,#E1,#16,#66,#6E,#33,#E8,#88,#88,#EE,#EE,#33,#11,#11,#11,#33,#33,#30,#88,#88,#88,#EE,#EE,#EE,#E3,#33,#31,#11,#E0,#88,#88,#88,#88
db #3E,#EE,#EE,#EE,#33,#33,#31,#11,#11,#11,#E1,#E1,#EE,#EE,#EE,#EE,#EE,#33,#33,#33,#33,#31,#11,#11,#EE,#EE,#EE,#EE,#EE,#EE,#EE,#E3,#33,#33,#33,#33,#EE,#EE,#EE,#EE,#EE,#EE,#EE,#EE,#EE,#EE,#EE,#33
db "c:\symbos\apps\symsee.exe",0,"c:\graphics\",0,3:icnseepth0

dw icncmdpth0-icncmdtx1+2+4
dw 104,44
icncmdtx1 db "Sym-":        ds 12-4
icncmdtx2 db "Commander":   ds 12-9
db 12,24,24:dw $+7:dw $+4,12*24:db 5
db #88,#88,#88,#88,#88,#88,#88,#88,#88,#88,#88,#88,#88,#11,#11,#1D,#88,#88,#88,#88,#88,#88,#88,#88,#81,#CC,#CC,#C1,#D8,#88,#11,#11,#11,#88,#88,#88,#1C,#CC,#CC,#CC,#11,#11,#CC,#CC,#C1,#D8,#88,#88
db #1C,#CC,#CC,#CC,#CC,#CC,#CC,#CC,#C1,#D8,#88,#88,#1C,#CC,#CC,#CC,#CC,#CC,#CC,#CC,#C1,#D1,#11,#18,#1C,#CC,#CC,#13,#33,#1C,#CC,#C1,#11,#1C,#CC,#1D,#1C,#CC,#C3,#CC,#4C,#C3,#11,#1C,#CC,#CC,#C1,#D8
db #1C,#CC,#34,#C4,#C4,#C4,#3C,#CC,#CC,#CC,#C1,#D8,#1C,#C1,#CC,#4C,#4C,#4C,#C1,#CC,#CC,#CC,#1D,#88,#1C,#C3,#C4,#C4,#C4,#C4,#C3,#CC,#CC,#CC,#1D,#88,#1C,#C3,#4C,#44,#4C,#4C,#43,#CC,#CC,#C1,#D8,#88
db #1C,#C3,#C4,#44,#44,#C4,#C3,#CC,#CC,#C1,#D8,#88,#1C,#C1,#CC,#44,#4C,#4C,#C1,#CC,#CC,#1D,#88,#88,#1C,#C1,#34,#C4,#C4,#C4,#3C,#CC,#CC,#1D,#88,#88,#1C,#C1,#C3,#CC,#4C,#C3,#33,#CC,#C1,#D8,#88,#88
db #1C,#1C,#CC,#13,#33,#1C,#31,#1C,#C1,#D8,#88,#88,#11,#1C,#CC,#CC,#CC,#CC,#31,#11,#3D,#88,#88,#88,#11,#CC,#CC,#CC,#C1,#11,#13,#11,#18,#88,#88,#88,#81,#CC,#C1,#11,#1D,#DD,#D8,#31,#11,#88,#88,#88
db #81,#11,#1D,#DD,#D8,#88,#88,#83,#11,#18,#88,#88,#88,#8D,#D8,#88,#88,#88,#88,#88,#31,#11,#88,#88,#88,#88,#88,#88,#88,#88,#88,#88,#83,#13,#38,#88,#88,#88,#88,#88,#88,#88,#88,#88,#88,#33,#88,#88
db "c:\symbos\symcmder.exe",0,"c:\",0,1:icncmdpth0

dw icnnpdpth0-icnnpdtx1+2+4
dw 52,0
icnnpdtx1 db "Notepad":     ds 12-7
icnnpdtx2 db "Editor":      ds 12-6
db 12,24,24:dw $+7:dw $+4,12*24:db 5
db #88,#88,#88,#88,#DD,#8D,#D8,#DD,#8D,#D8,#DD,#88,#88,#88,#88,#8D,#8D,#D8,#DD,#8D,#D8,#DD,#8D,#D8,#88,#88,#88,#54,#D4,#4D,#44,#D4,#4D,#44,#D4,#77,#88,#88,#88,#54,#44,#44,#44,#44,#44,#44,#44,#77
db #88,#88,#85,#44,#44,#44,#44,#44,#44,#44,#45,#17,#88,#88,#85,#44,#44,#44,#44,#44,#44,#44,#45,#17,#88,#88,#54,#44,#FF,#FF,#FF,#FF,#F4,#44,#50,#17,#88,#88,#54,#44,#44,#44,#44,#44,#44,#44,#51,#17
db #88,#85,#44,#45,#55,#55,#55,#55,#44,#45,#00,#17,#88,#85,#44,#44,#44,#44,#44,#44,#44,#45,#00,#17,#88,#54,#44,#55,#55,#55,#55,#54,#44,#51,#11,#17,#88,#54,#44,#44,#44,#44,#44,#44,#44,#50,#06,#17
db #85,#44,#44,#44,#44,#44,#44,#44,#45,#00,#06,#17,#85,#44,#44,#44,#44,#44,#44,#44,#45,#11,#11,#17,#54,#44,#44,#44,#44,#44,#44,#44,#50,#00,#66,#17,#54,#44,#44,#44,#44,#44,#44,#44,#50,#00,#66,#17
db #85,#55,#55,#55,#55,#55,#55,#55,#11,#11,#11,#17,#88,#88,#88,#70,#00,#00,#00,#00,#00,#06,#66,#17,#88,#88,#88,#70,#00,#00,#00,#00,#00,#06,#66,#17,#88,#88,#88,#71,#11,#11,#11,#11,#11,#11,#11,#17
db #88,#88,#88,#70,#00,#00,#00,#00,#00,#66,#66,#17,#88,#88,#88,#76,#66,#66,#66,#66,#66,#66,#61,#17,#88,#88,#88,#87,#11,#11,#11,#11,#11,#11,#11,#78,#88,#88,#88,#88,#77,#77,#77,#77,#77,#77,#77,#88
db "c:\symbos\apps\notepad.exe",0,0,2:icnnpdpth0

dw icnminpth0-icnmintx1+2+4
dw 52,44
icnmintx1 db "Mine-":       ds 12-5
icnmintx2 db "Sweeper":     ds 12-7
db 12,24,24:dw $+7:dw $+4,12*24:db 5
db #88,#88,#88,#88,#88,#18,#81,#88,#88,#88,#88,#88,#88,#88,#88,#88,#11,#11,#11,#11,#88,#88,#88,#88,#88,#11,#88,#11,#00,#00,#00,#CC,#11,#88,#11,#88,#81,#1F,#11,#00,#00,#C0,#0C,#00,#CC,#11,#F1,#18
db #81,#11,#10,#0C,#CC,#D0,#CC,#DC,#CC,#11,#11,#18,#88,#11,#00,#C0,#0D,#CC,#CC,#CC,#DC,#C1,#11,#88,#88,#10,#00,#0C,#CC,#CC,#CC,#CC,#DD,#C1,#11,#88,#88,#10,#CC,#CC,#CD,#DC,#CD,#DC,#1D,#C1,#11,#88
db #81,#00,#CD,#CC,#DD,#DD,#DD,#DD,#CD,#1D,#11,#18,#81,#0C,#00,#CD,#CC,#11,#1D,#DD,#DD,#DD,#11,#18,#11,#CC,#0D,#CD,#D1,#00,#D1,#DD,#DD,#1D,#11,#11,#81,#00,#DC,#DD,#D1,#00,#D1,#1D,#1D,#D1,#11,#1D
db #11,#C0,#0C,#CD,#D1,#DD,#11,#11,#D1,#D1,#11,#11,#11,#C0,#CC,#CD,#DD,#11,#11,#11,#DD,#1D,#11,#11,#81,#1C,#CC,#DD,#DD,#D1,#11,#11,#1D,#11,#11,#18,#81,#1D,#CC,#D1,#D1,#D1,#11,#11,#D1,#D1,#11,#18
db #88,#11,#D1,#DD,#1D,#1D,#D1,#1D,#11,#11,#11,#88,#88,#11,#1D,#11,#D1,#D1,#DD,#11,#D1,#11,#11,#88,#88,#81,#11,#1D,#11,#D1,#11,#11,#11,#11,#18,#88,#88,#81,#11,#11,#11,#11,#11,#11,#11,#11,#18,#88
db #88,#1F,#11,#11,#11,#11,#11,#11,#11,#11,#F1,#88,#88,#11,#11,#11,#11,#11,#11,#11,#11,#11,#11,#88,#88,#81,#18,#88,#11,#11,#11,#11,#88,#81,#18,#88,#88,#88,#88,#88,#88,#11,#D1,#88,#88,#88,#88,#88
db "c:\symbos\apps\mineswpr.exe",0,0,0:icnminpth0

dw icnlifpth0-icnliftx1+2+4
dw 52,88
icnliftx1 db "Game Of":     ds 12-7
icnliftx2 db "Life":        ds 12-4
db 12,24,24:dw $+7:dw $+4,12*24:db 5
db #FF,#F3,#FF,#F3,#FF,#F3,#FF,#F3,#FF,#F3,#FF,#F3,#F3,#33,#F3,#33,#F3,#33,#F3,#33,#F3,#33,#F3,#33,#F3,#33,#F3,#33,#F3,#33,#F3,#33,#F3,#33,#F3,#33,#33,#33,#33,#33,#33,#33,#33,#33,#33,#33,#33,#33
db #FF,#F3,#AA,#A9,#AA,#A9,#FF,#F3,#FF,#F3,#FF,#F3,#F3,#33,#A9,#99,#A9,#99,#F3,#33,#F3,#33,#F3,#33,#F3,#33,#A9,#99,#A9,#99,#F3,#33,#F3,#33,#F3,#33,#33,#33,#99,#99,#99,#99,#33,#33,#33,#33,#33,#33
db #FF,#F3,#AA,#A9,#FF,#F3,#AA,#A9,#FF,#F3,#FF,#F3,#F3,#33,#A9,#99,#F3,#33,#A9,#99,#F3,#33,#F3,#33,#F3,#33,#A9,#99,#F3,#33,#A9,#99,#F3,#33,#F3,#33,#33,#33,#99,#99,#33,#33,#99,#99,#33,#33,#33,#33
db #FF,#F3,#AA,#A9,#FF,#F3,#FF,#F3,#FF,#F3,#AA,#A9,#F3,#33,#A9,#99,#F3,#33,#F3,#33,#F3,#33,#A9,#99,#F3,#33,#A9,#99,#F3,#33,#F3,#33,#F3,#33,#A9,#99,#33,#33,#99,#99,#33,#33,#33,#33,#33,#33,#99,#99
db #FF,#F3,#FF,#F3,#FF,#F3,#AA,#A9,#AA,#A9,#FF,#F3,#F3,#33,#F3,#33,#F3,#33,#A9,#99,#A9,#99,#F3,#33,#F3,#33,#F3,#33,#F3,#33,#A9,#99,#A9,#99,#F3,#33,#33,#33,#33,#33,#33,#33,#99,#99,#99,#99,#33,#33
db #FF,#F3,#FF,#F3,#FF,#F3,#FF,#F3,#FF,#F3,#FF,#F3,#F3,#33,#F3,#33,#F3,#33,#F3,#33,#F3,#33,#F3,#33,#F3,#33,#F3,#33,#F3,#33,#F3,#33,#F3,#33,#F3,#33,#33,#33,#33,#33,#33,#33,#33,#33,#33,#33,#33,#33
db "c:\symbos\apps\gamelife.exe",0,0,0:icnlifpth0

dw icnchtpth0-icnchttx1+2+4
dw 156,0
icnchttx1 db "SymChat":     ds 12-7
icnchttx2 db "Messenger":   ds 12-9
db 12,24,24:dw $+7:dw $+4,12*24:db 5
db #44,#44,#44,#44,#44,#44,#44,#99,#99,#44,#44,#44,#44,#44,#44,#99,#19,#44,#99,#11,#19,#94,#44,#44,#44,#44,#44,#91,#A1,#99,#91,#AA,#A1,#94,#44,#44,#44,#44,#44,#1A,#AA,#19,#1A,#AA,#A1,#94,#44,#44
db #44,#44,#49,#1A,#AA,#19,#1A,#AA,#19,#94,#44,#44,#44,#44,#44,#91,#AA,#19,#1A,#AA,#19,#99,#44,#44,#44,#94,#19,#99,#1A,#19,#1A,#AA,#19,#11,#11,#94,#49,#91,#A1,#19,#91,#19,#1A,#11,#91,#AA,#AA,#14
db #49,#1A,#AA,#A1,#99,#99,#91,#99,#11,#AA,#AA,#19,#99,#1A,#AA,#A1,#99,#91,#19,#91,#AA,#AA,#A1,#94,#91,#AA,#AA,#AA,#19,#1C,#C1,#91,#AA,#11,#19,#94,#49,#11,#11,#11,#11,#CC,#CC,#19,#11,#99,#99,#44
db #44,#99,#11,#FF,#F1,#CC,#CC,#19,#11,#11,#11,#94,#44,#91,#FF,#FF,#F1,#1C,#C1,#91,#AA,#AA,#AA,#19,#44,#1F,#FF,#FF,#F1,#99,#99,#91,#AA,#AA,#AA,#19,#44,#1F,#FF,#F1,#11,#19,#11,#11,#1A,#AA,#AA,#19
db #44,#91,#11,#19,#1A,#A1,#1A,#AA,#11,#11,#11,#99,#44,#49,#99,#91,#AA,#A1,#1A,#AA,#19,#99,#99,#94,#44,#44,#49,#1A,#AA,#A1,#1A,#AA,#19,#99,#99,#44,#44,#44,#49,#1A,#AA,#A1,#91,#A1,#99,#44,#44,#44
db #44,#44,#49,#1A,#A1,#19,#99,#11,#94,#44,#44,#44,#44,#44,#49,#1A,#A1,#99,#99,#99,#94,#44,#44,#44,#44,#44,#44,#11,#11,#99,#44,#49,#44,#44,#44,#44,#44,#44,#44,#44,#99,#94,#44,#44,#44,#44,#44,#44
db "c:\symbos\apps\chat.exe",0,0,0:icnchtpth0

dw icncalpth0-icncaltx1+2+4
dw 104,0
icncaltx1 db "Pocket":      ds 12-6
icncaltx2 db "Calculator":  ds 12-10
db 12,24,24:dw $+7:dw $+4,12*24:db 5
db #11,#11,#11,#11,#11,#11,#11,#11,#11,#11,#11,#11,#16,#66,#66,#66,#66,#66,#66,#66,#66,#66,#66,#61,#16,#66,#66,#66,#66,#66,#66,#66,#66,#66,#66,#61,#16,#77,#77,#77,#77,#77,#77,#77,#77,#77,#7D,#61
db #16,#70,#00,#00,#10,#10,#10,#11,#10,#00,#0D,#61,#16,#70,#00,#00,#11,#10,#10,#10,#10,#00,#0D,#61,#16,#70,#00,#00,#00,#10,#10,#11,#10,#01,#0D,#61,#16,#7D,#DD,#DD,#DD,#DD,#DD,#DD,#DD,#DD,#DD,#61
db #16,#66,#66,#66,#66,#66,#66,#66,#66,#66,#66,#61,#16,#66,#66,#66,#66,#66,#66,#66,#66,#66,#66,#61,#16,#11,#56,#11,#56,#11,#56,#66,#66,#FF,#F6,#61,#16,#15,#54,#15,#54,#15,#54,#66,#66,#FF,#FE,#61
db #16,#64,#44,#64,#44,#64,#44,#66,#66,#6E,#EE,#61,#16,#66,#66,#66,#66,#66,#66,#66,#66,#66,#66,#61,#16,#11,#56,#11,#56,#11,#56,#66,#A6,#A6,#A6,#61,#16,#15,#54,#15,#54,#15,#54,#66,#66,#66,#66,#61
db #16,#64,#44,#64,#44,#64,#44,#66,#A6,#A6,#A6,#61,#16,#66,#66,#66,#66,#66,#66,#66,#66,#66,#66,#61,#16,#11,#56,#11,#56,#11,#56,#66,#A6,#A6,#A6,#61,#16,#15,#54,#15,#54,#15,#54,#66,#66,#66,#66,#61
db #16,#64,#44,#64,#44,#64,#44,#66,#66,#66,#66,#61,#16,#66,#66,#66,#66,#66,#66,#66,#66,#66,#66,#61,#16,#66,#66,#66,#66,#66,#66,#66,#66,#66,#66,#61,#DD,#DD,#DD,#DD,#DD,#DD,#DD,#DD,#DD,#DD,#DD,#DD
db "c:\symbos\apps\calc.exe",0,0,0:icncalpth0

dw 0
icndatend

wdgdatbeg   ;widget data
dw wdgdatend-wdgdatbeg

wdgdat1 dw wdgdat10-wdgdat1
        db 0        ;process ID (temporary)
        dw 200,20   ;position
        db 1,4      ;selected size, number of available sizes
        db 0        ;flags (+1=property dialogue available)
        dw 32,32,48,32,32,48,48,48,00,00,00,00,00,00,00,00  ;size list
        db "c:\symbos\widgets\test.wdg",0:wdgdat10

wdgdat2 dw wdgdat20-wdgdat2
        db 0        ;process ID (temporary)
        dw 100,100  ;position
        db 0        ;selected size
db 8            ;number of sizes
db 1            ;flags (+1=property dialogue available)
dw  99,33       ;size list
dw  99,44
dw  99,44
dw  99,53
dw 151,33
dw 151,44
dw 151,44
dw 151,53
        db "c:\symbos\widgets\clock.wdg",0:wdgdat20

dw 0
wdgdatend
