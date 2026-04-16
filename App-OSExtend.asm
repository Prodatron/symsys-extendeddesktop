;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@                                                                            @
;@               S y m b O S   S y s t e m   E x t e n s i o n                @
;@                                                                            @
;@             (c) 2005-2026 by Prodatron / SymbiosiS (Jörn Mika)             @
;@                                                                            @
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


;translate
;- foldatnam "new","folder"
;- dictxt0/dictxt1
;- startmenu editor -> "Favourites" (?)


;todo
;- ausführen -> startparameter anhängen
;- letzte documente automatisch hinzufügen

;bugs
;- widget file not found -> löschen
;- widgets speichern falsch, bei neustart müll
;- cpc -> manchmal crash bei startmenu editor (oder war M4 problem??)
;- cpc -> manchmal crash nach speichern und neu-boot

;- icontext farbübernahme nicht vom CP ausgelöst
;- kein autosave bei shutdown


;--- PROGRAM ------------------------------------------------------------------
;### PRGPRZ -> Application process
;### PRGERR -> Error-Fenster anzeigen
;### PRGTRY -> tray icon clicked
;### PRGINI

;--- CONFIG-ROUTINES ----------------------------------------------------------
;### CFGPTH -> Generates config path
;### CFGSAV -> save config data
;### CFGLOD -> load config data
;### CFGIMP -> imports icons and startmenu entries from the classic configuration
;### CFGLNG -> translate startmenu with current language
;### CFGSMI -> adds startmenu icons to top- and controlpanel-menu if not existing, or relocates existing ones
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
;### STRCMP -> compares two string (case-sensitive)
;### STRSKP -> skips text string (behind 0-terminator)
;### STRCOP -> copies string until 0-terminator
;### SYSCHK -> get computer type and adjust logo, ini-filename
;### SYSOPN -> Lock desktop and open window
;### SYSCLO -> Close window and unlock desktop
;### SELOPN -> starts a "file selection" session
;### MEMCHK -> checks, if enough memory available
;### BNKDST -> get our bank as destination

;--- EXTENDED STARTMENU -------------------------------------------------------

;--- EXTENDED DESKTOP ---------------------------------------------------------

;--- ICON GUI ROUTINES --------------------------------------------------------
;### DICDEL -> icon delete
;### DICCUT -> Cuts desktop icon
;### DICCOP -> Copies desktop icon
;### DICREN -> Renames desktop icon
;### DICFOL -> check, if icon is a folder
;### DICPOS -> corrects mouse position for new icon
;### DICNEW -> New shortcut dialogue
;### DICMAK -> creates a new icon
;### DICPRP -> Show and edit icon properties
;### DICSHC -> Create shortcut
;### DICPST -> Paste icon
;### DICLUP -> line up icons
;### DICARR -> arrange icons
;### DICINF -> get file infos
;### DICINH -> inits icon header

;--- FOLDER ROUTINES ----------------------------------------------------------
;### FOLPTH -> init folder/launcher path
;### FOLNAM -> generate folder filename from name
;### FOLGNM -> copy icon name to group file
;### FOLGEN -> creates new folder file
;### FOLNEW -> create new folder
;### FOLREN -> renames folder file
;### FOLPST -> duplicates folder file

;--- LINE UP ROUTINES ---------------------------------------------------------
;### LUPCOL -> collision detection
;### LUPALN -> align position
;### LUPFRE -> find free icon position
;### LUPALL -> line up all icons

;--- TASK SWITCH ROUTINES -----------------------------------------------------
;### TSKPRE -> prepares task switcher data and window
;### TSKICN -> find icon of process
;### TSKTIT -> get titel from current selected window
;### TSKPOS -> update selector positions
;### TSKNXT -> starts task switcher with next window
;### TSKPRV -> starts task switcher with previous window
;### TSKSWT -> opens task switcher window

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
;### ICNPOS -> udates positions of icon data from actual desktop data
;### ICNRSZ -> resizes icon data
;### ICNDEL -> deletes icon
;### ICNCOP -> copies icon into the clipboard
;### ICNNEW -> reserves memory for new icon
;### ICNFIL -> gets icon from file
;### ICNCPR -> check, if inside area or skip compressed/uncompressed area
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

;--- CONTROL PANEL COMMUNICATION ----------------------------------------------
;### CPLOPR -> execute control panel operations
;### CPLRPL -> replys to control panel/appication and returns to main loop

;--- FONT ROUTINES ------------------------------------------------------------
;### FNTINI -> init font handling
;### FNTACT -> activate enhance font
;### FNTCFL -> check, if enhanced font is existing, load it and set OS font (called by cfglod)
;### FNTCFS -> save enhanced font in config, if existing (called by cfgsav)
;### FNTMEM -> reserves and registers memory for enhanced font
;### FNTERR -> error while loading font, release memory optional and send CP message
;### FNTLOD -> load enhanced font from file and activate it, send CP confirmation
;### FNTREM -> remove enhanced font, if existing, send CP confirmation

;--- KEYFUNCTION ROUTINES -----------------------------------------------------
;### KFNEXE -> executes keyboard input

;--- KEYMAPPING ROUTINES ------------------------------------------------------
;### KEYMEM -> releases or reserves and registers memory for enhanced keymaps and deadkey/romaji trees
;### KEYCFS -> save enhanced keyboard configuration into INI file
;### KEYCFL -> load enhanced keyboard configuration from KEX/INI file
;### KEYACT -> activate or deactivate enhanced keymap settings
;### KEYSTD -> remove systray icon
;### KEYNXT -> switches to next keymap, if switchable keymaps active
;### KEYSWT -> switches to selected keylayout
;### KEYSWTx -> switch to keymap via systray menu
;### KEYINF -> builds keyboard information
;### KEYERR -> error while loading kex file
;### KEYPRV -> shows kex preview
;### KEYLOD -> loads and activates kex-file
;### KEYDED -> converts deadkey+char into combined char
;### KEYFTR -> use full tree for input conversion
;### KEYTRE -> executes key tree

;--- LANGUAGE ROUTINES --------------------------------------------------------
;### PRGLNG -> patches language for Extended Desktop and SymbOS core
;### LNGSET -> gets or sets primary and secondary language
;### LNGLOD -> load from language file and patch application
;### LNGISA -> copy language/keyboard IDs to Isetta, if existing

;--- DATA AREA ----------------------------------------------------------------
;### CONFIG AREA START ###

;--- TRANSFER AREA ------------------------------------------------------------
;### PRGPRZS -> Stack for application process

;%%% MULTI LANGUAGE TEXTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;### SYMBOS LOGO ##############################################################
;### MISC #####################################################################
;### KEYBOARD SYSTRAY MENU ####################################################
;### KEYBOARD INFORMATION #####################################################
;### SYMBOS SECURITY ##########################################################
;### UNLOCK ###################################################################
;### PASSWORD #################################################################
;### TASK SWITCH ##############################################################
;### WIDGET MANAGEMENT DIALOGUES ##############################################
;### WIDGET NEW DIALOGUE ######################################################
;### FOLDER MANAGEMENT MESSAGES ###############################################
;### ICON MANAGEMENT DIALOGUES ################################################
;### ICON NEW DIALOGUE ########################################################
;### ICON PROPERTY DIALOGUE ###################################################
;### WIDGET CONTEXT MENU ######################################################
;### ICONS CONTEXT MENU #######################################################
;### DESKTOP CONTEXT MENU #####################################################
;### DESKTOP WINDOW ###########################################################
;### STARTMENU ICONS ##########################################################
;### STARTMENU ITEMS #########################################################

;---


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

prgprz  ld e,7
        ld hl,jmp_sysinf                        ;##!!## AB HIER FALSCHE BANKEN/ADRESSEN bei EP-G9K
        rst #28                 ;IYL=Databank
        db #fd:ld a,l
        push af
        ld e,8
        ld hl,jmp_sysinf
        rst #28
        pop af
        push iy:pop hl
        ld de,32
        add hl,de               ;hl=pointer to desktop extended vars
        rst #20:dw jmp_bnkrwd
        ld l,c
        ld h,b                  ;hl=desktop extended vars
        ld (dskvaradr),hl

        call fntini
        call syschk
        call prgpar
        call cfglod
        call prglng
        call cfglng
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
        ld hl,(dskvaradr)
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
prgini3 ld hl,SyDesktop_DSKALL  ;replaced with CALL, set extended font, if existing (see FNTCFL), because of MSX do this here (?)

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

prgprz0 ld hl,cfgsavf
        bit 0,(hl)
        jp nz,cfgsav0
        call msgget             ;*** CHECK FOR MESSAGES
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
        cp MSR_DSK_EVTCLK
        jp z,prgtry
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
        jp secwin3
prgprz2 cp DSK_ACT_CONTENT      ;* content clicked
        jr nz,prgprz0
        ld hl,(App_MsgBuf+8)
        ld a,l
        or h
        jr z,prgprz0
        jp (hl)
prgprz1 ld a,b
        cp MSR_SYS_SELOPN
        jp z,selopna
prgprz6 cp MSR_DSK_EXTDSK
        jp nz,prgprz0

prgprz4 ld a,(App_MsgBuf+13)
        ld (cplrpl0+2),a
        ld a,(App_MsgBuf+1)         ;** extended desktop functions
        ld de,(App_MsgBuf+2)
        ld hl,(App_MsgBuf+4)
        ld bc,(App_MsgBuf+6)
        cp FNC_DXT_DSKBGR
        jp z,dskbgr
        ;...FILRUN
        ;...FILBRW
        cp FNC_DXT_MENCLK
        jp z,menclk
        cp FNC_DXT_DSKCLK
        jp z,dskclk
        cp FNC_DXT_CFGLOD
        jp z,cfglod0
        cp FNC_DXT_CFGSAV
        jp z,cfgsav1
        cp FNC_DXT_WDGOKY
        jp z,wdgoky
        cp FNC_DXT_STMDAT
        jp z,stmdat
        cp FNC_DXT_STMCOP
        jp z,stmcop
        cp FNC_DXT_STMIIN
        jp z,stmiin
        cp FNC_DXT_KEYFNC
        jp z,kfnexe
        cp FNC_DXT_CPLOPR
        jp z,cplopr
        cp FNC_DXT_KEYDED
        jp z,keyded
        cp FNC_DXT_KEYFTR
        jp z,keyftr
        cp FNC_DXT_LNGLOD
        jp z,lnglod
        ;...
        jp prgprz0

;### PRGERR -> Error-Fenster anzeigen
;### Input      HL=data
prgwrn  ld b,1+16
prgwrn1 ld a,(App_BnkNum)
        jp SySystem_SYSWRN
prgwrn0 call prgwrn
        jp prgprz0

;### PRGTRY -> tray icon clicked
prgtry  ld a,(App_MsgBuf+2)     ;0=left, 1=right, 2=left double click
        cp 1
        jr z,prgtrym            ;right -> menu
prgtry1 call keynxt             ;left  -> next
        jp prgprz0
prgtrym ld hl,5*8+keymendat1        ;** open context menu
        ld de,-8
        ld b,5
        ld a,(keydatlyp)
        inc a
prgtry2 add hl,de
        res 1,(hl)
        cp b
        jr nz,prgtry3
        set 1,(hl)              ;check selected
prgtry3 djnz prgtry2
        ld de,keymendat
        ld a,(App_BnkNum)
        ld hl,-1
        call SyDesktop_MENCTX   ;open menu
        jp c,prgprz0
        ld a,l:or h
        jp z,prgprz0
        jp (hl)


;==============================================================================
;### CONFIG-ROUTINES ##########################################################
;==============================================================================

cfgpthfil   db "\symb"
cfgpthfil1  db "osxt.ini",0:cfgpthfil0

;### CFGPTH -> Generates config path
cfgpth  ld hl,cfgpthfil
        ld de,(prgparf)
        ld bc,cfgpthfil0-cfgpthfil
        ldir
        ret

;### CFGSAV -> save config data
cfgsavf db 0                        ;flag, if save config after finishing folder-operation

cfgsav  call icnpos
        call cfgpth
        ld hl,(prgparp)
        ld a,(App_BnkNum)
        db #dd:ld h,a
        xor a
        call SyFile_FILNEW          ;create file
        ret c
        call memchk0                ;hl=size of dynamic data (menu, icons, widgets)
        ld (cfgdyntot),hl
        ld c,l:ld b,h
        inc b                       ;bc=size with header
        ld hl,cfgdatflg
        set 0,(hl)                  ;store and set flag in header
        ld hl,cfgdatbeg
        ld de,(App_BnkNum)
        push af
        call SyFile_FILOUT          ;save header + dynamic data
        pop bc
        ;jr c,...error
        push bc
        call fntcfs                 ;save optional font
        pop bc
        ;jr c,...error
        push bc
        call keycfs                 ;save optional enhanced keyboard configuration
        pop af
        jp SyFile_FILCLO            ;close file
cfgsav0 ld (hl),0
cfgsav1 call cfgsav
        jp prgprz0
cfgsavs ld a,1
        ld (cfgsavf),a
        ret

;### CFGLOD -> load config data
cfglod  call cfgpth
        ld hl,(prgparp)
        ld a,(App_BnkNum)
        db #dd:ld h,a
        call SyFile_FILOPN          ;open file
        jr c,cfgimp
        ld hl,cfgdatbeg
        ld bc,256
        ld de,(App_BnkNum)
        push af
        call SyFile_FILINP          ;load header
        pop de
        ;jr c,...error
        ld a,(cfgdatflg)
        rra
        ld bc,dskmemmax-256
        jr nc,cfglod1
        ld bc,(cfgdyntot)
cfglod1 ld hl,cfgdynbeg
        ld a,d
        ld de,(App_BnkNum)
        push af
        call SyFile_FILINP          ;load dynamic data
        pop bc
        push bc
        call fntcfl                 ;load font
        pop bc
        push bc
        call keycfl                 ;load keyboard
        pop af
        call SyFile_FILCLO          ;close file
        jp cfgsmi
cfglod0 ;call cfglod                 ;##!!## doesn't work?? (load config again during runtime)
        jp prgprz0

;### CFGIMP -> imports icons and startmenu entries from the classic configuration
lnkadrmen   equ 0                   ;Offset Menunamen (20*20)
lnkadrpth   equ 0+400               ;Offset Pfade     (28*32; 20 startmenu, 8 icons)
lnkadricn   equ 0+400+896           ;Offset Iconnamen (8*24)
lnkadrspr   equ 0+400+896+192       ;Offset Sprites   (8*147)
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
        rst #20:dw jmp_bnkcop   ;(cfgicnnum,cfgmennum already got in syschk)

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
        jp z,cfgsmi
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

;### CFGLNG -> translate startmenu with current language
cfglngt
dw stmtoptxt2+1,stmtoptxt3+1,stmtoptxt4+1,stmtoptxt5+1,stmtoptxt6+1,stmtoptxt7+1,stmtoptxt8+1
dw stmtoptxta+1,stmtoptxtb+1,stmtoptxtc+1,stmtoptxtd+1,stmtoptxte+1,stmtoptxtf+1

cfglng  ld iy,stamen0
        ld ix,stamen01
        ld hl,(stamen01+6)
        ld bc,smiprggfx+1
        or a
        sbc hl,bc
        jr z,cfglng7        ;first item is "programs", skip upper part
        ld hl,cfglngf           ;translate upper part (if containing "favourites")
        call cfglng1
cfglng7 ld hl,cfglngt           ;translate main part (2 sections)
        ld (cfglngm+1),hl
        ld hl,cfglngm
        call cfglng1
        call cfglng2

        push ix:pop iy          ;translate control panel part (3 sections)
        inc iy              ;iy=stamen1
        ld bc,5
        add ix,bc           ;ix=stamen11
        call cfglng2
        call cfglng2
        jr cfglng2

