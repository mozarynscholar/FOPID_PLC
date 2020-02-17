function G = CFE(T,alpha,metodaDyskretyzacji)
%Funkcja ta umo¿liwia aproksymacje zadanego operatora do postaci dyskretnej
%z u¿yciem metody CFE. Do dzia³ania niezbêdne s¹ 3 parametry wejœciowe
%opisuj¹ce czas próbkowania, rz¹d operatora oraz liczbê okreœlaj¹c¹ metodê
%dyskretyzacji. Operator jest przybli¿any wielomianami stopnia 3. Funkcja
%zwraca transmitancjê w przestrzeni Z w postaci 
%        b0+b1*z^-1+b2*z^-2+b3*z^-3
%G(Z) = ---------------------------
%        a0+a1*z^-1+a2*z^-2+a3*z^-3     
if nargin == 3
k = ((1+metodaDyskretyzacji)/T)^alpha;
    b0=120/(metodaDyskretyzacji^3*alpha^3+6*metodaDyskretyzacji^3*alpha^2+3*metodaDyskretyzacji^2*alpha^3+11*metodaDyskretyzacji^3*alpha+6*metodaDyskretyzacji^2*alpha^2+3*metodaDyskretyzacji*alpha^3+6*metodaDyskretyzacji^3-27*metodaDyskretyzacji^2*alpha-6*metodaDyskretyzacji*alpha^2+alpha^3-54*metodaDyskretyzacji^2-27*metodaDyskretyzacji*alpha-6*alpha^2+54*metodaDyskretyzacji+11*alpha-6);
    b1=-(60*alpha+180-180*metodaDyskretyzacji+60*metodaDyskretyzacji*alpha)/(metodaDyskretyzacji^3*alpha^3+6*metodaDyskretyzacji^3*alpha^2+3*metodaDyskretyzacji^2*alpha^3+11*metodaDyskretyzacji^3*alpha+6*metodaDyskretyzacji^2*alpha^2+3*metodaDyskretyzacji*alpha^3+6*metodaDyskretyzacji^3-27*metodaDyskretyzacji^2*alpha-6*metodaDyskretyzacji*alpha^2+alpha^3-54*metodaDyskretyzacji^2-27*metodaDyskretyzacji*alpha-6*alpha^2+54*metodaDyskretyzacji+11*alpha-6);
    b2=-(-72-72*metodaDyskretyzacji^2-24*metodaDyskretyzacji*alpha^2+216*metodaDyskretyzacji-60*alpha-12*alpha^2-12*metodaDyskretyzacji^2*alpha^2+60*metodaDyskretyzacji^2*alpha)/(metodaDyskretyzacji^3*alpha^3+6*metodaDyskretyzacji^3*alpha^2+3*metodaDyskretyzacji^2*alpha^3+11*metodaDyskretyzacji^3*alpha+6*metodaDyskretyzacji^2*alpha^2+3*metodaDyskretyzacji*alpha^3+6*metodaDyskretyzacji^3-27*metodaDyskretyzacji^2*alpha-6*metodaDyskretyzacji*alpha^2+alpha^3-54*metodaDyskretyzacji^2-27*metodaDyskretyzacji*alpha-6*alpha^2+54*metodaDyskretyzacji+11*alpha-6);
    b3=-(11*alpha+6*alpha^2+alpha^3+6*metodaDyskretyzacji*alpha^2-6*metodaDyskretyzacji^2*alpha^2-27*metodaDyskretyzacji*alpha-6*metodaDyskretyzacji^3*alpha^2+3*metodaDyskretyzacji^2*alpha^3+metodaDyskretyzacji^3*alpha^3+3*metodaDyskretyzacji*alpha^3+11*metodaDyskretyzacji^3*alpha-27*metodaDyskretyzacji^2*alpha-6*metodaDyskretyzacji^3-54*metodaDyskretyzacji+6+54*metodaDyskretyzacji^2)/(metodaDyskretyzacji^3*alpha^3+6*metodaDyskretyzacji^3*alpha^2+3*metodaDyskretyzacji^2*alpha^3+11*metodaDyskretyzacji^3*alpha+6*metodaDyskretyzacji^2*alpha^2+3*metodaDyskretyzacji*alpha^3+6*metodaDyskretyzacji^3-27*metodaDyskretyzacji^2*alpha-6*metodaDyskretyzacji*alpha^2+alpha^3-54*metodaDyskretyzacji^2-27*metodaDyskretyzacji*alpha-6*alpha^2+54*metodaDyskretyzacji+11*alpha-6);
    a0=120/(metodaDyskretyzacji^3*alpha^3+6*metodaDyskretyzacji^3*alpha^2+3*metodaDyskretyzacji^2*alpha^3+11*metodaDyskretyzacji^3*alpha+6*metodaDyskretyzacji^2*alpha^2+3*metodaDyskretyzacji*alpha^3+6*metodaDyskretyzacji^3-27*metodaDyskretyzacji^2*alpha-6*metodaDyskretyzacji*alpha^2+alpha^3-54*metodaDyskretyzacji^2-27*metodaDyskretyzacji*alpha-6*alpha^2+54*metodaDyskretyzacji+11*alpha-6);
    a1=(60*alpha-180+180*metodaDyskretyzacji+60*metodaDyskretyzacji*alpha)/(metodaDyskretyzacji^3*alpha^3+6*metodaDyskretyzacji^3*alpha^2+3*metodaDyskretyzacji^2*alpha^3+11*metodaDyskretyzacji^3*alpha+6*metodaDyskretyzacji^2*alpha^2+3*metodaDyskretyzacji*alpha^3+6*metodaDyskretyzacji^3-27*metodaDyskretyzacji^2*alpha-6*metodaDyskretyzacji*alpha^2+alpha^3-54*metodaDyskretyzacji^2-27*metodaDyskretyzacji*alpha-6*alpha^2+54*metodaDyskretyzacji+11*alpha-6);
    a2=(72+72*metodaDyskretyzacji^2+24*metodaDyskretyzacji*alpha^2-216*metodaDyskretyzacji-60*alpha+12*alpha^2+12*metodaDyskretyzacji^2*alpha^2+60*metodaDyskretyzacji^2*alpha)/(metodaDyskretyzacji^3*alpha^3+6*metodaDyskretyzacji^3*alpha^2+3*metodaDyskretyzacji^2*alpha^3+11*metodaDyskretyzacji^3*alpha+6*metodaDyskretyzacji^2*alpha^2+3*metodaDyskretyzacji*alpha^3+6*metodaDyskretyzacji^3-27*metodaDyskretyzacji^2*alpha-6*metodaDyskretyzacji*alpha^2+alpha^3-54*metodaDyskretyzacji^2-27*metodaDyskretyzacji*alpha-6*alpha^2+54*metodaDyskretyzacji+11*alpha-6);
    a3=1;
    G=tf(k*[b0 b1 b2 b3],[a0 a1 a2 a3],T,'Variable', 'z^-1');

else
    error('Zla liczba argumentow');
end
end

