function G=AproksymacjaOustaloupa(Wyznacznik,Rzad,DolnaCzestotliwosc,GornaCzestotliwosc)
% Funkcja ta umo�liwia wyznaczenie aproksymacji Oustaloup'a operatora s^alpha w zadanym
% zakresie cz�stotliwo�ci, o zadanym rz�dzie aproksymacji. Paratemtry
% wej�ciowe opisane s� du�� liter�. Parametry wyznaczone w czasie dzia�ania
% funkcji opisywane s� z ma�ej litery. Mo�liwe jest wykonanie poprawnej
% aproksymacji tylko wtedy, gdy ilo�� parametr�w wej�ciowych jest r�wna 4.
% W innym przypadku uk�ad zwraca b��d. Nale�y pami�ta�, �e aproksymacja
% jest dok�adna tylko dla Rz�du mieszcz�cego si� w przedziale (0,1).
    
   
    if nargin == 4
	wyznacznik_czestotliwosci=(GornaCzestotliwosc/DolnaCzestotliwosc)^(0.5);
	wskaznik=1:Rzad;
    w_iprim=DolnaCzestotliwosc*(wyznacznik_czestotliwosci).^((2*wskaznik-1-Wyznacznik)/(Rzad));
    w_i=DolnaCzestotliwosc*(wyznacznik_czestotliwosci).^((2*wskaznik-1+Wyznacznik)/(Rzad));
	wzmocnenie=GornaCzestotliwosc^Wyznacznik;
	G=zpk(-w_iprim',-w_i',wzmocnenie);
    G=tf(G);
    else 
        error('Z�a liczba parametr�w')
    end
end