cfglng1 ld (cfglng3+1),hl
cfglng2 ld a,(ix+0)
        or a
        ret z
        ld a,(ix+1)
        or a
        jr z,cfglng4
cfglng3 call 0                  ;check, if translation, zf=1 yes, de=new name
        call z,cfglng5
        call cfglng4        ;ix=next item
        jr cfglng2
cfglng4 ld c,(ix+0)         ;jump to next
        ld b,0
        add ix,bc
        ret

cfglng5 ld c,ixl:ld b,ixh   ;*** translation required, de=new name, ix=menuitem
        ld hl,8
        ld a,(ix+1)
        cp 3
        jr nz,cfglng6
        inc l
cfglng6 add hl,bc               ;hl=old name
        push de
        push hl
        push de                 ;compare length
        call strlen
        pop hl
        ld b,c
        push bc
        call strlen             ;c=newlen
        pop af                  ;a=oldlen
        pop hl                  ;hl=old name
        pop de                  ;de=new name
        cp c
        call nz,cfglng8         ;not same length -> relocate memory
        ex de,hl
        jp strcop               ;copy new to old name

cfglng8 push de             ;*** relocate memory, de=new, hl=old, a=oldlen, c=newlen -> move memory
        push hl

        ld b,a              ;check, if memory available
        push bc
        neg
        add c
        jr nc,cfglngb
        push de
        push hl
        ld l,a
        ld h,0
        call memchk         ;HL=difference -> CF=1 memory full
        pop hl
        pop de
cfglngb pop bc
        jr c,cfglngc
        ld a,b

        ld e,l:ld d,h
        ld b,0
        add hl,bc           ;hl=dstadr (behind updated name)
        push hl
        ld l,a
        ld h,b
        add hl,de           ;hl=srcadr (behind old name)
        ld b,a
        push bc
        push hl
        call memchk0        ;hl=total data length
        pop de              ;de=srcadr
        or a
        sbc hl,de
        ld bc,cfgdynbeg
        add hl,bc           ;hl=coplen [=total-(srcadr-datbeg)=total-srcadr+datbeg]
        pop bc              ;b=oldlen,c=newlen
        ld a,c
        sub b               ;a=memdif=new-old
        ld c,l:ld b,h       ;bc=coplen
        pop hl              ;hl=dstadr
        jr nc,cfglng9
        ex de,hl
        ldir                ;old>new -> move memory forward
        jr cfglnga
cfglng9 add hl,bc
        dec hl              ;de=dstadr end
        ex de,hl
        add hl,bc
        dec hl              ;hl=srcadr end
        lddr                ;old<new -> move memory backward
cfglnga ld c,a
        add a
        sbc a
        ld b,a              ;bc=memdif
        ld a,(ix+0)
        add c
        ld (ix+0),a         ;update item length
        ld l,(iy+0)
        ld h,(iy+1)
        add hl,bc
        ld (iy+0),l
        ld (iy+1),h         ;update block length
        ld hl,(stmdatbeg)
        add hl,bc
        ld (stmdatbeg),hl   ;update startmenu length
cfglngc pop hl
        pop de
        ret

cfglngf ld l,(ix+6)         ;** translate only (zf=1), if icon=favourites
        ld h,(ix+7)
        ld bc,smifavgfx+1
        sbc hl,bc
        ld de,(stmtoptxt1+1)
        ret
cfglngm ld hl,0             ;** always translate, de=new name, zf=1
        ld e,(hl):inc hl
        ld d,(hl):inc hl
        ld (cfglngm+1),hl
        ex de,hl
        ld e,(hl):inc hl
        ld d,(hl)
        xor a
        ret

;### CFGSMI -> adds startmenu icons to top- and controlpanel-menu if not existing, or relocates existing ones
cfgsmii db 6,128,-1:dw 0:db " "
cfgsmim dw smifldgfx+1, smiprggfx+1,smidocgfx+1,smicfggfx+1,smihlpgfx+1,smirungfx+1,smisecgfx+1,smioffgfx+1
cfgsmic dw              smicfggfx+1,smidspgfx+1,smitimgfx+1,smimengfx+1,smilodgfx+1,smisavgfx+1
cfgsmif db "Favourites",0   ;(only used to convert old 3.x data, no translation necessary)

cfgsmi  ld a,(stamen01+3)
        cp 6
        jr nz,cfgsmig

        ld hl,smibeg            ;** new version -> relocate existing icons
        ld de,(inficnadr)
        ld (inficnadr),hl
        sbc hl,de           ;new-old=dif for old icon adr
        ret z
        ld c,l:ld b,h
        ld d,0
        ld ix,stamen01      ;relocate    top menu icons
        call cfgsmih
        ld e,5
        add ix,de           ;relocate config menu icons
cfgsmih ld a,(ix+0)
        or a
        ret z
        ld e,a
        ld a,(ix+1)
        or a
        jr z,cfgsmik
        cp 3
        jr c,cfgsmij
        inc ix
        dec e
cfgsmij ld l,(ix+5)
        ld h,(ix+6)
        add hl,bc
        ld (ix+5),l
        ld (ix+6),h
cfgsmik add ix,de
        jr cfgsmih

