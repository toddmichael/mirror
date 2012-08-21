
# default is to enable all of these
default[:mirror][:epel][:enabled] = true
default[:mirror][:epel][:url] = "rsync://dl.fedoraproject.org/fedora-epel"
default[:mirror][:epel][:bw_limit] = 5000
default[:mirror][:epel][:exclude] =  %w{
  beta/
  testing/
  beta testing 
  6/ppc64/ 
  6/SRPMS/
  5/ppc
  5/ppc64
  SRPMS
  4*
  */SRPMS/*
  */ppc/*
  */ppc64/*
}

