function [Transmitancja] = AproksymacjaOustaloupTransmitancji(Licznik,RzedyLicznika,Mianownik,RzedyMianownika,DolnaCzestotliwosc,GornaCzestotliwosc,RzadAproksymacji, Opoznienie)

%Funkcja umo¿liwia aproksymacje ca³ych transmitancji, a tak¿e rozszerze
%stosowalnoœæ aproksymacji Oustaloup'a do wszystkich liczb rzeczywistych.
%Niezbêdne jest wstawienie pierwszych 7 parametrów. Mo¿liwe jest pominiêcie
%opóŸnienia w uk³adzie. Funkcja sprawdza czy rozmiary tabel zawieraj¹cych
%licznik oraz mianownik transmitancji s¹ równe rozmiarom tabel
%zawierajacych wyk³adniki. W przypadku stwierdzenia nie równoœci zwracany
%jest b³¹d. Funkcja zwraca transmitancje bêd¹c¹ aproksymacj¹ Oustaluop'a.
   
    if nargin < 7
        error('Zbyt ma³a liczba argumentów w aproksymacji transmitancji przy u¿yciu aproksymacji Oustaloup.');
    end
    if length(Licznik)~=length(RzedyLicznika)
        error('Rozmiar tabeli wyznacznikow licznika jest rozna od rozmiaru tablicy licznika');
    end
    if length(Mianownik)~=length(RzedyMianownika)
        error('Rozmiar tabeli wyznacznikow mianownika jest rozna od rozmiaru tablicy mianownika');
    end
    zeraUkladu = 0;
    biegunyUkladu = 0;
    s = tf('s');
r = RzadAproksymacji;
w_d =DolnaCzestotliwosc;
w_g = GornaCzestotliwosc;
    for iterator=1:length(Licznik)
        Wykladnik = RzedyLicznika(iterator); 
        czescCalkowita = LiczbaCalkowita_doUlamkow(Wykladnik);
        czescUlamkowa = double(Wykladnik-czescCalkowita);
        wynik = (s^czescCalkowita)*Licznik(iterator);
        if czescUlamkowa ~= 0
           wynik = wynik * AproksymacjaOustaloupa(czescUlamkowa,r,w_d,w_g);
        end
        zeraUkladu = zeraUkladu + wynik;
    end
    
    for iterator=1:length(Mianownik)
        Wykladnik = RzedyMianownika(iterator);  
        czescCalkowita = LiczbaCalkowita_doUlamkow(Wykladnik); 
        czescUlamkowa = double(Wykladnik-czescCalkowita);
        wynik = (s^czescCalkowita)*Mianownik(iterator);
        if czescUlamkowa ~= 0
           wynik = wynik * AproksymacjaOustaloupa(czescUlamkowa,r,w_d,w_g);
        end
        biegunyUkladu = biegunyUkladu + wynik;
    end

    zeraUkladu = zpk(zeraUkladu);
    biegunyUkladu = zpk(biegunyUkladu);
    Transmitancja = zeraUkladu/biegunyUkladu;
    
    if nargin == 8

        if Opoznienie > 0
        Transmitancja.ioDelay = Opoznienie; 
        end
    end

end

