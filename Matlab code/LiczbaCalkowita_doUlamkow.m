function wynik = LiczbaCalkowita_doUlamkow(liczbaWejsciowa)
%Zwraca warto�� ca�kowit� liczby. Patrz fix.
    for iterator=1:length(liczbaWejsciowa)
        wynik(iterator) = fix(str2num(sprintf('%d',liczbaWejsciowa(iterator))));    
    end
end
