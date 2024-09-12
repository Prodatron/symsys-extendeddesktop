;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@                                                                            @
;@               S y m b O S   S y s t e m   E x t e n s i o n                @
;@                                                                            @
;@             (c) 2005-2022 by Prodatron / SymbiosiS (Jörn Mika)             @
;@                                                                            @
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

;todo
;- ausführen -> startparameter anhängen
;- letzte documente automatisch hinzufügen

;bugs
;- widgets speichern falsch, bei neustart müll
;- cpc -> manchmal crash bei startmenu editor (oder war M4 problem??)
;- cpc -> manchmal crash nach speichern und neu-boot

;- icontext farbübernahme nicht vom CP ausgelöst
;- kein autosave bei shutdown


;--- PROGRAM ------------------------------------------------------------------
;### PRGPRZ -> Application process
;### PRGINI -> init advanced desktop
;### PRGERR -> Error-Fenster anzeigen

;--- CONFIG-ROUTINES ----------------------------------------------------------
;### CFGPTH -> Generates config path
;### CFGSAV -> save config data
;### CFGLOD -> load config data
;### CFGIMP -> imports icons and startmenu entries from the classic configuration
;### PRGPAR -> Startpfad auswerten

;--- SUB-ROUTINES -------------------------------------------------------------
;### MSGGET -> check for message for application
;### MSGDSK -> wait for a message from the desktop manager
;### MSGSND -> send message to desktop process
;### MSGSYS -> sends message to system manager process
;### MSGMEN -> opens a context menu and returns result, if succesfull
;### CLCM16 -> Multipliziert zwei Werte (16bit)
;### CLCD16 -> Dividiert zwei Werte (16bit)
;### CLCD32 -> Dividiert zwei Werte (32bit)
;### CLCDEZ -> Rechnet Byte in zwei Dezimalziffern um
;### CLCN32 -> Wandelt 32Bit-Zahl in ASCII-String um (mit 0 abgeschlossen)
;### CLCUCS -> Wandelt Klein- in Großbuchstaben um
;### CLCLCS -> Wandelt Groß- in Kleinbuchstaben um
;### STRINP -> Initialisiert Textinput (abhängig vom String, den es bearbeitet)
;### STRLEN -> Ermittelt Länge eines Strings
;### STRSKP -> skips text string (behind 0-terminator)
;### SYSCHK -> get computer type and adjust logo
;### SYSOPN -> Lock desktop and open window
;### SYSCLO -> Close window and unlock desktop
;### SELOPN -> starts a "file selection" session
;### MEMCHK -> checks, if enough memory available

;--- EXTENDED STARTMENU -------------------------------------------------------
;### MENCLK -> ...

;--- EXTENDED DESKTOP ---------------------------------------------------------
;### DSKCLK -> ...
;### DSKREF -> ...
;### DSKPRP -> ...
;### DSKBGR -> ...

;--- ICON GUI ROUTINES --------------------------------------------------------
;### DICDEL -> icon delete
;### DICCUT -> Cuts desktop icon
;### DICCOP -> Copies desktop icon
;### DICREN -> Renames desktop icon
;### DICNEW -> New shortcut
;### DICPRP -> Show and edit icon properties
;### DICSHC -> Create shortcut
;### DICPST -> Paste icon
;### DICLUP -> line up icons
;### DICARR -> arrange icons
;### DICINH -> Inits icon header
;### DICINF -> get file infos

;--- LINE UP ROUTINES ---------------------------------------------------------
;### LUPCOL -> collision detection
;### LUPALN -> align position
;### LUPFRE -> find free icon position
;### LUPALL -> line up all icons

;--- SYSTEM EXTENSIONS ROUTINES -----------------------------------------------
;### SYSSEC -> Dialog für System-Sicherheit öffnen
;### SYSPWD -> Dialog zum Ändern des Paßwortes öffnen
;### SECWINx -> Aktionen im Security-Fenster ausführen
;### PASWINx -> Aktionen im Passwort-Ändern Fenster ausführen
;### LOKWIN -> Aktionen im Lock-Fenster ausführen

;--- STARTMENU MANAGEMENT ROUTINES --------------------------------------------
;### STMADR -> get menu block address
;### STMAUT -> executes all autostart entries
;### STMINI -> generates menu data records from config data
;### STMDAT -> [remote] sends startmenu address/bank to process
;### STMCOP -> [remote] moves memory area
;### STMIIN -> [remote] reinits startmenu and icons

;--- ICON MANAGEMENT ROUTINES -------------------------------------------------
;### ICNADR -> returns data addresse of an icon
;### ICNINI -> inits icons (init window controls, set colours and transfer data pointers to data area)
;### ICNRSZ -> resizes icon data
;### ICNDEL -> deletes icon
;### ICNCOP -> copies icon into the clipboard
;### ICNNEW -> reserves memory for new icon
;### ICNFIL -> gets icon from file
;### ICNLOD -> loads icon from ICN-file

;--- WIDGET ROUTINES ----------------------------------------------------------
;### WDGINI -> init and load widgets
;### WDGSIZ -> sends size message to widget
;### WDGOKY -> resize response from widget
;### WDGPRC -> finds widget via its process ID
;### WDGADR -> returns data addresse of a widget
;### WDGREC -> gets widget control data record
;### WDGDIS -> disables a widget control
;### WDGNEW -> New widget
;### WDGMOV -> moves a widget
;### WDGDEL -> deletes a widget
;### WDGPRP -> open widgets property dialogue
;### WDGRSZ -> resizes a widget



;==============================================================================
;### CODE AREA ################################################################
;==============================================================================

tmpbuf  ds 768

;### PRGPRZ -> Application process
sysspcw     db 0    ;main window ID
syspwd0     db "SYMBOS",0
bnknumput   db 0
cfgbnk      dw 0
cfgadr      dw 0
symextwin   db 0    ;desktop window ID
symextbnk   db 0    ;bank of the old desktop window

dicprpw db 0:dw dicprc      ;window id NEW ICON
dicneww db 0:dw dicnewx     ;window id EDIT ICON
wdgneww db 0:dw wdgnewx     ;window id NEW WIDGET

prgprz  call syschk
        call prgpar
        call cfglod
        call dicarri

        ld e,7                  ;*** get username + password
        ld hl,jmp_sysinf
        rst #28                 ;DE=System, IX=Data, IYL=Bank
        call bnkdst
        db #fd:add l
        push af
        rlca:rlca:rlca:rlca
        ld (cfgbnk),a
        pop af
        push ix
        pop hl
        ld bc,3432+99+320
        add hl,bc
        ld (cfgadr),hl
        ld de,syspwda
        ld bc,33
        rst #20:dw jmp_bnkcop
        ld a,(syspwda)
        or a
        jr nz,prgini1
        ld hl,syspwd0           ;no username -> use default
        ld de,syspwda
        ld bc,16
        ldir

prgini1 call stmini0                ;*** PLACE EXTENDED STARTMENU
        ld e,7
        ld hl,jmp_sysinf                        ;##!!## AB HIER FALSCHE BANKEN/ADRESSEN bei EP-G9K
        rst #28                 ;IYL=Databank
        db #fd:ld a,l
        push af
        ld e,8
        ld hl,jmp_sysinf
        rst #28
        pop af
        push iy
        pop hl
        ld de,32
        add hl,de               ;hl=pointer to desktop extended vars
        rst #20:dw jmp_bnkrwd
        ld l,c
        ld h,b                  ;hl=desktop extended vars
        ld (dskvaradr),hl
        xor a
        rst #20:dw jmp_bnkrbt   ;read old bank
        dec hl
        ld a,b
        ld (symextbnk),a
        xor a
        ld bc,(App_BnkNum-1)
        rst #20:dw jmp_bnkwbt   ;write new bank
        ld bc,stmrec
        rst #20:dw jmp_bnkwwd   ;write startmenu address
        call stminix

