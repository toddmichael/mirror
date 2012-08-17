#
# Author:: Jesse Nelson <spheromak@gmail.com>
# Cookbook Name:: mirror
# Recipe:: master
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
include_recipe 'rsync::server'
include_recipe 'mirror::server'

class Chef::Recipe
  include Repo::Mirror
end

node[:mirror].each do |mirror, data|
  # validate this mirror
  next unless validate( mirror, data )

  dispatch( mirror, data )

  Chef::Log.info "Setting up Rsync Server for #{mirror}"
  # todo: expand the per-mirror data for rsync options
  # serve out this mirror 
  rsync_serve "#{mirror}-prod" do
    path node[:mirror][:base_path] + "/prod/#{mirror}"
    comment data[:comment] || ""
    read_only true
    use_chroot true
    list true
    uid "nobody"
    gid "nobody"
  end
end

