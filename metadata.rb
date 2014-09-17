name             'lamp'
maintainer       'G. Arends'
maintainer_email 'gdarends@gmail.com'
license          'All rights reserved'
description      'Installs/Configures lamp'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.3.2'

supports "debian"
supports "ubuntu"

depends "base"
depends "secure"
depends "users"
depends "apache2"
depends "php"
depends "composer"
depends "mysql"
depends "openssl"

depends "git"
