#
# Cookbook Name:: gluster
# Recipe:: server_install
#
# Copyright 2014, Biola University
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'gluster::repository'

# Install dependencies
node['gluster']['server']['dependencies'].each do |d|
  package d
end

# Install the server package
package node['gluster']['server']['package']

# Make sure the service is started
service 'glusterd' do
  action [:enable, :start]
end
