include_recipe 'devbox::repos'

# Setup attributes used elsewhere
node.default['devbox']['home'] = Dir.home(node['devbox']['user'])

include_recipe 'devbox::git'
include_recipe 'devbox::rvm'
include_recipe 'devbox::zsh'
include_recipe 'devbox::vim'
