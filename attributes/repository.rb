#
# Cookbook Name:: gluster
# Attributes:: repository
#
# Copyright 2014, Jackson River
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

default['gluster']['repository']['apt'].tap do |apt|
  apt['repo_name'] = 'ubuntu-glusterfs-3.4'
  apt['uri'] = 'http://ppa.launchpad.net/semiosis/ubuntu-glusterfs-3.4/ubuntu'
  apt['distribution'] = node['lsb']['codename']
  apt['components'] = %w(main)
  apt['keyserver'] = 'keyserver.ubuntu.com'
  apt['key'] = '774BAC4D'
  apt['deb_src'] = true
end

default['gluster']['repository']['yum'].tap do |yum|
  yum['repo_name'] = 'glusterfs'
  yum['url'] = 'http://download.gluster.org/pub/gluster/glusterfs/3.4/LATEST/EPEL.repo/epel-$releasever/$basearch/'
  yum['gpgcheck'] = true
  yum['gpgkey'] = 'http://download.gluster.org/pub/gluster/glusterfs/3.4/LATEST/EPEL.repo/pub.key'
end
