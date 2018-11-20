Name: houdini		
Version:	6
Release:	1%{?dist}
Summary:	Intel ARM-on-x86 Just-In-Time Compiler	
BuildArch: x86_64

License:	Intel

BuildRequires:  squashfs-tools	
Source0: houdini-6.tar
%description

Intel ARM/ARM64-on-x64 dynamic binary translator.

%prep
%setup -q
%build
./build.sh

%install
DESTDIR=%{buildroot} ./install64.sh

%files
/usr/lib/houdini/cpu32
/usr/lib/houdini/cpu64
/usr/lib/houdini/ld.so
/usr/libexec/houdini
/usr/libexec/houdini64
/etc/binfmt.d/houdini.conf 
%doc

%post
systemctl reload systemd-binfmt.service

%changelog

