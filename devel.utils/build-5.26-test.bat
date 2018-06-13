@cls
call ..\build.bat test

set PERL_USE_UNSAFE_INC=1

set SKIP_MSI_STEP=
set SKIP_PDL_STEP=1
rem perl -Mblib ..\script\perldist_strawberry -job ..\share\32bit-5.26.2.1.pp -notest_core -notest_modules -beta=0 -nointeractive -norestorepoints -wixbin_dir="C:\Program Files (x86)\WiX Toolset v3.11\bin" -cpan_url="http://cpan.metacpan.org/"
perl -Mblib ..\script\perldist_strawberry -job ..\share\64bit-5.26.2.1-test.pp -notest_core -notest_modules -beta=0 -nointeractive -norestorepoints -wixbin_dir="C:\Program Files (x86)\WiX Toolset v3.11\bin" -cpan_url="http://cpan.metacpan.org/" -working_dir="C:\projects\perl-dist-strawberry\tmp_build"
