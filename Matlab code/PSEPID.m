function G = PSEPID(Kp,Ki,Kd,lambda,mu,rzad, T)
%Funkcja wykorzystuje funkcj� PSE w celu aproksymacji operator�w ca�kowania
%oraz r�niczkowania u�amkowego rz�du. Funkcja ta umo�liwia stworzenie
%regulatora P, PI^lambda, PD^mu b�d� PI^lambdaD^mu. Dzia�a analogicznie do
%funkci CFEPID. Rz�d jest parametrem m�wi�cym o ilo�ci poprzednich pr�bek
%wykorzystywanych do aproksymacji.T z kolei jest okresem pr�bkowania. 
if nargin<7
    error('Zla liczba argumentow')
end
if Ki == 0 && Kd ==0
    G = tf(Kp);
elseif Ki == 0
    G = Kp+Kd*PSE(rzad,T,mu);
elseif Kd == 0
    G = Kp + Ki*PSE(rzad,T,lambda);
else 
G = Kp + Ki*PSE(rzad,T,lambda) + Kd*PSE(rzad,T,mu);
end
end

