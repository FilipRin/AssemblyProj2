# AssemblyProj2
Sum of two arrays C[i]=A[i]+B[i] through procedure (subroutine): saberi()  
----------------------------------------------------------------------
ENG
- Write a program that simultaneously loads two strings A(i) (i=0..4) and B(j)(j=0..4) from peripherals KP1.1 and KP1.2.
Array A(i) is loaded with KP1.1 by checking the ready bit and places it in memory starting at address 100h.
Array B(i) is loaded from KP1.2 using the interrupt mechanism and placed into memory starting at address 200h.
Place the interrupt routine KP1.2 in the memory starting from address 2000h. After receiving strings it is necessary
call the add/saberi procedure that should be written and placed in memory from address 3000h. This procedure
should calculate the sequence C(k)(k=0..4) which is placed in memory starting from address 300h, where C(k)=A(k)+B(k).
After calling the add/saberi procedure, it is necessary to send the sequence C(k) to the peripheral KP2 by checking the ready bit.
- At the beginning of the main program, it is necessary to initialize the IV table so that input 2 contains the address
2000h and that input corresponds to the KP1.2 peripheral. Place the IV table in the memory starting from address 0h. The main one
the program starts at address 1000h.

SRB
- Napisati program koji uporedo sa periferija KP1.1 i KP1.2 učitava dva niza A(i) (i=0..4) i B(j)(j=0..4).
Niz A(i) učitava se sa KP1.1 ispitivanjem bita spremnost i smešta u memoriju počev od adrese 100h.
Niz B(i) učitava se sa KP1.2 korišćenjem mehanizma prekida i smešta u memoriju počev od adrese 200h.
Prekidnu rutinu KP1.2 smestiti u memoriju počev od adrese 2000h. Nakon prijema nizova potrebno je
pozvati proceduru saberi koju treba napisati i smestiti u memoriju od adrese 3000h. Ova procedura
treba da izračuna niz C(k)(k=0..4) koji se smešta u memoriju počev od adrese 300h, gde je C(k)=A(k)+B(k).
Nakon poziva procedure saberi potrebno je niz C(k) poslati periferiji KP2 ispitivanjem bita
spremnosti.
- Potrebno je na početku glavnog programa inicijalizovati IV tabelu tako da se u ulazu 2 nalazi adresa
2000h i taj ulaz odgovara periferiji KP1.2. IV tabelu smestiti u memoriju počev od adrese 0h. Glavni
program počinje od adrese 1000h.
