
default[:mirror][:centos][:enabled] = true
default[:mirror][:centos][:url] = "rsync://mirror.aarnet.edu.au/centos/"
default[:mirror][:centos][:bw_limit] = 5000
default[:mirror][:centos][:exclude] =  %w{ 
  /2/
  /2.*
  /3/
  /3.*
  /4/
  /4.*
  /5.*
  apt/
  docs/
  isos/
  SRPMS/
  alpha/
  ia64/
  ppc/
  s390/
  s390x/
  Deployment_Guide-*
  5server
  5Server
  /6.0
  /6.1 
  /6.2 
} 
