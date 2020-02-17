function G = RegulatorPIDzAproksymacjaOustoulopa(DolnaCzestotliwosc,GornaCzestotliwosc,Rzad,Kp,Ki,lamda,Kd,mu)
%Funkcja tworzy transmitancje regulatora P,Pi lub PID w zale¿noœci od
%iloœci podanych parametrów wejœciowych. W przypadku podania 4 bêdzie to
%regulator P, 6 regulator PI, 8 regulator PID. W ka¿dym innym przypadku
%funkcja bêdzie zwraca³a b³¹d liczby argumentów. Funkcja wykorzystuje
%funkcjê AproksymacjaOustaloupTransmitancji do aproksymowania rzêdów akcji
%ca³kuj¹cej i ró¿niczkuj¹cej.


switch nargin
    case 4
        
        G = tf(Kp);
    case 6
        G = Kp+Ki*(AproksymacjaOustaloupTransmitancji(1,0,1,-lamda,DolnaCzestotliwosc,GornaCzestotliwosc,Rzad));
    case 8
        G = Kp+Ki*(AproksymacjaOustaloupTransmitancji(1,0,1,-lamda,DolnaCzestotliwosc,GornaCzestotliwosc,Rzad))+...
            Kd*(AproksymacjaOustaloupTransmitancji(1,mu,1,0,DolnaCzestotliwosc,GornaCzestotliwosc,Rzad));
    otherwise
        error('Z³a liczba argumentów wprowadzona do regulatora');
end

end