prgini2 call dskbgr0                ;*** PLACE EXTENDED DESKTOP
        call msgsnd             ;send dummy confirmation (only for MSX ##!!## why?)
        ld de,dskbgrwin
        ld a,(App_BnkNum)
        call SyDesktop_WINOPN   ;open extended desktop window
        ld (symextwin),a
        ld hl,(dskvaradr)
        ld bc,symextwin1
        add hl,bc
        ld b,a
        xor a
        rst #20:dw jmp_bnkwbt

        call stmaut                 ;*** AUTOSTART
        call wdgini                 ;*** LOAD WIDGETS (should be last before message check)

prgprz0 call msgget             ;*** CHECK FOR MESSAGES
        jr nc,prgprz0
prgprz5 ld b,a
        ld a,PRC_ID_SYSTEM
        db #dd:cp h
        jr z,prgprz1
        ld a,PRC_ID_DESKTOP
        db #dd:cp h
        ld a,b
        jr nz,prgprz6
        cp MSR_DSK_EXTDSK       ;* extended desktop command
        jp z,prgprz4
        cp MSR_DSK_WCLICK       ;* window has been clicked?
        jr nz,prgprz0
        ld hl,(App_MsgBuf+1)
        ld a,(symextwin)        ;ignore desktop window
        cp l
        jr z,prgprz0
        ld a,h                  ;other windows -> check what exactly
        cp DSK_ACT_CLOSE
        jr nz,prgprz2
        ld ix,dicprpw
        ld b,3
        ld de,3
        ld a,(App_MsgBuf+1)
prgprz7 ld l,(ix+1)
        ld h,(ix+2)
        ld (prgprz8+1),hl
        cp (ix+0)
prgprz8 jp z,0
        add ix,de
        djnz prgprz7
        ld a,(syssecf)          ;* close only, if security window is open
        or a
        jr z,prgprz0
        jp secwin5
prgprz2 cp DSK_ACT_CONTENT      ;* content clicked
        jr nz,prgprz0
        ld hl,(App_MsgBuf+8)
        ld a,l
        or h
        jr z,prgprz0
        jp (hl)
prgprz1 ld a,b
        cp MSR_DSK_EXTDSK
        jp z,prgprz4
        cp MSR_SYS_SELOPN
        jp z,selopna
        cp 2
        jp c,syssec
        jp z,tsknxt
        cp 3
        jp z,tskprv
        jr prgprz0
prgprz6 cp MSR_DSK_EXTDSK
        jr nz,prgprz0

prgprz4 ld a,(App_MsgBuf+1)     ;* extended desktop/startmenu
        cp FNC_DXT_CFGLOD
        jp z,cfglod0
        cp FNC_DXT_CFGSAV
        jp z,cfgsav0
        cp FNC_DXT_MENCLK
        jp z,menclk
        cp FNC_DXT_DSKBGR
        jp z,dskbgr
        cp FNC_DXT_DSKCLK
        jp z,dskclk
        cp FNC_DXT_WDGOKY
        jp z,wdgoky
        cp FNC_DXT_STMDAT
        jp z,stmdat
        cp FNC_DXT_STMCOP
        jp z,stmcop
        cp FNC_DXT_STMIIN
        jp z,stmiin
        ;...
        jp prgprz0

;### PRGERR -> Error-Fenster anzeigen
;### Input      HL=data
prgerr  ld (App_MsgBuf+1),hl
        ld hl,(App_BnkNum)
        ld h,1
        ld (App_MsgBuf+3),hl
        ld a,MSC_SYS_SYSWRN
        ld (App_MsgBuf),a
        ld a,(App_PrcID)
        db #dd:ld l,a
        db #dd:ld h,PRC_ID_SYSTEM
        ld iy,App_MsgBuf
        rst #10
        ret


;==============================================================================
;### CONFIG-ROUTINES ##########################################################
;==============================================================================

cfgpthfil   db "/symb"
cfgpthfil1  db "osxt.ini",0:cfgpthfil0

;### CFGPTH -> Generates config path
cfgpth  ld hl,cfgpthfil
        ld de,(prgparf)
        ld bc,cfgpthfil0-cfgpthfil
        ldir
        ret

;### CFGSAV -> save config data
cfgsav  call icnpos
        call cfgpth
        ld hl,(prgparp)
        ld a,(App_BnkNum)
        db #dd:ld h,a
        xor a
        call SyFile_FILNEW          ;create file
        ret c
        ld hl,cfgdynbeg
        ld e,(hl)                   ;startmenu size
        inc hl
        ld d,(hl)
        add hl,de
        ld b,(hl)                   ;icons size
        dec hl
        ld c,(hl)
        ex de,hl
        add hl,bc
        ex de,hl
        add hl,bc
        ld c,(hl)                   ;widget size
        inc hl
        ld b,(hl)
        ex de,hl
        add hl,bc
        ld c,l:ld b,h               ;bc=sum
        inc b
        ld hl,cfgdatbeg
        ld de,(App_BnkNum)
        push af
        call SyFile_FILOUT          ;save configdata
        pop af
        jp SyFile_FILCLO            ;close file
cfgsav0 call cfgsav
        jp prgprz0

;### CFGLOD -> load config data
cfglod  call cfgpth
        ld hl,(prgparp)
        ld a,(App_BnkNum)
        db #dd:ld h,a
        call SyFile_FILOPN          ;open file
        jr c,cfgimp
        ld hl,cfgdatbeg
        ld bc,dskmemmax
        ld de,(App_BnkNum)
        push af
        call SyFile_FILINP          ;load configdata
        pop af
        jp SyFile_FILCLO            ;close file
cfglod0 ;call cfglod
        jp prgprz0

;### CFGIMP -> imports icons and startmenu entries from the classic configuration
lnkadrmen   equ 0               ;Offset Menunamen (20*20)
lnkadrpth   equ 0+400           ;Offset Pfade     (28*32; 20 startmenu, 8 icons)
lnkadricn   equ 0+400+896       ;Offset Iconnamen (8*24)
lnkadrspr   equ 0+400+896+192   ;Offset Sprites   (8*147)
lnklenall   equ 0+400+896+192+1176  ;Gesamtlänge der Linkdaten

cfgimpc db 0

cfgimp  ld e,7                      ;*** get startmenu entries and icons
        ld hl,jmp_sysinf
        rst #28                 ;DE=System, IX=Data, IY=databank
        call bnkdst
        db #fd:add l
        ld hl,16383-lnklenall
        ld de,cfgdatbeg
        add hl,de
        ld (cfgimp0+1),hl
        ex de,hl
        push ix
        pop hl
        ld bc,lnklenall
        rst #20:dw jmp_bnkcop
        ld hl,jmp_sysinf        ;get numbers
        ld de,256*36+5
        ld ix,cfgicnnum
        ld iy,66+2+6+5
        rst #28

        ld hl,16383-lnklenall-1120  ;*** generate startmenu entries
        ld de,cfgdatbeg
        add hl,de
        push hl
        ex de,hl
        ld a,-1
        ld (cfgimpc),a
cfgimp4 ld hl,cfgimpc
        inc (hl)
        ld a,(cfgmennum)
        cp (hl)
        jr z,cfgimp5
        push de                 ;save pointer to length byte
        inc de
        ld a,1
        ld (de),a               ;set type
        inc de
        ld bc,0
        ld a,20
        call cfgimp0
        push hl
        call strlen
        pop hl
        inc c
        push bc
        ldir                    ;copy name
        ld bc,lnkadrpth
        ld a,32
        call cfgimp0
        push hl
        call strlen
        pop hl
        inc c
        push bc
        ldir                    ;copy path
        xor a
        ld (de),a
        inc de
        ld (de),a
        inc de
        pop bc
        ld a,c
        pop bc
        add c
        add 4
        pop hl
        ld (hl),a               ;set length byte
        jr cfgimp4
cfgimp5 ex de,hl
        pop de                  ;de=start
        or a
        sbc hl,de               ;hl=length
        jr z,cfgimp3
        push de
        push hl
        ld de,cfgdatend-1
        add hl,de
        ex de,hl
        ld bc,cfgdatend-stamen2z
        lddr                    ;move remaining data
        pop bc
        pop hl
        ld de,stamen2z
        push bc
        ldir                    ;copy new data
        pop bc
        ld hl,(stmdatbeg)
        add hl,bc
        ld (stmdatbeg),hl
        ld hl,(stamen2)
        add hl,bc
        ld (stamen2),hl

cfgimp3 ld a,-1                     ;*** generate icons
        ld (cfgimpc),a
cfgimp1 ld hl,cfgimpc
        inc (hl)
        ld a,(cfgicnnum)
        cp (hl)
        ret z
        ld bc,20*32+lnkadrpth
        ld a,32
        call cfgimp0            ;hl=path
        push hl
        call strlen
        push bc
        ld hl,6+24+3+144+3
        add hl,bc               ;hl=icon size
        call icnnew             ;create new icon
        inc hl:inc hl
        ex de,hl
        ld hl,cfgicnpos
        ld a,4
        call cfgimp2
        ldir                    ;copy position
        ld bc,lnkadricn
        ld a,24
        call cfgimp0
        ldir                    ;copy name
        ld bc,lnkadrspr
        ld a,147
        call cfgimp0
        ldir                    ;copy graphic
        pop bc
        pop hl
        inc c
        ldir                    ;copy path
        xor a
        ld (de),a
        inc de
        ld (de),a
        jr cfgimp1

;(cfgimpc)=element, bc=offset, a=factor -> hl=address, bc=factor, de saved
cfgimp0 ld hl,0
        add hl,bc
cfgimp2 push de
        push hl
        ld e,a
        ld d,0
        push de
        ld a,(cfgimpc)
        call clcm16
        pop bc
        pop de
        add hl,de
        pop de
        ret

;### PRGPAR -> Startpfad auswerten
prgparp dw 0    ;start pfad
prgparf dw 0    ;start filename

prgpar  ld hl,(App_BegCode)       ;nach angehängter Datei suchen
        ld de,App_BegCode
        dec h
        add hl,de               ;HL=CodeEnde=Pfad
        ld (prgparp),hl
        call prgpar0
        ld (prgparf),de
        ret
;HL=String -> DE=letztes /, CF=0 pfad hört mit Leerzeichen auf
prgpar0 ld de,0
        ld b,255
prgpar1 ld a,(hl)
        cp "\"
        jr z,prgpar7
        cp "/"
        jr nz,prgpar3
prgpar7 ld e,l
        ld d,h
prgpar3 or a
        scf
        ret z
        cp 32
        ret z
        inc hl
        djnz prgpar1
        scf
        ret


;==============================================================================
;### SUB-ROUTINES #############################################################
;==============================================================================

;### MSGGET -> check for message for application
;### Output     CF=0 -> keine Message vorhanden, CF=1 -> IXH=Absender, (recmsgb)=Message, A=(recmsgb+0), IY=recmsgb
msgget  db #dd:ld h,-1          ;IYL=sender ID (-1 = receive messages from any sender)
msgget1 ld a,(App_PrcID)
        db #dd:ld l,a           ;IXL=our own process ID
        ld iy,App_MsgBuf           ;IY=Messagebuffer
        rst #08                 ;get Message -> IXL=Status, IXH=sender ID
        or a
        db #dd:dec l
        ret nz
        ld iy,App_MsgBuf
        ld a,(App_MsgBuf)
        scf
        ret

;### MSGDSK -> wait for a message from the desktop manager
;### Ausgabe    (recmsgb)=Message, A=(recmsgb+0), IY=recmsgb
;### Veraendert 
msgdsk  call msgget
        jr nc,msgdsk            ;no Message
        ld a,PRC_ID_DESKTOP
        db #dd:cp h
        jr nz,msgdsk            ;Message from someone else -> ignore
        ld a,(App_MsgBuf)
        ret

;### MSGSND -> send message to desktop process
;### Eingabe    C=command, B/E/D/L/H=Parameter1/2/3/4/5
msgsnd  ld a,PRC_ID_DESKTOP
msgsnd1 ld (App_MsgBuf+0),bc
        ld (App_MsgBuf+2),de
        ld (App_MsgBuf+4),hl
msgsnd2 db #dd:ld h,a
        ld a,(App_PrcID)
        db #dd:ld l,a
        ld iy,App_MsgBuf
        rst #10
        ret

;### MSGSYS -> sends message to system manager process
;### Eingabe    C=command, B=param1
msgsys  ld a,PRC_ID_SYSTEM
        jr msgsnd1

;### MSGMEN -> opens a context menu and returns result, if succesfull
;### Input      DE=data record
;### Output     CF=1, ZF=0 wrong answer  (->prgprz5)
;###            CF=0, ZF=0 user canceled (->prgprz0)
;###            CF=0, ZF=1 HL=value
msgmen  ld a,(App_BnkNum)
        ld b,a
        ld c,MSC_DSK_MENCTX
        ld hl,-1
        call msgsnd
msgmen1 db #dd:ld h,PRC_ID_DESKTOP
        call msgget1
        jr nc,msgmen1
        cp MSR_DSK_MENCTX
        scf
        ret nz
        ccf
        ld a,(App_MsgBuf+1)
        dec a
        ret nz
        ld hl,(App_MsgBuf+2)
        ret

;### CLCM16 -> Multipliziert zwei Werte (16bit)
;### Eingabe    A=Wert1, DE=Wert2
;### Ausgabe    HL=Wert1*Wert2 (16bit)
;### Veraendert AF,DE
clcm16  ld hl,0         ;3
clcm161 or a            ;1
        ret z           ;2 (4)
        rra             ;1
        jr nc,clcm162   ;3/2
        add hl,de       ;0/3
clcm162 sla e           ;2
        rl d            ;2
        jr clcm161      ;3 -> 15 pro durchlauf

;### CLCD16 -> Dividiert zwei Werte (16bit)
;### Eingabe    BC=Wert1, DE=Wert2
;### Ausgabe    HL=Wert1/Wert2, DE=Wert1 MOD Wert2
;### Veraendert AF,BC,DE
clcd16  ld a,e
        or d
        ld hl,0
        ret z
        ld a,b
        ld b,16
clcd161 rl c
        rla
        adc hl,hl
        sbc hl,de
        jr nc,clcd162
        add hl,de
clcd162 djnz clcd161
        rl c
        rla
        cpl
        ld d,a
        ld a,c
        cpl
        ld e,a
        ex de,hl
        ret

;### CLCD32 -> Dividiert zwei Werte (32bit)
;### Eingabe    IY,BC=Wert1, IX=Wert2
;### Ausgabe    IY,BC=Wert1/Wert2, HL=Wert1 MOD Wert2
;### Veraendert AF,BC,DE,IY
clcd32c db 0
clcd32  ld hl,0
        db #dd:ld a,l
        db #dd:or h
        ret z           ;IY,BC=Wert1(Zaehler)
        ld de,0         ;DE,HL=RechenVar
        ld a,32         ;Counter auf 32 setzen
clcd321 ld (clcd32c),a
        rl c
        rl b
        db #fd:ld a,l:rla:db #fd:ld l,a
        db #fd:ld a,h:rla:db #fd:ld h,a
        adc hl,hl
        rl e
        rl d
        ld a,l
        db #dd:sub l
        ld l,a
        ld a,h
        db #dd:sbc h
        ld h,a
        ld a,e
        sbc 0
        ld e,a
        ld a,d
        sbc 0
        ld d,a
        jr nc,clcd322
        ld a,l
        db #dd:add l
        ld l,a
        ld a,h
        db #dd:adc h
        ld h,a
        ld a,e
        adc 0
        ld e,a
        ld a,d
        adc 0
        ld d,a
        scf
clcd322 ccf
        ld a,(clcd32c)
        dec a
        jr nz,clcd321   ;HL=Wert1 MOD Wert2
        rl c
        rl b
        db #fd:ld a,l:rla:db #fd:ld l,a
        db #fd:ld a,h:rla:db #fd:ld h,a
        ret             ;IY,BC=Wert1 DIV Wert2

;### CLCDEZ -> Rechnet Byte in zwei Dezimalziffern um
;### Eingabe    A=Wert
;### Ausgabe    L=10er-Ascii-Ziffer, H=1er-Ascii-Ziffer
;### Veraendert AF
clcdez  ld l,0
clcdez1 sub 10
        jr c,clcdez2
        inc l
        jr clcdez1
clcdez2 add "0"+10
        ld h,a
        ld a,"0"
        add l
        ld l,a
        ret

;### CLCN32 -> Wandelt 32Bit-Zahl in ASCII-String um (mit 0 abgeschlossen)
;### Eingabe    DE,IX=Wert, IY=Adresse
;### Ausgabe    IY=Adresse letztes Zeichen
;### Veraendert AF,BC,DE,HL,IX,IY
clcn32t dw 1,0,     10,0,     100,0,     1000,0,     10000,0
        dw #86a0,1, #4240,#f, #9680,#98, #e100,#5f5, #ca00,#3b9a
clcn32z ds 4

clcn32  ld (clcn32z),ix
        ld (clcn32z+2),de
        ld ix,clcn32t+36
        ld b,9
        ld c,0
clcn321 ld a,"0"
        or a
clcn322 ld e,(ix+0):ld d,(ix+1):ld hl,(clcn32z):  sbc hl,de:ld (clcn32z),hl
        ld e,(ix+2):ld d,(ix+3):ld hl,(clcn32z+2):sbc hl,de:ld (clcn32z+2),hl
        jr c,clcn325
        inc c
        inc a
        jr clcn322
clcn325 ld e,(ix+0):ld d,(ix+1):ld hl,(clcn32z):  add hl,de:ld (clcn32z),hl
        ld e,(ix+2):ld d,(ix+3):ld hl,(clcn32z+2):adc hl,de:ld (clcn32z+2),hl
        ld de,-4
        add ix,de
        inc c
        dec c
        jr z,clcn323
        ld (iy+0),a
        inc iy
clcn323 djnz clcn321
        ld a,(clcn32z)
        add "0"
        ld (iy+0),a
        ld (iy+1),0
        ret

;### CLCUCS -> Wandelt Klein- in Großbuchstaben um
;### Eingabe    A=Zeichen
;### Ausgabe    A=ucase(Zeichen)
;### Verändert  F
clcucs  cp "a"
        ret c
        cp "z"+1
        ret nc
        add "A"-"a"
        ret

;### CLCLCS -> Wandelt Groß- in Kleinbuchstaben um
;### Eingabe    A=Zeichen
;### Ausgabe    A=lcase(Zeichen)
;### Verändert  F
clclcs  cp "A"
        ret c
        cp "Z"+1
        ret nc
        add "a"-"A"
        ret

;### STRINP -> Initialisiert Textinput (abhängig vom String, den es bearbeitet)
;### Eingabe    IX=Control
;### Ausgabe    HL=Stringende (0), BC=Länge (maximal 255)
;### Verändert  AF
strinp  ld l,(ix+0)
        ld h,(ix+1)
        call strlen
        ld (ix+8),c
        ld (ix+4),c
        xor a
        ld (ix+2),a
        ld (ix+6),a
        ret

;### STRLEN -> Ermittelt Länge eines Strings
;### Eingabe    HL=String (0-terminiert)
;### Ausgabe    HL=Stringende (0), BC=Länge (maximal 255, ohne Terminator)
;### Verändert  -
strlen  push af
        xor a
        ld bc,255
        cpir
        ld a,254
        sub c
        ld c,a
        dec hl
        pop af
        ret

;### STRSKP -> skips text string (behind 0-terminator)
;### Input      HL=string
;### Output     HL=behind 0 terminator
strskp  xor a
        ld bc,-1
        cpir
        ret

;### STRCOP -> copies string until 0-terminator
;### Input      HL=source, DE=destination
;### Output     DE=behind 0-terminator, A=0
;### Destroyed  F,BC,HL
strcop  ld a,(hl)
        ldi
        or a
        jr nz,strcop
        ret

;### SYSCHK -> get computer type and adjust logo, ini-filename
syschk  ld hl,jmp_sysinf        ;*** get Computer Type
        ld de,256*1+5
        ld ix,cfgcpctyp
        ld iy,245-163 ;66+2+6+8
        rst #28
        ld a,(cfgcpctyp)
        ld b,a
        and #1f
        cp 7
        ret nc
        bit 7,b
        ret z
        ld hl,256*"9"+"G"       ;cpc/ep with msx encoding -> g9k version
        ld (cfgpthfil1),hl
        ret

;### SYSOPN -> Lock desktop and open window
;### Input      HL=window data record, B=desktopservice param1, C=desktopservice param2
sysopn  push hl
        ld e,c
        ld c,MSC_DSK_DSKSRV
        call msgsnd
        pop de
        ld a,128+1
        ld (de),a
        ld a,(App_BnkNum)
        call SyDesktop_WINOPN
        jr c,sysopn1
        ld (sysspcw),a
        jp prgprz0
sysopn1 xor a
        ld (syssecf),a
        jp prgprz0

;### SYSCLO -> Close window and unlock desktop
sysclo  ld hl,sysspcw           ;Spezial-Fenster schließen, Desktop entfrieren
        call sysclo0
        ld a,DSK_SRV_DSKCNT
        jp SyDesktop_Service
sysclo0 xor a
        ld (syssecf),a
        ld a,(hl)
        cp -1
        ret z
        ld (hl),-1
        jp SyDesktop_WINCLS

;### SELOPN -> starts a "file selection" session
;### Input      HL=filemask, filselbuf+4=path, A=file[0]/directory[128] selection, DE=Data record of the caller window, BC=routine address, when selection has been completed
;### Output     (jumps to prgprz0) -> filselbuf+4 will contain selected path/file
selopn  db 0
        ld (selopna+2),de
        ld (selopn0+1),bc
        ld de,filselbuf
        ld (App_MsgBuf+8),de
        ld bc,3
        ldir
        ld hl,App_BnkNum
        add (hl)
        ld (App_MsgBuf+6),a
        ld a,8
        ld (App_MsgBuf+7),a
        ld hl,200
        ld (App_MsgBuf+10),hl
        ld hl,8000
        ld (App_MsgBuf+12),hl
        ld a,#c9
        ld (selopn),a
        ld iy,App_MsgBuf
        ld c,MSC_SYS_SELOPN
        call SySystem_SendMessage
        jp prgprz0
selopna ld ix,0
        ld (ix+51),0
        ld a,(App_MsgBuf+1)
        inc a
        jr nz,selopn1
        ld a,(App_MsgBuf+2)
        ld (ix+51),a
        jp prgprz0
selopn1 dec a
        ld a,0
        ld (selopn),a
selopn0 jp z,0
        jp prgprz0

;### MEMCHK -> checks, if enough memory available
;### Input      HL=difference
;### Output     CF=0 ok, DE=new length of stm+icn+wdg, HL=memory left, BC=difference
;###            CF=1 memory full
;### Destroyed  AF
memchk  push hl
        xor a
        call icnadr
        dec hl
        ld d,(hl)
        dec hl
        ld e,(hl)
        push de
        call wdgadr
        dec hl
        ld d,(hl)
        dec hl
        ld e,(hl)
        ld hl,(cfgdynbeg)
        add hl,de
        pop de
        add hl,de
        pop bc
        add hl,bc
        ex de,hl
        ld hl,dskmemmax
        sbc hl,de
        ret

;### BNKDST -> get our bank as destination
;### Output     A[4-7]=bank, A[0-3]=0
bnkdst  ld a,(App_BnkNum)
        add a:add a:add a:add a
        ret


;==============================================================================
;### EXTENDED STARTMENU #######################################################
;==============================================================================

menclk  ld hl,(App_MsgBuf+2)
        ld a,h
        cp 4
        jr nc,menclk1
        ld c,l
        ld b,h
        call msgsys
        jp prgprz0
menclk1 call menclk0
        jp prgprz0
menclk0 ld a,(App_BnkNum)       ;##!!## pfad neu zusammensetzen (workdir, winmode)
        jp SySystem_PRGRUN


;==============================================================================
;### EXTENDED DESKTOP #########################################################
;==============================================================================

dskvaradr   dw 0    ;desktop extended vars (desktop -> symdskbeg)

symextbnm   equ 0   ;db bnkndt       ;(extended) bank
symextsma   equ 1   ;dw dsksta       ;(extended) startmenu address
symextsmy   equ 3   ;dw -66          ;(extended) startmenu -ylength
symextnum   equ 5   ;db dskbgranz    ;(extended) number of background controls
symextadr   equ 6   ;dw dskbgrobj    ;(extended) address of the background control data
symextwin1  equ 8   ;db -1           ;(extended) background window ID
symextpgm   equ 9   ;dw prggrpmem    ;(extended) program group memory
symextwgm   equ 11  ;dw wingrpmem    ;(extended) window group memory
symextwix   equ 13  ;dw wingrpanz    ;(extended) window number and index list

dskclk  ld hl,(App_MsgBuf+2)       ;H=action type (left/right/middle/doubleclick mouse key or keyboard)
        ld a,l
        cp DSK_ACT_CONTENT
        jp nz,prgprz0
        ld bc,(App_MsgBuf+8)       ;B=type (0=background, 128=icon [C=icon ID], 1-127=widget [B=process ID, C=local control ID])
        ld a,b
        or a
        jp z,dskclk8
        cp 128
        jp z,dskclk1
        jp nc,prgprz0
        ld a,h                  ;*** Widget
        cp DSK_SUB_MRCLICK
        jr z,dskclka
        ld a,MSC_WDG_CLICK          ;no rightclick -> send event to widget
        ld (App_MsgBuf+0),a
        ld a,b
        call msgsnd2
        jp prgprz0
dskclka ld a,b                      ;rightclick -> open widget context menu
        call wdgprc                 ;get widget ID and data record
        jp c,prgprz0
        ld a,c
        ld (wdgcurid),a
        ld bc,7
        add hl,bc
        bit 0,(hl)                  ;check, if property dialogue available
        ld a,0
        jr z,dskclkb
        inc a
dskclkb ld (ctxwdg0),a
        dec hl
        ld a,(hl)
        ld (ctxwdgsiz),a
        dec hl
        ld c,(hl)
        inc c
        inc hl:inc hl:inc hl
        call dskclkf
        ld de,ctxwdg
        jr dskclk9
dskclkf ld iy,ctxwdgtxta            ;generate size menu
        ld ix,ctxwdgsiz+2
        ld b,a
dskclkc ld (ix+0),1
        dec c
        jr nz,dskclke
        ld (ix+0),3
dskclke push bc
        push ix
        push iy
        call dskclkd
        ld (iy+1)," "
        ld (iy+2),"x"
        ld (iy+3)," "
        ld bc,4
        add iy,bc
        call dskclkd
        pop iy
        ld bc,14
        add iy,bc
        pop ix
        ld c,8
        add ix,bc
        pop bc
        djnz dskclkc
        ret
dskclkd ld c,(hl)
        inc hl
        ld b,(hl)
        inc hl
        push hl
        push bc:pop ix
        ld de,0
        call clcn32
        pop hl
        ret
dskclk8 ld a,h                  ;*** Background
        cp DSK_SUB_MRCLICK
        jp nz,prgprz0               ;only react on right mouseclick
        ld hl,(App_MsgBuf+4)        ;store current mouse position for new/paste
        ld (dicnewm+0),hl
        ld hl,(App_MsgBuf+6)
        ld (dicnewm+2),hl
        rst #20:dw #8154            ;check, if icon in clipboard
        ld a,d
        cp CLPTYP_ICON
        ld a,0
        jr nz,dskclk6
        inc a
dskclk6 ld (ctxdsk0),a
        ld de,ctxdsk
dskclk9 call msgmen
        jp c,prgprz5
        jp nz,prgprz0
        ld a,l
        or h
        jp z,prgprz0
        jp (hl)

dskclkt dw 0
dskclk1 ld a,h                  ;*** Icons
        cp DSK_SUB_MLCLICK
        jr nz,dskclk4
        push bc
        ld hl,jmp_mtgcnt:rst #28
        pop bc
        push ix:pop hl
        ld de,(dskclkt)
        ld (dskclkt),hl
        or a
        sbc hl,de
        ld de,40
        sbc hl,de
        jp c,prgprz0
        ld de,60
        sbc hl,de
        ld a,c
        jp c,dicren
        ld a,(dicarraut)            ;check, if icon has been moved (##!!## replace with drap&drop event as soon as available)
        or a
        jp z,prgprz0
        ld a,c
        call icnadr
        inc hl
        inc hl
        ex de,hl
        add a:add a:add a
        ld l,a
        ld h,0
        add hl,hl
        ld bc,dskbgrobj1+6
        add hl,bc
        ld b,4
dskclk7 ld a,(de)
        cp (hl)
        jp nz,diclup
        inc hl
        inc de
        djnz dskclk7
        jp prgprz0
dskclk4 cp DSK_SUB_MRCLICK
        jr nz,dskclk3
        ld de,ctxicn                ;right mouse click -> open context menu
        push bc
        call msgmen                 ;hl=value
        pop bc
        jp c,prgprz5
        jp nz,prgprz0
        ld a,c
        jp (hl)
dskclk3 cp DSK_SUB_MDCLICK
        jp nz,prgprz0
dskclk2 ld a,c                      ;double click -> start link
        call icnadr
        ld bc,2+4+24
        add hl,bc
        bit 3,(hl)
        ld bc,6*24+3                ;skip  4 colour
        jr z,dskclk5
        ld bc,12*24+10              ;skip 16 colour
dskclk5 add hl,bc
        jp menclk1

dskref  call dskref0
        jp prgprz0
dskref0 ld a,(symextwin)        ;refresh desktop
        ld e,-1
        jp SyDesktop_WINDIN

dskprp  ld hl,stmsetlnk2        ;display properties
        jp menclk1

dskbgr  push ix
        call dskbgr0
        pop af
        call msgsnd1            ;send confirmation
        jp prgprz0
dskbgr0 ld hl,(dskvaradr)           ;** reinitialize background
        ld bc,symextnum
        add hl,bc
        xor a
        rst #20:dw jmp_bnkrbt
        push bc
        rst #20:dw jmp_bnkrwd   ;bc=address of background controls
        pop af                  ;a=number of background controls
        add a:add a:add a:add a
        push bc
        ld c,a
        ld b,0
        ld de,dskbgrobj
        call bnkdst
        ld hl,symextbnk
        or (hl)
        pop hl
        rst #20:dw jmp_bnkcop
        jp icnini


;==============================================================================
;### ICON GUI ROUTINES ########################################################
;==============================================================================

;### DICDEL -> icon delete
dicdel  ld hl,dicprpw
        inc (hl)
        dec (hl)
        jp nz,dicprpz
        push af
        call icnadr
        ld bc,2+4
        add hl,bc
        push hl
        ld e,l
        ld d,h
        call strlen
        ex de,hl
        ld de,dicdeltxt2+1
        inc c:dec c
        jr z,dicdel1
        ldir
dicdel1 ld a," "
        ld (de),a
        inc de
        pop hl
        ld bc,12
        add hl,bc
        push hl
        call strlen
        pop hl
        inc c:dec c
        jr z,dicdel2
        ldir
dicdel2 ex de,hl
        ld (hl),"'"
        inc hl
        ld (hl),"?"
        inc hl
        ld (hl),0
        ld a,(App_BnkNum)
        ld hl,dicdelobj
        ld b,4*8+2
        ld de,0
        call SySystem_SYSWRN
        pop bc
        cp 3
        jp nz,prgprz0
        rst #30
        ld a,b
        jr diccut1

;### DICCUT -> Cuts desktop icon
diccut  push af
        call icncop
        pop af
diccut1 push af
        call icnpos
        pop af
        call icnadr
        inc hl:inc hl
        ld e,(hl):inc hl
        ld d,(hl):inc hl
        push de
        ld e,(hl):inc hl
        ld d,(hl)
        push de
        call icndel
        pop bc
        pop hl
        ld a,(symextwin)
        ld e,-1
        ld ix,48
        ld iy,40
        call SyDesktop_WINPIN
        jp prgprz0

;### DICCOP -> Copies desktop icon
diccop  call icncop
        jp prgprz0

;### DICREN -> Renames desktop icon
dicrenw db 0
dicrenb ds 14
dicren  push af
        call icnpos
        pop af
        ld (dicren4+1),a
        call icnadr
        inc hl:inc hl
        ld e,(hl):inc hl
        ld d,(hl):inc hl
        ld (dicrenwin1+0),de
        ld e,(hl):inc hl
        ld d,(hl):inc hl
        ex de,hl
        ld bc,24-4
        add hl,bc
        ld (dicrenwin1+2),hl
        ex de,hl
        ld de,dicrentxt1b
        ld bc,24
        ldir
        ld ix,dicrentxt1
        call strinp
        ld ix,dicrentxt2
        call strinp
        ld a,(App_BnkNum)
        ld de,dicrenwin
        call SyDesktop_WINOPN
        jp c,prgprz0
        ld (dicrenw),a
dicren1 call msgdsk
        cp MSR_DSK_EXTDSK
        jr z,dicren3
        ld hl,App_MsgBuf+2
        cp MSR_DSK_WFOCUS
        jr z,dicren2
        cp MSR_DSK_WCLICK
        jr nz,dicren1
        dec hl
        ld a,(symextwin)
        cp (hl)
        jr z,dicren3
        inc hl
        ld a,(hl)
        cp DSK_ACT_CONTENT
        jr nz,dicren1
        ld hl,(App_MsgBuf+8)
        ld a,l:or h
        jr z,dicren1
        jp (hl)
dicren3 push ix
        push iy
        ld hl,App_MsgBuf
        ld de,dicrenb
        ld bc,14
        ldir
        call dicren4
        ld de,App_MsgBuf
        ld hl,dicrenb
        ld bc,14
        ld a,(hl)
        ldir
        pop iy
        pop ix
        jp prgprz5
dicren4 ld a,0
        call icnadr
        ld bc,2+4
        add hl,bc
        ex de,hl
        ld hl,dicrentxt1b
        ld bc,24
        ldir
dicren5 ld a,(dicrenw)
        jp SyDesktop_WINCLS
dicren2 dec (hl)
        jr z,dicren1
dicreno call dicren4            ;ok
        jp prgprz0
dicrenc call dicren5            ;cancel
        jp prgprz0

;### DICNEW -> New shortcut
dicnewm dw 0,0          ;mouse position
        dw 0,0
dicnew  ld hl,dicneww           ;only 1 dialogue at the same time
        inc (hl)
        dec (hl)
        jp nz,dicprpz
        ld hl,(dicnewm+0)
        ld de,-12
        add hl,de
        ld (dicnewm+4),hl
        ld hl,(dicnewm+2)
        ld (dicnewm+6),hl
        ld hl,icndummy          ;reset/set to default
        ld de,dicnewicn
        ld bc,147
        ldir
        xor a
        ld (dicnewbuf1),a
        ld (dicnewbuf2),a
        ld (dicnewbuf3),a
        ld ix,dicnewinp1
        call strinp
        ld ix,dicnewinp2
        call strinp
        ld ix,dicnewinp3
        call strinp
        ld hl,dicnewgrp1        ;open
        ld (dicnewwin0),hl
        ld a,(App_BnkNum)
        ld de,dicnewwin
        call SyDesktop_WINOPN
        jp c,prgprz0
        ld (dicneww),a
        jp prgprz0

dicnewb ld hl,dicnewbuf1        ;browse file
        ld de,filselbuf+4
        ld bc,128
        ldir
        ld hl,filmskall
        xor a
        ld de,dicnewwin
        ld bc,dicnew6
        jp selopn
dicnew6 ld hl,filselbuf+4
        ld de,dicnewbuf1
        ld bc,127
        ldir
        ld ix,dicnewinp1
        call strinp
        ld hl,dicnewbuf1
        ld de,dicnewicn
        call icnfil
        call dicinhb
        ld a,(dicneww)
        ld e,10
        call SyDesktop_WINDIN
        jp prgprz0

dicnewi xor a                   ;browse icon
        ld (filselbuf+4),a
        ld hl,filmskicn
        ld de,dicnewwin
        ld bc,dicnew7
        jp selopn
dicnew7 ld hl,filselbuf+4
        ld de,dicnewicn
        call icnlod
        jr dicnew8

dicnewf ld hl,dicnewbuf1        ;use file icon
        ld de,dicnewicn
        call icnfil
dicnew8 call dicinhb
        ld a,(dicneww)
        ld e,7
        call SyDesktop_WINDIN
        jp prgprz0

dicnewx call dicnewy            ;close
        jp prgprz0
dicnewy ld hl,dicneww
        ld a,(hl)
        ld (hl),0
        jp SyDesktop_WINCLS

dicnew1 ld a,(dicnewinp1+8)     ;zu Tab2 vorspringen
        or a
        jp z,prgprz0
        ld a,(dicnewinp2+8)
        or a
        jr nz,dicnew9
        ld hl,dicnewbuf1
dicnewd ld e,l:ld d,h
dicnewe ld a,(hl)
        inc hl
        or a
        jr z,dicnewg
        cp 32
        jr z,dicnewg
        cp "\"
        jr z,dicnewd
        cp "/"
        jr z,dicnewd
        jr dicnewe
dicnewg ex de,hl
        ld de,dicnewbuf2
        ld bc,11*256+255
dicnewh ld a,(hl)
        or a
        jr z,dicnewc
        cp " "
        jr z,dicnewc
        cp "."
        jr z,dicnewc
        ldi
        dec c
        jr nz,dicnewh
dicnewc xor a
        ld (de),a
        ld ix,dicnewinp2
        call strinp
dicnew9 ld hl,dicnewgrp2
        jr dicnew0

dicnew2 ld hl,dicnewgrp1        ;zu Tab1 zurückspringen
        jr dicnew0
dicnew3 ld a,(dicnewinp2+8)     ;zu Tab3 vorspringen
        or a
        jr nz,dicnewl
        ld a,(dicnewinp3+8)
        or a
        jp z,prgprz0
dicnewl ld hl,dicnewgrp3
        jr dicnew0
dicnew4 ld hl,dicnewgrp2        ;zu Tab2 zurückspringen
dicnew0 ld (dicnewwin0),hl
        ld a,(dicneww)
        ld e,-1
        ld hl,41
        ld bc,0
        ld ix,1000
        ld iy,1000
        call SyDesktop_WINPIN
        jp prgprz0

dicnew5 call icnpos             ;finished
        ld hl,(dicnewinp1+8)
        ld a,(dicnewicn)
        bit 3,a
        ld de,147+2+4+24+3
        ld bc,147
        jr z,dicnewj
        ld de,298+2+4+24+3
        ld bc,298
dicnewj add hl,de               ;hl=icon length
        push bc
        call icnnew
        pop bc
        jr c,dicnewk
        push bc
        inc hl
        inc hl
        ex de,hl
        ld hl,dicnewm+4         ;position
        ld bc,4
        ldir
        ld hl,dicnewbuf2        ;names
        ld c,24
        ldir
        ld hl,dicnewicn
        pop bc
        ldir
        ld hl,dicnewbuf1
        call strcop
        ld (de),a
        inc de
        ld (de),a
        inc de
        ld (de),a
        ld a,(dicarraut)
        or a
        jr nz,dicnewn
        ld a,(icnnumval)        ;no auto arrange
        dec a
        push af
        xor a
        call wdgdel2        ;disable all widgets
        pop af
        call dicpry5
        call wdgini0        ;re-inits all widgets
        jp dicnewx
dicnewn xor a
        call wdgdel2        ;disable all widgets
        call icnini
        call wdgini0        ;re-inits all widgets
        call dicnewy
        jp diclup
dicnewk call dicpry3
        jp dicnewx

;### DICPRP -> Show and edit icon properties
dicprpi db 0            ;icon id

dicprp  ld e,a
        ld a,(dicprpw)
        or a
        jr z,dicprp1
dicprpz ld hl,dicpreobj
dicprpy ld a,(App_BnkNum)
        ld b,1+16
        call SySystem_SYSWRN
        jp prgprz0
dicprp1 ld a,e
        ld (dicprpi),a
        call icnadr
        ld bc,2+4
        add hl,bc
        ld de,dicprpbuf3
        ld bc,12*2
        ldir
        bit 3,(hl)
        ld bc,6*24+3        ; 4 colour
        jr z,dicprp2
        ld bc,12*24+10      ;16 colour
dicprp2 ld de,dicprpicn
        ldir
        push hl
        call dicinha
        pop hl
        ld a,(hl)
        cp "%"
        ld de,dicprpbuf1
        jr nz,dicprp3
        push hl
        ld hl,jmp_sysinf
        ld de,256*32+5
        ld ix,dicprpbuf1
        ld iy,163-163
        rst #28             ;copy system path
        ld hl,dicprpbuf1
        call strskp
        dec hl
        ex de,hl
        pop hl
        inc hl
dicprp3 call strcop
        ld de,dicprpbuf2
        call strcop
        ld a,(hl)
        ld (dicprprun+12),a
        ld ix,dicprpinp1
        call strinp
        ld ix,dicprpinp2
        call strinp
        ld ix,dicprpinp3
        call strinp
        ld ix,dicprpinp4
        call strinp
        call dicprp0
        xor a
        ld (dicprptab0),a
        ld (dicprtt),a
        ld hl,dicprpgrp1
        ld (dicprpwin0),hl
        ld a,(App_BnkNum)
        ld de,dicprpwin
        call SyDesktop_WINOPN
        jp c,prgprz0
        ld (dicprpw),a
        jp prgprz0

;*** display file infos
dicprp0 ld hl,dicprpbuf1
        call dicinf         ;dicinfe=extension (3 bytes), HL=linked path, DE=filename
        push hl
        push de
        ex de,hl                    ;*** filename
        ld de,dicprptxtu
        ld bc,13
        ldir
        ld hl,dicinfe
        ld de,dicprptxte
        ld bc,3
        ldir
        ld de,dicprpbuf1            ;*** location
        pop hl
        or a
        sbc hl,de
        ld c,l:ld b,h
        ex de,hl
        ld de,dicprptxti
        jr z,dicprp4
        ldir
dicprp4 ex de,hl
        ld (hl),0
        pop hl
        ld de,dicprptxt8
        ld bc,32
        ldir

        ld hl,dicprpbuf1
        ld a,(App_BnkNum)
        db #dd:ld l,16
        db #dd:ld h,a
        ld de,tmpbuf
        ld bc,768
        ld iy,0
        call SySystem_CallFunction  ;*** get file properties
        db MSC_SYS_SYSFIL
        db FNC_FIL_DIRINP
        jr c,dicprp5
        dec hl
        ld a,l:or h
        jr z,dicprp6
dicprp5 ld hl,tmpbuf+0          ;error -> show 0-values
        ld de,tmpbuf+1
        ld (hl),0
        ld bc,5
        ldir
dicprp6 ld iy,dicprptxtf            ;*** length
        ld ix,(tmpbuf+0)
        ld de,(tmpbuf+2)
        call clcn32
        push iy
        pop de
        inc de
        ld hl,dicprptxtg
        ld bc,7
        ldir
        ld bc,(tmpbuf+4)            ;*** timestamp
        ld de,(tmpbuf+6)
        call SySystem_CallFunction
        db MSC_SYS_SYSFIL
        db FNC_FIL_FILF2T
        ld iy,dicprpdtm1+6
        push hl
               call clcdez:ld (iy+18-6),l:ld (iy+19-6),h    ;second
        ld a,b:call clcdez:ld (iy+15-6),l:ld (iy+16-6),h    ;minute
        ld a,c:call clcdez:ld (iy+12-6),l:ld (iy+13-6),h    ;hour
        ld a,d:call clcdez:ld (iy+00-6),l:ld (iy+01-6),h    ;day
        ld a,e:call clcdez:ld (iy+03-6),l:ld (iy+04-6),h    ;month
        pop ix
        ld de,0
        call clcn32                                         ;year
        ld (iy+1),","
        ld hl,(dicinfz)
        ld a,l
        or h
        ret z
        ld (hl),32
        ret

dicprtt db 0
dicprt  ld a,(dicprptab0)           ;*** change tab
        ld hl,dicprtt
        cp (hl)
        jp z,prgprz0
        ld (hl),a
        or a
        ld hl,dicprpgrp1
        jr z,dicprt1
        ld hl,dicprpgrp2
dicprt1 ld (dicprpwin0),hl
        ld e,-1
        call dicprt0
        jp prgprz0
dicprt0 ld a,(dicprpw)
        jp SyDesktop_WININH

dicpro  call dicpry1                ;*** OK
dicprc  ld hl,dicprpw               ;*** cancel
        ld a,(hl)
        ld (hl),0
        call SyDesktop_WINCLS
        jp prgprz0

dicpry  call dicpry1                ;*** apply
        jp prgprz0
dicpry1 ld a,(dicprpinp1+8)
        ld hl,dicprpinp2+8
        add (hl)
        ld l,a
        ld h,0
        ld a,(dicprpicn)
        bit 3,a
        ld bc,147+2+4+24+3
        jr z,dicpry2
        ld bc,298+2+4+24+3
dicpry2 add hl,bc               ;hl=new icon length
        push hl
        ld a,(dicprpi)
        call icnadr             ;de=old icon length
        ex (sp),hl
        or a
        sbc hl,de               ;hl=difference
        call icnrsz
        pop hl
        jr c,dicpry3
        ld de,6
        add hl,de
        ex de,hl
        ld hl,dicprpbuf3
        ld bc,24
        ldir
        ld hl,dicprpicn
        bit 3,(hl)
        ld bc,144+3
        jr z,dicpry4
        ld bc,288+10
dicpry4 ldir
        ld hl,dicprpbuf1
        call strcop
        ld hl,dicprpbuf2
        call strcop
        ld hl,dicprprun+12
        ldi
        call icnpos
        ld a,(dicprpi)
dicpry5 push af
        call icnini
        pop af
        add 8
dicpry6 ld e,a
        ld a,(symextwin)
        jp SyDesktop_WINDIN
dicpry3 ld a,(App_BnkNum)
        ld hl,dicmemobj
        ld b,1+16
        jp SySystem_SYSWRN

dicpbt  ld hl,dicprpbuf1            ;*** browse target
        ld de,filselbuf+4
        ld bc,128
        ldir
        ld hl,filmskall
        xor a
        ld de,dicprpwin
        ld bc,dicpbt1
        jp selopn
dicpbt1 ld hl,filselbuf+4
        ld de,dicprpbuf1
        ld bc,127
        ldir
        ld ix,dicprpinp1
        call strinp
        ld hl,dicprpbuf1
        ld de,dicprpicn
        call icnfil
        ld a,(dicprpw)
        ld e,10
        call SyDesktop_WINDIN
        call dicprp0
        jr dicpbi2

dicpbi  xor a                       ;*** browse icon
        ld (filselbuf+4),a
        ld hl,filmskicn
        ld de,dicprpwin
        ld bc,dicpbi1
        jp selopn
dicpbi1 ld hl,filselbuf+4
        ld de,dicprpicn
        call icnlod
        jp c,prgprz0
dicpbi2 call dicinha
        ld a,(dicprpw)
        ld e,5
        call SyDesktop_WINDIN
        jp prgprz0

;### DICSHC -> Create shortcut
dicshc  call icnadr
        push hl
        push de
        ex de,hl
        call icnnew
        jr c,dicpst1
        pop bc
        ex de,hl
        pop hl
        push de
        ldir
        call icnpos
        call lupfre
        pop ix
        ld (ix+2),e
        ld (ix+3),d
        ld (ix+4),l
        ld (ix+5),h
        jr dicpst0

;### DICPST -> Paste icon
dicpst  rst #20:dw #8154
        ld a,d
        cp CLPTYP_ICON
        jp nz,prgprz0
        push iy
        call icnpos
        pop hl
        push hl
        call icnnew
        pop iy
        jr c,dicpst1
        push hl:pop ix
        ld de,(App_BnkNum)
        ld d,CLPTYP_ICON
        push hl
        rst #20:dw #8151
        pop ix
        ld hl,(dicnewm+0)
        ld de,-12
        add hl,de
        ld (ix+2),l
        ld (ix+3),h
        ld hl,(dicnewm+2)
        ld (ix+4),l
        ld (ix+5),h
dicpst0 ld a,(dicarraut)
        or a
        jr nz,dicpst2
        ld a,(icnnumval)
        dec a
        call dicpry5
        jp prgprz0
dicpst1 call dicpry3
        jp prgprz0
dicpst2 call icnini
        jp diclup

;### DICLUP -> line up icons
diclup  call lupall
        jp prgprz0

;### DICARR -> arrange icons
dicarr  ld hl,dicarraut         ;auto arrange
        ld a,(hl)
        xor 1
        ld (hl),a
        add a
        inc a
        ld (ctxdskarr0),a
dicarr2 bit 1,a
        jr nz,diclup
        jp prgprz0
dicarra ld d,0                  ;8x8 grid
        jr dicarr0
dicarrb ld d,1                  ;13x11 grid
        jr dicarr0
dicarrc ld d,2                  ;26x22 grid
        jr dicarr0
dicarrd ld d,3                  ;48x40 grid
        jr dicarr0
dicarre ld d,4                  ;52x44 grid
dicarr0 ld hl,dicarrgrd
        ld a,(hl)
        ld (hl),d
        ld e,1
        call dicarr1
        ld a,d
        ld e,3
        call dicarr1
        ld a,(ctxdskarr0)
        jr dicarr2
dicarri ld a,(dicarraut)
        add a
        inc a
        ld (ctxdskarr0),a
        ld a,(dicarrgrd)
        ld e,3
dicarr1 add a
        add a
        add a
        ld l,a
        ld h,0
        ld bc,ctxdskarr+2
        add hl,bc
        ld (hl),e
        ret

;### DICINF -> get file infos
;### Input      HL=filename
;### Output     dicinfe=extension (3 bytes), A=type (0=unknown, 1=EXE, 2=linked), HL=linked path, DE=filename
;### Destroyed  F,BC,IX,IY
dictxt0 db "[not defined]",0
dictxt1 db "[Executable]",0
dicinfe ds 3
dicinfz dw 0

dicinf  push hl
        ld hl,0
        ld (dicinfz),hl
        ld e,7                      ;*** get file extensions
        ld hl,jmp_sysinf
        rst #28         ;DE=System, IX=Data, IY=databank
        push ix:pop hl
        ld bc,400+896+192+1176
        add hl,bc
        ld de,tmpbuf
        ld bc,768
        call bnkdst
        db #fd:add l
        rst #20:dw jmp_bnkcop
        pop hl
        ld e,l:ld d,h
        ld c,l:ld b,h
dicinf1 ld a,(hl)
        inc hl
        or a
        jr z,dicinf7
        cp 32
        jr nz,dicinf3
        dec hl
        ld (hl),0
        ld (dicinfz),hl
        jr dicinf7
dicinf3 cp "."
        jr nz,dicinf2
        ld c,l:ld b,h
dicinf2 cp "/"
        jr z,dicinf4
        cp "\"
        jr nz,dicinf1
dicinf4 ld e,l:ld d,h
        ld bc,0
        jr dicinf1
dicinf7 ld (dicinfd+1),de
        ld a,32                     ;*** Extension
        ld (dicinfe+0),a
        ld (dicinfe+1),a
        ld (dicinfe+2),a
        ld a,c
        or b
        jr z,dicinf5
        ld l,c:ld h,b
        ld de,dicinfe
dicinf6 ld a,(hl)
        or a
        jr z,dicinf5
        call clcucs
        ld (de),a
        inc hl
        inc de
        jr dicinf6
dicinf5 ld a,(dicinfe+0)            ;*** Type (start with)
        call clclcs
        ld c,a
        ld hl,(dicinfe+1)
        ld a,l
        call clclcs
        ld e,a
        ld a,h
        call clclcs
        ld d,a
        ld a,"e"
        cp d
        jr nz,dicinf8
        cp c
        jr nz,dicinf8
        ld a,"x"
        cp e
        ld hl,dictxt1
        ld a,1
        jr z,dicinfd
dicinf8 ld hl,tmpbuf
        ld b,16
dicinf9 push bc
        push hl
        ld b,4
dicinfa push hl
               ld a,(hl):cp c:jr nz,dicinfb
        inc hl:ld a,(hl):cp e:jr nz,dicinfb
        inc hl:ld a,(hl):cp d
dicinfb pop hl
        jr z,dicinfc
        inc hl:inc hl:inc hl
        djnz dicinfa
        pop hl
        ld bc,48
        add hl,bc
        pop bc
        djnz dicinf9
        ld hl,dictxt0
        xor a
        jr dicinfd
dicinfc pop hl
        pop bc
        ld bc,15
        add hl,bc
        ld a,2
dicinfd ld de,0
        ret

;### DICINH -> inits icon header
dicinhb ld hl,dicnewicn
        bit 3,(hl)
        ld a,8
        jr z,dicinh2
        ld a,10
dicinh2 ld (dicnewdat3a+2),a
        ret z
        jr dicinh0
dicinha ld hl,dicprpicn
        bit 3,(hl)
        ld a,8
        jr z,dicinh1
        ld a,10
dicinh1 ld (dicprpdat1a+2),a
        ld (dicprpdat2a+2),a
        ret z
dicinh0 inc hl:inc hl:inc hl
        ld e,l:ld d,h
        ld bc,7
        add hl,bc
        ex de,hl
        ld (hl),e
        inc hl
        ld (hl),d
        inc hl
        ex de,hl
        ld bc,4-7+2
        add hl,bc
        ex de,hl
        ld (hl),e
        inc hl
        ld (hl),d
        ret


;==============================================================================
;### LINE UP ROUTINES #########################################################
;==============================================================================

;### LUPCOL -> collision detection
;### Input      DE=xpos, HL=ypos, A=other icon ID
;### Output     CF=1 collision
;### Destroyed  F,BC,DE,HL,IX,IY
lupcolx dw 0
lupcoly dw 0

lupcol  ld (lupcolx),de
        ld (lupcoly),hl
        call icnadr
        inc hl:inc hl
        ld ix,lupcolx
        ld bc,48-1
        push hl
        call lupcol1
        pop hl
        ret nc
        inc hl:inc hl
        inc ix:inc ix
        ld c,40-1
lupcol1 ld e,(hl)
        inc hl
        ld d,(hl)       ;de=pos other
        ld l,(ix+0)
        ld h,(ix+1)     ;hl=pos own
        push hl
        add hl,bc       ;hl=pos+width-1
        or a
        sbc hl,de
        ccf
        pop hl
        ret nc          ;own before other -> no collision
        ex de,hl
        add hl,bc
        or a
        sbc hl,de       ;test, if other is before
        ccf
        ret

;### LUPALN -> align position
;### Input      DE=old xpos, HL=old ypos
;### Output     DE=new xpos, HL=new ypos
;### Destroyed  AF,BC,IX,IY
lupalng db 08,08, 13,11, 26,22, 48,40, 52,44

lupaln  push hl
        push de
        call lupfre0
        pop de
        ld a,(dicarrgrd)
        add a
        ld c,a
        ld b,0
        ld ix,lupalng
        add ix,bc
        ld iy,lupfrem+0
        call lupaln1    ;align X
        ex (sp),hl
        inc ix
        ex de,hl
        ld iy,lupfrem+2
        call lupaln1    ;align Y
        pop de
        ret
lupaln1 bit 7,d         ;** de=pos, (ix+0)=grid -> hl=new pos
        ld hl,0
        ret nz          ;left/top outside
        ld c,e:ld b,d
        ld e,(ix+0)
        ld d,0
        call clcd16     ;hl=div, e=mod
        ld a,(ix+0)
        srl a
        cp e
        jr nc,lupaln2
        inc hl
lupaln2 ld a,(ix+0)
        ex de,hl
        call clcm16
        ld e,(iy+0)
        ld d,(iy+1)
        or a
        sbc hl,de
        ex de,hl
        ret nc          ;right/down outside
        add hl,de
        ret

;### LUPFRE -> find free icon position
;### Output     DE=xpos, HL=ypos
;### Destroyed  AF,BC,IX,IY
lupfrem dw 0,0  ;max x,y
lupfreg dw 0,0  ;grid x,y

lupfre  call lupfre0
        ld a,(dicarrgrd)
        add a
        ld l,a
        ld h,0
        ld bc,lupalng
        add hl,bc
        ld de,lupfreg
        ldi:inc de:ldi
        ld de,0
lupfre1 ld hl,0
lupfre2 ld a,(icnnumval)
lupfre3 sub 1
        ccf
        ret nc
        push de
        push hl
        call lupcol
        pop hl
        pop de
        jr nc,lupfre3
        ld ix,lupfrem+2
        call lupfre4
        jr c,lupfre2
        ex de,hl
        ld ix,lupfrem+0
        call lupfre4
        ex de,hl
        jr c,lupfre1
        ld de,(lupfrem+0)
        ld hl,(lupfrem+2)
        ret
lupfre4 ld c,(ix+4)
        ld b,0
        add hl,bc
        push hl
        ld c,(ix+0)
        ld b,(ix+1)
        or a
        sbc hl,bc
        pop hl
        ret
lupfre0 ld hl,#8139:rst #28
        ld bc,-48
        add ix,bc
        ld (lupfrem+0),ix
        ld bc,-40-14
        add iy,bc
        ld (lupfrem+2),iy
        ret

;### LUPALL -> line up all icons
;### Destroyed  AF,BC,DE,HL,IX,IY
lupall  call icnpos
        ld a,(icnnumval)        ;*** align all icons
lupall1 sub 1
        jr c,lupall2
        push af             ;align all icons
        call icnadr
        inc hl
        inc hl
        ld e,(hl)           ;get old position
        inc hl
        ld d,(hl)
        inc hl
        ld a,(hl)
        inc hl
        push hl
        ld h,(hl)
        ld l,a
        call lupaln         ;align
        ld c,l
        ld b,h
        pop hl
        ld (hl),b           ;store new position
        dec hl
        ld (hl),c
        dec hl
        ld (hl),d
        dec hl
        ld (hl),e
        pop af
        jr lupall1
lupall2 ld a,(icnnumval)        ;*** collision tests
lupall3 sub 1
        jr c,lupapp6
        push af
        call icnadr
        inc hl
        inc hl
        ld e,(hl)
        inc hl
        ld d,(hl)
        inc hl
        ld a,(hl)
        inc hl
        ld h,(hl)           ;de,hl=pos of the current icon
        ld l,a
        pop af
        push af
lupall4 sub 1               ;test with all previouse icons
        jr c,lupall5        ;no collisions -> continue with next icon
        push de
        push hl
        call lupcol
        pop hl
        pop de
        jr nc,lupall4
        pop af              ;collision -> move to a free position
        call icnadr
        push af
        push hl
        call lupfre
        ld c,l:ld b,h
        pop hl
        inc hl:inc hl
        ld (hl),e
        inc hl
        ld (hl),d
        inc hl
        ld (hl),c
        inc hl
        ld (hl),b
lupall5 pop af
        jr lupall3
lupapp6 call icnini
        jp dskref0


;==============================================================================
;### TASK SWITCH ROUTINES #####################################################
;==============================================================================

wingrpmax   equ 32          ;max 32 windows

windatsta   equ 0           ;Status (0=close, 1=normal, 2=maximiert, 3=minimiert, +128=zentriert öffnen)
windatprz   equ 3           ;Prozeßnummer
windattit   equ 30          ;Adresse Titeltext
windatsto   equ 50          ;Alter Status (vor Minimierung)

tskswtwid   db 0            ;task switch window ID
tskswtsel   db 1            ;current selected window
tskswtnum   db 0            ;number of windows
tskswtidx   ds wingrpmax    ;index table

tskswtpgm   dw 0            ;program group memory
tskswtwgm   dw 0            ;window group memory
tskswtonm   db 0            ;original numbers (including non taskbar)
tskswtoix   ds wingrpmax    ;original index table
tskswtinf   ds 4*wingrpmax  ;window data (1b bnk, 1w titadr, 1b status)

;### TSKPRE -> prepares task switcher data and window
;### Input      A=direction (#28=jr z=next, #18=jr=prev)
;### Output     CF=1 no windows
tskpre  ld (tskpre6),a
        xor a
        ld (tskswtnum),a
        ld hl,(dskvaradr)
        ld bc,symextpgm
        add hl,bc
        xor a
        rst #20:dw jmp_bnkrwd
        ld (tskswtpgm),bc       ;store program group memory adr
        rst #20:dw jmp_bnkrwd
        ld (tskswtwgm),bc       ;store window group memory adr
        rst #20:dw jmp_bnkrwd
        ld l,c
        ld h,b
        ld de,tskswtonm
        ld bc,1+wingrpmax
        call bnkdst
        rst #20:dw jmp_bnkcop
        ld hl,tskswtonm
        ld a,(hl)
        or a                    ;a=number of windows
        scf
        ret z                   ;no windows -> quit
        ld iy,tskswtdat_icn
        ld b,30
        ld de,16
tskpre2 ld (iy+2),64            ;first hide all icons
        add iy,de
        djnz tskpre2
        ld c,a
        ld b,0
        add hl,bc               ;hl=first window
        ld de,tskswtidx         ;de=filtered window index
        ld ix,tskswtinf         ;ix=window data pointers
        ld iy,tskswtdat_icn     ;iy=icon records
tskpre3 push af
        ld a,(hl)
        push hl
        ld hl,symextwin
        cp (hl)
        jr z,tskpre4            ;window is desktop -> skip
        ld (de),a               ;store ID (if window not in taskbar, ignore/overwrite later)
        add a:add a
        ld c,a
        ld b,0
        ld hl,(tskswtwgm)
        add hl,bc
        xor a
        rst #20:dw jmp_bnkrwd   ;c=type, b=bnk
        dec c
        jr nz,tskpre4           ;not in taskbar -> skip
        push de
        ld (ix+0),b             ;store bank
        ld e,b
        rst #20:dw jmp_bnkrwd   ;bc=adr
        ld a,e                  ;a=bank
        ld hl,windattit
        add hl,bc
        rst #20:dw jmp_bnkrwd   ;bc=adr title
        ld (ix+1),c
        ld (ix+2),b             ;store titleadr
        ld bc,windatsta-windattit-2
        add hl,bc
        rst #20:dw jmp_bnkrbt   ;b=status
        ld (ix+3),b             ;store status
        ld bc,windatprz-windatsta-1
        add hl,bc
        rst #20:dw jmp_bnkrbt   ;b=prozess ID
        ld a,b
        call tskicn             ;HL=icon address, B=bank, C=type (8=4col, 10=16col)
        ld (iy+2),c
        ld (iy+3),b
        ld (iy+4),l
        ld (iy+5),h
        pop de
        inc de
        ld hl,tskswtnum         ;increase window number
        inc (hl)
        ld bc,4
        add ix,bc
        ld c,16
        add iy,bc
tskpre4 pop hl
        dec hl
        pop af
        dec a
        jr nz,tskpre3
        ld a,(tskswtnum)
        sub 1
        ret c
        push af
        ld hl,56-32             ;adjust window y-size and title pos
tskpre5 ld bc,32
        add hl,bc
        sub 6
        jr nc,tskpre5
        ld (tskswtwin+10),hl
        ld (tskswtwin+18),hl
        ld (tskswtwin+22),hl
        ld (tskswtwin+26),hl
        ld bc,-16
        add hl,bc
        ld (tskswtdat_tit+8+00),hl
        inc hl:inc hl
        ld (tskswtdat_tit+8+16),hl
        ld a,1+128
        ld (tskswtwin),a        ;open centered
        pop af
tskpre6 jr z,tskpre1            ;set selector
        ld a,1
tskpre1 ld (tskswtsel),a
        call tskpos
        call tsktit
        or a
        ret

;### TSKICN -> find icon of process
;### Input      A=process ID
;### Output     HL=icon address, B=bank, C=type (8=4col, 10=16col)
tskicn  ld (tskicn5+1),a
        ld hl,(tskswtpgm)           ;hl=program group mem
        ld e,24
tskicn1 xor a
        rst #20:dw jmp_bnkrbt       ;b=bank
        inc b
        dec b
        jr nz,tskicn3
        ld bc,3
        add hl,bc
tskicn2 dec e
        jr nz,tskicn1
        ld hl,prgicn16c             ;not found -> use dummy ##!!## 4 or 16 selection
        ld a,(App_BnkNum)
        ld b,a
        ld c,10
        ret
tskicn3 push de
        ld e,b                      ;e=bank
        rst #20:dw jmp_bnkrwd       ;bc=address
        inc hl
        push hl
        ld l,c
        ld h,b
        ld (tskicn6+1),hl
tskicn5 ld d,0                      ;d=process id
        ld bc,prgpstprz
        add hl,bc
        ld a,e
        rst #20:dw jmp_bnkrbt
        ld a,b
        cp d
        jr z,tskicn4
        ld bc,prgpstspz-prgpstprz-1
        add hl,bc
        ld a,e
        rst #20:dw jmp_bnkrwd
        ld a,b:cp d:jr z,tskicn4
        ld a,c:cp d:jr z,tskicn4
        ld a,e
        rst #20:dw jmp_bnkrwd
        ld a,b:cp d:jr z,tskicn4
        ld a,c:cp d:jr z,tskicn4
        pop hl
        pop de
        jr tskicn2
tskicn4 push de
        push ix
        push iy
        ld hl,jmp_scrget:rst #28
tskicn6 ld hl,0
        bit 4,d
        pop iy
        pop ix
        pop de
        jr z,tskicn7            ;no 16col mode -> use 4col icon
        ld bc,prgdatflg
        add hl,bc
        ld a,e
        rst #20:dw jmp_bnkrbt
        bit 0,b
        ld bc,prgdatibg-prgdatflg-1
        jr z,tskicn8            ;no 16col icon available -> use 4col icon
        rst #20:dw jmp_bnkrwd
        ld l,c
        ld h,b
        ld c,10
        jr tskicn9
tskicn7 ld bc,prgdatibg
tskicn8 add hl,bc
        ld c,8
tskicn9 ld b,e
        pop de
        pop de
        ret

;### TSKTIT -> get titel from current selected window
;### Input      (tskswtsel)=current window
tsktit  ld a,(tskswtsel)
        add a
        add a
        ld c,a
        ld b,0
        ld hl,tskswtinf
        add hl,bc
        call bnkdst
        or (hl)
        inc hl
        ld e,(hl)
        inc hl
        ld d,(hl)
        ex de,hl
        ld de,tsktittxt
        ld c,31
        rst #20:dw jmp_bnkcop
        ret

;### TSKPOS -> update selector positions
;### Input      (tskswtsel)=current window
tskpos  ld hl,(tskswtdat_shw+06):ld (tskswtdat_clr+06),hl
        ld hl,(tskswtdat_shw+08):ld (tskswtdat_clr+08),hl
        ld hl,(tskswtdat_shw+22):ld (tskswtdat_clr+22),hl
        ld hl,(tskswtdat_shw+24):ld (tskswtdat_clr+24),hl
        ld a,(tskswtsel)
        ld hl,4-32
        ld bc,32
tskpos1 add hl,bc
        sub 6
        jr nc,tskpos1
        add 6
        ld (tskswtdat_shw+08),hl
        inc hl
        ld (tskswtdat_shw+24),hl
        ld hl,4-32
tskpos2 add hl,bc
        sub 1
        jr nc,tskpos2
        ld (tskswtdat_shw+06),hl
        inc hl
        ld (tskswtdat_shw+22),hl
        ret

;### TSKNXT -> starts task switcher with next window
tsknxt  ld a,#28
        jr tskswt

;### TSKPRV -> starts task switcher with previous window
tskprv  ld a,#18
        jr tskswt

;### TSKSWT -> opens task switcher window
tskswt  call tskpre             ;prepare window
        jp c,prgprz0            ;no windows there -> quit
        ld a,(App_BnkNum)
        ld de,tskswtwin
        call SyDesktop_WINOPN
        jp c,prgprz0
        ld (tskswtwid),a
tskswt1 rst #30                 ;idle
        ld hl,jmp_keysta:rst #28
        bit 2,e                 ;e=Shift(+1)/Control(+2)/Alt(+4)-Status
        jp z,tskswt5            ;alt not pressed anymore -> select
        db #dd:ld h,-1          ;IYL=sender ID (-1 = receive messages from any sender)
        ld a,(App_PrcID)
        db #dd:ld l,a           ;IXL=our own process ID
        ld iy,App_MsgBuf        ;IY=Messagebuffer
        rst #18                 ;get Message -> IXL=Status, IXH=sender ID
        db #dd:dec l
        jr nz,tskswt1
        ld iy,App_MsgBuf
        ld a,PRC_ID_SYSTEM
        db #dd:cp h
        jr z,tskswt4
        ld a,PRC_ID_DESKTOP
        db #dd:cp h
        jr nz,tskswt1
        ld a,(App_MsgBuf)
        cp MSR_DSK_WFOCUS
        jr z,tskswt2            ;focus changed -> cancel
        cp MSR_DSK_WCLICK
        jr nz,tskswt1
        ld a,(tskswtwid)
        cp (iy+1)
        jr nz,tskswt2           ;other window clicked -> cancel
        ld a,(iy+2)
        cp DSK_ACT_CONTENT
        jr nz,tskswt2
        ld a,(App_MsgBuf+8)
        or a
        sub 1
        jr c,tskswt1
        jr tskswt6
tskswt2 call tskswt3            ;cancel
        jp prgprz0
tskswt3 ld a,(tskswtwid)
        jp SyDesktop_WINCLS
tskswt4 ld a,(App_MsgBuf)
        ld hl,tskswtnum
        cp 3
        jr nz,tskswt9
        ld a,(tskswtsel)
        sub 1
        jr nc,tskswt7
        ld a,(hl)
        dec a
        jr tskswt7
tskswt9 cp 2
        jr nz,tskswt1
        ld a,(tskswtsel)
        inc a
        cp (hl)
        jr nz,tskswt7
        xor a
tskswt7 ld (tskswtsel),a
        call tskpos
        call tsktit
        ld a,(tskswtwid)
        ld de,256*tskswt_sel+256-5
        call SyDesktop_WINDIN
        jp tskswt1
tskswt5 ld a,(tskswtsel)
tskswt6 or a
        jr z,tskswt2            ;same window selected -> do nothing
        push af                 ;A=window, select it
        call tskswt3
        pop af
        ld c,a
        ld b,0
        ld hl,tskswtidx
        add hl,bc
        ld a,(hl)
        ld e,a                  ;E=window ID
        ld a,c
        add a:add a
        ld c,a
        ld b,0
        ld hl,tskswtinf+3
        add hl,bc
        ld a,(hl)               ;A=window status (1=normal, 2=maximized, 3=minimized)
        cp 3
        ld a,e
        jr nz,tskswt8
        call SyDesktop_WINMID   ;window was minimized -> restore
        jp prgprz0
tskswt8 call SyDesktop_WINTOP   ;window was open -> set to top
        jp prgprz0


;==============================================================================
;### SYSTEM EXTENSIONS ROUTINES ###############################################
;==============================================================================

;### SYSSEC -> Dialog für System-Sicherheit öffnen
syssecf db 0        ;flag, if security window is open
syssec  ld a,1
        ld (syssecf),a
        ld hl,jmp_mtgcnt        ;*** CPU-Last Infos holen
        rst #28                 ;IY,IX=Systemzähler, DE=Leerlaufprozess-Counter
        push ix
        pop bc
        ld ix,100*60
        call clcd32         ;IY,BC=Minuten
        ld ix,60
        call clcd32         ;IY,BC=Stunden, HL=Minuten
        ld a,l
        call clcdez
        ld (systxtsec5t),hl
        ld a,c
        call clcdez
        ld (systxtsec4t),hl
        ld bc,DSK_SRV_DSKSTP*256+2
        ld hl,syswinsec
        jp sysopn

;### SYSPWD -> Dialog zum Ändern des Paßwortes öffnen
syspwdw db -1
syspwd  ld a,(syspwdw)
        cp -1
        jr z,syspwd1
        jp SyDesktop_WINMID
syspwd1 ld hl,syspwda
        ld de,sysinppwd1b
        ld bc,16
        ldir
        ld ix,sysinppwd1
        call strinp
        ld de,syswinpwd
        ld a,128+1
        ld (de),a
        ld a,(App_BnkNum)
        call SyDesktop_WINOPN   ;open extended desktop window
        ret c
        ld (syspwdw),a
        ret

;### SECWINx -> Aktionen im Security-Fenster ausführen
secwin0 ld hl,sysspcw           ;*** Security -> Lock
        call sysclo0
        ld hl,syspwda
        ld de,sysinplok1b
        ld bc,16
        ldir
        ld ix,sysinplok1
        call strinp
        call lokwin1
        ld bc,DSK_SRV_DSKPNT*256+2
        ld hl,syswinlok
        jp sysopn
secwin1 call sysclo             ;*** Security -> TaskManager
        ld c,MSC_SYS_PRGTSK
        call msgsys
        jp prgprz0
secwin2 call sysclo             ;*** Security -> Run
        ld c,MSC_SYS_PRGSTA
        call msgsys
        jp prgprz0
secwin3 call sysclo             ;*** Security -> Password
        call syspwd
        jp prgprz0
secwin4 call sysclo             ;*** Security -> ShutDown
        ld c,MSC_SYS_SYSQIT
        call msgsys
        jp prgprz0
secwin5 call sysclo             ;*** Security -> Cancel
        jp prgprz0

;### PASWINx -> Aktionen im Passwort-Ändern Fenster ausführen
paswina ld hl,sysinppwd2b       ;*** Passwort -> Ok
        ld de,syspwdb
        call paswin6
        ld hl,prgmsgerrb
        jr nz,paswin2           ;altes falsch -> Fehler, nochmal neu
        ld hl,sysinppwd3b
        ld de,sysinppwd4b
        call paswin6
        ld hl,prgmsgerra
        jr nz,paswin2           ;neues1<>neues2 -> Fehler, nochmal neu
        ld hl,sysinppwd4b
        ld de,syspwdb
        ld bc,16
        ldir                    ;neues Paßwort merken
        ld hl,sysinppwd1b
        ld de,syspwda
        ld bc,16
        ldir
        ld hl,syspwda
        ld b,32
paswin1 ld a,(hl)               ;Paßwort und Username in Großschrift umwandeln
        call clcucs
        ld (hl),a
        inc hl
        djnz paswin1
        ld de,(cfgadr)          ;save username + password
        ld hl,syspwda
        ld bc,33
        ld a,(cfgbnk)
        rst #20:dw jmp_bnkcop
        ld bc,256*1+MSC_SYS_SYSCFG
        call msgsys
paswinb ld hl,syspwdw           ;*** Passwort -> Cancel
        call sysclo0
        call paswin4
        jp prgprz0
paswin2 call prgerr
        call paswin4
        ld e,7                  ;Control aktualisieren
        call paswin3
        ld e,8
        call paswin3
        ld e,9
        call paswin3
        jp prgprz0
paswin3 ld a,(syspwdw)
        ld b,a
        ld c,MSC_DSK_WININH
        jp msgsnd
paswin4 ld a,8
        ld (sysgrppwd+14),a     ;Fokus auf Paßwort setzen
        ld a,3                  ;Passwörter löschen
        ld hl,sysinppwd2+2
paswin5 ld e,l
        ld d,h
        inc de
        ld bc,7
        ld (hl),0
        ldir
        ld bc,14-7
        add hl,bc
        dec a
        jr nz,paswin5
        ld (sysinppwd2b),a
        ld (sysinppwd3b),a
        ld (sysinppwd4b),a
        ret
paswin6 ld a,(de)               ;Eingabe vergleichen
        call clcucs
        ld c,a
        ld a,(hl)
        call clcucs
        cp c
        ret nz
        or a
        ret z
        inc de
        inc hl
        jr paswin6

;### LOKWIN -> Aktionen im Lock-Fenster ausführen
lokwin  ld hl,sysinplok1b       ;*** Lock -> OK
        ld de,syspwda
        call paswin6
        jp nz,lokwin2
        ld hl,sysinplok2b
        ld de,syspwdb
        call paswin6
        jp z,secwin5
lokwin2 call lokwin1
        ld e,7                  ;Control aktualisieren
        ld a,(sysspcw)
        ld b,a
        ld c,MSC_DSK_WININH
        call msgsnd
        jp prgprz0
lokwin1 ld a,8
        ld (sysgrplok+14),a     ;Fokus auf Paßwort setzen
        xor a                   ;Passwort löschen
        ld hl,sysinplok2+2
        ld de,sysinplok2+3
        ld bc,8-1
        ld (hl),a
        ldir
        ld (sysinplok2b),a
        ret


;==============================================================================
;### STARTMENU MANAGEMENT ROUTINES ############################################
;==============================================================================

stmrecmax   equ 1024
stmrecsiz   dw 0    ;size of the startmenu data record (<=stmrecmax)


;### STMADR -> get menu block address
;### Input      A=menu block ID
;### Output     HL=address of temp pointer to menu data record, DE=length of menu block (excluding length word)
;### Destroyed  AF
stmadr  ld hl,cfgdynbeg
        inc hl
        inc hl
stmadr0 ld e,(hl)
        inc hl
        ld d,(hl)
        inc hl
        or a
        ret z
        add hl,de
        dec a
        jr stmadr0

;### STMAUT -> executes all autostart entries
stmauts db "Autostart",0
stmautn db 0

stmaut  ld a,(stmautn)
        or a
        ret z
        call stmadr
        inc hl
        inc hl
stmaut1 ld a,(hl)
        or a
        ret z
        push hl
        inc hl
        ld a,(hl)
        dec a
        jr nz,stmaut2
        inc hl
        call strskp
        call menclk0
stmaut2 pop hl
        ld c,(hl)
        ld b,0
        add hl,bc
        jr stmaut1

;### STMINI -> generates menu data records from config data
;### Output     stmrec filled, (stmrecsiz) updated
;### Destroyed  AF,BC,DE,HL,IY
stmini  call stmini0
stminix ld a,(stmrec)
        add a:add a:add a
        inc a
        cpl
        ld c,a
        ld b,-1
        xor a
        ld hl,(dskvaradr)
        inc hl:inc hl:inc hl
        rst #20:dw jmp_bnkwwd   ;write startmenu position delta
        ret
stmini0 ld iy,stmrec        ;IY=pointer to menu data records
        xor a               ;A=number of menu block
stmini1 push af
        call stmadr
        ld a,e
        or d
        jp z,stmini9
        db #fd:ld a,l:ld (hl),a:inc hl
        db #fd:ld a,h:ld (hl),a:inc hl
        push iy             ;HL=first source entry (behind address)
        inc iy:inc iy       ;IY=first destination entry (behinder number of entries)
        ld e,0              ;E=number of entries for this block
stmini2 ld a,(hl)
        or a
        jp z,stmini8        ;end of block
        inc hl
        ld a,(hl)
        inc hl
        cp 1
        jr c,stmini7
        jr z,stmini5
        cp 3
        jr c,stmini6
        ld (iy+0),5             ;*** Submenu
        ld d,(hl)
        inc hl
        ld (iy+4),d
        ld (iy+2),l
        ld (iy+3),h

        push hl
        ld bc,stmauts       ;test, if submenu name is "Autostart"
stminid ld a,(bc)
        cp (hl)
        jr nz,stminie
        inc bc
        inc hl
        or a
        jr nz,stminid
        ld a,d
        ld (stmautn),a
stminie pop hl

        call strskp
stmini4 ld (iy+6),0
        ld (iy+7),0
        ld (iy+1),0
        ld bc,8
        add iy,bc
        inc e
        jr stmini2
stmini5 ld (iy+0),1             ;*** Link
        ld (iy+2),l
        ld (iy+3),h
        call strskp
        ld (iy+4),l
        ld (iy+5),h
        call strskp
        call strskp
        inc hl
        jr stmini4
stmini6 ld (iy+0),1             ;*** Special Link
        ld (iy+2),l
        ld (iy+3),h
        call strskp
        ld a,(hl)
        inc hl
        ld (iy+4),a
        ld a,(hl)
        inc hl
        ld (iy+5),a
        or (iy+4)
        jr nz,stmini4
        ld (iy+0),0
        jr stmini4
stmini7 ld (iy+0),1+8           ;*** Line
        ld (iy+2),0
        ld (iy+3),0
        jr stmini4
stmini8 pop hl              ;block finished
        inc e:dec e
        jr nz,stminif
        ld (iy+0),0         ;block is empty -> place dummy entry
        ld bc,stmemptxt
        ld (iy+2),c
        ld (iy+3),b
        ld bc,8
        add iy,bc
        inc e
stminif ld (hl),e           ;store number of entries
        inc hl
        ld (hl),0
        pop af
        inc a
        jp stmini1
stmini9 pop bc              ;menus finished -> store address pointers
        ld iy,stmrec
stminia ld c,(iy+0)
        inc iy:inc iy
stminib ld a,(iy+0)
        cp 5
        jr nz,stminic
        ld a,(iy+4)
        call stmadr
        ld a,(hl)
        ld (iy+4),a
        inc hl
        ld a,(hl)
        ld (iy+5),a
stminic ld de,8
        add iy,de
        dec c
        jr nz,stminib
        djnz stminia
        push iy:pop hl
        ld bc,stmrec
        sbc hl,bc
        ld (stmrecsiz),hl
        ret

;### STMDAT -> [remote] sends startmenu address/bank to process
;### Output     (p2)=address, (p4)=bank
stmdat  ld hl,(stmrecsiz)
        ld (App_MsgBuf+6),hl
        ld de,cfgdynbeg
        ld hl,(App_BnkNum)
        db #dd:ld a,h
        call msgsnd1
        jp prgprz0

;### STMCOP -> [remote] moves memory area
stmcop  ld de,(App_MsgBuf+2)
        ld hl,(App_MsgBuf+4)
        ld bc,(App_MsgBuf+6)
        ld a,(App_MsgBuf+8)
        or a
        jr z,stmcop1
        ldir
        jp prgprz0
stmcop1 lddr
        jp prgprz0

;### STMIIN -> [remote] reinits startmenu and icons
stmiin  call stmini
        call icnpos
        call icnini
        jp prgprz0


;==============================================================================
;### ICON MANAGEMENT ROUTINES #################################################
;==============================================================================

dskmemmax   equ 16383-256   ;maximum amount of data
icnnummax   equ 32          ;maximum number of icons
icnnumval   db 0            ;current number of icons
icnnumold   db 0            ;number of icons since last icnini

;### ICNADR -> returns data addresse of an icon
;### Input      A=icon ID (0-31)
;### Output     HL=address (points to length word), DE=length
;### Destroyed  F,B
icnadr  ld hl,cfgdynbeg
icnadr0 ld e,(hl)
        inc hl
        ld d,(hl)
        inc hl
        add hl,de       ;skip startmenu data
        ld b,a
        inc b
icnadr1 ld e,(hl)
        inc hl
        ld d,(hl)
        dec hl
        dec b
        ret z
        add hl,de
        jr icnadr1

;### ICNINI -> inits icons (init window controls, set colours and transfer data pointers to data area)
;### Output     (icnnumval)=number of icons
;### Destroyed  AF,BC,DE,HL,IX,IY
icnini  call icnini6                    ;save widget control records
        ldir
        ld hl,jmp_sysinf                ;get icontext colours
        ld de,256*1+5
        ld ix,icninic
        ld iy,349-163
        rst #28
        ld a,(icninic)
        ld (icnini4+3),a
        ld ix,dskbgricn
        ld iy,dskbgrobj1
        xor a
icnini1 call icnadr
        ld c,a
        ld a,e
        or d
        ld a,c
        jr z,icnini3
        ld (iy+0),a                     ;icon ID
        ld (iy+1),128                   ;desktop object type (128=icon)
        ld (iy+2),9                     ;control type (9=icon)
        ld (iy+3),255                   ;ram bank (-1=same)
        db #dd:ld c,l:ld (iy+4),c       ;icon data record address
        db #dd:ld c,h:ld (iy+5),c
        inc hl:inc hl
        ld c,(hl):ld (iy+6),c:inc hl    ;x pos
        ld c,(hl):ld (iy+7),c:inc hl
        ld c,(hl):ld (iy+8),c:inc hl    ;y pos
        ld c,(hl):ld (iy+9),c:inc hl
        ld (iy+10),48                   ;x len
        ld (iy+12),40                   ;y len
        ld bc,12
        ld (ix+2),l                     ;textline 1
        ld (ix+3),h
        add hl,bc
        ld (ix+4),l                     ;textline 2
        ld (ix+5),h
        add hl,bc
        ld (ix+0),l                     ;graphic address
        ld (ix+1),h
        bit 3,(hl)
        ld c,32+128                     ; 4 colour mode
        jr z,icnini2
        call dicinh0                    ;16 colour mode
        ld c,16+32+128
icnini2 ld (ix+6),c
icnini4 ld (ix+7),0
        ld bc,8
        add ix,bc
        ld c,16
        add iy,bc
        inc a
        jp icnini1
icnini3 ld (icnnumval),a
        ld (icnnumold),a
        push af
        call icnini6                    ;restore widget control records
        ex de,hl
        ldir
        pop af
        ld hl,wdgnumval
icnini5 add (hl)
        add 8
        ld (dskbgrgrp),a
        ret
icnini6 ld hl,icnnumold
        xor a
        call wdgrec1
        push ix:pop hl
        ld de,tmpbuf
        ld bc,8*16
        ret

;### ICNPOS -> udates positions of icon data from actual desktop data
;### Destroyed  AF,B,DE,HL,IX,IY
icnpos  ld a,(icnnumval)
        or a
        ret z
        ld hl,cfgdynbeg
        ld e,(hl)
        inc hl
        ld d,(hl)
        inc hl
        add hl,de
        push hl:pop iy      ;iy=first icon data
        ld ix,dskbgrobj1    ;ix=first icon control
        ld b,a
icnpos1 ld a,(ix+6+0)
        ld (iy+2+0),a
        ld a,(ix+6+1)
        ld (iy+2+1),a
        ld a,(ix+8+0)
        ld (iy+4+0),a
        ld a,(ix+8+1)
        ld (iy+4+1),a
        ld e,(iy+0)
        ld d,(iy+1)
        add iy,de
        ld de,16
        add ix,de
        djnz icnpos1
        ret

;### ICNRSZ -> resizes icon data
;### Input      A=icon ID, HL=difference
;### Output     CF=0 -> ok, icnini NOT called!
;###            CF=1 -> memory full
;### Destroyed  AF,BC,DE,HL
icnrsz  call icnrsz0
        ret c
        push bc             ;update icon-entry length
        call icnadr
        pop bc
        ld e,(hl)
        inc hl
        ld d,(hl)
        ex de,hl
        add hl,bc
        ex de,hl
        ld (hl),d
        dec hl
        ld (hl),e
        or a
        ret

icnrsz0 push af             ;check for available memory and update icon data length
        call memchk         ;BC=difference
        pop hl
        ret c
        ld a,h
        ld hl,cfgdynbeg
        ld e,(hl)
        inc hl
        ld d,(hl)
        add hl,de           ;HL points to 2nd byte of icondata length
        ld d,(hl)
        dec hl
        ld e,(hl)
        ex de,hl
        add hl,bc           ;HL=new all length
        ex de,hl
        ld (hl),e
        inc hl
        ld (hl),d           ;store new icondata length
        push bc
        push af

        inc a
        push bc
        call icnadr         ;hl=adr of next after resized one
        push hl
        ld a,(icnnumval)
        call icnadr         ;hl=adr behind last icon
        inc hl
        inc hl              ;hl includes 0-terminator
        pop de              ;de=adr of next after resized one
        sbc hl,de           ;de=start old, hl=length
        ld bc,(wdgdatlen)
        add hl,bc           ;hl includes widget length
        ld c,l:ld b,h       ;bc=length
        pop hl              ;hl=dif
        bit 7,h             ;zf=1 ldir, zf=0 lddr
        add hl,de           ;hl=start new
        ex de,hl            ;de=start new, hl=start old, bc=length
        jr z,icnrsz1
        ldir                ;move data forwards
        jr icnrsz2
icnrsz1 add hl,bc
        dec hl
        ex de,hl
        add hl,bc
        dec hl
        ex de,hl
        lddr                ;move data backwards

icnrsz2 pop af
        pop bc
        or a
        ret

;### ICNDEL -> deletes icon
;### Input      A=icon ID
;### Output     (icnnumval)--
;### Destroyed  AF,BC,DE,HL,IX,IY
icndel  call icnadr
        ld hl,0
        or a
        sbc hl,de
        call icnrsz0
        ld hl,icnnumval
        dec (hl)
        xor a
        call wdgdel2        ;disable all widgets
        call icnini         ;re-inits icons
        jp wdgini0          ;re-inits all widgets

;### ICNCOP -> copies icon into the clipboard
;### Input      A=icon ID
;### Destroyed  AF,BC,DE,HL,IX,IY
icncop  call icnadr
        push hl:pop ix
        push de:pop iy
        ld de,(App_BnkNum)
        ld d,CLPTYP_ICON
        rst #20:dw jmp_bufput
        ret

;### ICNNEW -> reserves memory for new icon
;### Input      HL=icon size
;### Output     CF=0 ok, HL=address for new icon, (icnnumval)++, icnini NOT called!
;###            CF=1 memory full
;### Destroyed  AF,BC,DE,HL
icnnew  ld a,(icnnumval)
        cp icnnummax-1
        scf
        ret z
        call icnrsz
        ret c
        ld hl,icnnumval
        ld a,(hl)
        inc (hl)
        call icnadr
        or a
        ret

;### ICNFIL -> gets icon from file
;### Input      HL=filepath, DE=icondata
;### Destroyed  AF,BC,DE,HL,IX,IY
icnfila     dw 0        ;icondataadr
icnfilh04   db 6,24,24
icnfilh16   db 12,24,24:dw 0,0,12*24:db 5

icnfil  push hl
        ld (icnfila),de
        call dicinf
        pop bc
        cp 1
        jr z,icnfil3            ;* EXE
        jr nc,icnfil1
        ld hl,icndummy          ;* unknown
        ld de,(icnfila)
        ld bc,144+3
        ldir
        or a
        ret
icnfil1 ld a,(hl)               ;* linked
        cp "%"
        ld de,icnfilpth
        jr nz,icnfil2
        push hl
        ld hl,jmp_sysinf
        ld de,256*32+5
        ld ix,icnfilpth
        ld iy,163-163
        rst #28             ;copy system path
        ld hl,icnfilpth
        call strskp
        dec hl
        ex de,hl
        pop hl
        inc hl
icnfil2 ld a,(hl)           ;copy remaining path
        ldi
        res 5,a
        or a
        jr nz,icnfil2
        dec de
        ld (de),a
        ld bc,icnfilpth
icnfil3 ld l,c:ld h,b           ;* load icon from EXE
        ld a,(App_BnkNum)
        db #dd:ld h,a
        call SyFile_FILOPN
        ret c
        ld (icnlodhnd),a
        ld hl,tmpbuf
        ld de,(App_BnkNum)
        ld bc,256
        call SyFile_FILINP
        jr c,icnfil4
        ld hl,jmp_scrget:rst #28
        bit 4,d
        jr z,icnfil6
        ld hl,tmpbuf+40
        bit 0,(hl)
        jr nz,icnfil5
icnfil6 ld hl,tmpbuf+109        ;* load 4colour icon
        ld de,(icnfila)
        ld bc,144+3
        ldir
        ld hl,icnfilh04
        ld bc,3
icnfil7 ld de,(icnfila)
        ldir
icnfil4 ld a,(icnlodhnd)
        jp SyFile_FILCLO
icnfil5                         ;* load 16colour icon
        ld hl,(tmpbuf+41)       ;hl=ofs
        ld a,(tmpbuf+40)        ;a=crunched flags
        ld de,#100              ;de=filofs
        ld bc,(tmpbuf+00)
        dec b
        call icnfild
        ld bc,(tmpbuf+02)       ;icon is never in code area
        call icnfild
        jr c,icnfil8            ;icon in data area
        ld bc,(tmpbuf+04)
        call icnfild            ;icon in trns area

icnfil8 push hl:pop ix
        ld iy,0
        ld c,0
        ld a,(icnlodhnd)
        call SyFile_FILPOI
        jr c,icnfil4
        ld a,(icnlodhnd)
        ld hl,(icnfila)
        ld de,(App_BnkNum)
        ld bc,288+10
        call SyFile_FILINP
        ld hl,icnfilh16
        ld bc,10
        jr icnfil7

icnfile pop hl:pop hl:pop hl:pop hl
        pop hl
        jr icnfil4

;### Input      DE=file offset, BC=uncompressed area size, A=compressed flag (bit7=current), HL=current offset
;### Output     CF=1 -> offset HL in this area, use it
;###            CF=0 -> DE=next file offset, HL=new corrected icon offset, A=next compressed flag
icnfild push hl
        or a
        sbc hl,de           ;ofs always >= fileofs
        sbc hl,bc           ;ofs within current area?
        pop hl
        jr nc,icnfil9       ;no, get next
        rla                 ;is this crunched?
        ccf
        ret c               ;no -> finished, here we are
        ld bc,8
        add hl,bc           ;yes -> increase by 8 because of crunch-header
        scf
        ret

icnfil9 rla                 ;ofs in next area -> crunched?
        jr c,icnfilf
        ex de,hl
        add hl,bc           ;no -> just increase file offset, next try
        ex de,hl
        ret
icnfilf push af             ;yes -> correct icon offset by crunch difference
        push de             ;filofs
        push bc             ;orglen
        push hl             ;curofs
        push de:pop ix
        ld iy,0
        ld c,0
        ld a,(icnlodhnd)
        call SyFile_FILPOI
        jr c,icnfile
        ld a,(icnlodhnd)
        ld hl,icnfilg+1
        ld de,(App_BnkNum)
        ld bc,2
        call SyFile_FILINP
        jr c,icnfile
icnfilg ld bc,0             ;bc=crnlen
        inc bc:inc bc
        pop hl              ;hl=curofs
        add hl,bc
        pop de              ;de=orglen
        or a
        sbc hl,de           ;hl=curofs + crnlen - orglen = corrected icon ofs
        ex de,hl
        pop hl
        add hl,bc
        ex de,hl            ;de=filofs + crnlen = next filofs
        pop af
        or a
        ret

;### ICNLOD -> loads icon from ICN-file
;### Input      HL=filepath, DE=icondata
;### Output     CF=0 ok, CF=1 error while loading or wrong file format
;### Destroyed  AF,BC,DE,HL,IX,IY
icnlodbuf   ds 10
icnlodhnd   db 0

icnlod  ld a,(App_BnkNum)
        db #dd:ld h,a
        ld (icnlod1+1),de
        call SyFile_FILOPN
        ret c
        ld (icnlodhnd),a
        ld hl,icnlodbuf
        ld bc,10
        ld de,(App_BnkNum)
        call SyFile_FILINP      ;load first 10 bytes
        jr c,icnlod2
        scf
        ld a,-1
        jr nz,icnlod2           ;loaded less -> error
        ld hl,(icnlodbuf+1)
        ld bc,24*256+24
        or a
        sbc hl,bc
        scf
        jr nz,icnlod2           ;bytes 1+2 not 24,24 -> error
        ld a,(icnlodbuf)
        bit 3,a
        ld bc,144+3-10
        jr z,icnlod1            ;4 colour icon
        cp 12
        scf
        ld a,-1
        jr nz,icnlod2           ;no 4 or 16 colour icon -> error
        ld hl,(icnlodbuf+7)     ;16 colour icon
        ld bc,288
        or a
        sbc hl,bc
        scf
        jr nz,icnlod2           ;length is not 288 -> error
        ld bc,288+10-10
icnlod1 ld de,0
        push bc
        ld hl,icnlodbuf
        ld bc,10
        ldir                    ;copy first 10 bytes to destination
        pop bc
        ex de,hl
        ld de,(App_BnkNum)
        ld a,(icnlodhnd)
        call SyFile_FILINP      ;load remaining part
icnlod2 push af
        ld a,(icnlodhnd)
        call SyFile_FILCLO
        pop af
        ret nc
        ld a,(App_BnkNum)
        ld hl,dicfleobj
        ld b,1+16
        call SySystem_SYSWRN
        scf
        ret


;==============================================================================
;### WIDGET ROUTINES ##########################################################
;==============================================================================

wdgnummax   equ 8           ;maximum number of widgets
wdgnumval   db 0            ;current number of widgets
wdgcurid    db 0            ;current widget ID (for context menu)
wdgdatlen   dw 4            ;current length of widget data

;### WDGINI -> init and load widgets
;### Destroyed  AF,BC,DE,HL,IX,IY
wdgini  xor a
wdgini1 push af
        call wdgadr
        ld c,a
        ld a,e
        or d
        jr z,wdgini2
        ld a,c
        call wdgrec
        ld (ix+2),64        ;disable widget control
        push hl
        ld bc,32+10
        add hl,bc
        ld a,(App_BnkNum)
        set 7,a
        call SySystem_PRGRUN    ;** start widget
        ex de,hl
        pop hl
        or a
;        jr nz,...widget löschen
        inc hl:inc hl
        ld (hl),d
        pop af
        inc a
        jr wdgini1
wdgini2 pop af                  ;** store total vars
        ld (wdgnumval),a    ;total widget number
        push hl
        ld hl,icnnumval
        call icnini5
        xor a
        call wdgadr
        ex de,hl
        pop hl
        or a
        sbc hl,de
        ld de,4
        add hl,de
        ld (wdgdatlen),hl   ;total widget datalength
wdgini0 xor a
        jp wdgdel3              ;** send size messages to all widgets

;### WDGSIZ -> sends size message to widget
;### Input      A=widget ID
;### Destroyed  AF,BC,DE,HL,IX,IY
wdgsiz  call wdgadr
        call wdgrec
        ld e,a              ;p2=control ID
        inc hl:inc hl
        ld a,(hl)           ;a=process ID
        ld bc,5
        add hl,bc
        ld d,(hl)           ;p3=size
        ld bc,(symextwin)
        ld b,c              ;p1=window ID
        ld c,MSC_WDG_SIZE   ;p0=command
        jp msgsnd1          ;send "size" message to widget

;### WDGOKY -> resize response from widget
;### Input      IXH=process ID, (App_MsgBuf+2)=control record address, (App_MsgBuf+4)=control record bank
wdgoky  db #dd:ld a,h
        call wdgprc
        jp c,prgprz0
        ld a,c
        push af
        call wdgrec
        ld c,a
        ld (ix+2),25        ;control collection
        ld a,(App_MsgBuf+4)
        ld (ix+3),a         ;record bank
        ld hl,(App_MsgBuf+2)
        ld (ix+4),l         ;record address
        ld (ix+5),h
        pop af
        push bc
        call wdgadr
        inc hl:inc hl:inc hl
        ld de,6
        add ix,de
        push ix:pop de
        ld bc,4
        ldir                ;position
        ld a,(hl)
        add a:add a
        add 3
        ld c,a
        add hl,bc
        ld c,4
        ldir                ;size
        pop de              ;e=control ID
        ld a,(symextwin)
        call SyDesktop_WINDIN ;update widget
        jp prgprz0

;### WDGPRC -> finds widget via its process ID
;### Input      A=process ID (1-127)
;### Output     CF=0 -> C=ID, HL=address (points to process ID), CF=1 -> not found
;### Destroyed  F,B,DE
wdgprc  ld bc,(wdgnumval-1)
        ld c,0
wdgprc1 push af
        push bc
        ld a,c
        call wdgadr
        inc hl:inc hl
        pop bc
        pop af
        cp (hl)
        ret z
        inc c
        djnz wdgprc1
        scf
        ret

;### WDGADR -> returns data addresse of a widget
;### Input      A=widget ID (0-7)
;### Output     HL=address (points to length word), DE=length
;### Destroyed  F,B
wdgadr  ld hl,cfgdynbeg
        ld e,(hl)
        inc hl
        ld d,(hl)
        dec hl
        add hl,de
        jp icnadr0

;### WDGREC -> gets widget control data record
;### Input      A=widget ID
;### Output     IX=control data record, A=control ID
;### Destroyed  F,BC,DE
wdgrec  ex de,hl
        ld hl,icnnumval
wdgrec1 add (hl)
        ld l,a
        ld h,0
        add hl,hl
        add hl,hl
        add hl,hl
        add hl,hl
        ld ix,dskbgrobj1
        ex de,hl
        add ix,de
        add 8
        ret

;### WDGDIS -> disables a widget control
;### Input      A=widget ID
;### Destroyed  AF,BC,DE,HL,IX,IY
wdgdis  call wdgrec
        ld (ix+2),64            ;disable control
wdgdis1 ld l,(ix+6)
        ld h,(ix+7)
        ld c,(ix+8)
        ld b,(ix+9)
        ld e,(ix+12)
        ld d,(ix+13)
        push de:pop iy
        ld e,(ix+10)
        ld d,(ix+11)
        push de:pop ix
        ld e,-1
        ld a,(symextwin)
        jp SyDesktop_WINPIN     ;restore desktop area

;### WDGNEW -> New widget
wdgnewr dw 0        ;datalength
        db 0        ;processID
        dw 0,0      ;position
        db 0        ;size
wdgnewd ds 2+32     ;temporary widget data

wdgnew  ld a,(wdgneww)          ;only 1 dialogue at the same time
        or a
        ld hl,wdgpreobj
        jp nz,dicprpy
        xor a
        ld (wdgnewbuf1),a
        ld ix,wdgnewinp1
        call strinp
        ld hl,wdgnewgrp1        ;open
        ld (wdgnewwin0),hl
        ld a,(App_BnkNum)
        ld de,wdgnewwin
        call SyDesktop_WINOPN
        jp c,prgprz0
        ld (wdgneww),a
        jp prgprz0

wdgnewb ld hl,wdgnewbuf1        ;browse file
        ld de,filselbuf+4
        ld bc,128
        ldir
        ld hl,filmskwdg
        xor a
        ld de,wdgnewwin
        ld bc,wdgnew3
        jp selopn
wdgnew3 ld hl,filselbuf+4
        ld de,wdgnewbuf1
        ld bc,127
        ldir
        ld ix,wdgnewinp1
        call strinp
        ld hl,wdgnewbuf1
        ld a,(wdgneww)
        ld e,10
        call SyDesktop_WINDIN
        jp prgprz0

wdgnewx call wdgnewy            ;close
        jp prgprz0
wdgnewy ld hl,wdgneww
        ld a,(hl)
        ld (hl),0
        jp SyDesktop_WINCLS

wdgnew1 ld a,(wdgnewinp1+8)     ;zu Tab2 vorspringen
        or a
        jp z,prgprz0
        ld hl,wdgnewbuf1        ;get widget infos from file
        ld a,(App_BnkNum)
        db #dd:ld h,a
        call SyFile_FILOPN
        ld hl,wdgfleobj
        jp c,dicprpy
        ld hl,tmpbuf
        ld bc,256+8+6+32
        ld de,(App_BnkNum)
        push af
        call SyFile_FILINP
        pop af
        call SyFile_FILCLO

        ld a,(tmpbuf+40)        ;crunched?
        rla
        jr nc,wdgnew7
        ld hl,tmpbuf+256+8
        ld de,tmpbuf+256
        ld bc,6+32
        ldir

wdgnew7 ld hl,(tmpbuf+256+0)
        ld bc,"W"*256+"S"
        or a
        sbc hl,bc
        ld hl,wdgfleobj
        jp nz,dicprpy
        ex de,hl
        ld hl,(tmpbuf+256+2)
        ld bc,"1"*256+"G"
        or a
        sbc hl,bc
        ex de,hl
        jp nz,dicprpy
        ld hl,tmpbuf+256+4
        ld de,wdgnewd
        ld bc,2+32
        ldir
        ld hl,tmpbuf+256+4+2    ;generate list
        xor a
        ld (wdgsizobj+2),a
        ld (wdgsizobj+12),a
        ld a,(tmpbuf+256+4)
        ld (wdgsizobj+0),a
        call dskclkf
        ld hl,wdgsizlst+1
        ld de,4
        set 7,(hl)
        ld b,7
wdgnew4 add hl,de
        res 7,(hl)
        djnz wdgnew4
        ld hl,wdgnewgrp2
        jr wdgnew0
wdgnew2 ld hl,wdgnewgrp1        ;zu Tab1 zurückspringen
wdgnew0 ld (wdgnewwin0),hl
        ld a,(wdgneww)
        ld e,-1
        ld hl,41
        ld bc,0
        ld ix,1000
        ld iy,1000
        call SyDesktop_WINPIN
        jp prgprz0

wdgnews ld a,(App_MsgBuf+3)     ;sizelist doubleclick -> finished
        cp DSK_SUB_MDCLICK
        jp nz,prgprz0
wdgnew5 ld a,(wdgnumval)        ;finished
        cp wdgnummax
        ld hl,wdgmemobj
        jp z,dicprpy            ;too many widgets -> error
        push hl
        push af
        call wdgdis             ;disable control for new widget
        ld hl,(dicnewm+0)
        ld (wdgnewr+3),hl
        ld hl,(dicnewm+2)
        ld (wdgnewr+5),hl       ;set position in tempbuf
        ld a,(wdgsizobj+12)
        ld (wdgnewr+7),a        ;set size in tempbuf
        ld hl,wdgnewbuf1
        call strlen
        ld hl,11+32
        add hl,bc               ;hl=length
        ld (wdgnewr+0),hl       ;set length in tempbuf
        call memchk
        pop bc
        pop hl
        jp c,dicprpy            ;memory full -> error
        ld a,b
        call wdgadr
        push hl
        ex de,hl
        ld hl,wdgnewr           ;copy tempbuf to widget data
        ld bc,10+32
        ldir
        ld hl,wdgnewbuf1        ;copy path to widget data
        call strcop
        ld (de),a               ;add 16bit 0-terminator
        inc de
        ld (de),a
        ld a,(App_BnkNum)       ;start widget
        set 7,a
        ld hl,wdgnewbuf1
        call SySystem_PRGRUN
        ex de,hl
        pop hl
        or a
        jr nz,wdgnew6
        inc hl:inc hl
        ld (hl),d
        xor a                   ;increase totals
        call wdgadr
        dec hl
        ld b,(hl)
        dec hl
        ld c,(hl)
        ex de,hl
        ld hl,(wdgnewr+0)
        add hl,bc
        ld (wdgdatlen),hl
        ex de,hl
        ld (hl),e
        inc hl
        ld (hl),d
        ld hl,wdgnumval
        ld a,(hl)
        inc (hl)
        ld hl,dskbgrgrp
        inc (hl)
        call wdgsiz             ;send size command to widget
        jp wdgnewx
wdgnew6 ld hl,wdgfleobj
        jp dicprpy

;### WDGMOV -> moves a widget
wdgmov  ld a,(wdgcurid)
        call wdgadr
        inc hl:inc hl:inc hl
        ld (wdgmov2+1),hl
        ld de,App_MsgBuf+2
        ld bc,4
        ldir
        ld a,(hl)
        inc a
        add a:add a
        ld c,a
        ld b,0
        dec hl
        add hl,bc
        ld c,4
        ldir
        ld a,MSC_DSK_CONPOS
        ld (App_MsgBuf+0),a
        ld a,PRC_ID_DESKTOP
        call msgsnd2
wdgmov1 db #dd:ld h,PRC_ID_DESKTOP
        call msgget1
        jr nc,wdgmov1
        cp MSR_DSK_CONPOS
        jp nz,prgprz5
        ld a,(App_MsgBuf+1)
        dec a
        jp nz,prgprz0
wdgmov2 ld de,0
        ld hl,App_MsgBuf+2
        ld bc,4
        ldir
        ld hl,(App_MsgBuf+4)
        push hl
        ld hl,(App_MsgBuf+2)
        push hl
        ld a,(wdgcurid)
        push af
        call wdgdis
        pop af
        call wdgrec
        ld (ix+2),25
        pop hl
        ld (ix+6),l
        ld (ix+7),h
        pop hl
        ld (ix+8),l
        ld (ix+9),h
        call wdgdis1
        jp prgprz0

;### WDGDEL -> deletes a widget
wdgdel  ld a,(App_BnkNum)
        ld hl,wdgdelobj
        ld b,4*8+2
        ld de,0
        call SySystem_SYSWRN
        cp 3
        jp nz,prgprz0
        rst #30
        ld a,(wdgcurid)
        push af
        call wdgdel2            ;disable this and all following widgets
        pop af
        call wdgadr
        push hl
        push af
        inc hl:inc hl
        ld a,(hl)
        ld c,0
        call msgsnd1            ;tell widget to quit
        pop af                      ;*** move widget data
        inc a
        call wdgadr             ;adr of next widget
        push hl
        ld a,(wdgnumval)
        call wdgadr
        inc hl:inc hl           ;adr behind widget data
        pop de
        or a
        sbc hl,de
        ld c,l:ld b,h           ;bc=length of data behind current widget
        ex de,hl                ;hl=adr of next widget -> source
        pop de                  ;de=adr of current widget -> destination
        push hl
        push de
        ldir
        ld hl,wdgcurid              ;*** move widget controls
        sub (hl)
        dec a
        jr z,wdgdel1
        add a:add a:add a:add a
        ld c,a
        ld b,0                  ;bc=length
        push bc
        ld a,(hl)
        call wdgrec
        pop bc
        push ix:pop de          ;de=destination
        ld hl,16
        add hl,de               ;hl=source
        ldir
wdgdel1 pop hl                      ;*** update totals
        pop de
        sbc hl,de
        ld de,(wdgdatlen)
        add hl,de
        ld (wdgdatlen),hl
        xor a
        push hl
        call wdgadr
        pop de
        dec hl
        ld (hl),d
        dec hl
        ld (hl),e
        ld hl,wdgnumval
        dec (hl)
        ld hl,dskbgrgrp
        dec (hl)
        ld a,(wdgcurid)         ;send size-command to all following widgets again for updating the control collection ID
        call wdgdel3
        jp prgprz0

wdgdel3 ld hl,wdgnumval     ;resize all widgets starting from A
        cp (hl)
        ret nc
        push af
        call wdgsiz
        pop af
        inc a
        jr wdgdel3

wdgdel2 ld hl,wdgnumval     ;disable all widgets starting from A
        cp (hl)
        ret nc
        push af
        call wdgdis
        pop af
        inc a
        jr wdgdel2

;### WDGPRP -> open widgets property dialogue
wdgprp  ld a,(wdgcurid)
        call wdgadr
        inc hl:inc hl
        ld a,(hl)
        ld c,MSC_WDG_PROP
        call msgsnd1
        jp prgprz0

;### WDGRSZ -> resizes a widget
wdgrsz0 ld c,0
        jr wdgrsz
wdgrsz1 ld c,1
        jr wdgrsz
wdgrsz2 ld c,2
        jr wdgrsz
wdgrsz3 ld c,3
        jr wdgrsz
wdgrsz4 ld c,4
        jr wdgrsz
wdgrsz5 ld c,5
        jr wdgrsz
wdgrsz6 ld c,6
        jr wdgrsz
wdgrsz7 ld c,7
wdgrsz  ld a,(wdgcurid)
        push bc
        push af
        call wdgdis
        pop af
        call wdgadr
        ld de,7
        add hl,de
        pop bc
        ld (hl),c
        call wdgsiz
        jp prgprz0


;==============================================================================
;### DATA AREA ################################################################
;==============================================================================

App_BegData

;------------------------------------------------------------------------------
;### CONFIG AREA START ###
;------------------------------------------------------------------------------

cfgdatbeg
dicarraut   db 0    ;1=auto arrange
dicarrgrd   db 4    ;grid type

            ds 256-$+dicarraut

cfgdynbeg   ;start of dynamic config data (startmenu, icons, widgets)

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

stamen1     dw stamen1z-stamen1-1,0     ;settings
stamen11    db stamen12-stamen11,1,"Control panel",0,   "%cp.exe",0,0,0
stamen13    db stamen14-stamen13,0
stamen12    db stamen13-stamen12,1,"Display",0,         "%cpdisply.exe",0,0,0
stamen14    db stamen15-stamen14,1,"Date and Time",0,   "%cptime.exe",0,0,0
stamen15    db stamen16-stamen15,1,"Startmenu",0,       "%cpstartm.exe",0,0,0
stamen16    db stamen17-stamen16,0
stamen17    db stamen18-stamen17,2,"Load",0,            MSC_SYS_SYSCFG,0
stamen18    db stamen1z-stamen18,2,"Save",0,            MSC_SYS_SYSCFG,1
stamen1z    db 0

stamen2     dw stamen2z-stamen2-1,0     ;programs
stamen21    db stamen2z-stamen21,3,4,"Autostart",0
stamen2z    db 0

stamen3     dw stamen3z-stamen3-1,0     ;documents
stamen3z    db 0
stamen4     dw stamen4z-stamen4-1,0     ;autostart
stamen4z    db 0
stamen5     dw stamen5z-stamen5-1,0     ;favourites
stamen5z    db 0

            dw 0

stmdatend

icndatbeg   ;icon data (empty)
dw icndatend-icndatbeg
dw 0
icndatend

wdgdatbeg   ;widget data (empty)
dw wdgdatend-wdgdatbeg
dw 0
wdgdatend

cfgdatend   ;last label in data area


;==============================================================================
;### TRANSFER AREA ############################################################
;==============================================================================

App_BegTrns
;### PRGPRZS -> Stack for application process
        ds 128
prgstk  ds 6*2
        dw prgprz
App_PrcID db 0

;### App_MsgBuf -> message buffer
App_MsgBuf ds 14

AppMsgB equ App_MsgBuf
AppPrzN equ App_PrcID

syspwda ds 16
syspwdb ds 16
syspwdc db 0        ;flags (encryption type, screen saver, lock after booting)

;### SYMBOS LOGO ##############################################################

syslogo db 40,160,16
db #f0,#f0,#87,#0f,#0f,#0f,#1f,#0f,#1e,#f0,#e1,#0f,#2d,#0f,#f0,#f0,#f0,#f0,#0f,#4b,#0f,#0f,#3c,#f0,#f0,#f0,#f0,#f0,#c3,#0f,#0f,#f0,#f0,#f0,#f0,#87,#0f,#0f,#0f,#0f
db #f0,#c3,#3d,#ff,#f8,#f0,#d2,#3d,#c3,#fc,#d2,#f6,#2f,#e5,#7c,#f0,#f0,#e1,#7f,#4f,#f0,#f1,#cf,#f0,#f0,#f0,#f0,#e3,#3e,#f0,#ff,#1e,#f0,#f0,#c3,#3f,#f0,#f0,#f1,#e9
db #f0,#1e,#f7,#f0,#f0,#f0,#d2,#bc,#e9,#f2,#b4,#e9,#6b,#f4,#3e,#f0,#f0,#c3,#f8,#4f,#f0,#f0,#f3,#3c,#f0,#f0,#f0,#9f,#f0,#f0,#f0,#ed,#78,#f1,#1e,#f0,#f0,#f0,#f1,#e9
db #e1,#79,#fc,#f0,#f0,#f0,#d2,#9e,#fc,#7b,#0f,#0f,#6d,#f4,#97,#f8,#f0,#1f,#f0,#4f,#f0,#f0,#f0,#bc,#f0,#f0,#f1,#3c,#e0,#00,#74,#f3,#3c,#e3,#78,#f0,#f0,#f0,#f1,#e9
db #c3,#f3,#c3,#0f,#0f,#0f,#1f,#de,#f4,#3d,#7f,#ef,#ed,#f4,#c3,#7c,#e1,#7e,#f0,#4f,#0f,#0f,#0f,#1e,#f0,#f0,#e3,#78,#d1,#33,#9e,#79,#da,#c7,#f0,#c3,#0f,#0f,#0f,#0f
db #96,#f6,#3c,#fe,#f0,#f0,#f0,#c3,#f6,#a5,#7a,#c3,#e9,#f4,#f0,#3e,#c3,#f8,#f0,#7c,#f0,#f0,#f0,#f0,#f0,#f0,#c3,#f0,#62,#00,#11,#70,#cf,#da,#f3,#9e,#f0,#f0,#f0,#f0
db #3c,#ed,#f1,#f8,#f0,#f0,#f0,#e1,#f2,#87,#fe,#d3,#e9,#f4,#f0,#97,#97,#f0,#f0,#4f,#0f,#0f,#0f,#0f,#0f,#3c,#d6,#e0,#00,#00,#74,#f0,#e5,#9e,#f6,#78,#f0,#f0,#f0,#f0
db #3c,#cf,#f3,#f0,#f0,#0f,#1f,#ed,#7b,#f0,#f0,#97,#e1,#f4,#f0,#c3,#3e,#f0,#f0,#4f,#f0,#f0,#f0,#f0,#f0,#cf,#d6,#f0,#22,#00,#20,#f0,#e5,#9e,#e5,#78,#f0,#f1,#8f,#0f
db #0f,#1f,#fe,#f0,#e1,#79,#da,#fc,#79,#f0,#f0,#b7,#e1,#f4,#f0,#e1,#7c,#f0,#f0,#4f,#f0,#f0,#f0,#f0,#f0,#e3,#5e,#f0,#88,#00,#00,#f2,#e5,#8f,#0f,#f0,#f0,#f2,#3d,#e9
db #f0,#f0,#f0,#f0,#c3,#f3,#96,#fc,#b5,#f8,#f0,#7a,#e1,#f4,#87,#0f,#0f,#1e,#f0,#4f,#0f,#0f,#0f,#0f,#0f,#0f,#5e,#f1,#00,#88,#10,#70,#e5,#f0,#f0,#f0,#f0,#e5,#79,#c3
db #f0,#f0,#f0,#f0,#1e,#fe,#b4,#f8,#b4,#f8,#f0,#7e,#e1,#f4,#b5,#f0,#f0,#d3,#f0,#7c,#f0,#f0,#f0,#f0,#f0,#f0,#c3,#f0,#80,#00,#00,#f8,#cf,#f0,#f0,#f0,#f3,#0f,#f3,#96
db #0f,#0f,#0f,#0f,#7f,#f0,#3d,#f8,#d2,#fc,#e1,#f4,#e1,#f4,#b5,#f0,#f0,#d3,#f0,#4f,#0f,#0f,#0f,#0f,#0f,#0f,#6b,#78,#e1,#00,#30,#f0,#db,#8f,#0f,#0f,#0f,#78,#f6,#3c
db #78,#fc,#f0,#f0,#f0,#c3,#7a,#f0,#d2,#f4,#e1,#f4,#e1,#f4,#b5,#f0,#f0,#d3,#f0,#4f,#f0,#f0,#f0,#f0,#f0,#e3,#79,#3c,#f0,#88,#70,#f3,#3d,#b4,#f0,#f0,#f0,#f0,#ed,#78
db #78,#fc,#f0,#f0,#f0,#96,#fc,#f0,#d2,#f4,#e1,#f4,#e1,#f4,#b5,#f0,#f0,#d3,#f0,#4f,#f0,#f0,#f0,#f0,#f0,#cf,#f0,#97,#f0,#f0,#f0,#e7,#79,#b4,#f0,#f0,#f0,#f3,#c3,#f0
db #78,#fc,#f0,#f0,#c3,#7f,#f0,#f0,#d2,#f4,#e1,#f4,#e1,#f4,#b7,#f0,#f0,#d3,#f0,#4f,#f0,#f0,#f0,#f0,#f3,#1e,#f0,#e3,#3e,#f0,#f3,#1e,#f1,#bf,#ff,#ff,#ff,#ed,#1e,#f0
db #0f,#0f,#0f,#0f,#1e,#f0,#f0,#f0,#c3,#0f,#0f,#f8,#e1,#0f,#3c,#f0,#f0,#c3,#0f,#4b,#0f,#0f,#0f,#0f,#0f,#f0,#f0,#f0,#c3,#0f,#0f,#f0,#f0,#c3,#0f,#0f,#0f,#0f,#f0,#f0

;### MISC #####################################################################

sysbutok    db "Ok",0
sysbutcnc   db "Cancel",0
sysbutapl   db "Apply",0
sysbutbck   db "< Back",0
sysbutnxt   db "Next >",0
sysbutfin   db "Finish",0
sysbutbrw   db "Browse...",0

stmsetlnk2  db "%cpdisply.exe",0

icndummy
db 6,24,24
db #30,#F0,#F0,#F0,#80,#00,#20,#00,#00,#00,#C0,#00,#20,#00,#00,#00,#A0,#00,#20,#00,#00,#00,#90,#00,#20,#00,#00,#00,#F0,#80,#20,#00,#00,#00,#77,#80,#20,#00,#00,#00,#00,#C4,#20,#F3,#FF,#DF,#6C,#C4
db #20,#F7,#FF,#FF,#EC,#C4,#20,#80,#00,#00,#20,#C4,#20,#91,#11,#11,#20,#C4,#20,#B3,#AB,#AB,#A8,#C4,#20,#A3,#AB,#BB,#A8,#C4,#20,#91,#11,#11,#20,#C4,#20,#80,#00,#00,#20,#C4,#20,#B1,#B2,#B0,#A8,#C4
db #20,#80,#00,#00,#20,#C4,#20,#F0,#F0,#F0,#E0,#C4,#20,#00,#00,#00,#00,#C4,#20,#00,#00,#00,#00,#C4,#20,#00,#00,#00,#00,#C4,#20,#00,#00,#00,#00,#C4,#30,#F0,#F0,#F0,#F0,#C4,#11,#FF,#FF,#FF,#FF,#CC

cfgcpctyp   db 0

filmskall   db "*  "
filmskicn   db "icn"
filmskwdg   db "wdg"

filselbuf   ds 4+256

icninic     db 0        ;tempbuf for icontext colours

cfgicnnum   db 0    ;number of icons
cfgmennum   db 0    ;number of startmenu entries
            ds 2
cfgicnpos   ds 4*8  ;icon positions

stmemptxt   db "[empty]",0

;### SYMBOS SECURITY ##########################################################

syswinsec   dw #1001,4+8,80,30,160,121,0,0,160,121,160,121,160,121,0,systitsec,0,0,sysgrpsec,0,0:ds 136+14
sysgrpsec   db 13,0:dw sysdatsec,0,0,13*256+8,0,0,0
sysdatsec
dw      00,255*256+0,2, 0,0,1000,1000,0                  ;   Hintergrund
dw      00,255*256+8, syslogo,     0, 1,160,16,0         ;   Logo
dw      00,255*256+3 ,sysfrmsec ,  0,21,160,44,0         ;   Rahmen
dw      00,255*256+1 ,systxtsec1,  5,69,155, 8,0         ;   Beschreibung 1
dw      00,255*256+1 ,systxtsec2,  5,77,155, 8,0         ;   Beschreibung 2
dw      00,255*256+1 ,systxtsec3, 20,36,144, 8,0         ;   Beschreibung 3
dw      00,255*256+1 ,systxtsec4, 20,44,144, 8,0         ;   Beschreibung 4
dw secwin0,255*256+16,sysbutsec1,  3,90, 50,12,0         ;07="Lock"-Button
dw secwin2,255*256+16,sysbutsec3, 55,90, 50,12,0         ;08="Run"-Button
dw secwin4,255*256+16,sysbutsec5,107,90, 50,12,0         ;09="Shut down"-Button
dw secwin3,255*256+16,sysbutsec4,  3,104,50,12,0         ;10="Password"-Button
dw secwin1,255*256+16,sysbutsec2, 55,104,50,12,0         ;11="Taskmgr"-Button
dw secwin5,255*256+16,sysbutcnc ,107,104,50,12,0         ;12="Cancel"-Button

systxtsec1  dw systxtsec1t,4*1+2
systxtsec2  dw systxtsec2t,4*1+2
systxtsec3  dw systxtsec3t,4*1+2
systxtsec4  dw systxtsec4t,4*1+2
sysfrmsec   dw sysfrmsect,2+4

systitsec   db "SymbOS security",0
systxtsec1t db "Use the Task Manager to close an",0
systxtsec2t db "application that is not responsing.",0
systxtsec3t db "You are logged on since",0
systxtsec4t db "00 hours and "
systxtsec5t db "00 minutes",0
sysfrmsect  db "Logon information",0
sysbutsec1  db "Lock",0
sysbutsec2  db "Task Mgr",0
sysbutsec3  db "Run...",0
sysbutsec4  db "Password...",0
sysbutsec5  db "Shut dwn...",0

;### UNLOCK ###################################################################

syswinlok   dw #1001,4+8,80,40,160,93,0,0,160,93,160,93,160,93,0,systitlok,0,0,sysgrplok,0,0:ds 136+14
sysgrplok   db 9,0:dw sysdatlok,0,0,9,0,0,8
sysdatlok
dw      00,255*256+0,2, 0,0,1000,1000,0                  ;   Hintergrund
dw      00,255*256+8, syslogo,     0, 1,160,16,0         ;   Logo
dw      00,255*256+1 ,systxtlok1, 18,21,155, 8,0         ;   Beschreibung 1
dw      00,255*256+1 ,systxtlok2, 18,29,155, 8,0         ;   Beschreibung 2
dw      00,255*256+1 ,systxtlok3, 18,47, 30, 8,0         ;   Beschreibung 3
dw      00,255*256+1 ,systxtlok4, 18,61, 30, 8,0         ;   Beschreibung 4
dw      00,255*256+32,sysinplok1, 63,45,090,12,0         ;   Textinput
dw      00,255*256+32,sysinplok2, 63,59,090,12,0         ;   Textinput
dw lokwin ,255*256+16,sysbutok  ,103,78, 50,12,0         ;08="Ok"-Button
systxtlok1  dw systxtlok1t,4*1+2
systxtlok2  dw systxtlok2t,4*1+2
systxtlok3  dw systxtlok3t,4*1+2
systxtlok4  dw systxtlok4t,4*1+2
sysinplok1  dw sysinplok1b,0,0,0,0,15,0
sysinplok2  dw sysinplok2b,0,0,0,0,15,1

systitlok   db "Unlock computer",0
systxtlok1t db "This computer is in use and",0
systxtlok2t db "has been locked.",0
systxtlok3t db "User name:",0
systxtlok4t db "Password:",0
sysinplok1b ds 16
sysinplok2b ds 16

;### PASSWORD #################################################################

syswinpwd   dw #1001,4,80,40,160,93,0,0,160,93,160,93,160,93,0,systitpwd,0,0,sysgrppwd,0,0:ds 136+14
sysgrppwd   db 12,0:dw sysdatpwd,0,0,12*256+11,0,0,7
sysdatpwd
dw      00,255*256+0,2, 0,0,1000,1000,0              ;   Hintergrund
dw      00,255*256+8, syslogo,     0,  1,160,16,0    ;   Logo
dw      00,255*256+1 ,systxtpwd1,  4, 23,155, 8,0    ;   Beschreibung 1
dw      00,255*256+1 ,systxtpwd2,  4, 37,155, 8,0    ;   Beschreibung 2
dw      00,255*256+1 ,systxtpwd3,  4, 51, 30, 8,0    ;   Beschreibung 3
dw      00,255*256+1 ,systxtpwd4,  4, 65, 30, 8,0    ;   Beschreibung 4
dw      00,255*256+32,sysinppwd1, 66, 21,090,12,0    ;   Textinput
dw      00,255*256+32,sysinppwd2, 66, 35,090,12,0    ;   Textinput
dw      00,255*256+32,sysinppwd3, 66, 49,090,12,0    ;   Textinput
dw      00,255*256+32,sysinppwd4, 66, 63,090,12,0    ;   Textinput
dw paswina,255*256+16,sysbutok  , 53, 78, 50,12,0    ;10="Ok"-Button
dw paswinb,255*256+16,sysbutcnc ,106, 78, 50,12,0    ;11="Cancel"-Button
systxtpwd1  dw systxtlok3t,4*1+2
systxtpwd2  dw systxtpwd2t,4*1+2
systxtpwd3  dw systxtpwd3t,4*1+2
systxtpwd4  dw systxtpwd4t,4*1+2
sysinppwd1  dw sysinppwd1b,0,0,0,0,15,0
sysinppwd2  dw sysinppwd2b,0,0,0,0,15,1
sysinppwd3  dw sysinppwd3b,0,0,0,0,15,1
sysinppwd4  dw sysinppwd4b,0,0,0,0,15,1

prgmsgerra dw prgmsgerra1,4*1+2,prgmsgerra2,4*1+2,prgmsgerra3,4*1+2
prgmsgerra1 db "The entered passwords do not",0
prgmsgerra2 db "match. Please confirm your",0
prgmsgerra3 db "new password.",0

prgmsgerrb dw prgmsgerrb1,4*1+2,prgmsgerrb2,4*1+2,prgmsgerrb3,4*1+2
prgmsgerrb1 db "The old password is not",0
prgmsgerrb2 db "correct. Please enter the valid",0
prgmsgerrb3 db "password to change it.",0

systitpwd   db "Change Password",0
systxtpwd2t db "Old Password:",0
systxtpwd3t db "New Password:",0
systxtpwd4t db "Confirm New:",0

sysinppwd1b ds 16
sysinppwd2b ds 16
sysinppwd3b ds 16
sysinppwd4b ds 16

;### TASK SWITCH ##############################################################

tskswtwin    dw #0001,4, 10,60,200, 88,0,0,200, 88,200, 88,200, 88,0,0,0,0,tskswtgrp,0,0:ds 136+14
tskswtgrp    db 37,0: dw tskswtdat,0,0,0,0,0,0
tskswtdat
dw      0,255*256+ 0, 2,              0, 0,999,999,0
tskswtdat_icn
dw      0,255*256+10, prgicn16c,      8,  8,24, 24,0
dw      0,255*256+10, prgicn16c,     40,  8,24, 24,0
dw      0,255*256+10, prgicn16c,     72,  8,24, 24,0
dw      0,255*256+10, prgicn16c,    104,  8,24, 24,0
dw      0,255*256+10, prgicn16c,    136,  8,24, 24,0
dw      0,255*256+10, prgicn16c,    168,  8,24, 24,0
dw      0,255*256+10, prgicn16c,      8, 40,24, 24,0
dw      0,255*256+10, prgicn16c,     40, 40,24, 24,0
dw      0,255*256+10, prgicn16c,     72, 40,24, 24,0
dw      0,255*256+10, prgicn16c,    104, 40,24, 24,0
dw      0,255*256+10, prgicn16c,    136, 40,24, 24,0
dw      0,255*256+10, prgicn16c,    168, 40,24, 24,0
dw      0,255*256+10, prgicn16c,      8, 72,24, 24,0
dw      0,255*256+10, prgicn16c,     40, 72,24, 24,0
dw      0,255*256+10, prgicn16c,     72, 72,24, 24,0
dw      0,255*256+10, prgicn16c,    104, 72,24, 24,0
dw      0,255*256+10, prgicn16c,    136, 72,24, 24,0
dw      0,255*256+10, prgicn16c,    168, 72,24, 24,0
dw      0,255*256+10, prgicn16c,      8,104,24, 24,0
dw      0,255*256+10, prgicn16c,     40,104,24, 24,0
dw      0,255*256+10, prgicn16c,     72,104,24, 24,0
dw      0,255*256+10, prgicn16c,    104,104,24, 24,0
dw      0,255*256+10, prgicn16c,    136,104,24, 24,0
dw      0,255*256+10, prgicn16c,    168,104,24, 24,0
dw      0,255*256+10, prgicn16c,      8,136,24, 24,0
dw      0,255*256+10, prgicn16c,     40,136,24, 24,0
dw      0,255*256+10, prgicn16c,     72,136,24, 24,0
dw      0,255*256+10, prgicn16c,    104,136,24, 24,0
dw      0,255*256+10, prgicn16c,    136,136,24, 24,0
dw      0,255*256+10, prgicn16c,    168,136,24, 24,0
tskswtdat_tit
dw      0,255*256+02, 3+0+16+64,      6,72,188, 12,0
tskswt_sel equ 32
dw      0,255*256+01, tsktitdat,      8,74,184,  8,0
tskswtdat_clr
dw      0,255*256+02, 2+8      ,   32+4, 4, 32, 32,0
dw      0,255*256+02, 2+8      ,   32+5, 5, 30, 30,0
tskswtdat_shw
dw      0,255*256+02, 3+12     ,   32+4, 4, 32, 32,0
dw      0,255*256+02, 3+12     ,   32+5, 5, 30, 30,0

tsktitdat   dw tsktittxt:db 1+0+128,2
tsktittxt   ds 32

prgicn16c db 12,24,24:dw $+7:dw $+4,12*24:db 5
db #88,#88,#88,#88,#88,#88,#88,#88,#88,#88,#88,#88,#88,#11,#11,#1D,#88,#88,#88,#88,#88,#88,#88,#88,#81,#CC,#CC,#C1,#D8,#88,#11,#11,#11,#88,#88,#88,#1C,#CC,#CC,#CC,#11,#11,#CC,#CC,#C1,#D8,#88,#88
db #1C,#CC,#CC,#CC,#CC,#CC,#CC,#CC,#C1,#D8,#88,#88,#1C,#CC,#CC,#CC,#CC,#CC,#CC,#CC,#C1,#D1,#11,#18,#1C,#CC,#CC,#13,#33,#1C,#CC,#C1,#11,#1C,#CC,#1D,#1C,#CC,#C3,#CC,#4C,#C3,#11,#1C,#CC,#CC,#C1,#D8
db #1C,#CC,#34,#C4,#C4,#C4,#3C,#CC,#CC,#CC,#C1,#D8,#1C,#C1,#CC,#4C,#4C,#4C,#C1,#CC,#CC,#CC,#1D,#88,#1C,#C3,#C4,#C4,#C4,#C4,#C3,#CC,#CC,#CC,#1D,#88,#1C,#C3,#4C,#44,#4C,#4C,#43,#CC,#CC,#C1,#D8,#88
db #1C,#C3,#C4,#44,#44,#C4,#C3,#CC,#CC,#C1,#D8,#88,#1C,#C1,#CC,#44,#4C,#4C,#C1,#CC,#CC,#1D,#88,#88,#1C,#C1,#34,#C4,#C4,#C4,#3C,#CC,#CC,#1D,#88,#88,#1C,#C1,#C3,#CC,#4C,#C3,#33,#CC,#C1,#D8,#88,#88
db #1C,#1C,#CC,#13,#33,#1C,#31,#1C,#C1,#D8,#88,#88,#11,#1C,#CC,#CC,#CC,#CC,#31,#11,#3D,#88,#88,#88,#11,#CC,#CC,#CC,#C1,#11,#13,#11,#18,#88,#88,#88,#81,#CC,#C1,#11,#1D,#DD,#D8,#31,#11,#88,#88,#88
db #81,#11,#1D,#DD,#D8,#88,#88,#83,#11,#18,#88,#88,#88,#8D,#D8,#88,#88,#88,#88,#88,#31,#11,#88,#88,#88,#88,#88,#88,#88,#88,#88,#88,#83,#13,#38,#88,#88,#88,#88,#88,#88,#88,#88,#88,#88,#33,#88,#88

;### WIDGET MANAGEMENT DIALOGUES ##############################################

wdgdelobj   dw dicdeltxt1,4*1+2, wdgdeltxt2,4*1+2, dicdeltxt3,4*1+2     ;confirm delete
wdgdeltxt2  db "this widget?",0

wdgpreobj   dw dicpretxt1,4*1+2, wdgpretxt2,4*1+2, dicpretxt3,4*1+2     ;too many dialogues
wdgpretxt2  db "widget dialogue first.",0

wdgmemobj   dw dicmemtxt1,4*1+2, dicmemtxt2,4*1+2, wdgmemtxt3,4*1+2     ;memory full
wdgmemtxt3  db "available for adding this widget.",0

wdgfleobj   dw dicfletxt1,4*1+2, wdgfletxt2,4*1+2, dicfletxt3,4*1+2     ;file error
wdgfletxt2  db "Wrong widget format or disc error.",0

wdgldeobj   dw wdgldetxt1,4*1+2, wdgldetxt2,4*1+2, wdgldetxt3,4*1+2     ;loading error
wdgldetxt1  db "Error while loading and executing",0
wdgldetxt2  db "widget. Disc error, corrupt widget",0
wdgldetxt3  db "file or memory full.",0

;### WIDGET NEW DIALOGUE ######################################################

wdgnewwin   dw #1401,4+16,074,027,176,107,0,0,176,107,176,107,176,107,0,wdgnewtit,0,0
wdgnewwin0  dw wdgnewgrp1,0,0:ds 136+14

wdgnewgrp1  db 12,0:dw wdgnewdat1,0,0,256*5+4,0,0,11    ;* location
wdgnewdat1
dw      00,         0,2,          0,0,1000,1000,0       ;00=Hintergrund
dw      00,         0,3,          05, 04, 32,80,0       ;01=grafik dummy
dw      00,         0,1,          05, 88,166, 1,0       ;02=Trennlinie
dw wdgnew1,255*256+16,sysbutnxt,  86, 92, 40,12,0       ;03="Next"  -Button
dw wdgnewx,255*256+16,sysbutcnc, 131, 92, 40,12,0       ;04="Cancel"-Button
dw      00,255*256+ 1,wdgnewdsc1, 41, 04,130, 8,0       ;05=Beschreibung 1
dw      00,255*256+ 1,wdgnewdsc2, 41, 12,130, 8,0       ;06=Beschreibung 2
dw      00,255*256+ 1,wdgnewdsc3, 41, 20,130, 8,0       ;07=Beschreibung 3
dw      00,255*256+ 1,wdgnewdsc4, 41, 28,130, 8,0       ;08=Beschreibung 4
dw      00,255*256+ 1,wdgnewdsc5, 41, 44,130, 8,0       ;09=Beschreibung "Command line"
dw      00,255*256+32,wdgnewinp1, 41, 54,130,12,0       ;10=Input "Command line"
dw wdgnewb,255*256+16,sysbutbrw,  41, 68, 40,12,0       ;11=Button "Browse..."

wdgnewgrp2  db 10,0:dw wdgnewdat2,0,0,256*6+5,0,0,8     ;* size
wdgnewdat2
dw      00,         0,2,          0,0,1000,1000,0       ;00=Hintergrund
dw      00,         0,3,          05, 04, 32,80,0       ;01=grafik dummy
dw      00,         0,1,          05, 88,166, 1,0       ;02=Trennlinie
dw wdgnew2,255*256+16,sysbutbck,  45, 92, 40,12,0       ;03="Back"  -Button
dw wdgnew5,255*256+16,sysbutfin,  86, 92, 40,12,0       ;04="Finish"-Button
dw wdgnewx,255*256+16,sysbutcnc, 131, 92, 40,12,0       ;05="Cancel"-Button
dw      00,255*256+ 1,wdgnewdsc6, 41, 04,130, 8,0       ;06=Beschreibung 1
dw      00,255*256+ 1,wdgnewdsc7, 41, 12,130, 8,0       ;07=Beschreibung 2
dw      00,255*256+ 1,wdgnewdsc8, 41, 20,130, 8,0       ;08=Beschreibung 3
dw wdgnews,255*256+41,wdgsizobj,  41, 32, 80,52,0       ;09=Size-List

wdgnewdsc1  dw wdgnewtxt1,2+4
wdgnewdsc2  dw wdgnewtxt2,2+4
wdgnewdsc3  dw wdgnewtxt3,2+4
wdgnewdsc4  dw wdgnewtxt4,2+4
wdgnewdsc5  dw wdgnewtxt5,2+4
wdgnewdsc6  dw wdgnewtxt6,2+4
wdgnewdsc7  dw wdgnewtxt7,2+4
wdgnewdsc8  dw wdgnewtxt8,2+4

wdgnewinp1  dw wdgnewbuf1,0,0,0,0,127,0
wdgnewbuf1  ds 128

wdgnewtit   db "Create Widget",0

wdgnewtxt1  db "Type the location and name of",0
wdgnewtxt2  db "the widget you want to add to",0
wdgnewtxt3  db "the desktop. Or, search for the",0
wdgnewtxt4  db "widget by clicking Browse.",0
wdgnewtxt5  db "Widget path",0

wdgnewtxt6  db "Choose a size for the widget.",0
wdgnewtxt7  db "The following size(s) are",0
wdgnewtxt8  db "available:",0

wdgsizobj   dw 8,0,wdgsizlst,0,1,wdgsizrow,0,1
wdgsizrow   dw 0,81,0,0
wdgsizlst   dw 0,ctxwdgtxta, 1,ctxwdgtxtb, 2,ctxwdgtxtc, 3,ctxwdgtxtd, 4,ctxwdgtxte, 5,ctxwdgtxtf, 6,ctxwdgtxtg, 7,ctxwdgtxth

;### ICON MANAGEMENT DIALOGUES ################################################

dicdelobj   dw dicdeltxt1,4*1+2, dicdeltxt2,4*1+2, dicdeltxt3,4*1+2     ;confirm delete
dicdeltxt1  db "Are you sure you want to delete",0  ;confirm delete
dicdeltxt2  db "'":ds 11+1+11+3
dicdeltxt3  db 0

dicpreobj   dw dicpretxt1,4*1+2, dicpretxt2,4*1+2, dicpretxt3,4*1+2     ;too many dialogues
dicpretxt1  db "Please close the previouse",0       ;too many dialogues
dicpretxt2  db "shortcut dialogue first.",0
dicpretxt3  db 0

dicfleobj   dw dicfletxt1,4*1+2, dicfletxt2,4*1+2, dicfletxt3,4*1+2     ;error while reading icon file
dicfletxt1  db "Error while reading file.",0        ;error while reading icon
dicfletxt2  db "Wrong icon format or disc error.",0
dicfletxt3  db 0

dicmemobj   dw dicmemtxt1,4*1+2, dicmemtxt2,4*1+2, dicmemtxt3,4*1+2     ;memory full
dicmemtxt1  db "Memory full.",0                     ;memory full
dicmemtxt2  db "There is no remaining memory",0
dicmemtxt3  db "available for saving this link.",0

dicrenwin   dw #0001,4+8                                                ;rename
dicrenwin1  dw           0,0,46,24,0,0,46,24,46,24,46,24,0,0,0,0,dicrengrp,0,0:ds 136+14
dicrengrp   dw 4,dicrendat,0,0,256*4+3,0,0,1
dicrendat
dw      00,255*256+32,dicrentxt1,0,00,46,12,0   ;textinput line 1
dw      00,255*256+32,dicrentxt2,0,12,46,12,0   ;textinput line 2
dw dicreno,255*256+64,0         ,-1,-1,1,1,0    ;dummy for enter
dw dicrenc,255*256+64,0         ,-1,-1,1,1,0    ;dummy for escape
dicrentxt1  dw dicrentxt1b,0,0,0,0,11,0
dicrentxt2  dw dicrentxt2b,0,0,0,0,11,0
dicrentxt1b ds 12
dicrentxt2b ds 12

;### ICON NEW DIALOGUE ########################################################

dicnewwin   dw #1401,4+16,074,027,176,107,0,0,176,107,176,107,176,107,0,dicnewtit,0,0
dicnewwin0  dw dicnewgrp1,0,0:ds 136+14

dicnewgrp1  db 12,0:dw dicnewdat1,0,0,256*5+4,0,0,11    ;* location
dicnewdat1
dw      00,         0,2,          0,0,1000,1000,0       ;00=Hintergrund
dw      00,         0,3,          05, 04, 32,80,0       ;01=grafik dummy
dw      00,         0,1,          05, 88,166, 1,0       ;02=Trennlinie
dw dicnew1,255*256+16,sysbutnxt,  86, 92, 40,12,0       ;03="Next"  -Button
dw dicnewx,255*256+16,sysbutcnc, 131, 92, 40,12,0       ;04="Cancel"-Button
dw      00,255*256+ 1,dicnewdsc1, 41, 04,130, 8,0       ;05=Beschreibung 1
dw      00,255*256+ 1,dicnewdsc2, 41, 12,130, 8,0       ;06=Beschreibung 2
dw      00,255*256+ 1,dicnewdsc3, 41, 20,130, 8,0       ;07=Beschreibung 3
dw      00,255*256+ 1,dicnewdsc4, 41, 28,130, 8,0       ;08=Beschreibung 4
dw      00,255*256+ 1,dicnewdsc5, 41, 44,130, 8,0       ;09=Beschreibung "Command line"
dw      00,255*256+32,dicnewinp1, 41, 54,130,12,0       ;10=Input "Command line"
dw dicnewb,255*256+16,sysbutbrw,  41, 68, 40,12,0       ;11=Button "Browse..."

dicnewgrp2  db 09,0:dw dicnewdat2,0,0,256*6+5,0,0,8     ;* name
dicnewdat2
dw      00,         0,2,          0,0,1000,1000,0       ;00=Hintergrund
dw      00,         0,3,          05, 04, 32,80,0       ;01=grafik dummy
dw      00,         0,1,          05, 88,166, 1,0       ;02=Trennlinie
dw dicnew2,255*256+16,sysbutbck,  45, 92, 40,12,0       ;03="Back"  -Button
dw dicnew3,255*256+16,sysbutnxt,  86, 92, 40,12,0       ;04="Next"  -Button
dw dicnewx,255*256+16,sysbutcnc, 131, 92, 40,12,0       ;05="Cancel"-Button
dw      00,255*256+ 1,dicnewdsc6, 41, 04,130, 8,0       ;06=Beschreibung 6
dw      00,255*256+32,dicnewinp2, 41, 20, 72,12,0       ;07=Input "Command line"
dw      00,255*256+32,dicnewinp3, 41, 34, 72,12,0       ;08=Input "Command line"

dicnewgrp3  db 10,0:dw dicnewdat3,0,0,256*6+5,0,0,8     ;* icon
dicnewdat3
dw      00,         0,2,          0,0,1000,1000,0       ;00=Hintergrund
dw      00,         0,3,          05, 04, 32,80,0       ;01=grafik dummy
dw      00,         0,1,          05, 88,166, 1,0       ;02=Trennlinie
dw dicnew4,255*256+16,sysbutbck,  45, 92, 40,12,0       ;03="Back"  -Button
dw dicnew5,255*256+16,sysbutfin,  86, 92, 40,12,0       ;04="Finish"-Button
dw dicnewx,255*256+16,sysbutcnc, 131, 92, 40,12,0       ;05="Cancel"-Button
dw      00,255*256+ 1,dicnewdsc7, 41, 04,130, 8,0       ;06=Beschreibung 7
dicnewdat3a
dw      00,255*256+ 8,dicnewicn,  41, 20,24, 24,0       ;07=Grafik        Icon
dw dicnewf,255*256+16,dicnewtxt8, 70, 19,64, 12,0       ;08=Button File   Icon
dw dicnewi,255*256+16,dicnewtxt9, 70, 33,64, 12,0       ;09=Button Choose Icon


dicnewdsc1  dw dicnewtxt1,2+4
dicnewdsc2  dw dicnewtxt2,2+4
dicnewdsc3  dw dicnewtxt3,2+4
dicnewdsc4  dw dicnewtxt4,2+4
dicnewdsc5  dw dicnewtxt5,2+4
dicnewdsc6  dw dicnewtxt6,2+4
dicnewdsc7  dw dicnewtxt7,2+4

dicnewinp1  dw dicnewbuf1,0,0,0,0,127,0
dicnewinp2  dw dicnewbuf2,0,0,0,0,11,0
dicnewinp3  dw dicnewbuf3,0,0,0,0,11,0

dicnewicn   ds 12*24+10

dicnewtit   db "Create Shortcut",0
dicnewtxt1  db "Type the location and name of",0
dicnewtxt2  db "the item you want to create a",0
dicnewtxt3  db "shortcut to. Or, search for the",0
dicnewtxt4  db "item by clicking Browse.",0
dicnewtxt5  db "Command line",0
dicnewtxt6  db "Select a name for the shortcut:",0
dicnewtxt7  db "Select an icon for the shortcut:",0
dicnewtxt8  db "Use file icon",0
dicnewtxt9  db "Select icon...",0

dicnewbuf1  ds 128
dicnewbuf2  ds 12
dicnewbuf3  ds 12

;### ICON PROPERTY DIALOGUE ###################################################

dicprpwin   dw #1401,4+16,079,011,160,142,0,0,160,142,160,142,160,142,0,dicprptit,0,0
dicprpwin0  dw dicprpgrp1,0,0:ds 136+14

dicprpgrp2  db 19,0:dw dicprpdat2,0,0,256*4+3,0,0,3
dicprpdat2
dw      00,         0,2,          0,0,1000,1000,0       ;00=Hintergrund
dw dicprt, 255*256+20,dicprptab,   0,  1,160,11,0       ;01=Tab-Leiste
dw dicpro, 255*256+16,sysbutok,   31,127, 40,12,0       ;02="Ok"    -Button
dw dicprc, 255*256+16,sysbutcnc,  73,127, 40,12,0       ;03="Cancel"-Button
dw dicpry, 255*256+16,sysbutapl, 115,127, 40,12,0       ;04="Apply" -Button
dicprpdat2a
dw      00,255*256+10,dicprpicn,  05, 15, 24,24,0       ;05=Icon "Icon"
dw      00,255*256+32,dicprpinp3, 51, 14, 72,12,0       ;06=Name1 "Icon"
dw      00,255*256+32,dicprpinp4, 51, 28, 72,12,0       ;07=Name2 "Icon"
dw      00,         0,1,          05, 43,150, 1,0       ;08=Trennlinie
dw      00,255*256+ 1,dicprpdscb, 05, 47, 55, 8,0       ;09=Beschreibung "Target"
dw      00,255*256+32,dicprpinp1, 05, 57,150,12,0       ;10=Eingabe "Target"
dw      00,         0,1,          05, 73,150, 1,0       ;11=Trennlinie
dw      00,255*256+ 1,dicprpdscc, 05, 80, 46, 8,0       ;12=Beschreibung "Start in"
dw      00,255*256+32,dicprpinp2, 51, 78,104,12,0       ;13=Eingabe "Start in"
dw      00,255*256+ 1,dicprpdscd, 05, 93, 46, 8,0       ;14=Beschreibung "Run"
dw      00,255*256+42,dicprprun,  51, 92,104,10,0       ;15=Auswahl "Run"
dw dicpbt, 255*256+16,dicprptxtm, 09,106, 72,12,0       ;16="Browse target..."    -Button
dw dicpbi, 255*256+16,dicprptxtn, 83,106, 72,12,0       ;17="Change icon..."-Button
dw      00,         0,1,          05,122,150, 1,0       ;18=Trennlinie

dicprpgrp1  db 23,0:dw dicprpdat1,0,0,256*4+3,0,0,20
dicprpdat1
dw      00,         0,2,          0,0,1000,1000,0       ;00=Hintergrund
dw dicprt, 255*256+20,dicprptab,   0,  1,160,11,0       ;01=Tab-Leiste
dw dicpro, 255*256+16,sysbutok,   31,127, 40,12,0       ;02="Ok"    -Button
dw dicprc, 255*256+16,sysbutcnc,  73,127, 40,12,0       ;03="Cancel"-Button
dw dicpry, 255*256+16,sysbutapl, 115,127, 40,12,0       ;04="Apply" -Button
dicprpdat1a
dw      00,255*256+10,dicprpicn,  05, 15, 24,24,0       ;05=Icon "Icon"
dw      00,255*256+ 1,dicprpdsc9, 51, 18,150, 8,0       ;06=Name1 "Icon"
dw      00,255*256+ 1,dicprpdsca, 51, 28,150, 8,0       ;07=Name2 "Icon"
dw      00,         0,1,          05, 43,150, 1,0       ;08=Trennlinie
dw      00,255*256+ 1,dicprpdsc1, 05, 47, 55, 8,0       ;09=Beschreibung "File type"
dw      00,255*256+ 1,dicprpcon1, 51, 47,104, 8,0       ;10=Angabe "File type"
dw      00,255*256+ 1,dicprpdsc2, 05, 57, 55, 8,0       ;11=Beschreibung "Open with"
dw      00,255*256+ 1,dicprpdsc8, 51, 57,104, 8,0       ;12=Beschreibung "not defined"
dw      00,255*256+ 1,dicprpdsc3, 05, 67, 55, 8,0       ;13=Beschreibung "Location"
dw      00,255*256+ 1,dicprpcon3, 51, 67,104, 8,0       ;14=Angabe "Location"
dw      00,255*256+ 1,dicprpdsc4, 05, 77, 55, 8,0       ;15=Beschreibung "Size"
dw      00,255*256+ 1,dicprpcon4, 51, 77,104, 8,0       ;16=Angabe "Size"
dw      00,         0,1,          05, 88,150, 1,0       ;17=Trennlinie
dw      00,255*256+ 1,dicprpdsc0, 05, 92, 55, 8,0       ;18=Beschreibung "Name"
dw      00,255*256+ 1,dicprpcon2, 51, 92,104, 8,0       ;19=Angabe "Name"
dw      00,255*256+ 1,dicprpdsc5, 05,102, 55, 8,0       ;20=Beschreibung "Modified"
dw      00,255*256+ 1,dicprpcon5, 51,102,104, 8,0       ;21=Angabe "Modified"
dw      00,         0,1,          05,113,150, 1,0       ;22=Trennlinie

dicprptab   db 2,2+4+48+64
dicprptab0  db 0:dw dicprptxtj:db -1:dw dicprptxtk:db -1

dicprpdsc9  dw dicprpbuf3,2+4
dicprpdsca  dw dicprpbuf4,2+4
dicprpdscb  dw dicprptxtl,2+4
dicprpdscc  dw dicprptxto,2+4
dicprpdscd  dw dicprptxtp,2+4

dicprpdsc0  dw dicprptxt0,2+4
dicprpdsc1  dw dicprptxt1,2+4
dicprpdsc2  dw dicprptxt2,2+4
dicprpdsc3  dw dicprptxt3,2+4
dicprpdsc4  dw dicprptxt4,2+4
dicprpdsc5  dw dicprptxt5,2+4
dicprpdsc8  dw dicprptxt8,2+4

dicprpcon1  dw dicprptxte,2+4
dicprpcon2  dw dicprptxtu,2+4
dicprpcon3  dw dicprptxti,2+4
dicprpcon4  dw dicprptxtf,2+4
dicprpcon5  dw dicprpdtm1,2+4

dicprpinp1  dw dicprpbuf1,0,0,0,0,127,0     ;target
dicprpinp2  dw dicprpbuf2,0,0,0,0,127,0     ;start in
dicprpinp3  dw dicprpbuf3,0,0,0,0,11,0      ;nameline1
dicprpinp4  dw dicprpbuf4,0,0,0,0,11,0      ;nameline2

dicprprun   dw 4,0,dicprplst,0,1,dicprprow,0,1
dicprprow   dw 0,1000,0,0
dicprplst   dw 0,dicprptxtq, 0,dicprptxtr, 0,dicprptxts, 0,dicprptxtt

dicprptit   db "Properties",0
dicprptxt0  db "File name",0
dicprptxt1  db "File type",0
dicprptxt2  db "Open with",0
dicprptxt3  db "Location",0
dicprptxt4  db "Size",0
dicprptxt5  db "Modified",0
dicprptxt8  ds 33

dicprpdtm1  db "01.01.2000, 00:00:00",0

dicprptxta  db "Read only",0
dicprptxtb  db "Hidden",0
dicprptxtc  db "System",0
dicprptxtd  db "Archive",0

dicprptxte  db "EXE-file",0
dicprptxtf  db "########### Bytes",0
dicprptxtg  db " Bytes",0
dicprptxth  db "directory",0
dicprptxti  ds 256

dicprptxtj  db "General",0
dicprptxtk  db "Shortcut",0
dicprptxtl  db "Target",0
dicprptxto  db "Start in",0
dicprptxtp  db "Run",0
dicprptxtq  db "Default",0
dicprptxtr  db "Normal window",0
dicprptxts  db "Minimized",0
dicprptxtt  db "Maximized",0
dicprptxtu  ds 13
dicprptxtm  db "Browse target...",0
dicprptxtn  db "Change icon...",0

dicprpbuf1  ds 128      ;filepath
dicprpbuf2  ds 128      ;startdirectory
dicprpicn   ds 12*24+10
icnfilpth   ds 32+32
dicprpbuf3  ds 12
dicprpbuf4  ds 12

;### WIDGET CONTEXT MENU ######################################################

ctxwdg  dw 5                    ;** widget-contextmenu
dw 1,ctxwdgtxt1,wdgmov,0            ;move
dw 5,ctxwdgtxt2,ctxwdgsiz,0         ;resize
dw 1,ctxwdgtxt3,wdgdel,0            ;delete
dw 9,0,0,0
ctxwdg0
dw 1,ctxwdgtxt4,wdgprp,0            ;properties

ctxwdgsiz   dw 8
dw 1,ctxwdgtxta,wdgrsz0,0
dw 1,ctxwdgtxtb,wdgrsz1,0
dw 1,ctxwdgtxtc,wdgrsz2,0
dw 1,ctxwdgtxtd,wdgrsz3,0
dw 1,ctxwdgtxte,wdgrsz4,0
dw 1,ctxwdgtxtf,wdgrsz5,0
dw 1,ctxwdgtxtg,wdgrsz6,0
dw 1,ctxwdgtxth,wdgrsz7,0

ctxwdgtxt1  db "Move",0
ctxwdgtxt2  db "Resize",0
ctxwdgtxt3  db "Delete",0
ctxwdgtxt4  db "Properties",0

ctxwdgtxta  db "xxxxx x xxxxx",0
ctxwdgtxtb  db "xxxxx x xxxxx",0
ctxwdgtxtc  db "xxxxx x xxxxx",0
ctxwdgtxtd  db "xxxxx x xxxxx",0
ctxwdgtxte  db "xxxxx x xxxxx",0
ctxwdgtxtf  db "xxxxx x xxxxx",0
ctxwdgtxtg  db "xxxxx x xxxxx",0
ctxwdgtxth  db "xxxxx x xxxxx",0

;### ICONS CONTEXT MENU #######################################################

ctxicn  dw 10                   ;** icon-contextmenu
dw 1,ctxicntxt1,dskclk2,0           ;open
dw 9,0,0,0
dw 1,ctxicntxt2,diccut,0            ;cut
dw 1,ctxicntxt3,diccop,0            ;copy
dw 9,0,0,0
dw 1,ctxicntxt4,dicshc,0            ;create shortcut
dw 1,ctxicntxt5,dicdel,0            ;delete
dw 1,ctxicntxt6,dicren,0            ;rename
dw 9,0,0,0
dw 1,ctxicntxt7,dicprp,0            ;properties

ctxicntxt1  db "Open",0
ctxicntxt2  db "Cut",0
ctxicntxt3  db "Copy",0
ctxicntxt4  db "Create Shortcut",0
ctxicntxt5  db "Delete",0
ctxicntxt6  db "Rename",0
ctxicntxt7  db "Properties",0

;### DESKTOP CONTEXT MENU #####################################################

ctxdsk  dw 9                    ;** desktop-contextmenu
dw 5,ctxdsktxt1,ctxdskarr,0         ;arrange icons
dw 1,ctxdsktxt2,diclup,0            ;line up icons
dw 9,0,0,0
dw 1,ctxdsktxt3,dskref,0            ;refresh
dw 9,0,0,0
ctxdsk0
dw 0,ctxdsktxt4,dicpst,0            ;paste
dw 5,ctxdsktxt5,ctxdsknew,0         ;new
dw 9,0,0,0
dw 1,ctxdsktxt6,dskprp,0            ;properties

ctxdskarr  dw 7                     ;arrange icons ->
dw 1,ctxdsktxt8,dicarra,0           ;8 x 8 grid
dw 1,ctxdsktxt9,dicarrb,0           ;13 x 11 grid
dw 1,ctxdsktxta,dicarrc,0           ;26 x 22 grid
dw 1,ctxdsktxtb,dicarrd,0           ;48 x 40 grid
dw 1,ctxdsktxtc,dicarre,0           ;52 x 44 grid
dw 9,0,0,0
ctxdskarr0
dw 1,ctxdsktxtd,dicarr,0            ;auto arrange

ctxdsknew  dw 2                     ;new ->
dw 1,ctxdsktxt7,dicnew,0            ;shortcut
dw 1,ctxdsktxte,wdgnew,0            ;widget

ctxdsktxt1  db "Arrange Icons",0
ctxdsktxt2  db "Line Up Icons",0
ctxdsktxt3  db "Refresh",0
ctxdsktxt4  db "Paste",0
ctxdsktxt5  db "New",0
ctxdsktxt6  db "Properties",0
ctxdsktxt7  db "Shortcut",0
ctxdsktxt8  db "8 x 8 grid",0
ctxdsktxt9  db "13 x 11 grid",0
ctxdsktxta  db "26 x 22 grid",0
ctxdsktxtb  db "48 x 40 grid",0
ctxdsktxtc  db "52 x 44 grid",0
ctxdsktxtd  db "Auto arrange",0
ctxdsktxte  db "Widget",0

;### DESKTOP WINDOW ###########################################################

dskbgrwin   dw #0001,0,-1,-1,10000,10000,0,0,10000,10000,32,24,10000,10000,0,0,0,0,dskbgrgrp,0,0:ds 14+136   ;Hintergrund-Fenster
dskbgrgrp   dw 8+9,dskbgrobj,0,0,0,0,0,0
dskbgrobj   dw 0,64,0,-1, -1,  1,  1,0
            dw 0,64,0,-1, -1,  1,  1,0
            dw 0,64,0,-1, -1,  1,  1,0
            dw 0,64,0,-1, -1,  1,  1,0
            dw 0,64,0,-1, -1,  1,  1,0
            dw 0,64,0,-1, -1,  1,  1,0
            dw 0,64,0,-1, -1,  1,  1,0
            dw 0,64,0,-1, -1,  1,  1,0
dskbgrobj1  ds 40*16                    ;40 objects (icons + widgets)
dskbgricn   ds 32*8                     ;32 icons

;### START MENU ###############################################################

stmrec  ds stmrecmax
