CREATE TABLE Kraje
  (ID_kraj INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Nazwa_kraju VARCHAR(30) NOT NULL);

CREATE TABLE Miasta
  (ID_miasto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Nazwa_miasta VARCHAR(50) NOT NULL,
  ID_kraj INT NOT NULL,
  CONSTRAINT miasta_fk0 FOREIGN KEY (ID_kraj) REFERENCES Kraje(ID_kraj));

CREATE TABLE Adres
  (ID_adres INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Nazwa_ulicy VARCHAR(30) NOT NULL,
  Numer_budynku INT(3) NOT NULL,
  Numer_mieszkania INT(3),
  Kod_pocztowy VARCHAR(10) NOT NULL,
  ID_miasto INT NOT NULL,
  CONSTRAINT adres_fk0 FOREIGN KEY (ID_miasto) REFERENCES Miasta(ID_miasto));

CREATE TABLE Typy_kart_platniczych
  (ID_typ_karty_platniczej INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Nazwa_typu_karty_platniczej VARCHAR(20) NOT NULL);

CREATE TABLE Karty_platnicze
  (ID_karta_platnicza INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  ID_typ_karty INT NOT NULL,
  Numer_karty BIGINT(16) NOT NULL,
  Data_waznosci VARCHAR(5) NOT NULL,
  Kod_CVC INT(3) NOT NULL,
  CONSTRAINT karty_platnicze_fk0 FOREIGN KEY (ID_typ_karty) REFERENCES Typy_kart_platniczych(ID_typ_karty_platniczej));

CREATE TABLE Uzytkownicy
  (ID_uzytkownik INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Email VARCHAR(50) NOT NULL,
  Haslo VARCHAR(50) NOT NULL,
  Imie VARCHAR(20) NOT NULL,
  Nazwisko VARCHAR(40) NOT NULL,
  Numer_telefonu VARCHAR(12) NOT NULL,
  ID_adres INT NOT NULL,
  CONSTRAINT uzytkownicy_fk0 FOREIGN KEY (ID_adres) REFERENCES Adres(ID_adres));

CREATE TABLE Karty_uzytkownika
  (ID_uzytkownik INT NOT NULL,
  ID_karta_platnicza INT NOT NULL,
  CONSTRAINT karty_uzytkownika_fk0 FOREIGN KEY (ID_uzytkownik) REFERENCES Uzytkownicy(ID_uzytkownik),
  CONSTRAINT karty_uzytkownika_fk1 FOREIGN KEY (ID_karta_platnicza) REFERENCES Karty_platnicze(ID_karta_platnicza));

CREATE TABLE Rodzaje_obiektow
  (ID_rodzaj_obiektu INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Rodzaj_obiektu VARCHAR(30) NOT NULL);

CREATE TABLE Obiekty
  (ID_obiekt INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  ID_rodzaj_obiektu INT NOT NULL,
  Nazwa_obiektu VARCHAR(255) NOT NULL,
  ID_adres INT NOT NULL,
  Liczba_gwiazdek INT(1),
  Odleglosc_od_centrum FLOAT,
  Calodobowa_recepcja BOOLEAN,
  Sniadanie_w_cenie BOOLEAN NOT NULL,
  Pokoje_dla_niepalacych BOOLEAN NOT NULL,
  Bezplatne_wifi BOOLEAN NOT NULL,
  Parking BOOLEAN NOT NULL,
  Udogodnienia_dla_niepelnosprawnych BOOLEAN NOT NULL,
  Przyjazny_dla_zwierzat BOOLEAN NOT NULL,
  Przyjazny_dla_dzieci BOOLEAN NOT NULL,
  Basen BOOLEAN NOT NULL,
  CONSTRAINT obiekty_fk0 FOREIGN KEY (ID_rodzaj_obiektu) REFERENCES Rodzaje_obiektow(ID_rodzaj_obiektu),
  CONSTRAINT obiekty_fk1 FOREIGN KEY (ID_adres) REFERENCES Adres(ID_adres));

CREATE TABLE Typy_pokoi
  (ID_typ_pokoju INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Nazwa_typu_pokoju VARCHAR(50),
  Maksymalna_liczba_osob INT(2) NOT NULL,
  Prywatna_lazienka BOOLEAN NOT NULL,
  Telewizor_w_pokoju BOOLEAN NOT NULL,
  Wyjscie_na_balkon BOOLEAN NOT NULL);

CREATE TABLE Pokoje
  (ID_pokoj INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  ID_obiekt INT NOT NULL,
  ID_typ_pokoju INT NOT NULL,
  Pietro INT(2) NOT NULL,
  Numer_pokoju INT(5) NOT NULL,
  Metraz_pokoju FLOAT NOT NULL,
  Cena_pokoju_za_noc FLOAT NOT NULL,
  CONSTRAINT pokoje_fk0 FOREIGN KEY (ID_obiekt) REFERENCES Obiekty(ID_obiekt),
  CONSTRAINT pokoje_fk1 FOREIGN KEY (ID_typ_pokoju) REFERENCES Typy_pokoi(ID_typ_pokoju));

