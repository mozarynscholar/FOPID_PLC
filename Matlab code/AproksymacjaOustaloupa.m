function G=AproksymacjaOustaloupa(Wyznacznik,Rzad,DolnaCzestotliwosc,GornaCzestotliwosc)
% Funkcja ta umo¿liwia wyznaczenie aproksymacji Oustaloup'a operatora s^alpha w zadanym
% zakresie czêstotliwoœci, o zadanym rzêdzie aproksymacji. Paratemtry
% wejœciowe opisane s¹ du¿¹ liter¹. Parametry wyznaczone w czasie dzia³ania
% funkcji opisywane s¹ z ma³ej litery. Mo¿liwe jest wykonanie poprawnej
% aproksymacji tylko wtedy, gdy iloœæ parametrów wejœciowych jest równa 4.
% W innym przypadku uk³ad zwraca b³¹d. Nale¿y pamiêtaæ, ¿e aproksymacja
% jest dok³adna tylko dla Rzêdu mieszcz¹cego siê w przedziale (0,1).
    
   
    if nargin == 4
	wyznacznik_czestotliwosci=(GornaCzestotliwosc/DolnaCzestotliwosc)^(0.5);
	wskaznik=1:Rzad;
    w_iprim=DolnaCzestotliwosc*(wyznacznik_czestotliwosci).^((2*wskaznik-1-Wyznacznik)/(Rzad));
    w_i=DolnaCzestotliwosc*(wyznacznik_czestotliwosci).^((2*wskaznik-1+Wyznacznik)/(Rzad));
	wzmocnenie=GornaCzestotliwosc^Wyznacznik;
	G=zpk(-w_iprim',-w_i',wzmocnenie);
    G=tf(G);
    else 
        error('Z³a liczba parametrów')
    end
end
