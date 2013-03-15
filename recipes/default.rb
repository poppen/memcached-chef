#
# Cookbook Name:: memcached
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
if platform?("centos","redhat","fedora")
  %w{memcached libmemcached}.each do |pkg|
    package pkg do
      action :install
    end
  end
end

service "memcached" do
  service_name "memcached"
  case node["platform"]
  when "centos","redhat","fedora"
    supports :restart => true, :reload => true, :status => true
  end
  action [:enable, :start]
end
