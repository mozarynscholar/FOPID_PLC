function G = RegulatorPIDzAproksymacjaOustoulopa(DolnaCzestotliwosc,GornaCzestotliwosc,Rzad,Kp,Ki,lamda,Kd,mu)
%Funkcja tworzy transmitancje regulatora P,Pi lub PID w zale�no�ci od
%ilo�ci podanych parametr�w wej�ciowych. W przypadku podania 4 b�dzie to
%regulator P, 6 regulator PI, 8 regulator PID. W ka�dym innym przypadku
%funkcja b�dzie zwraca�a b��d liczby argument�w. Funkcja wykorzystuje
%funkcj� AproksymacjaOustaloupTransmitancji do aproksymowania rz�d�w akcji
%ca�kuj�cej i r�niczkuj�cej.


switch nargin
    case 4
        
        G = tf(Kp);
    case 6
        G = Kp+Ki*(AproksymacjaOustaloupTransmitancji(1,0,1,-lamda,DolnaCzestotliwosc,GornaCzestotliwosc,Rzad));
    case 8
        G = Kp+Ki*(AproksymacjaOustaloupTransmitancji(1,0,1,-lamda,DolnaCzestotliwosc,GornaCzestotliwosc,Rzad))+...
            Kd*(AproksymacjaOustaloupTransmitancji(1,mu,1,0,DolnaCzestotliwosc,GornaCzestotliwosc,Rzad));
    otherwise
        error('Z�a liczba argument�w wprowadzona do regulatora');
end

end

