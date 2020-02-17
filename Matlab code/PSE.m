function G = PSE(rzad,T,operator)
%Funkcja po podaniu wszystkich parametr�w zwraca transmitancj� dyskretn�
%operatora S^+-alpha przy wykorzystaniu metody PSE. Zalecan� rz�dem
%aproksymacji jest 100 albo wi�cej pr�bek w celu uzyskania niezb�dnej
%dok�adno�ci aproksymacji. 
if nargin ==3 
liczbaProbek = [1:rzad];
OkresProbkowaniaPotega = T^operator;

if operator>0
    znak = 1;
end
if operator<0
    znak = -1;
end
   zmiennaPomocnicza=cumprod([1,1-((znak*operator+1)./liczbaProbek)]); 
   if operator>0
   G=filt(zmiennaPomocnicza,[T^operator],T);
end
if operator<0

   G=filt([T^-operator],zmiennaPomocnicza,T);
end
else
    error('Zla liczba argumentow');
end
end

