#
# Author:: Jesse Nelson <spheromak@gmail.com>
# Cookbook Name:: mirror
# Recipe:: centos
# Description:: 
#   Creates a centos mirror
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

include_recipe 'server'

mirror_rsync "centos" do 
  base_path node[:mirror][:base_path]
  exclude   node[:mirror][:centos][:exclude]
  limit     node[:mirror][:centos][:bw_limit]
  owner     node[:apache][:user]
  group     node[:apache][:group]
  url       node[:mirror][:centos][:rsync_url]
end


