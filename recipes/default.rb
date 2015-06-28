include_recipe 'devbox::repos'

# Setup attributes used elsewhere
node.default['devbox']['home'] = Dir.home(node['devbox']['user'])

include_recipe 'devbox::git'
include_recipe 'devbox::rvm' if node['devbox']['install_ruby']
include_recipe 'devbox::zsh'
include_recipe 'devbox::vim'
include_recipe 'devbox::rust'
