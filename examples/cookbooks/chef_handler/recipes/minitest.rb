gem_package "minitest" do
  action :nothing
end.run_action(:upgrade)

gem_package "minitest-chef-handler" do
  action :nothing
end.run_action(:upgrade)

require 'rubygems'
Gem.clear_paths
require 'minitest-chef-handler'

chef_handler "MiniTest::Chef::Handler" do
  source "minitest-chef-handler"
  arguments( :path => File.join(Chef::Config[:cookbook_path],
                                "**",
                                "test",
                                "test_*.rb"),
             :verbose => true)
  action :nothing
end.run_action(:enable)
