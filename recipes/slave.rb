#
# Author:: Jesse Nelson <spheromak@gmail.com>
# Cookbook Name:: mirror
# Recipe:: slave
# Description:: 
#   Slave node mirror in the repo system
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

# slaves are servers too.
include_recipe 'mirror::server'

class Chef::Recipe
  include Repo::Mirror
end

node[:mirror].each do |mirror, data|
  next unless validate( mirror, data )
  dispatch( mirror, data )
end
