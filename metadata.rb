name             "mirror"
maintainer       "Jesse Nelson"
maintainer_email "spheromak@gmail.com"
license          "Apache 2.0"
description      "Set up various Mirrors"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.0.3"

depends "apache2"
depends "rsync", ">= 0.7.2"
