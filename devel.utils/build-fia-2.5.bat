@cls
call ..\build.bat test

set PERL_USE_UNSAFE_INC=1

set SKIP_MSI_STEP=
set SKIP_PDL_STEP=1
perl -Mblib ..\script\perldist_strawberry -job ..\share\64bit-5.28.2.1-fusioninventory-agent-2.5.pp -notest_core -notest_modules -beta=0 -nointeractive -norestorepoints -wixbin_dir="C:\Program Files (x86)\WiX Toolset v3.11\bin" -cpan_url="http://cpan.metacpan.org/" -working_dir="C:\projects\perl-dist-strawberry\tmp_build"
