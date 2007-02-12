Summary:	lbxproxy application
Summary(pl.UTF-8):   Aplikacja lbxproxy
Name:		xorg-app-lbxproxy
Version:	1.0.1
Release:	1
License:	MIT
Group:		X11/Applications
Source0:	http://xorg.freedesktop.org/releases/individual/app/lbxproxy-%{version}.tar.bz2
# Source0-md5:	9d5045a5c76b1fe360221b967a5aa0e9
Source1:	lbxproxy.1x.pl
Patch0:		xorg-lbxproxy-freebsd.patch
Patch1:		%{name}-configdir.patch
URL:		http://xorg.freedesktop.org/
BuildRequires:	autoconf >= 2.57
BuildRequires:	automake
BuildRequires:	pkgconfig >= 1:0.19
BuildRequires:	xorg-lib-libICE-devel
BuildRequires:	xorg-lib-libXext-devel
BuildRequires:	xorg-lib-liblbxutil-devel
BuildRequires:	xorg-lib-xtrans-devel
BuildRequires:	xorg-proto-bigreqsproto-devel
BuildRequires:	xorg-proto-xproxymanagementprotocol-devel
BuildRequires:	xorg-util-util-macros >= 0.99.2
BuildRequires:	zlib-devel
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

%description
lbxproxy application.

%description -l pl.UTF-8
Aplikacja lbxproxy.

%prep
%setup -q -n lbxproxy-%{version}
%patch0 -p1
%patch1 -p1

%build
%{__aclocal}
%{__autoconf}
%{__autoheader}
%{__automake}
%configure

%{__make} \
	configdir=/etc/X11/lbxproxy

%install
rm -rf $RPM_BUILD_ROOT

%{__make} install \
	DESTDIR=$RPM_BUILD_ROOT \
	configdir=/etc/X11/lbxproxy

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
