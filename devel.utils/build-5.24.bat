@cls
call ..\build.bat test

set SKIP_MSI_STEP=
set SKIP_PDL_STEP=
set SKIP_LD_TROUBLE_MAKERS=
perl -Mblib ..\script\perldist_strawberry -job ..\share\32bit-5.24.0.1.pp -test_core -beta=0 -nointeractive -norestorepoints -wixbin_dir=z:\sw\Wix38 -cpan_url file:///z:/_cpan-mirror/
rem ###### perl -Mblib ..\script\perldist_strawberry -job ..\share\64bit-5.24.0.1.pp -test_core -beta=0 -nointeractive -norestorepoints -wixbin_dir=z:\sw\Wix38 -cpan_url file:///z:/_cpan-mirror/
rem ###### 
rem ###### set SKIP_MSI_STEP=1
rem ###### set SKIP_PDL_STEP=1
rem ###### set SKIP_LD_TROUBLE_MAKERS=
rem ###### perl -Mblib ..\script\perldist_strawberry -job ..\share\32bit-5.24.0.1.pp -test_core -beta=0 -noperl_64bitint -app_simplename=strawberry-perl-no64 -nointeractive -norestorepoints -wixbin_dir=z:\sw\Wix38 -cpan_url file:///z:/_cpan-mirror/
rem ###### 
rem ###### rem ### EXPERIMENTAL ###
rem ###### set SKIP_MSI_STEP=1
rem ###### set SKIP_PDL_STEP=
rem ###### set SKIP_LD_TROUBLE_MAKERS=1
rem ###### perl -Mblib ..\script\perldist_strawberry -job ..\share\64bit-5.24.0.1.pp -test_core -beta=0 -perl_ldouble -app_simplename=strawberry-perl-ld -nointeractive -norestorepoints -wixbin_dir=z:\sw\Wix38 -cpan_url file:///z:/_cpan-mirror/
rem ###### rem perl -Mblib ..\script\perldist_strawberry -job ..\share\32bit-5.24.0.1.pp -test_core -beta=0 -perl_ldouble -noperl_64bitint -app_simplename=strawberry-PDL-ld-no64 -nointeractive -norestorepoints -wixbin_dir=z:\sw\Wix38 -cpan_url file:///z:/_cpan-mirror/

pause
