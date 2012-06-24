.\" 2000 PTM Przemek Borys <pborys@dione.ids.pl>
.\" $XConsortium: lbxproxy.man /main/9 1996/12/02 15:47:09 swick $
.\" Copyright (c) 1996  X Consortium
.\" 
.\" Permission is hereby granted, free of charge, to any person obtaining
.\" a copy of this software and associated documentation files (the
.\" "Software"), to deal in the Software without restriction, including
.\" without limitation the rights to use, copy, modify, merge, publish,
.\" distribute, sublicense, and sell copies of the Software, and to
.\" permit persons to whom the Software is furnished to do so, subject to
.\" the following conditions:
.\" 
.\" The above copyright notice and this permission notice shall be included
.\" in all copies or substantial portions of the Software.
.\" 
.\" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
.\" OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
.\" MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
.\" IN NO EVENT SHALL THE X CONSORTIUM BE LIABLE FOR ANY CLAIM, DAMAGES OR
.\" OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
.\" ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
.\" OTHER DEALINGS IN THE SOFTWARE.
.\" 
.\" Except as contained in this notice, the name of the X Consortium shall
.\" not be used in advertising or otherwise to promote the sale, use or
.\" other dealings in this Software without prior written authorization
.\" from the X Consortium.
.\" 
.TH LBXPROXY 1 "Wydanie 6.3" "X Werjsa 11"
.SH NAZWA
lbxproxy - W�skopasmowe proxy X (Low BandWidth X proxy)
.SH SK�ADNIA
.B lbxproxy [:<wy�wietlacz>] [opcja]
.SH OPIS
Aplikacje, kt�re chc� wykorzystywa� rozszerzenie w�skiego pasma X (LBX)
musz� ��czy� si� z lbxproxy. Aplikacje te nie musz� wiedzie� nic o LBX, po
prostu musz� si� po��czy� do lbxproxy jak do normalnego serwera. Lbxproxy
przyjmuje po��czenia klient�w i powiela je na jednym po��czeniu do serwera
X, dokonuj�c r�nych optymalizacji protoko�u X, przyspieszaj�c po��czenia
w�skopasmowe.
.PP
Maj�c na uwadze uwierzytelnianie i autoryzacj�, lbxproxy zwyczajnie
przekazuje serwerowi przedstawione przez u�ytkownika dokumenty
uwierzytelniaj�ce. Poniwa� do lbxproxy ��cz� si� klienci X, wa�nym jest by
plik .Xauthority u�ytkownika zawiera� wpisy z prawid�owymi kluczami
zwi�zanymi z ID sieciowym proxy. lbxproxy nie jest odpowiedzialny za
dodawanie tych wpis�w do pliku .Xauthority. Odpowiedzialnym za
skonfigurowanie tego jest u�ytkownik.
.PP
Program lbxproxy ma r�ne opcje, z kt�rych wszystkie s� opcjonalne.
.PP
Je�li poadny jest
.BR :<wy�wietlacz> ,
proxy u�yje podanego portu wy�wietlacza podczas nas�uchiwania po��cze�. Port
wy�wietlacza jest offsetem od portu 6000, zupe�nie podobnie do sposobu
podawania normalnych wy�wietlaczy X. Je�li nie podano �adnego portu,
lbxproxy u�yje domy�lnego portu, 63. Je�li port ten jest zaj�ty, proxy
zg�osi komunikat o b��dzie.
.PP
Innymi opcjami linii polece� s�:
.PP
.TP 8
.B \-help
Drukuje kr�tk� informacj� o u�yciu i opcjach linii polece�.
.TP 8
.B \-display \fIdpy\fP
Podaje adres serwera X, obs�uguj�cego rozszerzenie LBX. Je�li opcja ta nie
jest podana, wy�wietlacz jest wyszukiwany wed�ug zmiennej �rodowiskowej
DISPLAY.
.TP 8
.B \-motion \fIliczba\fP
W danym momencie dozwolona jest ograniczona liczba ruch�w myszy, naraz
transferowanych mi�dzy serwerem a proxy. Domy�lna liczba to 8.
.TP 8
.B \-[terminate|reset]
Domy�lnym zachowanie lbxproxy po zako�czeniu dzia�a� ostatniego klienta jest
dalsze dzia�anie. Opcja
.B \-terminate
powoduje, �e lbxproxy ko�czy dzia�anie po zako�czeniu obs�ugi ostatniego
klienta. Opcja
.B \-reset
powoduje, �e po zako�czeniu obs�ugi ostatniego klienta lbxproxy si�
zresetuje. Resetowanie powoduje czyszczenie stanu i repod��czenie si� do
serwera.
.TP 8
.B \-reconnect
Domy�lne zachowanie lbxproxy to ko�czenie pracy gdy po��czenie zostaje
zerwane. Opcja
.B \-reconnect
powoduje, �e lbxproxy zamiast tego si� resetuje (zobacz wy�ej
.BR \-reset )
i pr�buje pod��czy� na nowo do serwera.
.TP 8
.B \-I
Powoduje ignorowanie wszystkich pozosta�ych argument�w.
.TP 8
.B \-nolbx
Wy��cza optymalizacje LBX.
.TP 8
.B \-nocomp
Wy��cza kompresj� �a�cuch�w.
.TP 8
.B \-nodelta
Wy��cza podstawienia ��da� delta.
.TP 8
.B \-notags
Wy��cza u�ywanie tag�w.
.TP 8
.B \-nogfx
Wy��cza rekodowanie ��da� graficznych (nie licz�c ��da� zwi�zanych z
obrazami).
.TP 8
.B \-noimage
Wy��cza kompresj� obraz�w.
.TP 8
.B \-nosquish
Wy��cza [squishing] zdarze� X.
.TP 8
.B \-nointernsc
Wy��cza zwieranie (short circuiting) ��da� InternAtom.
.TP 8
.B \-noatomsfile
Wy��cza odczytywanie pliku kontroli atom�w. Zobacz sekcj� o "Kontroli Atom�w".
.TP 8
.B \-atomsfile \fIfile\fP
Przeci��a domy�lny plik KontroliAtom�w. Zobacz sekcj� o "Kontroli Atom�w".
.TP 8
.B \-nowinattr
Disables GetWindowAttributes/GetGeometry grouping into one round trip.
.TP 8
.B \-nograbcmap
Wy��cza zbieranie (grabbing) map kolorowych (colormaps).
.TP 8
.B \-norgbfile
Wy��cza przekszta�canie nazwy koloru na RGB w proxy.
.TP 8
.B \-rgbfile \fI�cie�ka\fP
Podaje alternatywn� baz� RGB do przekszta�ce� nazw kolor�w na RGB.
.TP 8
.B \-tagcachesize
Ustawia rozmiar bufora podr�cznego tagu proxy (w bajtach).
.TP 8
.B \-zlevel \fIpoziom\fP
Ustaw poziom kompresji Zlib (u�ywane do kompresji strumienia).
.br
domy�lnie jest to 9
.br
1 = najgorsza, najszybsza kompresja
.br
9 = najlepsza, najwolniejsza kompresja
.TP 8
.B \-compstats
Za ka�dym razem gdy proxy si� resetuje, lub odbiera sygna� SIGHUP, raportuj
statystyki kompresji strumienia.
.TP 8
.B \-nozeropad
Nie zeruj nieu�ywanych bajt�w wype�niania w ��daniach, odpowiedziach i
zdarzeniach X.
.TP 8
.B \-cheaterrors
Zezwala  oszukiwanie protoko�u X w celu polepszenia wydajno�ci. Protok� X
gwarantuje, �e wszelkie odpowiedzi, zdarzenia lub b��dy, wygenerowane
poprzednim ��daniem b�d� wysy�ane przed wygenerowaniem odpowiedzi dla
kolejnego ��dania. Nak�ada to ograniczenia gdy lbxproxy mo�e zewrze�
(short circuit) ��danie. Opcja -cheaterrors umo�liwia lbxproxy pogwa�cenie
regu� protoko�u X wzgl�dem b��d�w. U�ywaj na w�asne ryzyko.
.TP 8
.B \-cheatevents
Podobne do poprzedniej opcji, lecz zezwala na pogwa�canie regu� X protoko�u
wzgl�dem tak zdarze�, jak i b��d�w. U�ywaj na w�asne ryzyko.
.PP
.SH KONTROLA ATOM�W
.PP
Podczas uruchamiania, lbxproxy "preinstancjonuje" konfigurowaln� list�
atom�w. Umo�liwia to lbxproxy internowanie grupy atom�w w pojedynczym
przebiegu (round trip) i natychmiastowe zachowanie wynik�w w buforze
podr�cznym.
.PP
Podczas pracy lbxproxy u�ywa heurystyk wspomagaj�cych decyzj�, kiedy op�ni�
wysy�anie danych o w�a�ciwo�ciach okna do serwera. Heurystyka zale�y od
rozmiaru danych, nazwy w�a�ciwo�ci i tego czy poprzez lbxproxy dzia�a
mened�er okien.
.PP
Kontrola atom�w jest okre�lana w pliku "KontroliAtom�w", konfigurowanym
podczas instalacji lbxproxy. Jest ona przeci��ana dyrektywami linii polece�.
.PP
Plik ten jest zwyczajnym plikiem tekstowym. Istniej� trzy postaci linii:
komentarze, kontrola d�ugo�ci i kontrola nazw. Linie rozpoczynaj�ce si� od
znaku '!' to komentarze. Linie postaci
.sp
.in +4
.nf
z \fId�ugo��\fP
.fi
.in -4
.sp
okre�laj� maksymaln� d�ugo�� w bajtach nim dane w�a�ciwo�ci zostan�
op�nione. Linia postaci
.sp
.in +4
.nf
\fIopcje\fP \fInazwaatomu\fP
.fi
.in -4
.sp
kontroluje podany atom, gdzie \fIopcje\fP s� dowoln� kombinacj� znak�w: 'i',
oznaczaj�cego, �e atom powinien by� pre-internowany; 'n', oznaczaj�cego, �e
dane w�a�ciwo�ci o tej nazwie nigdy nie powinny by� op�niane; 'w'
oznaczaj�cego, �e dane tej w�a�ciwo�ci powinny by� op�niane tylko je�li
mened�er okien dzia�a r�wnie� poprzez to samo lbxproxy.
