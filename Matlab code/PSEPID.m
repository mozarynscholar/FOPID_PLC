function G = PSEPID(Kp,Ki,Kd,lambda,mu,rzad, T)
%Funkcja wykorzystuje funkcjê PSE w celu aproksymacji operatorów ca³kowania
%oraz ró¿niczkowania u³amkowego rzêdu. Funkcja ta umo¿liwia stworzenie
%regulatora P, PI^lambda, PD^mu b¹dŸ PI^lambdaD^mu. Dzia³a analogicznie do
%funkci CFEPID. Rz¹d jest parametrem mówi¹cym o iloœci poprzednich próbek
%wykorzystywanych do aproksymacji.T z kolei jest okresem próbkowania. 
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