CREATE TABLE Rodzaje_atrakcji
  (ID_rodzaj_atrakcji INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Nazwa_rodzaju_atrakcji VARCHAR(50) NOT NULL);

CREATE TABLE Atrakcje
  (ID_atrakcja INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Nazwa_atrakcji VARCHAR(255) NOT NULL,
  ID_rodzaj_atrakcji INT NOT NULL,
  Cena_atrakcji FLOAT,
  Na_deszowe_dni BOOLEAN NOT NULL,
  Przyjazna_dla_dzieci BOOLEAN NOT NULL,
  CONSTRAINT atrakcje_fk0 FOREIGN KEY (ID_rodzaj_atrakcji) REFERENCES Rodzaje_atrakcji(ID_rodzaj_atrakcji));

CREATE TABLE Lista_atrakcji
  (ID_atrakcja INT NOT NULL,
  ID_miasto INT NOT NULL,
  CONSTRAINT lista_atrakcji_fk0 FOREIGN KEY (ID_atrakcja) REFERENCES Atrakcje(ID_atrakcja),
  CONSTRAINT lista_atrakcji_fk1 FOREIGN KEY (ID_miasto) REFERENCES Miasta(ID_miasto));

CREATE TABLE Rezerwacje
  (ID_rezerwacja INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  ID_uzytkownik INT NOT NULL,
  CONSTRAINT rezerwacje_fk0 FOREIGN KEY (ID_uzytkownik) REFERENCES Uzytkownicy(ID_uzytkownik));

CREATE TABLE Zarezerwowane_pokoje
  (ID_pokoj INT NOT NULL,
  ID_rezerwacja INT NOT NULL,
  CONSTRAINT zarezerwowane_pokoje_fk0 FOREIGN KEY (ID_rezerwacja) REFERENCES Rezerwacje(ID_rezerwacja),
  CONSTRAINT zarezerwowane_pokoje_fk1 FOREIGN KEY (ID_pokoj) REFERENCES Pokoje(ID_pokoj));

CREATE TABLE Rodzaj_posilku
  (ID_rodzaj_posilku INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Rodzaj_posilku VARCHAR(20) NOT NULL);

CREATE TABLE Posilki
  (ID_posilek INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Nazwa_posilku VARCHAR(50) NOT NULL,
  ID_rodzaj_posilku INT NOT NULL,
  CONSTRAINT posilki_fk0 FOREIGN KEY (ID_rodzaj_posilku) REFERENCES Rodzaj_posilku(ID_rodzaj_posilku));

CREATE TABLE Lista_posilkow
  (ID_rezerwacja INT NOT NULL,
  ID_posilek INT NOT NULL,
  CONSTRAINT lista_posilkow_fk0 FOREIGN KEY (ID_rezerwacja) REFERENCES Rezerwacje(ID_rezerwacja),
  CONSTRAINT lista_posilkow_fk1 FOREIGN KEY (ID_posilek) REFERENCES Posilki(ID_posilek));

CREATE TABLE Historia_rezerwacji
  (ID_rezerwacja INT NOT NULL,
  ID_uzytkownik INT NOT NULL,
  Data_zlozenia_rezerwacji DATE NOT NULL,
  Data_zameldowania DATE NOT NULL,
  Data_wymeldowania DATE NOT NULL,
  CONSTRAINT historia_rezerwacji_fk0 FOREIGN KEY (ID_rezerwacja) REFERENCES Rezerwacje(ID_rezerwacja),
  CONSTRAINT historia_rezerwacji_fk1 FOREIGN KEY (ID_uzytkownik) REFERENCES Uzytkownicy(ID_uzytkownik));

CREATE TABLE Platnosc
  (ID_platnosc INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  ID_rezerwacja INT NOT NULL,
  ID_uzytkownik INT NOT NULL,
  ID_karta_platnicza INT NOT NULL,
  Kwota_platnosci FLOAT NOT NULL,
  CONSTRAINT platnosc_fk0 FOREIGN KEY (ID_rezerwacja) REFERENCES Rezerwacje(ID_rezerwacja),
  CONSTRAINT platnosc_fk1 FOREIGN KEY (ID_uzytkownik) REFERENCES Uzytkownicy(ID_uzytkownik),
  CONSTRAINT platnosc_fk2 FOREIGN KEY (ID_karta_platnicza) REFERENCES Karty_platnicze(ID_karta_platnicza));

CREATE TABLE Historia_platnosci
  (ID_platnosc INT NOT NULL,
  Data_platnosci DATE NOT NULL,
  CONSTRAINT historia_platosci_fk0 FOREIGN KEY (ID_platnosc) REFERENCES Platnosc(ID_platnosc));
