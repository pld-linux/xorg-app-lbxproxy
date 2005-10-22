Summary:	lbxproxy application
Summary(pl):	Aplikacja lbxproxy
Name:		xorg-app-lbxproxy
Version:	0.99.1
Release:	0.1
License:	MIT
Group:		X11/Applications
Source0:	http://xorg.freedesktop.org/releases/X11R7.0-RC1/app/lbxproxy-%{version}.tar.bz2
# Source0-md5:	70127eb7aeac79b32e0e7f9326566ed9
Patch0:		xorg-lbxproxy-freebsd.patch
URL:		http://xorg.freedesktop.org/
BuildRequires:	autoconf >= 2.57
BuildRequires:	automake
BuildRequires:	pkgconfig >= 1:0.19
BuildRequires:	xorg-lib-libICE-devel
BuildRequires:	xorg-lib-libXext-devel
BuildRequires:	xorg-lib-liblbxutil-devel
BuildRequires:	xorg-lib-xtrans-devel
# for <X11/extensions/bigreqstr.h>
BuildRequires:	xorg-proto-bigreqsproto-devel
BuildRequires:	xorg-proto-xproxymanagementprotocol-devel
BuildRequires:	xorg-util-util-macros >= 0.99.1
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

%description
lbxproxy application.

%description -l pl
Aplikacja lbxproxy.

%prep
%setup -q -n lbxproxy-%{version}
%patch0 -p1

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
	DESTDIR=$RPM_BUILD_ROOT \
	appmandir=%{_mandir}/man1

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644,root,root,755)
%doc ChangeLog README
%attr(755,root,root) %{_bindir}/*
%{_libdir}/X11/lbxproxy
%{_mandir}/man1/*.1x*
