#
# Author:: Jesse Nelson <spheromak@gmail.com>
# Cookbook Name:: yum
# Recipe:: repo_server
# Description:: 
#   Creates a repo mirror
#
# Copyright:: Copyright (c) 2011 Jesse Nelson
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


major = node['platform_version'].to_i
include_recipe 'apache2'

package "rsync"
package "createrepo"

base_path =  node[:mirror][:base_path]

directory base_path do 
  owner node[:apache][:user]
  group node[:apache][:group]
end

directory "#{base_path}/bin" do
  owner node[:apache][:user]
  group node[:apache][:group]
end

#
# setup the apache front for the repo
#
web_app "repo_mirror" do
  template "mirror-web.conf.erb"
  server_name node[:hostname]
  server_aliases [ 
    node[:fqdn], 
    "repos",
    "repos.#{node[:domain]}", 
    "yumrepo", 
    "yumrepo.#{node[:domain]}"
  ]
  docroot "#{base_path}"
end

apache_site "repo_mirror" do 
  enable true
end

#
# disable default site
#
apache_site "default" do
  enable false
end



