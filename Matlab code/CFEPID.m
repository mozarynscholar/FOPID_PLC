function G = CFEPID(Kp,Ki,Kd,lambda,mu,T,metodaDyskretyzacji)
%Funkcja wykorzystuje funkcj� CFE w celu aproksymacji operator�w ca�kowania
%oraz r�niczkowania u�amkowego rz�du. Funkcja ta umo�liwia stworzenie
%regulatora P, PI^lambda, PD^mu b�d� PI^lambdaD^mu. Dzia�a analogicznie do
%funkci PSEPID. Metoda dyskretyzaji okre�lona jest przez liczb�:
%0 dla metody Eulera
%1 dla metody Tustina
% 1/7 dla metody Al-Aloua
%Natomiast T jest okresem pr�bkowania.
if nargin<7
    error('Zla liczba argumentow')
end
if Ki == 0 && Kd ==0
    G = tf(Kp);
elseif Ki == 0
    G = Kp+Kd*CFE(T,mu,metodaDyskretyzacji);
elseif Kd == 0
    G = Kp + Ki*CFE(T,lambda,metodaDyskretyzacji);
else 
G = Kp + Ki*CFE(T,lambda,metodaDyskretyzacji) + Kd*CFE(T,mu,metodaDyskretyzacji);
end
end

