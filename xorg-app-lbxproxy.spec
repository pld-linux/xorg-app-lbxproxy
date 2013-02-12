Summary:	lbxproxy application - Low Bandwidth X proxy
Summary(pl.UTF-8):	Aplikacja lbxproxy - proxy X dla sieci o niskiej przepustowości
Name:		xorg-app-lbxproxy
Version:	1.0.3
Release:	1
License:	MIT
Group:		X11/Applications
Source0:	http://xorg.freedesktop.org/releases/individual/app/lbxproxy-%{version}.tar.bz2
# Source0-md5:	0bd565b5464f38f606dae15459ff4b09
Source1:	lbxproxy.1x.pl
URL:		http://xorg.freedesktop.org/
BuildRequires:	autoconf >= 2.57
BuildRequires:	automake
BuildRequires:	pkgconfig >= 1:0.19
BuildRequires:	xorg-lib-libICE-devel
BuildRequires:	xorg-lib-libXext-devel >= 1.1.1-3
BuildRequires:	xorg-lib-liblbxutil-devel >= 1.1.0
BuildRequires:	xorg-lib-xtrans-devel
BuildRequires:	xorg-proto-bigreqsproto-devel
BuildRequires:	xorg-proto-xproxymanagementprotocol-devel
BuildRequires:	xorg-util-util-macros >= 1.3
BuildRequires:	zlib-devel
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

%description
Applications that would like to take advantage of the Low Bandwidth
extension to X (LBX) must make their connections to an lbxproxy. These
applications need to know nothing about LBX, they simply connect to
the lbxproxy as if were a regular server. The lbxproxy accepts client
connections, multiplexes them over a single connection to the X
server, and performs various optimizations on the X protocol to make
it faster over low bandwidth and/or high latency connections.

%description -l pl.UTF-8
Aplikacje chcące wykorzystać rozszerzenie LBX (Low Bandwidth X - X dla
sieci o małej przepustowości) muszą wykonywać połączenia do lbxproxy.
Aplikacje te nie muszą wiedzieć niczego o LBX, po prostu łączą się z
lbxproxy tak, jak ze zwykłym serwerem. lbxproxy przyjmuje połączenia
klienckie, przekazuje je naprzemiennie po pojedynczym połączeniu do
serwera X i wykonuje różne optymalizacje na protokole X w celu
uczynienia go szybszym po połączeniu o niskiej przepustowości i/lub
dużym opóźnieniu.

%prep
%setup -q -n lbxproxy-%{version}

%build
%{__aclocal}
%{__autoconf}
%{__autoheader}
%{__automake}
%configure

%{__make}

%install
rm -rf $RPM_BUILD_ROOT

%{__make} install \
	DESTDIR=$RPM_BUILD_ROOT

install -D %{SOURCE1} $RPM_BUILD_ROOT%{_mandir}/pl/man1/lbxproxy.1x

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644,root,root,755)
%doc COPYING ChangeLog README
%attr(755,root,root) %{_bindir}/lbxproxy
%dir /etc/X11/lbxproxy
%config(noreplace) %verify(not md5 mtime size) /etc/X11/lbxproxy/AtomControl
%{_mandir}/man1/lbxproxy.1x*
%lang(pl) %{_mandir}/pl/man1/lbxproxy.1x*
