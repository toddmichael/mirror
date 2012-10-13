default[:mirror][:ubuntu][:enabled] = true
default[:mirror][:ubuntu][:url] = "rsync://mirror.aarnet.edu.au/ubuntu/archive/"
default[:mirror][:ubuntu][:bw_limit] = 10000
default[:mirror][:ubuntu][:exclude] = %w{ 
 dists/hardy*
 dists/lucid*
 dists/maveric*
 dists/natty*
 dists/oneiric*
 dists/precise-proposed
 pool/*
}


