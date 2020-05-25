--POZYTYWNE
SELECT Nazwa_atrakcji
FROM Atrakcje as A
WHERE A.ID_atrakcja IN (SELECT L.ID_atrakcja FROM Lista_atrakcji as L WHERE L.ID_miasto IN (SELECT ID_miasto FROM Miasta WHERE Nazwa_miasta LIKE 'Warszawa'));

SELECT Nazwa_obiektu FROM Obiekty
WHERE Udogodnienia_dla_niepelnosprawnych = 1;

--NEGATYWNE
SELECT Imie, Nazwisko FROM Uzytkownicy
WHERE ID_uzytkownik NOT IN (SELECT ID_uzytkownik FROM Historia_rezerwacji);

SELECT Nazwa_atrakcji FROM Atrakcje AS A
JOIN Rodzaje_atrakcji AS R ON A.ID_rodzaj_atrakcji = R.ID_rodzaj_atrakcji
WHERE Nazwa_rodzaju_atrakcji NOT LIKE 'Muzeum';
