function G = CFEPID(Kp,Ki,Kd,lambda,mu,T,metodaDyskretyzacji)
%Funkcja wykorzystuje funkcjê CFE w celu aproksymacji operatorów ca³kowania
%oraz ró¿niczkowania u³amkowego rzêdu. Funkcja ta umo¿liwia stworzenie
%regulatora P, PI^lambda, PD^mu b¹dŸ PI^lambdaD^mu. Dzia³a analogicznie do
%funkci PSEPID. Metoda dyskretyzaji okreœlona jest przez liczbê:
%0 dla metody Eulera
%1 dla metody Tustina
% 1/7 dla metody Al-Aloua
%Natomiast T jest okresem próbkowania.
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

