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
lbxproxy - W±skopasmowe proxy X (Low BandWidth X proxy)
.SH SK£ADNIA
.B lbxproxy [:<wy¶wietlacz>] [opcja]
.SH OPIS
Aplikacje, które chc± wykorzystywaæ rozszerzenie w±skiego pasma X (LBX)
musz± ³±czyæ siê z lbxproxy. Aplikacje te nie musz± wiedzieæ nic o LBX, po
prostu musz± siê po³±czyæ do lbxproxy jak do normalnego serwera. Lbxproxy
przyjmuje po³±czenia klientów i powiela je na jednym po³±czeniu do serwera
X, dokonuj±c ró¿nych optymalizacji protoko³u X, przyspieszaj±c po³±czenia
w±skopasmowe.
.PP
Maj±c na uwadze uwierzytelnianie i autoryzacjê, lbxproxy zwyczajnie
przekazuje serwerowi przedstawione przez u¿ytkownika dokumenty
uwierzytelniaj±ce. Poniwa¿ do lbxproxy ³±cz± siê klienci X, wa¿nym jest by
plik .Xauthority u¿ytkownika zawiera³ wpisy z prawid³owymi kluczami
zwi±zanymi z ID sieciowym proxy. lbxproxy nie jest odpowiedzialny za
dodawanie tych wpisów do pliku .Xauthority. Odpowiedzialnym za
skonfigurowanie tego jest u¿ytkownik.
.PP
Program lbxproxy ma ró¿ne opcje, z których wszystkie s± opcjonalne.
.PP
Je¶li poadny jest
.BR :<wy¶wietlacz> ,
proxy u¿yje podanego portu wy¶wietlacza podczas nas³uchiwania po³±czeñ. Port
wy¶wietlacza jest offsetem od portu 6000, zupe³nie podobnie do sposobu
podawania normalnych wy¶wietlaczy X. Je¶li nie podano ¿adnego portu,
lbxproxy u¿yje domy¶lnego portu, 63. Je¶li port ten jest zajêty, proxy
zg³osi komunikat o b³êdzie.
.PP
Innymi opcjami linii poleceñ s±:
.PP
.TP 8
.B \-help
Drukuje krótk± informacjê o u¿yciu i opcjach linii poleceñ.
.TP 8
.B \-display \fIdpy\fP
Podaje adres serwera X, obs³uguj±cego rozszerzenie LBX. Je¶li opcja ta nie
jest podana, wy¶wietlacz jest wyszukiwany wed³ug zmiennej ¶rodowiskowej
DISPLAY.
.TP 8
.B \-motion \fIliczba\fP
W danym momencie dozwolona jest ograniczona liczba ruchów myszy, naraz
transferowanych miêdzy serwerem a proxy. Domy¶lna liczba to 8.
.TP 8
.B \-[terminate|reset]
Domy¶lnym zachowanie lbxproxy po zakoñczeniu dzia³añ ostatniego klienta jest
dalsze dzia³anie. Opcja
.B \-terminate
powoduje, ¿e lbxproxy koñczy dzia³anie po zakoñczeniu obs³ugi ostatniego
klienta. Opcja
.B \-reset
powoduje, ¿e po zakoñczeniu obs³ugi ostatniego klienta lbxproxy siê
zresetuje. Resetowanie powoduje czyszczenie stanu i repod³±czenie siê do
serwera.
.TP 8
.B \-reconnect
Domy¶lne zachowanie lbxproxy to koñczenie pracy gdy po³±czenie zostaje
zerwane. Opcja
.B \-reconnect
powoduje, ¿e lbxproxy zamiast tego siê resetuje (zobacz wy¿ej
.BR \-reset )
i próbuje pod³±czyæ na nowo do serwera.
.TP 8
.B \-I
Powoduje ignorowanie wszystkich pozosta³ych argumentów.
.TP 8
.B \-nolbx
Wy³±cza optymalizacje LBX.
.TP 8
.B \-nocomp
Wy³±cza kompresjê ³añcuchów.
.TP 8
.B \-nodelta
Wy³±cza podstawienia ¿±dañ delta.
.TP 8
.B \-notags
Wy³±cza u¿ywanie tagów.
.TP 8
.B \-nogfx
Wy³±cza rekodowanie ¿±dañ graficznych (nie licz±c ¿±dañ zwi±zanych z
obrazami).
.TP 8
.B \-noimage
Wy³±cza kompresjê obrazów.
.TP 8
.B \-nosquish
Wy³±cza [squishing] zdarzeñ X.
.TP 8
.B \-nointernsc
Wy³±cza zwieranie (short circuiting) ¿±dañ InternAtom.
.TP 8
.B \-noatomsfile
Wy³±cza odczytywanie pliku kontroli atomów. Zobacz sekcjê o "Kontroli Atomów".
.TP 8
.B \-atomsfile \fIfile\fP
Przeci±¿a domy¶lny plik KontroliAtomów. Zobacz sekcjê o "Kontroli Atomów".
.TP 8
.B \-nowinattr
Disables GetWindowAttributes/GetGeometry grouping into one round trip.
.TP 8
.B \-nograbcmap
Wy³±cza zbieranie (grabbing) map kolorowych (colormaps).
.TP 8
.B \-norgbfile
Wy³±cza przekszta³canie nazwy koloru na RGB w proxy.
.TP 8
.B \-rgbfile \fI¶cie¿ka\fP
Podaje alternatywn± bazê RGB do przekszta³ceñ nazw kolorów na RGB.
.TP 8
.B \-tagcachesize
Ustawia rozmiar bufora podrêcznego tagu proxy (w bajtach).
.TP 8
.B \-zlevel \fIpoziom\fP
Ustaw poziom kompresji Zlib (u¿ywane do kompresji strumienia).
.br
domy¶lnie jest to 9
.br
1 = najgorsza, najszybsza kompresja
.br
9 = najlepsza, najwolniejsza kompresja
.TP 8
.B \-compstats
Za ka¿dym razem gdy proxy siê resetuje, lub odbiera sygna³ SIGHUP, raportuj
statystyki kompresji strumienia.
.TP 8
.B \-nozeropad
Nie zeruj nieu¿ywanych bajtów wype³niania w ¿±daniach, odpowiedziach i
zdarzeniach X.
.TP 8
.B \-cheaterrors
Zezwala  oszukiwanie protoko³u X w celu polepszenia wydajno¶ci. Protokó³ X
gwarantuje, ¿e wszelkie odpowiedzi, zdarzenia lub b³êdy, wygenerowane
poprzednim ¿±daniem bêd± wysy³ane przed wygenerowaniem odpowiedzi dla
kolejnego ¿±dania. Nak³ada to ograniczenia gdy lbxproxy mo¿e zewrzeæ
(short circuit) ¿±danie. Opcja -cheaterrors umo¿liwia lbxproxy pogwa³cenie
regu³ protoko³u X wzglêdem b³êdów. U¿ywaj na w³asne ryzyko.
.TP 8
.B \-cheatevents
Podobne do poprzedniej opcji, lecz zezwala na pogwa³canie regu³ X protoko³u
wzglêdem tak zdarzeñ, jak i b³êdów. U¿ywaj na w³asne ryzyko.
.PP
.SH KONTROLA ATOMÓW
.PP
Podczas uruchamiania, lbxproxy "preinstancjonuje" konfigurowaln± listê
atomów. Umo¿liwia to lbxproxy internowanie grupy atomów w pojedynczym
przebiegu (round trip) i natychmiastowe zachowanie wyników w buforze
podrêcznym.
.PP
Podczas pracy lbxproxy u¿ywa heurystyk wspomagaj±cych decyzjê, kiedy opó¼niæ
wysy³anie danych o w³a¶ciwo¶ciach okna do serwera. Heurystyka zale¿y od
rozmiaru danych, nazwy w³a¶ciwo¶ci i tego czy poprzez lbxproxy dzia³a
mened¿er okien.
.PP
Kontrola atomów jest okre¶lana w pliku "KontroliAtomów", konfigurowanym
podczas instalacji lbxproxy. Jest ona przeci±¿ana dyrektywami linii poleceñ.
.PP
Plik ten jest zwyczajnym plikiem tekstowym. Istniej± trzy postaci linii:
komentarze, kontrola d³ugo¶ci i kontrola nazw. Linie rozpoczynaj±ce siê od
znaku '!' to komentarze. Linie postaci
.sp
.in +4
.nf
z \fId³ugo¶æ\fP
.fi
.in -4
.sp
okre¶laj± maksymaln± d³ugo¶æ w bajtach nim dane w³a¶ciwo¶ci zostan±
opó¼nione. Linia postaci
.sp
.in +4
.nf
\fIopcje\fP \fInazwaatomu\fP
.fi
.in -4
.sp
kontroluje podany atom, gdzie \fIopcje\fP s± dowoln± kombinacj± znaków: 'i',
oznaczaj±cego, ¿e atom powinien byæ pre-internowany; 'n', oznaczaj±cego, ¿e
dane w³a¶ciwo¶ci o tej nazwie nigdy nie powinny byæ opó¼niane; 'w'
oznaczaj±cego, ¿e dane tej w³a¶ciwo¶ci powinny byæ opó¼niane tylko je¶li
mened¿er okien dzia³a równie¿ poprzez to samo lbxproxy.
