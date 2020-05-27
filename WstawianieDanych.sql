INSERT INTO Kraje (Nazwa_kraju)
VALUES ('Polska'), ('Niemcy'), ('Portugalia');

INSERT INTO Miasta (Nazwa_miasta, ID_kraj)
VALUES ('Warszawa', 1), ('Berlin', 2), ('Lizbona', 3), ('Nidzica', 1), ('Olsztyn', 1);

INSERT INTO Rodzaje_atrakcji (Nazwa_rodzaju_atrakcji)
VALUES ('Zabytek'), ('Muzeum'), ('Natura i prarki'), ('Zoo i akwaria');

INSERT INTO Atrakcje (Nazwa_atrakcji, ID_rodzaj_atrakcji, Cena_atrakcji, Na_deszowe_dni, Przyjazna_dla_dzieci)
VALUES ('Lazienki Krolewskie', 4, 0, 0, 0), ('Muzeum Palacu Krola Jana III', 2, 20.0, 1, 0), ('Haus der Wannsee-Konferenz', 1, 0, 1, 0), ('Zoo Berlin', 4, 65.0, 0, 1), ('Jardim da Praca do Imperio', 3, 0, 0, 1);

INSERT INTO Lista_atrakcji (ID_atrakcja, ID_miasto)
VALUES (1, 1), (2, 1), (3, 2), (4, 2), (5, 3);

INSERT INTO Adres (Nazwa_ulicy, Numer_budynku, Numer_mieszkania, Kod_pocztowy, ID_miasto)
VALUES ('Krzywa', 43, NULL, '00-112',  1), ('Warschauer Platz', 6, NULL, '10245', 2), ('Edifício Nau', 15, NULL, '1900-000', 3), ('Klonowa', 7, 43, '13-100', 4), ('Warszawska', 132, NULL, '45-214', 5);

INSERT INTO Rodzaje_obiektow (Rodzaj_obiektu)
VALUES ('Hotel'), ('Osrodek wczasowy');

INSERT INTO Obiekty (ID_rodzaj_obiektu, Nazwa_obiektu, ID_adres, Liczba_gwiazdek, Odleglosc_od_centrum, Calodobowa_recepcja, Sniadanie_w_cenie, Pokoje_dla_niepalacych, Bezplatne_wifi, Parking, Udogodnienia_dla_niepelnosprawnych, Przyjazny_dla_zwierzat, Przyjazny_dla_dzieci, Basen)
VALUES (1, 'West Hotel', 1, 3, 12.4, 0, 0, 1, 0, 1, 0, 0, 0, 0), (1, 'PLUS Berlin Hostel und Hotel', 2, 4, 3.4, 1, 1, 1, 1, 1, 1, 0, 0, 1), (2, 'Tagus Marina', 3, NULL, NULL, NULL, 0, 0, 0, 1, 0, 1, 1, 0);

INSERT INTO Typy_pokoi (Nazwa_typu_pokoju, Maksymalna_liczba_osob, Prywatna_lazienka, Telewizor_w_pokoju, Wyjscie_na_balkon)
VALUES ('2 lozka jednoosobowe standard', 2, 1, 0, 0), ('Lozko dwuosobowe premium', 2, 1, 1, 1), ('Maly pokoj dwuosobowy', 2, 1, 1, 1), ('Domek z 1 sypialnia', 2, 1, 1, 0), ('Domek z 2 sypialniami', 4, 1, 1, 0);

INSERT INTO Pokoje (ID_obiekt, ID_typ_pokoju, Pietro, Numer_pokoju, Metraz_pokoju, Cena_pokoju_za_noc)
VALUES (1, 1, 2, 214, 9.4, 29.99), (1, 1, 4, 401, 10.3, 32.99), (1, 2, 3, 309, 12.8, 50.00), (2, 3, 4, 2410, 15.0, 202.00), (3, 4, 0, 5, 35.6, 300.00), (3, 5, 0, 9, 46.1, 500.00);

INSERT INTO Uzytkownicy (Email, Haslo, Imie, Nazwisko, Numer_telefonu, ID_adres)
VALUES ('jan.kowalski@op.pl', '12345', 'Jan', 'Kowalski', '+48492014964', 4), ('anow84@wp.pl', 'motylek84', 'Aleksandra', 'Nowak', '+48123456789', 5);

INSERT INTO Typy_kart_platniczych (Nazwa_typu_karty_platniczej)
VALUES ('Visa'), ('Mastercard');

INSERT INTO Karty_platnicze (ID_typ_karty, Numer_karty, Data_waznosci, Kod_CVC)
VALUES (1, 123456789012345, '12/21', 213), (1, 987654321098765, '03/22', 132), (2, 5839514375012852, '01/21', 131);

INSERT INTO Karty_uzytkownika (ID_uzytkownik, ID_karta_platnicza)
VALUES (1, 1), (2, 2), (1, 3);

INSERT INTO Rezerwacje (ID_uzytkownik)
VALUES (1);

INSERT INTO Rodzaj_posilku (Rodzaj_posilku)
VALUES ('sniadnaie'), ('obiad'), ('kolacja');

INSERT INTO Posilki (Nazwa_posilku, ID_rodzaj_posilku)
VALUES ('Ziemniaki ze schabowym', 2), ('Jajecznica z bekonem', 1), ('Kanapki', 1), ('Nalesniki na slodko', 3);

INSERT INTO Lista_posilkow (ID_rezerwacja, ID_posilek)
VALUES (1, 2), (1, 2);

INSERT INTO Zarezerwowane_pokoje (ID_pokoj, ID_rezerwacja)
VALUES (3, 1);

INSERT INTO Historia_rezerwacji (ID_rezerwacja, ID_uzytkownik, Data_zlozenia_rezerwacji, Data_zameldowania, Data_wymeldowania)
VALUES (1, 1, '2020/05/22', '2020/06/14', '2020/06/21');

INSERT INTO Platnosc (ID_rezerwacja, ID_uzytkownik, ID_karta_platnicza, Kwota_platnosci)
VALUES (1, 1, 1, 423.67);

INSERT INTO Historia_platnosci (ID_platnosc, Data_platnosci)
VALUES (1, '2020/05/24');
