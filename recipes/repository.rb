#
# Cookbook Name:: gluster
# Recipe:: repository
#
# Copyright 2014, Biola University
#
# Copyright 2014, Jackson River
# Modified by Ben Clark <benjamin.clark@jacksonriver.com>
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

case node['platform_family']
when 'debian'
  apt_repository node['gluster']['repository']['apt']['repo_name'] do
    uri node['gluster']['repository']['apt']['uri']
    distribution node['gluster']['repository']['apt']['distribution']
    components node['gluster']['repository']['apt']['components']
    keyserver node['gluster']['repository']['apt']['keyserver']
    key node['gluster']['repository']['apt']['key']
    deb_src node['gluster']['repository']['apt']['deb_src']
  end
when 'rhel'
  yum_repository node['gluster']['repository']['yum']['repo_name'] do
    url node['gluster']['repository']['yum']['url']
    gpgcheck node['gluster']['repository']['yum']['gpgcheck']
    gpgkey node['gluster']['repository']['yum']['gpgkey']
    action :create
  end
end