cfgsmig xor a                   ;** old version -> no existing icons, add menu icons
        call stmadr
        ld iyl,7-1
        ld ix,cfgsmim
        call cfgsmi1

        ld a,1
        call stmadr
        push hl:pop ix      ;***CORRECTION OF WRONG OLD DATA***
        ld (ix+#1c+0),#02
        ld (ix+#1c+2),#1A
        ld iyl,6-1
        ld ix,cfgsmic-2

cfgsmi1 ld (cfgsmi5+1),hl   ;HL=address of temp pointer to menu data record, DE=length of menu block (excluding length word)
        inc hl
        inc hl              ;hl=first item
        ld de,0             ;de=item counter
        ld b,e
cfgsmi2 ld c,(hl)           ;c=length
        inc c:dec c
        jr z,cfgsmi4
        inc hl
        ld a,(hl)           ;a=type (0=line, 1=item, 2=special, 3=folder)
        or a
        jr z,cfgsmi3
        inc e
cfgsmi3 dec hl
        add hl,bc
        jr cfgsmi2
cfgsmi4 ld a,e
        sub iyl
        ld iyl,a
        ld l,e:ld h,d
        add hl,hl
        add hl,de
        add hl,hl           ;hl=items*6=additional required memory
        call memchk         ;DE=new length of stm+icn+wdg, HL=memory left, BC=difference, IX=old total length
        ret c
        ld hl,(stmdatbeg)
        add hl,bc
        ld (stmdatbeg),hl   ;increase total menu length
cfgsmi5 ld hl,0
        push hl
        dec hl
        dec hl
        ld a,(hl)
        add c
        ld (hl),a
        inc hl
        ld a,(hl)
        adc b
        ld (hl),a           ;increase block length
        ld hl,stmdatbeg-1
        add hl,de
        ld e,l:ld d,h       ;de=last byte of new    mem
        sbc hl,bc           ;hl=last byte of actual mem
        pop bc
        inc bc              ;bc=block start-1
        push hl
        sbc hl,bc
        ld c,l:ld b,h       ;bc=length of block to move
        pop hl
        lddr                ;move menublock
        ex de,hl
        inc hl              ;de=block start
        inc de              ;hl=start of old data
cfgsmi6 ld a,(hl)
        sub 2
        ret c
        jr nz,cfgsmi7
        ldi:ldi             ;line -> copy 2 bytes
        jr cfgsmi6
cfgsmi7 ld iyh,a
        add 8
        ld (hl),a
        ldi
        ld a,(hl)
        ldi                 ;link/folder -> copy len,type
        cp 3
        ld a,iyh
        ld bc,smiappgfx+1
        jr nz,cfgsmi8
        ldi                 ;folder -> copy sub-block id
        dec a
        call cfgsmia        ;"Favourites" will use a special icon
cfgsmi8 ld (cfgsmim+0),bc
        push hl
        dec iyl
        jr nz,cfgsmi9
        inc iyl
        inc ix:inc ix
cfgsmi9 ld l,(ix+0)
        ld h,(ix+1)
        ld (cfgsmii+3),hl
        ld hl,cfgsmii
        ld bc,6
        ldir
        pop hl
        ld c,a
        ldir
        jr cfgsmi6

cfgsmia push af
        push de
        push hl
        ld de,cfgsmif           ;check if name is "Favourites"
        call strcmp
        ld bc,smifldgfx+1       ;no -> use folder     icon
        jr nz,cfgsmid
        ld bc,smifavgfx+1       ;yes -> use favourites icon
cfgsmid pop hl
        pop de
        pop af
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
        ld iy,App_MsgBuf        ;IY=Messagebuffer
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
msgdsk  ld h,PRC_ID_DESKTOP
        call msgget1
        jr nc,msgdsk            ;no Message
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

;### STRCMP -> compares two string (case-sensitive)
;### Input      HL/DE=Strings (0-terminated)
;### Output     ZF=0 -> equal, ZF=1 not equal
;### Destroyed  AF,DE,HL
strcmp  ld a,(de)
        cp (hl)
        ret nz
        or a
        ret z
        inc hl:inc de
        jr strcmp

;### STRSKP -> skips text string (behind 0-terminator)
;### Input      HL=string
;### Output     HL=behind 0 terminator
strskp  xor a
        ld bc,-1
        cpir
        ret

;### STRCOP -> copies string until 0-terminator
;### Input      HL=source, DE=destination
;### Output     HL,DE=behind 0-terminator, A=0
;### Destroyed  F,BC,HL
strcop  ld a,(hl)
        ldi
        or a
        jr nz,strcop
        ret

;### SYSCHK -> get computer type and adjust logo, ini-filename
syschk  ld hl,jmp_sysinf        ;*** get Computer Type, hardware flags and icon configuration (for cfgimp)
        ld de,256*38+5
        ld ix,cfghrdflg
        ld iy,240-163
        rst #28
        ld a,(cfghrdflg)
        bit 3,a
        ret z
        ld hl,256*"9"+"G"       ;g9k version
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
;### Output     CF=0 ok, DE=new total length (stm+icn+wdg), HL=memory left, BC=difference
;###            CF=1 memory full
;### Destroyed  AF
memchk  push hl
        call memchk0
        pop bc
        add hl,bc
        ex de,hl            ;de=total new length
        ld hl,dskmemmax
        sbc hl,de           ;hl=total left
        ret
memchk0 ld hl,cfgdynbeg
        ld e,(hl)
        inc hl
        ld d,(hl)                   ;de=size startmenu
        add hl,de
        ld b,(hl)
        dec hl
        ld c,(hl)                   ;bc=size icons
        ex de,hl
        add hl,bc
        ex de,hl                    ;de=startmenu+icons
        add hl,bc
        ld c,(hl)
        inc hl
        ld b,(hl)                   ;bc=size widgets
        ex de,hl
        add hl,bc                   ;hl=startmenu+icons+widgets=total dynamic data size
        ret

;### BNKDST -> get our bank as destination
;### Output     A[4-7]=bank, A[0-3]=0
bnkdst  ld a,(App_BnkNum)
        add a:add a:add a:add a
        ret


;==============================================================================
;### EXTENDED STARTMENU #######################################################
;==============================================================================

;### MENCLK -> executes menu entry
;### Input      DE=path
menclk  ex de,hl
        ld a,h
        cp 4
        jr nc,menclk1
        ld c,l
        ld b,h
        call msgsys
        jp prgprz0
;hl=path
menclk1 call menclk0
        jp prgprz0
menclk0 push hl
        call strlen
        inc hl                  ;hl=start-in path
        push hl
        call strlen             ;c=path length
        inc hl
        ld a,(hl)
        ld ixh,a                ;ixh=window mode
        pop iy
        inc c:dec c
        ld ixl,0
        jr z,menclk2
        inc ixl                 ;ixl=flag, if start-in path
menclk2 pop hl
        ld a,(App_BnkNum)
        set 4,a
        jp SySystem_PRGRUN


;==============================================================================
;### EXTENDED DESKTOP #########################################################
;==============================================================================

dskvaradr   dw 0    ;desktop extended vars (desktop -> symdskbeg)

symextbnm   equ 0   ;db bnkndt           ;(extended) bank
symextsma   equ 1   ;dw dsksta           ;(extended) startmenu address
symextsmy   equ 3   ;dw -66              ;(extended) startmenu -ylength
symextnum   equ 5   ;db dskbgranz        ;(extended) number of background controls
symextadr   equ 6   ;dw dskbgrobj        ;(extended) address of the background control data
symextwin1  equ 8   ;db -1               ;(extended) background window ID
symextpgm   equ 9   ;dw prggrpmem        ;(extended) program group memory
symextwgm   equ 11  ;dw wingrpmem        ;(extended) window group memory
symextwix   equ 13  ;dw wingrpanz        ;(extended) window number and index list
symextmem   equ 15  ;dw memmap           ;(extended) address of memory map
symextmop   equ 17  ;db memops_d,memops_t,memops_o   ;data, transfer length, transfer offset
symextbfl   equ 20  ;dw 1                ;(extended) bank availability flags (reverse order, 1=available)
symextfna   equ 22  ;dw dskfnt           ;(extended) system font address (with header; for txtfnt)
symextfno   equ 24  ;dw dskfnt+dskfntofs ;(extended) system font address (without header/system chars; for sysinf/control panel)
symextfnt   equ 26  ;db platform_chr255  ;(extended) system font type (0=96+6, 1=255)
symextfnb   equ 27  ;db 0                ;(extended) system font bank (0=no extended 255 big font)
symextlng   equ 28  ;dw symlngtxt        ;(extended) international texts
symextkmf   equ 30  ;db 0                ;(extended) keymap flags (+1=keymap active, +2=keymaps switchable, +4=deadkeys)
symextkm1   equ 31  ;dw 0                ;(extended) keymap normal
symextkm2   equ 33  ;dw 0                ;(extended) keymap alt gr

dskclk  ld a,e                     ;D=action type (left/right/middle/doubleclick mouse key or keyboard)
        cp DSK_ACT_CONTENT
        jp nz,prgprz0
        ld bc,(App_MsgBuf+8)       ;B=type (0=background, 128=icon [C=icon ID], 1-127=widget [B=process ID, C=local control ID])
        ld a,b
        or a
        jp z,dskclk8
        cp 128
        jp z,dskclk1
        jp nc,prgprz0
        ld a,d                  ;*** Widget
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
dskclk8 ld a,d                  ;*** Background
        cp DSK_SUB_MRCLICK
        jp nz,prgprz0               ;only react on right mouseclick
        ld (dicnewm+0),hl           ;store current mouse position for new/paste
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
dskclk1 ld a,d                  ;*** Icons
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
;### Input      A=icon ID
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
        ld hl,dicdelobj
        ld b,4*8+2
        ld de,0
        call prgwrn1
        pop bc
        cp 3
        jp nz,prgprz0
        rst #30
        ld a,b
        push af
        call dicfol
        jr nz,diccut1
        inc hl                  ;icon is folder -> delete groupfile
        ld de,(foldatfps)
        ld bc,8
        ldir
        ld hl,folnamext
        ld c,5
        ldir
        ld hl,dicnewbuf1
        ld ix,(App_BnkNum-1)
        call SyFile_DIRDEL
        call cfgsavs
        jr diccut1

;### DICCUT -> Cuts desktop icon
diccut  push af
        call dicfol
        pop bc
        ld hl,dicfctobj
        jp z,prgwrn0
        ld a,b
        push af
        call icncop
diccut1 pop af
        push af
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
;### Input      A=icon ID
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
        ld hl,dicrentxt1b       ;copy new name into icon data
        ld bc,24
        ldir
        ex de,hl
        call dicfol0            ;check, if icon is a folder
        jr nz,dicren5
        inc hl
        call folren             ;dicnewbuf1=full path, dicrentxt1b=new name, hl=old filename in icon data
dicren5 ld a,(dicrenw)
        jp SyDesktop_WINCLS

dicren2 dec (hl)
        jp z,dicren1
dicreno call dicren4            ;ok
        jp prgprz0
dicrenc call dicren5            ;cancel
        jp prgprz0

;### DICFOL -> check, if icon is a folder
;### Input      A=icon ID
;### Output     ZF=1 icon is folder (HL+1=groupfile in full path)
dicfol  call icnadr
        ld bc,2+4+24
        add hl,bc
dicfol0 bit 3,(hl)              ;skip bitmap
        ld bc,6*24+3
        jr z,dicfol1
        ld bc,12*24+10
dicfol1 add hl,bc
        push hl
        call folpth
        pop hl
        ld de,dicnewbuf1        ;compare icon path with launcher path
dicfol2 ld a,(de)
        or a
        ret z
        call clcucs
        ld c,a
        ld a,(hl)
        call clcucs
        inc hl
        inc de
        cp c
        jr z,dicfol2
        ret

;### DICPOS -> corrects mouse position for new icon
;### Input      (dicnewm+0)=mouse position
;### Output     (dicnewm+4)=icon position
dicpos  ld hl,(dicnewm+0)
        ld de,-12
        add hl,de
        ld (dicnewm+4),hl
        ld hl,(dicnewm+2)
        ld (dicnewm+6),hl
        ret

;### DICNEW -> New shortcut dialogue
dicnewm dw 0,0          ;mouse position
        dw 0,0
dicnew  ld hl,dicneww           ;only 1 dialogue at the same time
        inc (hl)
        dec (hl)
        jp nz,dicprpz
        call dicpos
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
        call dicinha
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
dicnew8 call dicinha
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
dicnewj ld e,-1
        ld hl,41
        ld bc,0
        ld ix,1000
        ld iy,1000
        call SyDesktop_WINPIN
        jp prgprz0

dicnew5 call dicmak             ;finished
        call c,dicpry3
        jp dicnewx

;### DICMAK -> creates a new icon
;### Input      (dicnewm+4)=position, dicnewbuf2=name, dicnewicn=bitmap, dicnewbuf1=path
;### Output     CF=0 ok, CF=1 memory full
dicmak  call icnpos
        ld hl,dicnewbuf1
        call strlen             ;bc=path length
        ld a,(dicnewicn)
        bit 3,a
        ld hl,147+2+4+24+3
        ld de,147
        jr z,dicmak1
        ld hl,298+2+4+24+3
        ld de,298
dicmak1 add hl,bc               ;hl=icon length
        push de
        call icnnew             ;HL=icon size -> CF=0 ok, HL=address for new icon, (icnnumval)++, icnini not called
        pop bc
        ret c
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
        ld hl,dicnewicn         ;bitmap
        pop bc
        ldir
        ld hl,dicnewbuf1        ;path
        call strcop
        ld (de),a
        inc de
        ld (de),a
        inc de
        ld (de),a
        ld a,(dicarraut)
        or a
        jr nz,dicmak2
        ld a,(icnnumval)        ;** no auto arrange
        dec a
        push af
        xor a
        call wdgdel2        ;disable all widgets
        pop af
        call dicpry5
        call wdgini0        ;re-inits all widgets
        or a
        ret
dicmak2 xor a                   ;** auto arrange
        call wdgdel2        ;disable all widgets
        call icnini
        call wdgini0        ;re-inits all widgets
        call lupall
        or a
        ret

;### DICPRP -> Show and edit icon properties
dicprpi db 0            ;icon id

dicprp  ld e,a
        ld a,(dicprpw)
        or a
        jr z,dicprp1
dicprpz ld hl,dicpreobj
        jp prgwrn0
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
        call dicinhb
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
        ld de,(dicprptxte+1)
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
dicpry3 ld hl,dicmemobj
        jp prgwrn

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
dicpbi2 call dicinhb
        ld a,(dicprpw)
        ld e,5
        call SyDesktop_WINDIN
        jp prgprz0

dicpbs  ld hl,dicprpbuf2            ;*** browse start-in
        ld de,filselbuf+4
        ld bc,128
        ld a,c
        ldir
        ld hl,filmskall
        ld de,dicprpwin
        ld bc,dicpbs1
        jp selopn
dicpbs1 ld hl,filselbuf+4
        ld de,dicprpbuf2
        ld bc,127
        ldir
        ld ix,dicprpinp2
        call strinp
        ld a,(dicprpw)
        ld e,13
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
dicpst  rst #20:dw #8154        ;check, if icon in clipboard
        ld a,d
        cp CLPTYP_ICON
        jp nz,prgprz0
        push iy                 ;iy=len
        call icnpos
        pop hl
        push hl                 ;hl=len
        call icnnew             ;hl=adr new icon
        pop iy                  ;iy=len
        jr c,dicpst1            ;memory full
        push hl:pop ix          ;ix=adr new icon
        ld de,(App_BnkNum)
        ld d,CLPTYP_ICON
        push hl
        rst #20:dw #8151
        pop ix                  ;ix=adr new icon
        ld hl,(dicnewm+0)
        ld de,-12
        add hl,de
        ld (ix+2),l
        ld (ix+3),h
        ld hl,(dicnewm+2)
        ld (ix+4),l
        ld (ix+5),h
        ld a,(icnnumval)
        dec a
        push af
        call dicfol             ;ZF=1 icon is folder (HL+1=groupfile in full path)
        pop bc                  ;B=icon ID
        call z,folpst
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
dicinha ld hl,dicnewicn         ;new icon
        bit 3,(hl)
        ld a,8
        jr z,dicinh2
        ld a,10
dicinh2 ld (dicnewdat3a+2),a
        ret z
        jr dicinh0

dicinhb ld hl,dicprpicn         ;existing icon
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
;### FOLDER ROUTINES ##########################################################
;==============================================================================

foldatexe   db "\folders\":foldatexe1
            db "launcher.exe",0:foldatexe0
foldatpps   dw 0    ;adr first char behind "launcher.exe"
foldatfps   dw 0    ;adr first char of "launcher.exe"
foldatnam   db "New":ds 12-3
            db "Folder":ds 12-6
foldatgrp   ds 8+1
foldatnew   ds 12+1

;### FOLPTH -> init folder/launcher path
folpth  ld hl,(prgparf)
        ld de,(prgparp)
        or a
        sbc hl,de
        ld c,l:ld b,h
        ex de,hl
        ld de,dicnewbuf1
        ldir
        ld hl,foldatexe
        ld bc,foldatexe0-foldatexe
        ldir
        dec de
        ld (foldatpps),de
        ld hl,foldatexe1-foldatexe0+1
        add hl,de
        ld (foldatfps),hl
        ret

;### FOLNAM -> generate folder filename from name
;### Input      HL=icon name (2x12)
;### Output     CF=0 -> (foldatgrp)=folder name (8 chars), dicnewbuf1=full group filepath
;###            CF=1 -> disc error or too many folders with similiar names
folnamcnt   db 0    ;counter for existing files
folnamext   db ".grp",0

folnam  ld (folnam4+1),hl
        ld de,foldatgrp     ;destination
        ld bc,256*2+8       ;b=name counter, c=char counter
folnam1 ld a,(hl)
        inc hl
        or a
        jr z,folnam4        ;next name part
        call clcucs
        cp "0"
        jr c,folnam1        ;not valid
        cp "Z"+1
        jr nc,folnam1       ;not valid
        cp "9"+1
        jr c,folnam2
        cp "A"
        jr c,folnam1        ;not valid
folnam2 ld (de),a           ;** valid, copy, c-=1
        inc de
        dec c
        jr nz,folnam1
        jr folnam7          ;full 8 chars reached
folnam4 ld hl,0             ;next name part
        dec b
        jr z,folnam5        ;** both name parts parsed
        push de
        ld de,12
        add hl,de
        pop de
        jr folnam1
folnam5 ld a,"_"
        inc c
folnam6 dec c               ;pad filename with "_" to keep 8 chars always
        jr z,folnam7
        ld (de),a
        inc de
        jr folnam6
folnam7 xor a
        ld (folnamcnt),a
folnam8 ld hl,(foldatfps)   ;create full group filepath
        push hl
        ex de,hl
        ld hl,foldatgrp
        call strcop
        dec de
        ld hl,folnamext     ;add extension
        call strcop
        ld hl,dicnewbuf1
        ld ix,(App_BnkNum-1)
        xor a
        call SyFile_DIRPRR  ;check, if existing
        pop hl
        jr nc,folnam3       ;-> yes, try next
        cp 013  ;stoerrxfi
        scf
        ret nz              ;error!=file not found -> disc error
        xor a
        ret
folnam3 ld a,(folnamcnt)
        inc a
        scf
        ret z               ;error too many double files (255)
        ld (folnamcnt),a
        call clcdez
folnam9 ld (foldatgrp+6),hl
        jr folnam8

;### FOLGNM -> copy icon name to group file
;### Input      HL=icon name (2x12)
;### Output     folgendatn=group name (24)
;### Destroyed  AF,BC,DE
folgnm  push hl
        ld hl,folgendatn
        push hl
        ld de,folgendatn+1
        ld bc,24-1
        ld (hl),0
        ldir
        pop de
        pop hl
        push hl
        call strcop
        ld l,e:ld h,d
        dec hl
        ld (hl)," "
        pop hl
        push hl
        ld bc,12
        add hl,bc
        call strcop
        pop hl
        ret

;### FOLGEN -> creates new folder file
;### Input      HL=icon name (2x12)
;### Output     CF=0 -> foldatgrp=folder name (1-8 chars), 
;###            CF=1 -> error while creating file or too many folders with similiar names

;2w = form x (60)
;2w = form y (50)
;2w = form w (150)
;2w = form h (110)
;2w = offset of title string in the heap, after the 13-byte header (0)
;2w = heap size in bytes (24)
;1b = number of icons (0)
;??b = heap data (11+1+11+1)

folgendat   dw 60,50,150,110
            dw 0,11+1+11+1
            db 0
folgendatn  ds 11+1+11+1
folgendat0

folgen  call folgnm         ;copy name to group file
        call folnam
        ret c
        ld hl,dicnewbuf1
        ld ix,(App_BnkNum-1)
        xor a
        call SyFile_FILNEW  ;create group file
        ret c               ;error while creating file
        ld hl,folgendat
        ld bc,folgendat0-folgendat
        ld de,(App_BnkNum)
        push af
        call SyFile_FILOUT
        pop bc
        push af
        call cfgsavs
        ld a,b
        call SyFile_FILCLO
        pop af
        ret

;### FOLNEW -> create new folder
folnew  ld hl,dicneww       ;not allowed, when new icon dialogue open
        inc (hl)
        dec (hl)
        jp nz,dicprpz
        call folpth         ;init path
        call dicpos         ;set icon position
        ld hl,(foldatpps)
        ld (hl),0
        ld hl,dicnewbuf1
        ld de,dicnewicn
        call icnfil         ;HL=filepath, DE=icondata -> load launcher icon
        ld hl,folglaobj
        jp c,prgwrn0        ;error, no launcher found
        call dicinha
        ld hl,foldatnam
        ld de,dicnewbuf2
        ld bc,24
        ldir                ;copy name
        ld hl,foldatnam
        call folgen         ;generate group file
        ld hl,folgdiobj
        jp c,prgwrn0
        call folpth         ;init path again
        ld hl,(foldatpps)
        ld (hl)," "
        inc hl
        ex de,hl
        ld hl,foldatgrp
        call strcop
        call dicmak
        jr nc,folnew1
        call dicpry3
        jp prgprz0
folnew1 ld a,(icnnumval)
        dec a
        jp dicren

;### FOLREN -> renames folder file
;### Input      dicnewbuf1=full launcher path, dicrentxt1b=new icon name, hl=old filename in icon data
;### Output     CF=1 -> disc error
folren  push hl
        ld hl,dicrentxt1b
        call folnam         ;HL=icon name (2x12) -> CF=0 (foldatgrp)=folder name (8 chars), dicnewbuf1=full group filepath
        jp c,folren1
        ld hl,(foldatfps)
        ld de,foldatnew
        ld bc,13
        push hl
        ldir                ;copy from full path to new filename
        pop de
        pop hl              ;hl=old filename
        push hl
        ld c,8              ;modify full path with old filename
        ldir
        ld hl,dicnewbuf1
        ld de,foldatnew
        ld ix,(App_BnkNum-1)
        call SyFile_DIRREN
        pop de              ;de=old filename in icon data
        jr c,folren2
        call cfgsavs
        ld hl,foldatgrp     ;update with new filename
        ld bc,8
        ldir
        ld hl,foldatnew     ;modify full path with new filename
        ld de,(foldatfps)
        ld c,8
        ldir
        ld hl,dicnewbuf1
        ld ix,(App_BnkNum-1)
        call SyFile_FILOPN
        jr c,folren2
        ld ix,13
        ld iy,0
        ld c,0
        push af
        call SyFile_FILPOI  ;move pointer to title string
        jr c,folren3
        ld hl,dicrentxt1b
        call folgnm
        ld hl,folgendatn
        ld de,(App_BnkNum)
        ld bc,24
        pop af
        push af
        call SyFile_FILOUT  ;write new name
        jr c,folren3
        pop af
        jp SyFile_FILCLO

folren3 pop af
        call SyFile_FILCLO
        jr folren2
folren1 pop hl
folren2 ld hl,folrdiobj
        call prgwrn
        scf
        ret

;### FOLPST -> duplicates folder file
;### Input      B=icon ID, HL+1=groupfile in source icon record
;### Output     CF=1 -> disc error
folpsts db 0    ;src handler
folpstd db 0    ;dst handler

folpst  push hl                 ;IX=icon record, HL+1=groupfile in icon record
        ld a,b
        call icnadr
        ld de,6
        add hl,de
        call folnam             ;(foldatgrp)=new groupfile name (8 chars), dicnewbuf1=new full groupfile path, (foldatfps)=position of groupfile in path
        jr c,folpst6
        ld hl,dicnewbuf1
        ld ix,(App_BnkNum-1)
        push ix
        call SyFile_FILNEW      ;overwrite new groupfile
        pop ix
        pop de
        ret c
        ld (folpstd),a
        inc de                  ;de=old groupfile in icon record
        ld hl,(foldatfps)       ;hl=new groupfile in path
        ld b,8
folpst1 ld a,(de)               ;copy new in icon record, old in path
        ldi
        dec hl
        ld (hl),a
        inc hl
        djnz folpst1
        ld hl,dicnewbuf1
        call SyFile_FILOPN      ;open old groupfile
        jr c,folpst5
        ld (folpsts),a
folpst2 ld hl,tmpbuf
        ld a,(App_BnkNum)
        ld e,a
        ld a,(folpsts)
        ld bc,512
        push de
        push hl
        call SyFile_FILINP      ;read from source
        pop hl
        pop de
        jr c,folpst3
        ld a,c
        or b
        jr z,folpst3
        ld a,(folpstd)
        call SyFile_FILOUT      ;write to destination
        jr nc,folpst2
folpst3 push af
        ld a,(folpsts)
        call SyFile_FILCLO
folpst4 ld a,(folpstd)
        call SyFile_FILCLO
        pop af
        ret
folpst5 push af
        jr folpst4
folpst6 pop hl
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
tskswtonm   db 0            ;original count (including non taskbar)
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
        ld l,c:ld h,b
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
        push af
        and #0f
        rst #20:dw jmp_bnkrbt       ;check, if linked text
        dec hl
        dec b
        jr nz,tsktit1
        inc hl
        rst #20:dw jmp_bnkrwd       ;get linked address
        ld l,c:ld h,b
tsktit1 pop af
        ld de,tsktittxt
        ld bc,31
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
tskswt4 ld hl,(App_MsgBuf)
        ld bc,256*FNC_DXT_KEYFNC+MSR_DSK_EXTDSK
        or a
        sbc hl,bc
        jr nz,tskswt1
        ld a,(App_MsgBuf+2)
        ld hl,tskswtnum
        cp 135
        jr nz,tskswt9
        ld a,(tskswtsel)
        sub 1
        jr nc,tskswt7
        ld a,(hl)
        dec a
        jr tskswt7
tskswt9 cp 129
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
syssec  ld a,(App_MsgBuf+12)
        or a
        jp nz,prgprz0
        ld a,1
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
        ex de,hl
        ld hl,(systxtsec5t+1)
        ld (hl),e:inc hl
        ld (hl),d
        ld a,c
        call clcdez
        ex de,hl
        ld hl,(systxtsec4t+1)
        ld (hl),e:inc hl
        ld (hl),d
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
secwin1 ld hl,sysspcw           ;*** Security -> Lock
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
secwin2 call sysclo             ;*** Security -> Password
        call syspwd
        jp prgprz0
secwin3 call sysclo             ;*** Security -> Cancel
        jp prgprz0

secwin4 ld c,MSC_SYS_PRGTSK     ;*** Security -> TaskManager
        jr secwins
secwin5 ld c,MSC_SYS_PRGSTA     ;*** Security -> Run
        jr secwins
secwin6 ld c,MSC_SYS_SYSQIT     ;*** Security -> ShutDown
secwins push bc
        call sysclo
        rst #30
        pop bc
        call msgsys             ;send command to system manager
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
paswin2 ld b,1
        call prgwrn
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
        jp z,secwin3
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
stmadr0 ld e,(hl)       ;de=length of this block
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
        ld (stminig+1),hl   ;store length byte address
        inc hl
        ld a,(hl)
        inc hl
        cp 1
        jp c,stmini7
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

        push hl
        ld l,(iy+2)
        ld h,(iy+3)
        ld a,(App_BnkNum)
        rst #20:dw jmp_bnkrbt   ;read first menu text char
        ld a,b
        cp 6
        jr nz,stminig
        set 4,(iy+0)
stminig ld bc,0                 ;correct item length (if corrupt)
        pop hl
        push hl
        or a
        sbc hl,bc
        ld a,l
        ld (bc),a
        pop hl

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
        jp stmini4
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
        and #f
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
;### Input      IXH=ID of requesting process
;### Output     (p2)=address, (p4)=bank
stmdat  ld hl,(stmrecsiz)
        ld (App_MsgBuf+6),hl
        ld de,cfgdynbeg
        ld hl,(App_BnkNum)
        db #dd:ld a,h
        call msgsnd1
        jp prgprz0

;### STMCOP -> [remote] moves memory area
stmcop  ld a,(App_MsgBuf+8)
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
;### Output     CF=1 -> unknown file/error while loading icon
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
icnfil0 ld hl,icndummy          ;* unknown
        ld de,(icnfila)
        ld bc,144+3
        ldir
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
        jr c,icnfil0
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
icnfil4 push af
        ld a,(icnlodhnd)
        call SyFile_FILCLO
        pop af
        jp c,icnfil0
        ret
icnfil5                         ;* load 16colour icon
        ld hl,(tmpbuf+41)       ;hl=ofs
        ld a,(tmpbuf+40)        ;a=crunched flags
        ld de,#100              ;de=filofs
        ld bc,(tmpbuf+00)
        dec b
        call icncpr
        ld bc,(tmpbuf+02)       ;icon is never in code area
        call icncpr
        jr c,icnfil8            ;icon in data area
        ld bc,(tmpbuf+04)
        call icncpr             ;icon in trns area

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
        jr c,icnfil4
        ld hl,icnfilh16
        ld bc,10
        jr icnfil7

;### ICNCPR -> check, if inside area or skip compressed/uncompressed area
;### Input      DE=file offset, BC=uncompressed area size, A=compressed flag (bit7=current), HL=current offset
;### Output     CF=1 -> offset HL in this area, use it
;###            CF=0 -> DE=next file offset, HL=new corrected icon offset, A=next compressed flag
icncpr  push hl
        or a
        sbc hl,de           ;ofs always >= fileofs
        sbc hl,bc           ;ofs within current area?
        pop hl
        jr nc,icncpr1       ;no, get next
        rla                 ;is this crunched?
        ccf
        ret c               ;no -> finished, here we are
        ld bc,8
        add hl,bc           ;yes -> increase by 8 because of crunch-header
        scf
        ret

icncpre pop hl:pop hl:pop hl:pop hl
        pop hl
        jr icnfil4

icncpr1 rla                 ;ofs in next area -> crunched?
        jr c,icncpr2
        ex de,hl
        add hl,bc           ;no -> just increase file offset, next try
        ex de,hl
        ret
icncpr2 push af             ;yes -> correct icon offset by crunch difference
        push de             ;filofs
        push bc             ;orglen
        push hl             ;curofs
        push de:pop ix
        ld iy,0
        ld c,0
        ld a,(icnlodhnd)
        call SyFile_FILPOI
        jr c,icncpre
        ld a,(icnlodhnd)
        ld hl,icncpr3+1
        ld de,(App_BnkNum)
        ld bc,2
        call SyFile_FILINP
        jr c,icncpre
icncpr3 ld bc,0             ;bc=crnlen
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
        ld hl,dicfleobj
        call prgwrn
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
        jp nz,prgwrn0
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
        jp c,prgwrn0
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
        jp nz,prgwrn0
        ex de,hl
        ld hl,(tmpbuf+256+2)
        ld bc,"1"*256+"G"
        or a
        sbc hl,bc
        ex de,hl
        jp nz,prgwrn0
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
        jp dicnewj

wdgnews ld a,(App_MsgBuf+3)     ;sizelist doubleclick -> finished
        cp DSK_SUB_MDCLICK
        jp nz,prgprz0
wdgnew5 ld a,(wdgnumval)        ;finished
        cp wdgnummax
        ld hl,wdgmemobj
        jp z,prgwrn0            ;too many widgets -> error
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
        jp c,prgwrn0            ;memory full -> error
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
        jp prgwrn0

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
wdgdel  ld b,4*8+2
        ld hl,wdgdelobj
        ld de,0
        call prgwrn1
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
;### CONTROL PANEL COMMUNICATION ##############################################
;==============================================================================

;### CPLOPR -> execute control panel operations
;### Input      IXH=sender process (control panel or application for language services)
;###            E=type [1=*undef*, 2=font load, 3=font remove, 4=language setting, 5=build kex-info, 6=kex-preview, 7=load kex], D=data bank/flags, HL=data address/data
;### Redirects  D,HL
cplopr  ld a,ixh
        ld (cplrpl0+2),a
        dec e
        ;jp z,...
        dec e
        jp z,fntlod
        dec e
        jp z,fntrem
        dec e
        jp z,lngset
        dec e
        jp z,keyinf
        dec e
        jp z,keyprv
        dec e
        jp z,keylod
        jp prgprz0

;### CPLRPL -> replys to control panel/appication and returns to main loop
;### Input      A=status (for fonts  -> 0=error, 1-7=preview/load/remove/lngset/keyinf/keyprv/keylod successfully;
;###                      for lnglod -> [0=no extended desktop, already done by system manager], 1=ok, 2-x=error)
cplrpl  ld (App_MsgBuf+1),a
        ld a,(App_PrcID)
cplrpl2 ld ixl,a
cplrpl0 ld ixh,0                ;receiver ID, set by cplopr
        ld a,MSR_SYS_EXTFNC
cplrpl3 ld (App_MsgBuf+0),a
        ld iy,App_MsgBuf
        rst #10                 ;send message to control panel
        jp prgprz0
cplrpl1 ld (App_MsgBuf+1),a
        ld a,PRC_ID_SYSTEM
        jr cplrpl2


;==============================================================================
;### FONT ROUTINES ############################################################
;==============================================================================

fntcnv  ds 16*16+1  ;converter buffer; #used by font and language routines#

;### FNTINI -> init font handling
fntini  call fntini0
        rst #20:dw jmp_bnkrwd       ;store internal fontadr with header
        ld (fntrem1+1),bc
        rst #20:dw jmp_bnkrwd       ;store internal fontadr without header/system chars
        ld (fntrem2+1),bc
        ret
fntini0 ld hl,(dskvaradr)
        ld bc,symextfna
        add hl,bc
        xor a
        ret

;### FNTACT -> activate enhance font
fntact  call fntini0
        ld bc,(5*0+prgmemtab+1)
        push bc
        rst #20:dw jmp_bnkwwd       ;set external fontadr with header
        pop bc
        inc bc:inc bc               ;set external fontadr without header
        ld de,(5*0+prgmemtab+0-1)
        ld e,1
fntact1 rst #20:dw jmp_bnkwwd
        ld c,e:ld b,d
        rst #20:dw jmp_bnkwwd
        ret

;### FNTCFL -> check, if enhanced font is existing, load it and set OS font (called by cfglod)
;### Input      B=file handle
fntcfl  call fntcfl0
        ld a,#c3
        ld (fntcfl3),a
        ret

fntcfl0 ld a,(cfgdatflg)
        bit 1,a
        ret z
        push bc
        call fntmem
        pop bc
        jr nc,fntcfl2
fntcfl1 ld hl,cfgdatflg
        res 1,(hl)
        ret
fntcfl2 ld a,(5*0+prgmemtab+0)
        ld e,a
        ld a,b
        ld hl,(5*0+prgmemtab+1)
        inc h:inc h
        ld bc,255*11
        call SyFile_FILINP
        jr c,fntcfl1
        call fntact
        rst #30
fntcfl3 ld hl,SyDesktop_DSKALL       ;##!!## workaround, as this doesn't work directly on MSX while booting (DSKSRVA is not executed)
        ld a,#cd
        ld (prgini3),a
        ret

;### FNTCFS -> save enhanced font in config, if existing (called by cfgsav)
;### Input      B=file handle
fntcfs  ld a,(cfgdatflg)
        bit 1,a
        ret z
        ld a,b
        ld de,(5*0+prgmemtab+0)
        ld hl,(5*0+prgmemtab+1)
        inc h:inc h
        ld bc,255*11
        jp SyFile_FILOUT

;### FNTMEM -> reserves and registers memory for enhanced font
;### Output     CF=0 -> (5*0+prgmemtab+0/1/3) prepared
;###            CF=1 -> memory full
fntmems
db 8,8,#00,#02,#06,#0c,#58,#70,#20,#00,0 ;  029 *** Checker     (menu checked)
db 8,8,#00,#ff,#60,#78,#7e,#78,#60,#00,0 ;  030 *** Arrow Right (menu sub, tree closed)
db 8,8,#00,#7e,#7e,#3c,#3c,#18,#18,#00,0 ;  031 *** Arrow Down  (tree opened)

fntmem  ld bc,255*11+510+2
        xor a
        ld e,1
        push bc
        rst #20:dw jmp_memget
        pop bc
        ret c
        ld (5*0+prgmemtab+0),a      ;register reserved memory
        ld (5*0+prgmemtab+1),hl
        ld (5*0+prgmemtab+3),bc
        push hl
        ld hl,cfgdatflg
        set 1,(hl)
        ld hl,#0303                     ;** prepare chars
        ld (fntcnv),hl
        ld hl,fntcnv+2
        ld bc,8
        ld (hl),b
        ld de,fntcnv+3
        ldir
        ld hl,fntcnv
        ld bc,17*11-11
        ldir
        pop hl:push hl
        inc h:inc h                 ;hl+=255*2+2
        ld ixl,15
        ld bc,17*11
fntmem5 push hl
        push bc
        call fntmem4
        pop bc
        pop hl
        add hl,bc
        dec ixl
        jr nz,fntmem5
        ld hl,fntmems                   ;** set system chars
        ld de,fntcnv
        ld bc,3*11
        push bc
        ldir
        pop bc
        pop hl:push hl
        ld de,29*11-11+512
        add hl,de
        call fntmem4
        ld hl,256*1+128+64+8            ;** prepare header, offsets
        ld (fntcnv),hl              ;255 chars, big font, 8pixel height, starts at char 1
        ld de,255*2-1               ;de=offset
        ld ixl,127
        ld hl,fntcnv+2
        call fntmem1                ;offsets for first 127 chars
        pop hl:push hl
        call fntmem3                ;copy to enhanced big font
        ld ixl,128
        ld hl,fntcnv
        call fntmem1                ;offsets for next 127 chars
        pop hl
        inc h
fntmem3 push de                     ;copy to enhanced font
        ld bc,256
        call fntmem4
        pop de
        ret
fntmem4 ex de,hl                    ;copy BC bytes from fntcnv to HL
        ld a,(5*0+prgmemtab+0)
        add a:add a:add a:add a
        ld hl,App_BnkNum
        add (hl)
        ld hl,fntcnv
        rst #20:dw jmp_bnkcop
        ret
fntmem1 ld bc,11-2
fntmem2 ld (hl),e:inc hl
        ld (hl),d:inc hl
        ex de,hl
        add hl,bc
        ex de,hl
        dec ixl
        jr nz,fntmem2
        ret

;### FNTERR -> error while loading font, release memory optional and send CP message
fnterr2 pop hl
        pop hl
fnterr1 ld a,(fntlodhnd)
        call SyFile_FILCLO
fnterr0 ld a,(fntlodbrk)
        or a
        call nz,fntrem0
fnterr3 xor a
        jp cplrpl

;### FNTLOD -> load enhanced font from file and activate it, send CP confirmation
;### Input      HL=filepath address, D=filepath bank
fntlodhnd   db 0
fntlodhed   ds 2
fntlodbrk   db 0        ;1=on error release memory

fntlod  xor a
        ld (fntlodbrk),a
        ld a,(5*0+prgmemtab+0)
        or a
        jr nz,fntlod1
        push hl
        push de
        call fntmem
        pop de
        pop hl
        ld a,0
        jp c,cplrpl
        inc a                       ;there was no font loaded before -> remove enhanced font/memory, if loading fails
        ld (fntlodbrk),a
fntlod1 ld ixh,d                    ;open fontfile
        call SyFile_FILOPN
        jr c,fnterr0
        ld (fntlodhnd),a
        ld de,(App_BnkNum)          ;load header
        ld hl,fntlodhed
        ld bc,2
        call SyFile_FILINP
        jr c,fnterr1
        ld hl,fntlodhed+0
        xor a
        bit 7,(hl)
        jr z,fntlodc
        inc hl
        ld a,(hl)
        ld (hl),1
        dec hl
fntlodc ld (fntlodd+1),a
        ld a,(hl)
        bit 5,a
        ld hl,16*16
        ld de,1+fntcnv              ;+1 as first char would be overwriten by double width byte
        ld a,7
        jr z,fntlod2
        ld hl,9*16
        ld de,16*7+fntcnv
        xor a
fntlod2 ld (fntlod4+1),de           ;where to load
        ld (fntlod5+1),hl           ;size of 16 chars chunk
        ld (fntlod8+1),a            ;skip charlines
        add 9
        ld (fntlod6+1),a            ;loaded amount divisor
        ld a,(fntlodhed+1)
        ld b,a
        dec a
        ld de,11
        call clcm16
        ld de,(5*0+prgmemtab+1)
        add hl,de
        inc h:inc h                 ;hl+=255*2+2=destination big font address
        xor a
        sub b
        ld b,a                      ;b=256-first char=max number of chars to be loaded
fntlod3 push hl
        push bc                         ;** loading loop
        ld de,(App_BnkNum)
fntlod4 ld hl,0                     ;hl=convert destination (medium=fntcnv, small=fntcnv+16*7)
fntlod5 ld bc,0                     ;bc=size of 16 chars
        push hl
        ld a,(fntlodhnd)
        call SyFile_FILINP
        pop hl
        jp c,fnterr2
        push hl
fntlod6 ld de,0
        call clcd16                 ;l=loaded characters
        pop de
        pop bc
        ld c,l
        inc c:dec c
        jr z,fntloda                ;nothing loaded -> finished
        push bc                     ;b=remaining chars, c=loaded chars
        ld ixl,16
        ex de,hl
        ld de,fntcnv
fntlod7 ld a,(hl)                       ;** char loop
        ldi
        ld (de),a
        inc de
        ld bc,8
        ldir
        xor a
        ld (de),a
        inc de
fntlod8 ld bc,0
        add hl,bc
        dec ixl
        jr nz,fntlod7
        pop de                      ;d=remaining chars, e=loaded chars
        pop bc                      ;bc=destination
        push de
        push bc
        ld a,e
        cp d
        jr c,fntlod9
        ld a,d
fntlod9 ld de,11
        call clcm16
        ld e,c:ld d,b               ;de=dest
        ld c,l:ld b,h               ;bc=size
        ld a,(5*0+prgmemtab+0)
        add a:add a:add a:add a
        ld hl,App_BnkNum
        add (hl)
        ld hl,fntcnv
        rst #20:dw jmp_bnkcop
        pop hl
        ld bc,16*11
        add hl,bc
        pop af
        sub 16
        jr z,fntlodb
        ld b,a
        jr nc,fntlod3
        jr fntlodb
fntloda pop hl
fntlodb ld a,(fntlodhnd)
        call SyFile_FILCLO
        call fntact
fntlodd ld a,0
        ld (App_MsgBuf+2),a
        ld a,2
        jp cplrpl

;### FNTREM -> remove enhanced font, if existing, send CP confirmation
fntrem  call fntrem0
        ld a,3
        jp cplrpl                   ;reply and return
fntrem0 ld a,(5*0+prgmemtab+0)
        or a
        ret z                       ;no enhance font -> finished
        ld hl,(5*0+prgmemtab+1)
        ld bc,(5*0+prgmemtab+3)
        rst #20:dw jmp_memfre       ;free memory
        xor a                       ;unregister
        ld (5*0+prgmemtab+0),a
        ld hl,cfgdatflg
        res 1,(hl)
        call fntini0                ;set internal system font
fntrem1 ld bc,0                     ;address of internal system font (with header)
        rst #20:dw jmp_bnkwwd
fntrem2 ld bc,0                     ;address of internal system font (without header/system chars)
        ld de,0
        jp fntact1                  ;activate internal system font


;==============================================================================
;### KEYFUNCTION ROUTINES #####################################################
;==============================================================================

;### KFNEXE -> executes keyboard input
;### Input      E=char
kfnexe  ld a,e
        cp 128
        jp z,syssec         ;SymbOS security
        cp 129
        jp z,tsknxt         ;switch to next window
        cp 135
        jp z,tskprv         ;switch to previous window
        cp 203
        jp z,prgtry1        ;switch to next keyboard layout
        ;...
        jp prgprz0


;==============================================================================
;### KEYMAPPING ROUTINES ######################################################
;==============================================================================

keylaysiz   equ 40
keymapsiz   equ 100

keydatmp1   ds keymapsiz    ;normal/shift
keydatmp2   ds keymapsiz    ;altgr/shift+altgr
keydatlyp   db 0            ;layout position [0-(cfgkeylyc-1)]
keydatbnc   db 0            ;source/destination bank for BNKCOP
keydatsti   db -1           ;-1 or systray ID

;### KEYMEM -> releases or reserves and registers memory for enhanced keymaps and deadkey/romaji trees
;### Input      (cfgkeyflg),(cfgkeysiz)
;### Output     CF=1 -> memory full
;###            CF=0 -> ZF=1 -> no enhanced keymapping
;###                    ZF=0 -> (5*1+prgmemtab+0/1/3) updated, BC=length, HL=keydatbnc
keymem  ld a,(5*1+prgmemtab+0)
        or a
        jr z,keymem1
        ld hl,(5*1+prgmemtab+1)     ;free old keymap memory
        ld bc,(5*1+prgmemtab+3)
        rst #20:dw jmp_memfre
        xor a
        ld (5*1+prgmemtab+0),a
keymem1 ld a,(cfgkeyflg)
        or a
        ret z                       ;no enhanced keymapping
        ld bc,(cfgkeysiz)
        xor a
        ld e,a
        push bc
        rst #20:dw jmp_memget
        pop bc
        jr c,keymem4
        ld (5*1+prgmemtab+0),a      ;register reserved memory
        ld (5*1+prgmemtab+1),hl
        ld (5*1+prgmemtab+3),bc
        ld a,(App_BnkNum)
        add a:add a:add a:add a
        ld hl,5*1+prgmemtab+0
        add (hl)
        ld (keydatbnc),a
        or a
        ret
keymem4 ld hl,cfgkeyflg             ;memory full, disable enhanced keymapping
        ld (hl),0
        ret

;### KEYCFS -> save enhanced keyboard configuration into INI file
;### Input      B=file handle
keycfs  ld a,(cfgkeyflg)
        or a
        ret z
        ld a,(5*1+prgmemtab+0)
        ld e,a
        ld a,b
        ld hl,(5*1+prgmemtab+1)
        ld bc,(5*1+prgmemtab+3)
        jp SyFile_FILOUT            ;save enhanced keyboard data

;### KEYCFL -> load enhanced keyboard configuration from KEX/INI file
;### Input      B=file handle
;### Output     CF=1 memory full/file error
;###            KEYACT called
keycfl  ld a,(cfgkeyflg)
        or a
        jr z,keyact
keycfl1 push bc
        call keymem                 ;load switchable maps
        pop de
        jr c,keyact
        ld a,(5*1+prgmemtab+0)
        ld e,a
        ld a,d
        ld hl,(5*1+prgmemtab+1)
        call SyFile_FILINP
        jr nc,keyact
        call keymem4
        call keymem
        scf
;### KEYACT -> activate or deactivate enhanced keymap settings
;### Destroyed  BC,DE,HL,IX,IY
keyact  push af
        call lngisa
        ld hl,(dskvaradr)
        ld bc,symextkmf
        add hl,bc
        ld a,(cfgkeyflg)
        push af
        ld b,a
        xor a
        rst #20:dw jmp_bnkwbt
        ld bc,keydatmp1-28
        rst #20:dw jmp_bnkwwd
        ld bc,keydatmp2-28
        rst #20:dw jmp_bnkwwd
        call keystd                 ;delete systray, if existing
        pop af
        or a
        jr z,keyact0
        bit 1,a
        jr z,keyact2
        ld a,(cfgkeylyc)            ;generate systray menu
        push af
        ld (keymendat),a
        ld a,(keydatbnc)
        ld hl,(5*1+prgmemtab+1)
        inc hl:inc hl
        ld de,keymen_txt1+6
        pop bc
keyact1 push bc
        push hl
        push de

        push hl
        push de
        push af
        ld bc,22
        rst #20:dw jmp_bnkcop       ;copy description
        pop af
        pop hl
        ld bc,10+22
        add hl,bc                   ;skip text+gfxheader
        ex de,hl
        pop hl
        ld c,22
        add hl,bc                   ;jump to icon data
        push af
        ld c,14
        rst #20:dw jmp_bnkcop       ;copy iconbitmap
        pop af

        pop hl
        ld bc,keymen_txt2-keymen_txt1
        add hl,bc
        ex de,hl
        pop hl
        ld c,keylaysiz
        add hl,bc
        pop bc
        djnz keyact1

keyact2 xor a
        ld (keydatlyp),a
        call keyswt                 ;switch keymap to position 0
keyact0 pop af
        ret

;### KEYSTD -> remove systray icon
keystd  ld a,(keydatsti)
        inc a
        ret z
        dec a
        call SyDesktop_STIREM
        ld a,-1
        ld (keydatsti),a
        ret

;### KEYNXT -> switches to next keymap, if switchable keymaps active
keynxt  ld a,(cfgkeyflg)
        bit 1,a
        ret z
        ld hl,keydatlyp
        inc (hl)
        ld a,(cfgkeylyc)
        cp (hl)
        jr nz,keynxt1
        ld (hl),0
keynxt1 call keyswt0
        call z,SyDesktop_STIUPD
        ret

;### KEYSWT -> switches to selected keylayout
;### Input      (keydatlyp)=layout
keyswt  call keystd
        call keyswt0
        ret nz
        ld a,(App_BnkNum)
        ld l,1
        call SyDesktop_STIADD
        ret c
        ld (keydatsti),a
        ret
;ZF=1 -> show systray icon, ZF=0 -> DE=keysti_icn
keyswt0 ld a,(keydatlyp)
        ld de,keylaysiz
        call clcm16
        ld bc,(5*1+prgmemtab+1)
        add hl,bc                   ;layout adr
        ld a,(5*1+prgmemtab+0)
        rst #20:dw jmp_bnkrwd       ;c=layout (1-x), b=tree (1-x, +32=full translation, 0=no tree)
        ld a,b
        ld (keyswt1+1),a
        push hl
        ld a,c
        dec a
        ld de,keymapsiz*2
        call clcm16                 ;hl=mapofs
        push hl
        ld a,(cfgkeylyc)
        ld de,keylaysiz
        call clcm16                 ;hl=size of all layouts
        pop bc
        push hl
        add hl,bc
        ld bc,(5*1+prgmemtab+1)
        push bc
        add hl,bc                   ;hl=mapadr
        ld bc,keymapsiz*2
        ld de,keydatmp1
        ld a,(keydatbnc)
        rst #20:dw jmp_bnkcop       ;copy selected keymap
        ld a,(cfgkeympc)
        ld de,keymapsiz*2
        call clcm16                 ;hl=size of all maps
        pop bc
        add hl,bc
        pop bc
        add hl,bc                   ;hl=tree data begin
keyswt1 ld a,0
        push af
        sub 1
        jr c,keyswt2
        and 31
        add a
        ld c,a
        ld b,0
        add hl,bc
        ld a,(5*1+prgmemtab+0)
        rst #20:dw jmp_bnkrwd       ;bc=tree offset
        add hl,bc
        ld (keytreadr),hl           ;set tree address
        call keytre2                ;reset tree position
keyswt2 pop af
        ld hl,(cfgkeyflg)
        and 32
        or l
        ld b,a
        ld hl,(dskvaradr)
        ld de,symextkmf
        add hl,de
        xor a
        rst #20:dw jmp_bnkwbt       ;reset/set fulltree flag
        pop hl                      ;hl=layout name adr
        ld a,(cfgkeyflg)
        cpl
        and #82
        ret nz
        ld bc,22                    ;update systray icon, if active
        add hl,bc
        ld de,keysti_icn+3
        ld bc,16
        ld a,(keydatbnc)
        rst #20:dw jmp_bnkcop       ;copy bitmap
        ld a,2
        ld de,keysti_icn
        ld (de),a
        xor a
        ret

;### KEYSWTx -> switch to keymap via systray menu
keyswta xor a :jr keyswtm
keyswtb ld a,1:jr keyswtm
keyswtc ld a,2:jr keyswtm
keyswtd ld a,3:jr keyswtm
keyswte ld a,4
keyswtm ld (keydatlyp),a
        call keynxt1
        jp prgprz0

;### KEYINF -> builds keyboard information
;### Input      HL=window record of info-subwin, D=bank
;### Output     (App_MsgBuf+2)=header
keyinf  ld a,(App_BnkNum)
        ld b,a
        ld c,25
        ld a,d
        rst #20:dw jmp_bnkwwd
        ld bc,keyobjinf
        rst #20:dw jmp_bnkwwd

        ld a,(cfgkeyflg)
        and 1
        jr z,keyinf5
        ld a,(cfgkeylyc)
        ld b,a
        ld a,(keydatbnc)
        ld hl,(5*1+prgmemtab+1)
        inc hl:inc hl
        ld de,keytxtinf3+4
keyinf7 push bc
        push hl
        push de
        ld bc,22
        push af
        rst #20:dw jmp_bnkcop       ;copy description
        pop af
        pop hl
        ld bc,keytxtinf4-keytxtinf3
        add hl,bc
        ex de,hl
        pop hl
        ld c,keylaysiz
        add hl,bc
        pop bc
        djnz keyinf7
keyinf5 ld hl,cfgkeyflg

keyinf1 call keyinf0
        ld a,5
        jp cplrpl

keyinf0 ld a,(hl)
        ld de,App_MsgBuf+2          ;copy header to message
        ld bc,8
        ldir
        rra                         ;check for activated
        ld c,1
        jr nc,keyinf6
        ld bc,cfgkeynam-cfgkeyflg-8 ;copy description
        add hl,bc
        ld de,keytxtinf1
        ld c,8
        ldir
        inc de:inc de:inc de
        ld c,15
        ldir
        ld bc,cfgkeylyc-cfgkeynam-8-15
        add hl,bc
        ld a,(hl)
        ld ix,keydatinf1
        ld b,5
        ld de,16
keyinf3 ld (ix+2),64
        sub 1
        jp m,keyinf4
        ld (ix+2),1                 ;show available layers
keyinf4 add ix,de
        djnz keyinf3
        ld c,9
keyinf6 ld a,c
        ld (keygrpinf),a
        ret

;### KEYERR -> error while loading kex file
keyerr0 pop hl
keyerr  ld a,b
        call SyFile_FILCLO
keyerr1 xor a
        ld (App_MsgBuf+2),a
        jp cplrpl

;### KEYPRV -> shows kex preview
;### Input      HL=path address, D=bank
;### Output     (App_MsgBuf+2)=header
keyprv  ld ixh,d
        ld a,d
        ld (keylod+2),a
        call SyFile_FILOPN
        jr c,keyerr1
        ld hl,fntcnv
        ld bc,48
        ld de,(App_BnkNum)
        push af
        call SyFile_FILINP
        pop bc
        jr c,keyerr
        jr nz,keyerr
        ld de,"XK"
        ld hl,(fntcnv+0)
        sbc hl,de
        jr nz,keyerr
        ld a,(fntcnv+2)
        or a
        jr nz,keyerr
        ld a,(fntcnv+3-cfgkeyflg+cfgkeylyc)
        ld c,a
        ld hl,keytxtinf3+4
        ld ix,2
keyprv1 push bc
        push hl
        ld iy,0
        ld a,b
        push af
        ld c,1
        call SyFile_FILPOI
        pop bc
        pop hl
        jr c,keyerr0
        ld a,(App_BnkNum)
        ld e,a
        ld a,b
        ld bc,22
        push hl
        call SyFile_FILINP
        pop hl
        jr c,keyerr0
        ld de,keytxtinf4-keytxtinf3
        add hl,de
        ld ix,keylaysiz-22
        pop bc
        dec c
        jr nz,keyprv1
        ld hl,fntcnv+3-cfgkeyflg+cfgkeyflg
        set 7,(hl)
keyprv2 ld a,b
        call SyFile_FILCLO
        ld hl,fntcnv+3-cfgkeyflg+cfgkeyflg
        call keyinf0
        ld a,6
        jp cplrpl

;### KEYLOD -> loads and activates kex-file
;### Input      HL=path address, D=flags (bit0=active,bit7=systray, bit6=only systray changed)
keylod  ld ixh,0
        ld a,d
        or a
        jr z,keylod2
        bit 6,a
        jr z,keylod4
        call keylod5
        jr keylod6
keylod4 ld (keylod3+1),a        ;save systray flag
        call SyFile_FILOPN      ;activated, skip identifier, load and activated kex
        jp c,keyerr1
        ld c,0
        ld ix,3
        ld iy,0
        push af
        call SyFile_FILPOI
        pop bc
        jp c,keyerr
        ld a,(App_BnkNum)
        ld e,a
        ld hl,cfgkeyflg
        ld a,b
        ld bc,48-3
        push af
        call SyFile_FILINP
        pop bc
        jp c,keyerr
keylod3 ld a,0                  ;restore systray flag
        call keylod5
        push bc
        call keycfl
        pop bc
        jp c,keyerr
        ld a,b
        call SyFile_FILCLO
        ld hl,(cfgkeyfnt)
        ld (App_MsgBuf+2),hl    ;send writing style+language
keylod1 ld a,7
        jp cplrpl
keylod2 ld (cfgkeyflg),a        ;not activated, remove kex, if loaded
keylod6 call keyact
        jr keylod1
keylod5 ld hl,cfgkeyflg
        and 128
        res 7,(hl)
        or (hl)
        ld (hl),a
        ret

;### KEYDED -> converts deadkey+char into combined char
;### Input      E=second char, D=deadkey
;### Returns    P2=1, P6=combined char
keyded  call keytre2
        push de
        ld e,d
        call keytre
        pop de
        call keytre
        ld e,a
        jr nc,keyftr1
        ld a,(App_MsgBuf+6)
        cp 32
        jr nc,keyftr1
        ld e,a
        ld d,a
        jr keyded

;### KEYFTR -> use full tree for input conversion
;### Input      E=next input char
;### Returns    P2=0/len, P6-P12=result string
keyftr  call keytre
        ld e,a
keyftr1 ld bc,FNC_DXT_KEYFTR*256+MSR_DSK_EXTDSK
        call msgsnd
        jp prgprz0

;### KEYTRE -> executes key tree
;### Input      E=input char
;### Output     A>0 -> A=result length, (App_MsgBuf+6)=result string
;###                   CF=0 -> result found in tree
;###                   CF=1 -> not found, result is last char
;###            A=0 -> tree in progress, not finished (CF always 0)
keytreadr   dw 0    ;tree start address
keytreofs   dw 0    ;current address in tree

keytre  ld a,(5*1+prgmemtab+0)
        ld hl,(keytreofs)
        rst #20:dw jmp_bnkrbt
        ld d,b
keytre1 ld a,(5*1+prgmemtab+0)
        rst #20:dw jmp_bnkrbt
        ld a,e
        cp b
        jr z,keytre4
        inc hl:inc hl
        dec d
        jr nz,keytre1
        ld (App_MsgBuf+6),a         ;not found -> just return last char
        ld a,1
        scf
keytre2 ld hl,(keytreadr)
keytre3 ld (keytreofs),hl
        ret
keytre4 ld a,(5*1+prgmemtab+0)      ;found -> jump to node address
        rst #20:dw jmp_bnkrwd
        add hl,bc
        rst #20:dw jmp_bnkrbt
        inc b:dec b                 ;check, if leaf reached
        jr z,keytre5
        dec hl                      ;no -> store tree offset, return 0
        xor a
        jr keytre3
keytre5 ld de,App_MsgBuf+6          ;yes -> copy leaf-content to result
        ld bc,8
        ld a,(keydatbnc)
        push de
        rst #20:dw jmp_bnkcop
        pop hl
        call strlen
        ld a,c
        or a
        jr keytre2


;==============================================================================
;### LANGUAGE ROUTINES ########################################################
;==============================================================================

;### PRGLNG -> patches language for Extended Desktop and SymbOS core
prglng  ld hl,(App_BnkNum)
        ld h,l
        ld (lnglodm-4+6),hl     ;banks
        ld hl,texts_int
        ld (lnglodm-4+8),hl     ;text adr
        ld hl,(prgparp)
        ld (lnglodm-4+4),hl     ;path adr
        ld hl,256*0+9           ;pack 0, default language 9 (ENG)
        ld (lnglodm-4+10),hl
        ld a,0
        ld (lnglodm-4+12),a     ;version 0
        ld hl,(prgparf)         ;set path always to "symbosxt"
        ld bc,5
        add hl,bc
        ld e,(hl):ld (hl),"o":inc hl
        ld d,(hl):ld (hl),"s"
        push de
        push hl
        call lnglody

        ld hl,(dskvaradr)
        xor a
        rst #20:dw jmp_bnkrbt
        ld a,b
        ld (lnglodm-4+7),a
        ld de,symextlng-1
        add hl,de
        xor a
        rst #20:dw jmp_bnkrwd
        ld (lnglodm-4+8),bc     ;text adr
        inc a
        ld (lnglodm-4+11),a
        call lnglody

        pop hl                  ;restore path
        pop de
        ld (hl),d:dec hl
        ld (hl),e
        ret

;### LNGSET -> gets or sets primary and secondary language
;### Input      D=mode -> 0=get, 1=set -> L=primary, H=secondary
;### Output     get -> L=primary, H=secondary
lngset  dec d
        jr nz,lngset2
        ld (cfglngpri),hl
        ;call prglng
        ;call cfglng
lngset1 ld a,4
        jp cplrpl
lngset2 ld hl,(cfglngpri)
        ld (App_MsgBuf+2),hl
        jr lngset1

;### LNGLOD -> load from language file and patch application
;### Input      P10=default language, P11=pack, P12=version, P6=path bank, P4/5=path address, P7=text bank, P8/9=text address
;### Output     sends status back to application -> 1=ok, 2=disc error, 3=wrong version/pack, 4=language not available
lnglodh db 0                    ;file handler
lnglodm ds 10                   ;message buffer copy

lnglod  call lnglodx
        jp cplrpl1

lnglodx ld hl,App_MsgBuf+4
        ld de,lnglodm
        ld bc,10
        ldir
lnglody ld a,(cfglngpri)
        call lnglod0
        cp 4
        ret nz
        ld a,(cfglngsec)

lnglod0 ld (lnglod7+3),a
        ld e,a
        or a
        ld a,1
        ret z
        ld a,(lnglodm-4+10)
        cp e
        ld a,1
        ret z                   ;current language = default language -> finished
        ld de,fntcnv
        push de
        ld a,(App_BnkNum)
        add a:add a:add a:add a
        ld hl,lnglodm-4+6
        add (hl)
        ld hl,(lnglodm-4+4)
        ld bc,256
        rst #20:dw jmp_bnkcop   ;copy path
        pop hl
        push hl
lnglod8 inc hl
        ld a,(hl)
        or a
        jr z,lnglod9
        sub 32
        jr nz,lnglod8
        ld (hl),a
lnglod9 dec hl:ld (hl),"g"      ;change extension to ".LNG"
        dec hl:ld (hl),"n"
        dec hl:ld (hl),"l"
        pop hl
        ld ix,(App_BnkNum-1)
        call SyFile_FILOPN      ;open language file
        ld (lnglodh),a
        ld a,2
        ret c
        ld bc,6*16+3            ;load header + pack data
        call lnglodl
        jr nc,lnglod1
lnglodf ld b,2
lnglode push bc                 ;error, close
        ld a,(lnglodh)
        call SyFile_FILCLO
        pop af
        ret
lnglod1 ld a,(lnglodm-4+12)
        cp (hl)
        ld bc,3*256+255
        jr nz,lnglode           ;wrong version
        inc hl
        ld de,lnglod7+1         ;store number of languages
        ldi
        ld a,(lnglodm-4+11)
        cp (hl)
        jr nc,lnglode           ;wrong pack, too high
        add a
        ld e,a
        add a
        add e                   ;*6
        inc a
        ld e,a
        ld d,0
        add hl,de
        ld e,(hl):inc hl
        ld d,(hl):inc hl
        ld (lnglod4+1),de       ;store pack size
        ld e,(hl):inc hl
        ld d,(hl):inc hl
        ld (lnglod5+2),de       ;store number of texts
        call lnglodo            ;seek to language data
        jr c,lnglodf
        ld bc,2*80+1            ;load language data
        call lnglodl
        jr c,lnglodf
lnglod7 ld c,0                  ;\ search language
        ld a,0                  ;/
lnglod2 cp (hl)
        inc hl
        jr z,lnglod3
        inc hl:inc hl
        dec c
        jr nz,lnglod2
        ld b,4                  ;language not available
        jr lnglode
lnglod3 call lnglodo            ;seek to text
        jr c,lnglodf
        ld hl,(lnglodm-4+8)     ;load text to application
        ld a,(lnglodm-4+7)
        ld e,a
lnglod4 ld bc,0
        push hl
        ld a,(lnglodh)
        scf
        call SyFile_FILCPR
        pop hl
        jr c,lnglodf

        ld e,l:ld d,h               ;** relocate text pointers
lnglod5 ld ix,0                 ;ix=counter
lnglod6 inc hl
        push hl
        ld a,(lnglodm-4+7)
        rst #20:dw jmp_bnkrwd
        ld l,e:ld h,d
        add hl,bc
        ld c,l:ld b,h
        pop hl
        rst #20:dw jmp_bnkwwd
        dec ix
        ld a,ixl:or ixh
        jr nz,lnglod6
        ld b,1
        jp lnglode

lnglodo ld a,(hl):ld ixl,a:inc hl   ;** seek in file
        ld a,(hl):ld ixh,a
        ld iy,0
        ld c,0
        ld a,(lnglodh)
        jp SyFile_FILPOI
lnglodl ld hl,fntcnv                ;** load from file
        ld de,(App_BnkNum)
        push hl
        ld a,(lnglodh)
        call SyFile_FILINP
        pop hl
        ret

;### LNGISA -> copy language/keyboard IDs to Isetta, if existing
lngisa  ld a,(cfghrdtyp)
        and 63
        cp 19
        ret nz
        ld hl,#4f0
        ld a,(cfglngpri)
        out (#f1),a
        ld b,6
        ld de,cfgkeynam
        ld a,(cfgkeyflg)
        or a
        jr z,lngisa2
lngisa1 ld a,(de)
lngisa2 inc hl
        out (#f1),a
        inc de
        djnz lngisa1
        ret


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
cfgdatflg   db 0    ;flags ([bit0]=total dynlen available, [bit1]=enhanced 255 char font [behind dyntot])
cfgdyntot   dw 0    ;length of total dynamic config data (startmenu, icons, widgets); only available, if cfgdatflg[0]=1
cfglngpri   db 0    ;language ID primary
cfglngsec   db 0    ;language ID secondary (fallback if primary not available; e.g. app is in japanese, LNG has no german, but english)

cfgkeyflg   db 0    ;+1=keymap active, +2=keymaps switchable (always set, if cfgkeylyc>1)
cfgkeysiz   dw 0    ;total size of additional keyboard data [behind dyntot + 255char font]
cfgkeylyc   db 0    ;total number of keyboard layouts (1-x; 40 each)
cfgkeympc   db 0    ;total number of keyboard maps (200 each)
cfgkeytrc   db 0    ;total number of keyboard trees (length table at the beginning of tree data)
cfgkeyfnt   db 0    ;required writing style (="codepage"/font)
cfgkeylng   db 0    ;prefered language (JPN)
cfgkeyres   ds 13   ;*res*
cfgkeynam   ds 24   ;name (3chars language identifier, 5chars subspec, 16chars full name)

            ds 256-$+cfgdatbeg-2

inficnadr   dw smibeg       ;len=2, adjust above

cfgdynbeg   ;start of dynamic config data (startmenu, icons, widgets)

stmdatbeg
dw stmdatend-stmdatbeg

;entry type -> 0=line, 1=link (+text, +link, +workdirectory, +opentype), 2=special link (+text, +2B code; 0=inactive), 3=submenu (+1B index, +text)

stamen0     dw stamen0z-stamen0-1,0                                         ;length of whole block data, temp pointer to menu data record
stamen01    db stamen02-stamen01,3,5, 6,128,-1:dw smifavgfx+1:db " Favourites",0
stamen02    db stamen03-stamen02,0
stamen03    db stamen04-stamen03,3,2, 6,128,-1:dw smiprggfx+1:db " Programs",0
stamen04    db stamen05-stamen04,3,3, 6,128,-1:dw smidocgfx+1:db " Documents",0
stamen05    db stamen06-stamen05,3,1, 6,128,-1:dw smicfggfx+1:db " Settings",0
stamen06    db stamen07-stamen06,2,   6,128,-1:dw smihlpgfx+1:db " Help",0,          MSC_SYS_SYSHLP,0
stamen07    db stamen08-stamen07,2,   6,128,-1:dw smirungfx+1:db " Run...",0,        MSC_SYS_PRGSTA,0
stamen08    db stamen09-stamen08,0
stamen09    db stamen0a-stamen09,2,   6,128,-1:dw smisecgfx+1:db " Security...",0,   MSC_SYS_SYSSEC,0
stamen0a    db stamen0z-stamen0a,2,   6,128,-1:dw smioffgfx+1:db " Shut down...",0,  MSC_SYS_SYSQIT,0
stamen0z    db 0                                                            ;end marker

stamen1     dw stamen1z-stamen1-1,0     ;settings
stamen11    db stamen12-stamen11,1,   6,128,-1:dw smicfggfx+1:db " Control panel",0, "%cp.exe",0,0,0
stamen12    db stamen13-stamen12,0
stamen13    db stamen14-stamen13,1,   6,128,-1:dw smidspgfx+1:db " Display",0,       "%cpdisply.exe",0,0,0
stamen14    db stamen15-stamen14,1,   6,128,-1:dw smitimgfx+1:db " Date and Time",0, "%cptime.exe",0,0,0
stamen15    db stamen16-stamen15,1,   6,128,-1:dw smimengfx+1:db " Startmenu",0,     "%cpstartm.exe",0,0,0
stamen16    db stamen17-stamen16,0
stamen17    db stamen18-stamen17,2,   6,128,-1:dw smilodgfx+1:db " Load",0,          MSC_SYS_SYSCFG,0
stamen18    db stamen1z-stamen18,2,   6,128,-1:dw smisavgfx+1:db " Save",0,          MSC_SYS_SYSCFG,1
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

;==============================================================================
;%%% MULTI LANGUAGE TEXTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;==============================================================================

texts_int
read"App-OSExtend-i18n.asm"
texts_int_end

list
texts_int_len   equ texts_int_end-texts_int
nolist

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

prgtxtbrw   db "...",0
stmsetlnk2  db "%cpdisply.exe",0

icndummy
db 6,24,24
db #30,#F0,#F0,#F0,#80,#00,#20,#00,#00,#00,#C0,#00,#20,#00,#00,#00,#A0,#00,#20,#00,#00,#00,#90,#00,#20,#00,#00,#00,#F0,#80,#20,#00,#00,#00,#77,#80,#20,#00,#00,#00,#00,#C4,#20,#F3,#FF,#DF,#6C,#C4
db #20,#F7,#FF,#FF,#EC,#C4,#20,#80,#00,#00,#20,#C4,#20,#91,#11,#11,#20,#C4,#20,#B3,#AB,#AB,#A8,#C4,#20,#A3,#AB,#BB,#A8,#C4,#20,#91,#11,#11,#20,#C4,#20,#80,#00,#00,#20,#C4,#20,#B1,#B2,#B0,#A8,#C4
db #20,#80,#00,#00,#20,#C4,#20,#F0,#F0,#F0,#E0,#C4,#20,#00,#00,#00,#00,#C4,#20,#00,#00,#00,#00,#C4,#20,#00,#00,#00,#00,#C4,#20,#00,#00,#00,#00,#C4,#30,#F0,#F0,#F0,#F0,#C4,#11,#FF,#FF,#FF,#FF,#CC

filmskall   db "*  "
filmskicn   db "icn"
filmskwdg   db "wdg"

filselbuf   ds 4+256

icninic     db 0        ;tempbuf for icontext colours

cfghrdflg   db 0    ;Hardware -> [b0]=Proportional Mouse, [b1]=Real-Time Clock, [b2]=Mass Storage Device, [b3]=GFX9000, [b4]=longfilename support, [b5]=255 char support
cfgdskvir   db 0    ;Virtual desktop (0=no virtual desktop, Bit[0-3] -> X-resolution, 1=512, 2=1000, Bit[4-7] -> Y-resolution, not yet defined)
cfgicnnum   db 0    ;number of icons
cfgmennum   db 0    ;number of startmenu entries
cfgcapflg   db 0    ;Capabilities -> [bit0]=long filename support, [bit1]=internal full charset system font (1-255), [bit5-6]=Backdrop size (0=320x200x4, 1=512x212x4/16)
cfghrdtyp   db 0    ;bit[0-6] Computer type     0=464, 1=664, 2=6128, 3=464Plus, 4=6128Plus, ...
cfgicnpos   ds 4*8  ;icon positions


;### KEYBOARD SYSTRAY MENU ####################################################

keysti_icn  db 2,8,8:ds 2*8

keymendat   dw 4
keymendat1  dw 17,keymen_txt1, keyswta, 0
            dw 17,keymen_txt2, keyswtb, 0
            dw 17,keymen_txt3, keyswtc, 0
            dw 17,keymen_txt4, keyswtd, 0
            dw 17,keymen_txt5, keyswte, 0

keymen_txt1 db 6,128,-1:dw keymen_icn1+1:db " ":ds 22
keymen_icn1 db 2,8,7:dw $+7,$+4,14:db 0: ds 2*7
keymen_txt2 db 6,128,-1:dw keymen_icn2+1:db " ":ds 22
keymen_icn2 db 2,8,7:dw $+7,$+4,14:db 0: ds 2*7
keymen_txt3 db 6,128,-1:dw keymen_icn3+1:db " ":ds 22
keymen_icn3 db 2,8,7:dw $+7,$+4,14:db 0: ds 2*7
keymen_txt4 db 6,128,-1:dw keymen_icn4+1:db " ":ds 22
keymen_icn4 db 2,8,7:dw $+7,$+4,14:db 0: ds 2*7
keymen_txt5 db 6,128,-1:dw keymen_icn5+1:db " ":ds 22
keymen_icn5 db 2,8,7:dw $+7,$+4,14:db 0: ds 2*7

;### KEYBOARD INFORMATION #####################################################

keyobjinf   dw keygrpinf,172,69,0,0,2
keygrpinf   db 10,0:dw keydatinf,0,0,00*256+00,0,0,00
keydatinf
dw 00,     255*256+0 ,0,           0, 0,1000,1000,0    ;00=Background
dw 00,     255*256+1, keyobjinf1  ,1, 1, 168, 8,0      ;01=Beschreibung Zeile 1
dw 00,     255*256+0 ,1,           0,11,1000, 1,0      ;02=separator
dw 00,     255*256+1, keyobjinf2  ,1,13, 168, 8,0      ;03=Beschreibung Zeile 2 "layouts"
keydatinf1
dw 00,     255*256+1, keyobjinf3  ,9,21, 168, 8,0      ;04=Beschreibung Zeile 3
dw 00,     255*256+1, keyobjinf4  ,9,29, 168, 8,0      ;05=Beschreibung Zeile 4
dw 00,     255*256+1, keyobjinf5  ,9,37, 168, 8,0      ;06=Beschreibung Zeile 5
dw 00,     255*256+1, keyobjinf6  ,9,45, 168, 8,0      ;07=Beschreibung Zeile 6
dw 00,     255*256+1, keyobjinf7  ,9,53, 168, 8,0      ;09=Beschreibung Zeile 7

keyobjinf1  dw keytxtinf1,0+4
keyobjinf2  dw keytxtinf2,0+4
keyobjinf3  dw keytxtinf3,0+4
keyobjinf4  dw keytxtinf4,0+4
keyobjinf5  dw keytxtinf5,0+4
keyobjinf6  dw keytxtinf6,0+4
keyobjinf7  dw keytxtinf7,0+4

keytxtinf1  db "XXXxxxxx - ":ds 16

keytxtinf3  db "[1] ":ds 22
keytxtinf4  db "[2] ":ds 22
keytxtinf5  db "[3] ":ds 22
keytxtinf6  db "[4] ":ds 22
keytxtinf7  db "[5] ":ds 22

;### SYMBOS SECURITY ##########################################################

syswinsec   dw #1001,4+8,80,30,176,121,0,0,176,121,176,121,176,121,0,systitsec,0,0,sysgrpsec,0,0:ds 136+14
sysgrpsec   db 13,0:dw sysdatsec,0,0,13*256+8,0,0,0
sysdatsec
dw      00,255*256+0,2, 0,0,1000,1000,0                  ;   Hintergrund
dw      00,255*256+8, syslogo,     8, 1,160,16,0         ;   Logo
dw      00,255*256+3 ,sysfrmsec ,  0,21,176,44,0         ;   Rahmen
dw      00,255*256+1 ,systxtsec1,  5,69,155, 8,0         ;   Beschreibung 1
dw      00,255*256+1 ,systxtsec2,  5,77,155, 8,0         ;   Beschreibung 2
dw      00,255*256+1 ,systxtsec3, 20,36,144, 8,0         ;   Beschreibung 3
dw      00,255*256+1 ,systxtsec4, 20,44,144, 8,0         ;   Beschreibung 4
dw secwin1,255*256+16,sysbutsec1,  3,90, 55,12,0         ;07="Lock"-Button
dw secwin5,255*256+16,sysbutsec3, 60,90, 55,12,0         ;08="Run"-Button
dw secwin6,255*256+16,sysbutsec5,117,90, 56,12,0         ;09="Shut down"-Button
dw secwin2,255*256+16,sysbutsec4,  3,104,55,12,0         ;10="Password"-Button
dw secwin4,255*256+16,sysbutsec2, 60,104,55,12,0         ;11="Taskmgr"-Button
dw secwin3,255*256+16,sysbutcnc ,117,104,56,12,0         ;12="Cancel"-Button

systxtsec1  dw systxtsec1t,4*1+2
systxtsec2  dw systxtsec2t,4*1+2
systxtsec3  dw systxtsec3t,4*1+2
systxtsec4  dw systxtsec4t,4*1+2
sysfrmsec   dw sysfrmsect,2+4

;### UNLOCK ###################################################################

syswinlok   dw #1001,4+8,80,40,176,93,0,0,176,93,176,93,176,93,0,systitlok,0,0,sysgrplok,0,0:ds 136+14
sysgrplok   db 9,0:dw sysdatlok,0,0,9,0,0,8
sysdatlok
dw      00,255*256+0,2, 0,0,1000,1000,0                  ;   Hintergrund
dw      00,255*256+8, syslogo,     8, 1,160,16,0         ;   Logo
dw      00,255*256+1 ,systxtlok1, 10,21,155, 8,0         ;   Beschreibung 1
dw      00,255*256+1 ,systxtlok2, 10,29,155, 8,0         ;   Beschreibung 2
dw      00,255*256+1 ,systxtlok3, 10,47, 30, 8,0         ;   Beschreibung 3
dw      00,255*256+1 ,systxtlok4, 10,61, 30, 8,0         ;   Beschreibung 4
dw      00,255*256+32,sysinplok1, 76,45,090,12,0         ;   Textinput
dw      00,255*256+32,sysinplok2, 76,59,090,12,0         ;   Textinput
dw lokwin ,255*256+16,sysbutok  ,116,78, 50,12,0         ;08="Ok"-Button
systxtlok1  dw systxtlok1t,4*1+2
systxtlok2  dw systxtlok2t,4*1+2
systxtlok3  dw systxtlok3t,4*1+2
systxtlok4  dw systxtlok4t,4*1+2
sysinplok1  dw sysinplok1b,0,0,0,0,15,0
sysinplok2  dw sysinplok2b,0,0,0,0,15,1

sysinplok1b ds 16
sysinplok2b ds 16

;### PASSWORD #################################################################

syswinpwd   dw #1001,4,80,40,176,93,0,0,176,93,176,93,176,93,0,systitpwd,0,0,sysgrppwd,0,0:ds 136+14
sysgrppwd   db 12,0:dw sysdatpwd,0,0,12*256+11,0,0,7
sysdatpwd
dw      00,255*256+0,2, 0,0,1000,1000,0              ;   Hintergrund
dw      00,255*256+8, syslogo,     8,  1,160,16,0    ;   Logo
dw      00,255*256+1 ,systxtpwd1,  4, 23,155, 8,0    ;   Beschreibung 1
dw      00,255*256+1 ,systxtpwd2,  4, 37,155, 8,0    ;   Beschreibung 2
dw      00,255*256+1 ,systxtpwd3,  4, 51, 30, 8,0    ;   Beschreibung 3
dw      00,255*256+1 ,systxtpwd4,  4, 65, 30, 8,0    ;   Beschreibung 4
dw      00,255*256+32,sysinppwd1, 82, 21,090,12,0    ;   Textinput
dw      00,255*256+32,sysinppwd2, 82, 35,090,12,0    ;   Textinput
dw      00,255*256+32,sysinppwd3, 82, 49,090,12,0    ;   Textinput
dw      00,255*256+32,sysinppwd4, 82, 63,090,12,0    ;   Textinput
dw paswina,255*256+16,sysbutok  , 69, 78, 50,12,0    ;10="Ok"-Button
dw paswinb,255*256+16,sysbutcnc ,122, 78, 50,12,0    ;11="Cancel"-Button
systxtpwd1  dw systxtlok3t,4*1+2
systxtpwd2  dw systxtpwd2t,4*1+2
systxtpwd3  dw systxtpwd3t,4*1+2
systxtpwd4  dw systxtpwd4t,4*1+2
sysinppwd1  dw sysinppwd1b,0,0,0,0,15,0
sysinppwd2  dw sysinppwd2b,0,0,0,0,15,1
sysinppwd3  dw sysinppwd3b,0,0,0,0,15,1
sysinppwd4  dw sysinppwd4b,0,0,0,0,15,1

prgmsgerra dw prgmsgerra1,4*1+2,prgmsgerra2,4*1+2,prgmsgerra3,4*1+2

prgmsgerrb dw prgmsgerrb1,4*1+2,prgmsgerrb2,4*1+2,prgmsgerrb3,4*1+2

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

wdgdelobj   dw wdgdeltxt1,4*1+2, wdgdeltxt2,4*1+2, msgtxt0   ,4*1+2     ;confirm delete
wdgpreobj   dw wdgpretxt1,4*1+2, wdgpretxt2,4*1+2, msgtxt0   ,4*1+2     ;too many dialogues
wdgmemobj   dw dicmemtxt1,4*1+2, wdgmemtxt2,4*1+2, wdgmemtxt3,4*1+2     ;memory full
wdgfleobj   dw dicfletxt1,4*1+2, wdgfletxt2,4*1+2, dicfletxt3,4*1+2     ;file error
wdgldeobj   dw wdgldetxt1,4*1+2, wdgldetxt2,4*1+2, wdgldetxt3,4*1+2     ;loading error


dicprptxtf  db "########### Bytes",0
dicprptxtg  db " Bytes",0

;### WIDGET NEW DIALOGUE ######################################################

wdgnewwin   dw #1401,4+16,074,027,184,107,0,0,184,107,184,107,184,107,0,wdgnewtit,0,0
wdgnewwin0  dw wdgnewgrp1,0,0:ds 136+14

wdgnewgrp1  db 12,0:dw wdgnewdat1,0,0,256*5+4,0,0,11    ;* location
wdgnewdat1
dw      00,         0,2,          0,0,1000,1000,0       ;00=Hintergrund
dw      00,         0,3,          05, 04, 32,80,0       ;01=grafik dummy
dw      00,         0,1,          05, 88,172, 1,0       ;02=Trennlinie
dw wdgnew1,255*256+16,sysbutnxt,  86, 92, 44,12,0       ;03="Next"  -Button
dw wdgnewx,255*256+16,sysbutcnc, 135, 92, 44,12,0       ;04="Cancel"-Button
dw      00,255*256+ 1,wdgnewdsc1, 41, 04,130, 8,0       ;05=Beschreibung 1
dw      00,255*256+ 1,wdgnewdsc2, 41, 12,130, 8,0       ;06=Beschreibung 2
dw      00,255*256+ 1,wdgnewdsc3, 41, 20,130, 8,0       ;07=Beschreibung 3
dw      00,255*256+ 1,wdgnewdsc4, 41, 28,130, 8,0       ;08=Beschreibung 4
dw      00,255*256+ 1,wdgnewdsc5, 41, 44,130, 8,0       ;09=Beschreibung "Command line"
dw      00,255*256+32,wdgnewinp1, 41, 54,138,12,0       ;10=Input "Command line"
dw wdgnewb,255*256+16,sysbutbrw,  41, 68, 50,12,0       ;11=Button "Browse..."

wdgnewgrp2  db 10,0:dw wdgnewdat2,0,0,256*6+5,0,0,8     ;* size
wdgnewdat2
dw      00,         0,2,          0,0,1000,1000,0       ;00=Hintergrund
dw      00,         0,3,          05, 04, 32,80,0       ;01=grafik dummy
dw      00,         0,1,          05, 88,172, 1,0       ;02=Trennlinie
dw wdgnew2,255*256+16,sysbutbck,  41, 92, 44,12,0       ;03="Back"  -Button
dw wdgnew5,255*256+16,sysbutfin,  86, 92, 44,12,0       ;04="Finish"-Button
dw wdgnewx,255*256+16,sysbutcnc, 135, 92, 44,12,0       ;05="Cancel"-Button
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

wdgsizobj   dw 8,0,wdgsizlst,0,1,wdgsizrow,0,1
wdgsizrow   dw 0,81,0,0
wdgsizlst   dw 0,ctxwdgtxta, 1,ctxwdgtxtb, 2,ctxwdgtxtc, 3,ctxwdgtxtd, 4,ctxwdgtxte, 5,ctxwdgtxtf, 6,ctxwdgtxtg, 7,ctxwdgtxth

;### FOLDER MANAGEMENT MESSAGES ###############################################

msgtxt0     db 0

folglaobj   dw folgentxt1,4*1+2, follautxt2,4*1+2, msgtxt0   ,4*1+2     ;generate -> no launcher
folgdiobj   dw folgentxt1,4*1+2, foldistxt2,4*1+2, msgtxt0   ,4*1+2     ;generate -> disc error
folrdiobj   dw folrentxt1,4*1+2, foldistxt2,4*1+2, msgtxt0   ,4*1+2     ;rename   -> disc error

;### ICON MANAGEMENT DIALOGUES ################################################

dicdelobj   dw dicdeltxt1,4*1+2, dicdeltxt2,4*1+2, dicdeltxt3,4*1+2     ;confirm delete
dicdeltxt2  db "'":ds 11+1+11+3
dicdeltxt3  equ msgtxt0

dicpreobj   dw dicpretxt1,4*1+2, dicpretxt2,4*1+2, dicpretxt3,4*1+2     ;too many dialogues
dicpretxt3  equ msgtxt0

dicfleobj   dw dicfletxt1,4*1+2, dicfletxt2,4*1+2, dicfletxt3,4*1+2     ;error while reading icon file
dicfletxt3  equ msgtxt0

dicmemobj   dw dicmemtxt1,4*1+2, dicmemtxt2,4*1+2, dicmemtxt3,4*1+2     ;memory full

dicfctobj   dw dicfcttxt1,4*1+2, dicfcttxt2,4*1+2, dicfcttxt3,4*1+2     ;can't cut folders

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

dicnewwin   dw #1401,4+16,074,027,184,107,0,0,184,107,184,107,184,107,0,dicnewtit,0,0
dicnewwin0  dw dicnewgrp1,0,0:ds 136+14

dicnewgrp1  db 12,0:dw dicnewdat1,0,0,256*5+4,0,0,11    ;* location
dicnewdat1
dw      00,         0,2,          0,0,1000,1000,0       ;00=Hintergrund
dw      00,         0,3,          05, 04, 32,80,0       ;01=grafik dummy
dw      00,         0,1,          05, 88,174, 1,0       ;02=Trennlinie
dw dicnew1,255*256+16,sysbutnxt,  86, 92, 44,12,0       ;03="Next"  -Button
dw dicnewx,255*256+16,sysbutcnc, 135, 92, 44,12,0       ;04="Cancel"-Button
dw      00,255*256+ 1,dicnewdsc1, 41, 04,130, 8,0       ;05=Beschreibung 1
dw      00,255*256+ 1,dicnewdsc2, 41, 12,130, 8,0       ;06=Beschreibung 2
dw      00,255*256+ 1,dicnewdsc3, 41, 20,130, 8,0       ;07=Beschreibung 3
dw      00,255*256+ 1,dicnewdsc4, 41, 28,130, 8,0       ;08=Beschreibung 4
dw      00,255*256+ 1,dicnewdsc5, 41, 44,130, 8,0       ;09=Beschreibung "Command line"
dw      00,255*256+32,dicnewinp1, 41, 54,138,12,0       ;10=Input "Command line"
dw dicnewb,255*256+16,sysbutbrw,  41, 68, 50,12,0       ;11=Button "Browse..."

dicnewgrp2  db 09,0:dw dicnewdat2,0,0,256*6+5,0,0,8     ;* name
dicnewdat2
dw      00,         0,2,          0,0,1000,1000,0       ;00=Hintergrund
dw      00,         0,3,          05, 04, 32,80,0       ;01=grafik dummy
dw      00,         0,1,          05, 88,174, 1,0       ;02=Trennlinie
dw dicnew2,255*256+16,sysbutbck,  41, 92, 44,12,0       ;03="Back"  -Button
dw dicnew3,255*256+16,sysbutnxt,  86, 92, 44,12,0       ;04="Next"  -Button
dw dicnewx,255*256+16,sysbutcnc, 135, 92, 44,12,0       ;05="Cancel"-Button
dw      00,255*256+ 1,dicnewdsc6, 41, 04,130, 8,0       ;06=Beschreibung 6
dw      00,255*256+32,dicnewinp2, 41, 20, 72,12,0       ;07=Input "Command line"
dw      00,255*256+32,dicnewinp3, 41, 34, 72,12,0       ;08=Input "Command line"

dicnewgrp3  db 10,0:dw dicnewdat3,0,0,256*6+5,0,0,8     ;* icon
dicnewdat3
dw      00,         0,2,          0,0,1000,1000,0       ;00=Hintergrund
dw      00,         0,3,          05, 04, 32,80,0       ;01=grafik dummy
dw      00,         0,1,          05, 88,174, 1,0       ;02=Trennlinie
dw dicnew4,255*256+16,sysbutbck,  41, 92, 44,12,0       ;03="Back"  -Button
dw dicnew5,255*256+16,sysbutfin,  86, 92, 44,12,0       ;04="Finish"-Button
dw dicnewx,255*256+16,sysbutcnc, 135, 92, 44,12,0       ;05="Cancel"-Button
dw      00,255*256+ 1,dicnewdsc7, 41, 04,130, 8,0       ;06=Beschreibung 7
dicnewdat3a
dw      00,255*256+ 8,dicnewicn,  41, 20,24, 24,0       ;07=Grafik        Icon
dw dicnewf,255*256+16,dicnewtxt8, 70, 19,82, 12,0       ;08=Button File   Icon
dw dicnewi,255*256+16,dicnewtxt9, 70, 33,82, 12,0       ;09=Button Choose Icon


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

dicnewbuf1  ds 128
dicnewbuf2  ds 12
dicnewbuf3  ds 12

;### ICON PROPERTY DIALOGUE ###################################################

dicprpwin   dw #1401,4+16,075,011,168,142,0,0,168,142,168,142,168,142,0,systxtprp,0,0
dicprpwin0  dw dicprpgrp1,0,0:ds 136+14

dicprpgrp2  db 20,0:dw dicprpdat2,0,0,256*4+3,0,0,3
dicprpdat2
dw      00,         0,2,          0,0,1000,1000,0       ;00=Hintergrund
dw dicprt, 255*256+20,dicprptab,   0,  1,168,11,0       ;01=Tab-Leiste
dw dicpro, 255*256+16,sysbutok,   27,127, 44,12,0       ;02="Ok"    -Button
dw dicprc, 255*256+16,sysbutcnc,  73,127, 44,12,0       ;03="Cancel"-Button
dw dicpry, 255*256+16,sysbutapl, 119,127, 44,12,0       ;04="Apply" -Button
dicprpdat2a
dw      00,255*256+10,dicprpicn,  05, 15, 24,24,0       ;05=Icon "Icon"
dw      00,255*256+32,dicprpinp3, 51, 14, 72,12,0       ;06=Name1 "Icon"
dw      00,255*256+32,dicprpinp4, 51, 28, 72,12,0       ;07=Name2 "Icon"
dw      00,         0,1,          05, 43,158, 1,0       ;08=Trennlinie
dw      00,255*256+ 1,dicprpdscb, 05, 47, 55, 8,0       ;09=Beschreibung "Target"
dw      00,255*256+32,dicprpinp1, 05, 57,158,12,0       ;10=Eingabe "Target"
dw      00,         0,1,          05, 73,158, 1,0       ;11=Trennlinie
dw      00,255*256+ 1,dicprpdscc, 05, 80, 46, 8,0       ;12=Beschreibung "Start in"
dw      00,255*256+32,dicprpinp2, 59, 78, 87,12,0       ;13=Eingabe "Start in"
dw dicpbs, 255*256+16,prgtxtbrw, 148, 78, 15,12,0       ;14="Browse start-in..."  -Button
dw      00,255*256+ 1,dicprpdscd, 05, 93, 46, 8,0       ;15=Beschreibung "Run"
dw      00,255*256+42,dicprprun,  59, 92,104,10,0       ;16=Auswahl "Run"
dw dicpbt, 255*256+16,dicprptxtm, 05,106, 76,12,0       ;17="Browse target..."    -Button
dw dicpbi, 255*256+16,dicprptxtn, 83,106, 80,12,0       ;18="Change icon..."-Button
dw      00,         0,1,          05,122,158, 1,0       ;19=Trennlinie

dicprpgrp1  db 23,0:dw dicprpdat1,0,0,256*4+3,0,0,20
dicprpdat1
dw      00,         0,2,          0,0,1000,1000,0       ;00=Hintergrund
dw dicprt, 255*256+20,dicprptab,   0,  1,168,11,0       ;01=Tab-Leiste
dw dicpro, 255*256+16,sysbutok,   27,127, 44,12,0       ;02="Ok"    -Button
dw dicprc, 255*256+16,sysbutcnc,  73,127, 44,12,0       ;03="Cancel"-Button
dw dicpry, 255*256+16,sysbutapl, 119,127, 44,12,0       ;04="Apply" -Button
dicprpdat1a
dw      00,255*256+10,dicprpicn,  05, 15, 24,24,0       ;05=Icon "Icon"
dw      00,255*256+ 1,dicprpdsc9, 59, 18,150, 8,0       ;06=Name1 "Icon"
dw      00,255*256+ 1,dicprpdsca, 59, 28,150, 8,0       ;07=Name2 "Icon"
dw      00,         0,1,          05, 43,158, 1,0       ;08=Trennlinie
dw      00,255*256+ 1,dicprpdsc1, 05, 47, 55, 8,0       ;09=Beschreibung "File type"
dw      00,255*256+ 1,dicprpcon1, 59, 47,104, 8,0       ;10=Angabe "File type"
dw      00,255*256+ 1,dicprpdsc2, 05, 57, 55, 8,0       ;11=Beschreibung "Open with"
dw      00,255*256+ 1,dicprpdsc8, 59, 57,104, 8,0       ;12=Beschreibung "not defined"
dw      00,255*256+ 1,dicprpdsc3, 05, 67, 55, 8,0       ;13=Beschreibung "Location"
dw      00,255*256+ 1,dicprpcon3, 59, 67,104, 8,0       ;14=Angabe "Location"
dw      00,255*256+ 1,dicprpdsc4, 05, 77, 55, 8,0       ;15=Beschreibung "Size"
dw      00,255*256+ 1,dicprpcon4, 59, 77,104, 8,0       ;16=Angabe "Size"
dw      00,         0,1,          05, 88,158, 1,0       ;17=Trennlinie
dw      00,255*256+ 1,dicprpdsc0, 05, 92, 55, 8,0       ;18=Beschreibung "Name"
dw      00,255*256+ 1,dicprpcon2, 59, 92,104, 8,0       ;19=Angabe "Name"
dw      00,255*256+ 1,dicprpdsc5, 05,102, 55, 8,0       ;20=Beschreibung "Modified"
dw      00,255*256+ 1,dicprpcon5, 59,102,104, 8,0       ;21=Angabe "Modified"
dw      00,         0,1,          05,113,158, 1,0       ;22=Trennlinie

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
dicprplst   dw 0,dicprptxtq, 0,dicprptxtr, 0,dicprptxtt, 0,dicprptxts

dicprptxt8  ds 33

dicprpdtm1  db "01.01.2000, 00:00:00",0

dicprptxti  ds 256

dicprptxtu  ds 13

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
dw 1,systxtprp,wdgprp,0            ;properties

ctxwdgsiz   dw 8
dw 1,ctxwdgtxta,wdgrsz0,0
dw 1,ctxwdgtxtb,wdgrsz1,0
dw 1,ctxwdgtxtc,wdgrsz2,0
dw 1,ctxwdgtxtd,wdgrsz3,0
dw 1,ctxwdgtxte,wdgrsz4,0
dw 1,ctxwdgtxtf,wdgrsz5,0
dw 1,ctxwdgtxtg,wdgrsz6,0
dw 1,ctxwdgtxth,wdgrsz7,0

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
dw 1,systxtprp,dicprp,0             ;properties

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
dw 1,systxtprp,dskprp,0             ;properties

ctxdskarr  dw 7                     ;arrange icons ->
dw 1,ctxdsktxt8,dicarra,0           ;8 x 8 grid
dw 1,ctxdsktxt9,dicarrb,0           ;13 x 11 grid
dw 1,ctxdsktxta,dicarrc,0           ;26 x 22 grid
dw 1,ctxdsktxtb,dicarrd,0           ;48 x 40 grid
dw 1,ctxdsktxtc,dicarre,0           ;52 x 44 grid
dw 9,0,0,0
ctxdskarr0
dw 1,ctxdsktxtd,dicarr,0            ;auto arrange

ctxdsknew  dw 4                     ;new ->
dw 1,ctxdsktxtf,folnew,0            ;folder
dw 1,ctxdsktxt7,dicnew,0            ;shortcut
dw 9,0,0,0
dw 1,ctxdsktxte,wdgnew,0            ;widget

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

;### STARTMENU ICONS ##########################################################

smibeg          ;*** don't change order for INI compatibility (see CFGSMIH!)
smifavgfx   db 4,8,7:dw $+7,$+4,28:db 5: db #6d,#dd,#66,#66, #d0,#00,#dd,#d6, #d0,#0f,#f0,#01, #d0,#ff,#ff,#01, #d0,#0f,#f0,#01, #d0,#00,#00,#01, #61,#11,#11,#16
smifldgfx   db 4,8,7:dw $+7,$+4,28:db 5: db #6d,#dd,#66,#66, #d0,#00,#dd,#d6, #d0,#00,#00,#01, #d0,#00,#00,#01, #d0,#00,#00,#01, #d0,#00,#00,#01, #61,#11,#11,#16
smiappgfx   db 4,8,7:dw $+7,$+4,28:db 5: db #61,#11,#11,#16, #17,#77,#74,#71, #12,#22,#22,#21, #12,#ff,#2f,#21, #12,#22,#2f,#21, #12,#22,#22,#21, #61,#11,#11,#16

smiprggfx   db 4,8,7:dw $+7,$+4,28:db 5: db #61,#11,#11,#16, #17,#77,#76,#71, #18,#88,#88,#81, #18,#f8,#a8,#81, #18,#d8,#d8,#81, #18,#88,#88,#81, #61,#11,#11,#16
smidocgfx   db 4,8,7:dw $+7,$+4,28:db 5: db #66,#68,#66,#66, #66,#87,#86,#66, #68,#78,#88,#66, #dd,#dd,#dd,#16, #d0,#00,#00,#16, #6d,#00,#00,#01, #61,#11,#11,#11
smicfggfx   db 4,8,7:dw $+7,$+4,28:db 5: db #66,#6c,#66,#66, #6c,#6c,#6c,#66, #6f,#cd,#cf,#66, #cc,#c1,#cc,#c6, #ff,#cc,#cf,#f6, #6c,#fc,#fc,#66, #6f,#6c,#6f,#66
smihlpgfx   db 4,8,7:dw $+7,$+4,28:db 5: db #66,#1f,#f1,#66, #61,#fc,#cf,#16, #1f,#ff,#fc,#f1, #ff,#fc,#cc,#f1, #ff,#ff,#ff,#18, #1f,#cf,#f1,#81, #61,#ff,#18,#16
smirungfx   db 4,8,7:dw $+7,$+4,28:db 5: db #13,#33,#16,#66, #14,#44,#17,#77, #61,#21,#88,#87, #66,#16,#a8,#f7, #61,#41,#88,#87, #12,#22,#17,#77, #13,#33,#16,#66
smisecgfx   db 4,8,7:dw $+7,$+4,28:db 5: db #66,#66,#63,#f6, #67,#76,#1f,#36, #7c,#c1,#66,#66, #c1,#1c,#77,#77, #c1,#1c,#cc,#cc, #7c,#c7,#7c,#7c, #67,#76,#67,#67
smioffgfx   db 4,8,7:dw $+7,$+4,28:db 5: db #67,#77,#77,#76, #77,#11,#11,#77, #71,#81,#81,#17, #71,#18,#11,#17, #71,#11,#81,#17, #77,#11,#11,#77, #67,#77,#77,#76

;control panel
smidspgfx   db 4,8,7:dw $+7,$+4,28:db 5: db #67,#77,#77,#76, #77,#11,#11,#77, #71,#18,#81,#17, #71,#81,#11,#17, #71,#11,#11,#17, #77,#11,#11,#77, #67,#77,#77,#76
smitimgfx   db 4,8,7:dw $+7,$+4,28:db 5: db #66,#77,#77,#66, #67,#8a,#18,#76, #78,#88,#18,#87, #7a,#81,#88,#a7, #78,#18,#88,#87, #67,#88,#a8,#76, #66,#77,#77,#66
smimengfx   db 4,8,7:dw $+7,$+4,28:db 5: db #61,#66,#66,#66, #f1,#17,#ff,#7f, #71,#81,#77,#77, #f1,#88,#17,#ff, #71,#88,#81,#77, #f1,#81,#1f,#7f, #61,#16,#11,#66
smilodgfx   db 4,8,7:dw $+7,$+4,28:db 5: db #61,#16,#66,#66, #10,#01,#16,#66, #10,#00,#77,#77, #10,#07,#22,#27, #10,#72,#22,#76, #17,#22,#27,#66, #77,#77,#76,#66
smisavgfx   db 4,8,7:dw $+7,$+4,28:db 5: db #11,#11,#11,#11, #1f,#ee,#ee,#f1, #1f,#ee,#ee,#f1, #1f,#ff,#ff,#f1, #1f,#11,#c1,#f1, #1f,#11,#c1,#f1, #61,#11,#11,#11

;### STARTMENU ITEMS ##########################################################

stmrec  ds stmrecmax
