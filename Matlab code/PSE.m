function G = PSE(rzad,T,operator)
%Funkcja po podaniu wszystkich parametrów zwraca transmitancjê dyskretn¹
%operatora S^+-alpha przy wykorzystaniu metody PSE. Zalecan¹ rzêdem
%aproksymacji jest 100 albo wiêcej próbek w celu uzyskania niezbêdnej
%dok³adnoœci aproksymacji. 
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

