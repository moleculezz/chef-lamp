name             'lamp'
maintainer       'G. Arends'
maintainer_email 'gdarends@gmail.com'
license          'All rights reserved'
description      'Installs/Configures lamp'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.2'

supports "debian"
supports "ubuntu"

depends "apt"
depends "build-essential"
depends "git"
depends "apache2"
depends "php"
depends "database"
depends "openssl"
depends "users"
depends "composer"
depends "memcached"
depends "base"
