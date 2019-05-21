### job description for building strawberry perl

#Available '<..>' macros:
# <package_url>   is placeholder for http://strawberryperl.com/package
# <dist_sharedir> is placeholder for Perl::Dist::Strawberry's distribution sharedir
# <image_dir>     is placeholder for c:\strawberry

{
  app_version     => '2.5.0.1', #BEWARE: do not use '.0.0' in the last two version digits
  bits            => 64,
  beta            => 0,
  app_fullname    => 'FusionInventory Agent (64-bit)',
  app_simplename  => 'fusioninventory-agent',
  maketool        => 'gmake', # 'dmake' or 'gmake'
  build_job_steps => [
    ### NEXT STEP ###########################
    {
        plugin  => 'Perl::Dist::Strawberry::Step::BinaryToolsAndLibs',
        install_packages => {
            #tools
            'dmake'         => '<package_url>/kmx/64_tools/64bit_dmake-warn_20170512.zip',
            'pexports'      => '<package_url>/kmx/64_tools/64bit_pexports-0.47-bin_20170426.zip',
            'patch'         => '<package_url>/kmx/64_tools/64bit_patch-2.5.9-7-bin_20100110_UAC.zip',
            #gcc, gmake, gdb & co.
            'gcc-toolchain' => { url=>'<package_url>/kmx/64_gcctoolchain/mingw64-w64-gcc7.1.0_20170512.zip', install_to=>'c' },
            'gcc-license'   => '<package_url>/kmx/64_gcctoolchain/mingw64-w64-gcc7.1.0_20170512-lic.zip',
            #libs
            'bzip2'         => '<package_url>/kmx/64_libs/gcc71-2017Q2/64bit_bzip2-1.0.6-bin_20170517.zip',
            'libdb'         => '<package_url>/kmx/64_libs/gcc71-2017Q2/64bit_db-6.2.32-bin_20170517.zip',
            'libexpat'      => '<package_url>/kmx/64_libs/gcc71-2017Q2/64bit_expat-2.2.0-bin_20170517.zip',
            'libfreeglut'   => '<package_url>/kmx/64_libs/gcc71-2017Q2/64bit_freeglut-3.0.0-bin_20170517.zip',
            'libfreetype'   => '<package_url>/kmx/64_libs/gcc71-2017Q2/64bit_freetype-2.7.1-bin_20170517.zip',
            'libgdbm'       => '<package_url>/kmx/64_libs/gcc71-2017Q2/64bit_gdbm-1.10-bin_20170517.zip',
            'libgiflib'     => '<package_url>/kmx/64_libs/gcc71-2017Q2/64bit_giflib-5.1.4-bin_20170517.zip',
            'libgmp'        => '<package_url>/kmx/64_libs/gcc71-2017Q2/64bit_gmp-6.1.2-bin_20170517.zip',
            'libjpeg'       => '<package_url>/kmx/64_libs/gcc71-2017Q2/64bit_jpeg-9b-bin_20170517.zip',
            'libgd'         => '<package_url>/kmx/64_libs/gcc71-2017Q2/64bit_libXpm-3.5.12-bin_20170517.zip',
            'libffi'        => '<package_url>/kmx/64_libs/gcc71-2017Q2/64bit_libffi-3.2.1-bin_20170517.zip',
            'liblibXpm'     => '<package_url>/kmx/64_libs/gcc71-2017Q2/64bit_libgd-2.2.4-bin_20170517.zip',
            'liblibiconv'   => '<package_url>/kmx/64_libs/gcc71-2017Q2/64bit_libiconv-1.15-bin_20170517.zip',
            'liblibpng'     => '<package_url>/kmx/64_libs/gcc71-2017Q2/64bit_libpng-1.6.29-bin_20170517.zip',
            'liblibssh2'    => '<package_url>/kmx/64_libs/gcc71-2017Q2/64bit_libssh2-1.8.0-bin_20170517.zip',
            'liblibxml2'    => '<package_url>/kmx/64_libs/gcc71-2017Q2/64bit_libxml2-2.9.4-bin_20170517.zip',
            'liblibxslt'    => '<package_url>/kmx/64_libs/gcc71-2017Q2/64bit_libxslt-1.1.29-bin_20170517.zip',
            'libmpc'        => '<package_url>/kmx/64_libs/gcc71-2017Q2/64bit_mpc-1.0.3-bin_20170517.zip',
            'libmpfr'       => '<package_url>/kmx/64_libs/gcc71-2017Q2/64bit_mpfr-3.1.5-bin_20170517.zip',
            'libopenssl'    => '<package_url>/kmx/64_libs/gcc71-2019Q2/64bit_openssl-1.1.0j-bin_20190426.zip',
            'libpostgresql' => '<package_url>/kmx/64_libs/gcc71-2017Q2/64bit_postgresql-9.6.3-bin_20170517.zip',
            'libt1lib'      => '<package_url>/kmx/64_libs/gcc71-2017Q2/64bit_t1lib-5.1.2-bin_20170517.zip',
            'libtiff'       => '<package_url>/kmx/64_libs/gcc71-2017Q2/64bit_tiff-4.0.7-bin_20170517.zip',
            'libxz'         => '<package_url>/kmx/64_libs/gcc71-2017Q2/64bit_xz-5.2.3-bin_20170517.zip',
            'libzlib'       => '<package_url>/kmx/64_libs/gcc71-2017Q2/64bit_zlib-1.2.11-bin_20170517.zip',
            #special cases
            'libmysql'      => '<package_url>/kmx/64_libs/gcc71-2017Q2/64bit_mysql-5.7.16-bin_20170517.zip',
        },
    },
    ### NEXT STEP ###########################
    {
       plugin => 'Perl::Dist::Strawberry::Step::FilesAndDirs',
       commands => [
         { do=>'removefile', args=>[ '<image_dir>/c/i686-w64-mingw32/lib/libglut.a', '<image_dir>/c/i686-w64-mingw32/lib/libglut32.a' ] }, #XXX-32bit only workaround
         { do=>'movefile',   args=>[ '<image_dir>/c/lib/libdb-6.1.a', '<image_dir>/c/lib/libdb.a' ] }, #XXX ugly hack
         { do=>'removefile', args=>[ '<image_dir>/c/bin/gccbug', '<image_dir>/c/bin/ld.gold.exe', '<image_dir>/c/bin/ld.bfd.exe' ] },
         { do=>'removefile_recursive', args=>[ '<image_dir>/c', qr/.+\.la$/i ] }, # https://rt.cpan.org/Public/Bug/Display.html?id=127184
       ],
    },
    ### NEXT STEP ###########################
    {
        plugin     => 'Perl::Dist::Strawberry::Step::InstallPerlCore',
        url        => 'http://cpan.metacpan.org/authors/id/S/SH/SHAY/perl-5.28.2.tar.gz',
        cf_email   => 'strawberry-perl@project', #IMPORTANT: keep 'strawberry-perl' before @
        perl_debug => 0,    # can be overridden by --perl_debug=N option
        perl_64bitint => 1, # ignored on 64bit, can be overridden by --perl_64bitint | --noperl_64bitint option
        buildoptextra => '-D__USE_MINGW_ANSI_STDIO',
        patch => { #DST paths are relative to the perl src root
            '<dist_sharedir>/msi/files/perlexe.ico'             => 'win32/perlexe.ico',
            '<dist_sharedir>/perl-5.28/win32_config.gc.tt'      => 'win32/config.gc',
            '<dist_sharedir>/perl-5.28/perlexe.rc.tt'           => 'win32/perlexe.rc',
            '<dist_sharedir>/perl-5.28/win32_config_H.gc'       => 'win32/config_H.gc', # enables gdbm/ndbm/odbm
        },
        license => { #SRC paths are relative to the perl src root
            'Readme'   => '<image_dir>/licenses/perl/Readme',
            'Artistic' => '<image_dir>/licenses/perl/Artistic',
            'Copying'  => '<image_dir>/licenses/perl/Copying',
        },
    },
    ### NEXT STEP ###########################
    {
        plugin => 'Perl::Dist::Strawberry::Step::UpgradeCpanModules',
        exceptions => [
          # possible 'do' options: ignore_testfailure | skiptest | skip - e.g. 
          #{ do=>'ignore_testfailure', distribution=>'ExtUtils-MakeMaker-6.72' },
          #{ do=>'ignore_testfailure', distribution=>qr/^IPC-Cmd-/ },
        ]
    },
    ### NEXT STEP ###########################
    {
        plugin => 'Perl::Dist::Strawberry::Step::InstallModules',
        modules => [
            # IPC related
            { module=>'IPC-Run', skiptest=>1 }, #XXX-TODO trouble with 'Terminating on signal SIGBREAK(21)' https://metacpan.org/release/IPC-Run
            qw/ IPC-Run3 /,

            { module=>'LWP::UserAgent', skiptest=>1 }, # XXX-HACK: 6.08 is broken

            { module=>'Archive::Extract',  ignore_testfailure=>1 }, #XXX-TODO-5.28/64bit

            # JSON::PP
            qw/ JSON::PP /,

            # win32 related
            qw/ Win32 Win32API::Registry Win32::TieRegistry/,
            { module=>'Win32::OLE',         ignore_testfailure=>1 }, #XXX-TODO: ! Testing Win32-OLE-0.1711 failed
            { module=>'Win32::API',         ignore_testfailure=>1 }, #XXX-TODO: https://rt.cpan.org/Public/Bug/Display.html?id=107450
            qw/ Win32::Unicode::File /,
            { module=>'<package_url>/kmx/perl-modules-patched/Win32-Pipe-0.025_patched.tar.gz' }, #XXX-FIXME 
            qw/ Win32-Daemon Win32-Process Win32-WinError /,
            qw/ Win32::Console Win32::Console::ANSI Win32::Job /,
            qw/ Win32::OLE::Const Win32::OLE::Variant /,
            qw/ Sys::Syslog /,

            # term related
            { module=>'Term::ReadKey', ignore_testfailure=>1 },
            { module=>'Term::ReadLine::Perl', env=>{ PERL_MM_NONINTERACTIVE=>1 } },

            # compression
            'Compress::Zlib',

            # file related
            { module=>'File::Copy::Recursive', ignore_testfailure=>1 }, #XXX-TODO-5.28
            qw/ File-Which /,

            # SSL & SSH
            'Net-SSLeay',
            { module=>'IO-Socket-SSL', env=>{ 'HARNESS_SUBCLASS'=>'TAP::Harness::Restricted', 'HARNESS_SKIP'=>'t/nonblock.t t/mitm.t t/verify_fingerprint.t t/session_ticket.t' } },
            #https://github.com/noxxi/p5-io-socket-ssl/issues/30

            # network
            qw/ Socket IO::Socket::IP IO::Socket::INET6 /,
            qw/ Net::IP HTTP::Daemon HTTP::Proxy Net::SNMP Net::Ping Net::NBName/,
            qw/ HTTP-Server-Simple HTTP::Server::Simple::Authen /,
            qw/ Net::Domain Net::hostent Net::HTTPS Sys::Hostname /,
            qw/ Net::SNMP::Security::USM Net::SNMP::Transport::IPv4::TCP /,
            qw/ Net::SNMP::Transport::IPv6::TCP Net::SNMP::Transport::IPv6::UDP /,
            qw/ HTTP::Cookies HTTP::Headers HTTP::Request HTTP::Status /,
            qw/ LWP::UserAgent /,
            { module=>'LWP::Protocol::https', env=>{ 'HARNESS_SUBCLASS'=>'TAP::Harness::Restricted', 'HARNESS_SKIP'=>'t/https_proxy.t' } }, #https://rt.perl.org/Ticket/Display.html?id=132863
            { module=>'<package_url>/kmx/perl-modules-patched/Crypt-SSLeay-0.72_patched.tar.gz', ignore_testfailure=>1 }, #XXX-FIXME

            # XML & co.
            qw/ XML::TreePP /,

            # crypto
            qw/ CryptX Crypt::OpenSSL::Bignum Crypt::OpenSSL::DSA Crypt-OpenSSL-RSA Crypt-OpenSSL-Random Crypt-OpenSSL-X509 /,
            'KMX/Crypt-OpenSSL-AES-0.05.tar.gz', #XXX-FIXME patched https://metacpan.org/pod/Crypt::OpenSSL::AES  https://rt.cpan.org/Public/Bug/Display.html?id=77605
            #Crypt-SMIME ?
            qw/ Crypt::CBC Crypt::Blowfish Crypt::DES Crypt::DSA Crypt::IDEA Crypt::Rijndael Crypt::Twofish /,
            qw/ Digest-MD5 Digest-SHA Digest-SHA1 Digest::HMAC /,

            # date/time
            qw/ DateTime DateTime::TimeZone::Local::Win32 /,

            # e-mail
            { module=>'Net::DNS', skiptest=>1 }, # tests might hang due to network issues

            # exceptions
            qw/ Try-Tiny /,

            # templates
            qw/ Text::Template /,

            # OO - others
            qw/ Class::Accessor Class::Accessor::Lite /,

            # dumpers
            qw/ Data::Dumper /,

            # misc
            { module=>'Unicode::UTF8', ignore_testfailure=>1 }, #XXX-TODO-5.28

            # FusionInventory Agent
            qw/ strict warnings integer lib UNIVERSAL::require /,
            qw/ IO::Capture::Stderr Parallel::ForkManager /,
            qw/ Parse::EDID URI URI::Escape Cwd English Fcntl Getopt::Long /,
            # TODO Net::Pcap needs WinPcap driver installed
            #qw/ Net::Pcap' Net::Write::Layer2/,
            qw/ Encode Encode::Byte Encode::CN Encode::JP Encode::KR Encode::TW /,
            qw/ Encode::Unicode utf8 /,
            qw/ Memoize MIME::Base64 Pod::Usage POSIX Scalar::Util Storable /,
            qw/ Thread::Queue Thread::Semaphore threads threads::shared /,
            qw/ Tie::Hash::NamedCapture Time::HiRes Time::Local Time::localtime /,
            qw/ User::pwent /,
            qw/ FusionInventory::Agent /,
        ],

    },
    ### NEXT STEP ###########################
    {
        plugin => 'Perl::Dist::Strawberry::Step::FixShebang',
        shebang => '#!perl',
    },
    ### NEXT STEP ###########################
    {
       plugin => 'Perl::Dist::Strawberry::Step::FilesAndDirs',
       commands => [
         # directories
         { do=>'createdir', args=>[ '<image_dir>/cpan' ] },
         { do=>'createdir', args=>[ '<image_dir>/cpan/sources' ] },
         { do=>'createdir', args=>[ '<image_dir>/win32' ] },
         # templated files
         { do=>'apply_tt', args=>[ '<dist_sharedir>/config-files/CPAN_Config.pm.tt', '<image_dir>/perl/lib/CPAN/Config.pm', {}, 1 ] }, #XXX-temporary empty tt_vars, no_backup=1
         { do=>'apply_tt', args=>[ '<dist_sharedir>/extra-files/README.txt.tt', '<image_dir>/README.txt' ] },
         { do=>'apply_tt', args=>[ '<dist_sharedir>/extra-files/DISTRIBUTIONS.txt.tt', '<image_dir>/DISTRIBUTIONS.txt' ] },
         # fixed files
         { do=>'copyfile', args=>[ '<dist_sharedir>/extra-files/licenses/License.rtf', '<image_dir>/licenses/License.rtf' ] },
         { do=>'copyfile', args=>[ '<dist_sharedir>/extra-files/relocation.pl.bat',    '<image_dir>/relocation.pl.bat' ] },
         { do=>'copyfile', args=>[ '<dist_sharedir>/extra-files/update_env.pl.bat',    '<image_dir>/update_env.pl.bat' ] },
         { do=>'copyfile', args=>[ '<dist_sharedir>/extra-files/win32/cpan.ico',       '<image_dir>/win32/cpan.ico' ] },
         { do=>'copyfile', args=>[ '<dist_sharedir>/extra-files/win32/onion.ico',      '<image_dir>/win32/onion.ico' ] },
         { do=>'copyfile', args=>[ '<dist_sharedir>/extra-files/win32/perldoc.ico',    '<image_dir>/win32/perldoc.ico' ] },
         { do=>'copyfile', args=>[ '<dist_sharedir>/extra-files/win32/perlhelp.ico',   '<image_dir>/win32/perlhelp.ico' ] },
         { do=>'copyfile', args=>[ '<dist_sharedir>/extra-files/win32/strawberry.ico', '<image_dir>/win32/strawberry.ico' ] },
         { do=>'copyfile', args=>[ '<dist_sharedir>/extra-files/win32/win32.ico',      '<image_dir>/win32/win32.ico' ] },
         { do=>'copyfile', args=>[ '<dist_sharedir>/extra-files/win32/metacpan.ico',   '<image_dir>/win32/metacpan.ico' ] },
         # URLs
         { do=>'apply_tt', args=>[ '<dist_sharedir>/extra-files/win32/CPAN Module Search.url.tt',                  '<image_dir>/win32/CPAN Module Search.url' ] },
         { do=>'apply_tt', args=>[ '<dist_sharedir>/extra-files/win32/MetaCPAN Search Engine.url.tt',              '<image_dir>/win32/MetaCPAN Search Engine.url' ] },
         { do=>'apply_tt', args=>[ '<dist_sharedir>/extra-files/win32/Learning Perl (tutorials, examples).url.tt', '<image_dir>/win32/Learning Perl (tutorials, examples).url' ] },
         { do=>'apply_tt', args=>[ '<dist_sharedir>/extra-files/win32/Live Support (chat).url.tt',                 '<image_dir>/win32/Live Support (chat).url' ] },
         { do=>'apply_tt', args=>[ '<dist_sharedir>/extra-files/win32/Perl Documentation.url.tt',                  '<image_dir>/win32/Perl Documentation.url' ] },
         { do=>'apply_tt', args=>[ '<dist_sharedir>/extra-files/win32/Strawberry Perl Release Notes.url.tt',       '<image_dir>/win32/Strawberry Perl Release Notes.url' ] },
         { do=>'apply_tt', args=>[ '<dist_sharedir>/extra-files/win32/Strawberry Perl Website.url.tt',             '<image_dir>/win32/Strawberry Perl Website.url' ] },
         # cleanup (remove unwanted files/dirs)
         { do=>'removefile', args=>[ '<image_dir>/perl/vendor/lib/Crypt/._test.pl', '<image_dir>/perl/vendor/lib/DBD/testme.tmp.pl' ] },
         { do=>'removefile', args=>[ '<image_dir>/perl/bin/nssm_32.exe.bat', '<image_dir>/perl/bin/nssm_64.exe.bat' ] },
         { do=>'removefile_recursive', args=>[ '<image_dir>/perl', qr/.+\.dll\.AA[A-Z]$/i ] },
         { do=>'removedir', args=>[ '<image_dir>/perl/bin/freeglut.dll' ] }, #XXX OpenGL garbage
         # cleanup cpanm related files
         { do=>'removedir', args=>[ '<image_dir>/perl/site/lib/MSWin32-x86-multi-thread-64int' ] },
         { do=>'removedir', args=>[ '<image_dir>/perl/site/lib/MSWin32-x86-multi-thread' ] },
         { do=>'removedir', args=>[ '<image_dir>/perl/site/lib/MSWin32-x64-multi-thread' ] },
       ],
    },
    ### NEXT STEP ###########################
    {
       plugin => 'Perl::Dist::Strawberry::Step::CreateRelocationFile',
       reloc_in  => '<dist_sharedir>/relocation/relocation.txt.initial',
       reloc_out => '<image_dir>/relocation.txt',
    },
    ### NEXT STEP ###########################
    {
       plugin => 'Perl::Dist::Strawberry::Step::OutputZIP', # no options needed
    },
    ### NEXT STEP ###########################
    {
       disable => $ENV{SKIP_MSI_STEP}, ### hack
       plugin => 'Perl::Dist::Strawberry::Step::OutputMSI',
       exclude  => [
           #'dirname\subdir1\subdir2',
           #'dirname\file.pm',
           'relocation.pl.bat',
           'update_env.pl.bat',
       ],
       msi_upgrade_code    => '810FD690-9A72-4188-A562-B16AF0FAB73B', #BEWARE: fixed value for all 64bit releases (for ever)
       app_publisher       => 'fusioninventory-agent',
       url_about           => 'http://fusioninventory.org/',
       url_help            => 'http://fusioninventory.org/resources/',
       msi_root_dir        => 'FusionInventory-Agent',
       msi_main_icon       => '<dist_sharedir>\msi\files\fusioninventory-agent.ico',
       msi_license_rtf     => '<dist_sharedir>\msi\files\License-short.rtf',
       msi_dialog_bmp      => '<dist_sharedir>\msi\files\FusionInventoryDialog.bmp',
       msi_banner_bmp      => '<dist_sharedir>\msi\files\FusionInventoryBanner.bmp',
       msi_debug           => 0,

       env => {
         #TERM => "dumb",
       },

    },
    ### NEXT STEP ###########################
    {
        plugin => 'Perl::Dist::Strawberry::Step::InstallModules',
        # modules specific to portable edition
        modules => [ 'Portable' ],
    },
    ### NEXT STEP ###########################
    {
       plugin => 'Perl::Dist::Strawberry::Step::SetupPortablePerl', # no options needed
    },
    ### NEXT STEP ###########################
    {
       plugin => 'Perl::Dist::Strawberry::Step::FilesAndDirs',
       commands => [ # files and dirs specific to portable edition
         { do=>'removefile', args=>[ '<image_dir>/README.txt', '<image_dir>/perl2.reloc.txt', '<image_dir>/perl1.reloc.txt', '<image_dir>/relocation.txt',
                                     '<image_dir>/update_env.pl.bat', '<image_dir>/relocation.pl.bat' ] },
         { do=>'createdir',  args=>[ '<image_dir>/data' ] },
         { do=>'apply_tt',   args=>[ '<dist_sharedir>/portable/portable.perl.tt',       '<image_dir>/portable.perl', {gcchost=>'x86_64-w64-mingw32', gccver=>'7.1.0'} ] },
         { do=>'copyfile',   args=>[ '<dist_sharedir>/portable/portableshell.bat',      '<image_dir>/portableshell.bat' ] },
         { do=>'apply_tt',   args=>[ '<dist_sharedir>/portable/README.portable.txt.tt', '<image_dir>/README.txt' ] },
         # cleanup cpanm related files
         { do=>'removedir', args=>[ '<image_dir>/perl/site/lib/MSWin32-x86-multi-thread-64int' ] },
         { do=>'removedir', args=>[ '<image_dir>/perl/site/lib/MSWin32-x86-multi-thread' ] },
         { do=>'removedir', args=>[ '<image_dir>/perl/site/lib/MSWin32-x64-multi-thread' ] },
       ],
    },
    ### NEXT STEP ###########################
    {
       plugin => 'Perl::Dist::Strawberry::Step::OutputPortableZIP', # no options needed
    },
    ### NEXT STEP ###########################
    {
       plugin => 'Perl::Dist::Strawberry::Step::CreateReleaseNotes', # no options needed
    },
    ### NEXT STEP ###########################
    {
       plugin => 'Perl::Dist::Strawberry::Step::OutputLogZIP', # no options needed
    },
  ],
}
