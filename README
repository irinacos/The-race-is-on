Tema 2 - The race is on (Assembly)

TASK 1

Am facut un loop prin care se parcurge sirul, litera cu litera, 
si se adauga pasul. In cazul in care caracterul obtinut 
depaseste 90 (litera 'Z'), se scade 26. Fiecare litera se 
copiaza in enc_string.

TASK 2

sort_procs:

Algoritmul continua cat timp se produce o interschimbare.
Se compara fiecare element cu urmatorul, prima data dupa,
prioritate, apoi dupa timp, apoi dupa pid. In caz ca ordinea
nu este cea dorita, se interschimba campurile structurii.

run_procs:

In vectorul global prio_result am retinut numarul de procese cu 
prioritatea corespunzatoare indexului, iar in time_result suma
cuatelor de timp. Se face media si se completeaza rezultatele 
impartirii in vector. In cazul in care divizorul este 0, 
campurile structurii se completeaza cu 0.

TASK 3

rotate_x_positions:

In cazul in care x este 0, nu se produce nicio schimbare.
Altfel, se gaseste adresa rotorului care trebuie shiftat. Se
verifica daca forward este 0 sau 1 si se itereaza printre 
caractere, mutandu-se cu pozitie, si se salveaza primul / 
ultimul caracter pentru a se pune pe ultima / prima pozitie.
Procesul se repeta de x ori, dupa care se trece pe urmatorul
rand al rotorului si se face acelasi lucru.

enigma:

Se shifteaza rotorii cum este descris in cerinta, verificandu-se
si ca keys[i] sa nu depaseasca litera 'Z'.
Pe parcursul cautarii in plugboard a literei curente, se 
incrementeaza si pozitia in al treilea rotor, linia 2, pentru a
avea la final direct litera corespunzatoare. Acest lucru se 
repeta in toate cautarile in siruri, urmandu-se modelul din 
poza prezentata in cerinta. Acest proces se repeta pentru toate
literele din plain, rezultatele fiind copiate in enc. 

TASK 4

Am aflat adresa pozitiei curente a damei. Daca linia pe care se
afla este 0, se trece la urmatoarea linie. Pentru fiecare dintre 
linii, se verifica daca coloana este intre 1 si 6, si se completeaza cu 1.

TASK BONUS

Cum linia anterioara celei pe care este dama initial este 
identica cu linia posterioara (in cazul in care x este intre 1 
si 6), am inceput prim fomarea acesteia, shiftand numarul 1 la 
stanga. Am impartit programul pe cazuzi, pentru fiecare posibila
valoarea a lui x, si am format numarul care este copiat in board,
shiftand in continuare bitii, dupa caz, si lipind numerele (care
corespund fiecare unei linii) rezultate cu or.

