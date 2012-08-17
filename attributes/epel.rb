
# default is to enable all of these
default[:mirror][:epel][:enabled] = true
default[:mirror][:epel][:url] = "rsync://dl.fedoraproject.org/fedora-epel"
default[:mirror][:epel][:bw_limit] = 5000
default[:mirror][:epel][:exclude] =  %w{
*/ppc64/
/2/
/2.*
/3/
/3.*
/4/
/4.*
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
/5.5
/5.6
/5.7
}

