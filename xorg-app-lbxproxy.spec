Summary:	lbxproxy application
Summary(pl):	Aplikacja lbxproxy
Name:		xorg-app-lbxproxy
Version:	0.99.0
Release:	0.02
License:	MIT
Group:		X11/Applications
Source0:	http://xorg.freedesktop.org/X11R7.0-RC0/app/lbxproxy-%{version}.tar.bz2
# Source0-md5:	497c9e0c8d690e1f2298d421ca9cdbaf
Patch0:		lbxproxy-man.patch
Patch1:		lbxproxy-freebsd.patch
URL:		http://xorg.freedesktop.org/
BuildRequires:	autoconf
BuildRequires:	automake
BuildRequires:	xorg-proto-bigreqsproto-devel
BuildRequires:	xorg-lib-libICE-devel
BuildRequires:	xorg-lib-libXext-devel
BuildRequires:	xorg-lib-liblbxutil-devel
BuildRequires:	xorg-util-util-macros
BuildRequires:	pkgconfig >= 0.19
BuildRequires:	xorg-proto-xproxymanagementprotocol-devel
BuildRequires:	xorg-lib-xtrans-devel
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

%description
lbxproxy application.

%description -l pl
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

%{__make}

%install
rm -rf $RPM_BUILD_ROOT

%{__make} install \
	DESTDIR=$RPM_BUILD_ROOT

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644,root,root,755)
%attr(755,root,root) %{_bindir}/*
%{_mandir}/man1/*.1*
