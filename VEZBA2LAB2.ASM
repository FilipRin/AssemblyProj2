! inicijalizacija simulacije
onkp false, x.1, x.1
onkp false, x.1, x.1
onkp true, x.1, x.1
kpreg 1.1, r0, x.1
kpreg 1.1, r1, x.2
kpreg 1.1, r2, x.3
kpreg 1.1, r3, x.4
kpreg 1.1, r4, x.5
kpreg 1.2, r0, x.6
kpreg 1.2, r1, x.7
kpreg 1.2, r2, x.8
kpreg 1.2, r3, x.9
kpreg 1.2, r4, x.a
reg pc, x.1000
reg sp, x.500
! kraj inicijalizacije

!gl prog
org x.1000
!postavlja iv tabele
clr r0
mvrir r0,ivtp
ldimm x.2000,r0
stmem x.2,r0 	!ulaz 2 iv tabele

!start kp1.1 i kp1.2
ldimm x.5,r2 ! r2 brojac
ldimm x.100,r0 !pokazivac gde treba smestiti niz A
ldimm x.5,r1
stmem x.f100,r1 !kp1.1 upaljen

ldimm x.2,r3
stmem x.f142,r3 !postavljanje ulaza 2 u entry reg kp1.2
ldimm x.200,r4 !pok gde smestiti niz B
ldimm x.6,r5 !broj + 1
ldimm x.f,r1
clr ra		!semafor
stmem x.f140,r1 !kp1.2 upaljen

!ispitivanje bita spremnosti
ldimm x.1,r3 	!maska
loop: ldmem x.f101, rc !citanje statusnog reg
	and rc,rc,r3
	beql loop
	
	ldmem x.f103,r7 !podatak niza A
	stri [r0],r7 	!store na addr
	inc r0
	dec r2
	bneq loop
!gotovo ucitavanje
clr r0
stmem x.f100,r0

!cekanje semafora
ldimm x.1,r3
wait: and ra,ra,r3 !test semafora
	beql wait

!skok na proc
jsr saberi

!pokretanje kp2
ldimm x.4,r3
stmem x.f200,r3 !za kontrolni reg kp2
ldimm x.300,r0 !ptr gde ispisati
ldimm x.5,r1	!brojac elemenata

!ispis
ldimm x.1,r3 !maska za prov
loop2: ldmem x.f201,r2
	and r2,r2,r3
	beql loop2
	
	
	ldrid [r0]x.0,r7
	stmem x.f203,r7
	inc r0
	dec r1
	bneq loop2
!gasim kp2
clr r0
stmem x.f200,r0

halt

!procedura saberi
saberi:
push r0 		! cuvanje registara koji se menjaju
push r1
push r2
push r3
push r5
push r6
push r7

ldimm x.100,r0
ldimm x.200,r1
ldimm x.300,r2
ldimm x.5,r3

loop3: ldrid [r0]x.0,r5
	ldrid [r1]x.0,r6
	add r7,r5,r6
	stri [r2],r7
	inc r0
	inc r1
	inc r2
	dec r3
	bneq loop3
!povratak iz pp
pop r7
pop r6
pop r5
pop r3
pop r2
pop r1
pop r0
rts

!prek rutina kp1.2
org x.2000
dec r5
bneq prebaci
stmem x.f140,r5
ldimm x.1,ra
jmp back
prebaci: ldmem x.f143,rb
	stri [r4],rb
	inc r4
back:rti
