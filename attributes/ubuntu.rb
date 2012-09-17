default[:mirror][:ubuntu][:enabled] = true
default[:mirror][:ubuntu][:url] = "rsync://ftp.riken.jp/ubuntu/dists/"
default[:mirror][:ubuntu][:bw_limit] = 10000
default[:mirror][:ubuntu][:exclude] = %w{ 
 hardy*
 lucid*
 maveric*
 natty*
 oneiric*
 precise-proposed
}


