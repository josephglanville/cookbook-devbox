package 'zsh'

%w(zshrc zprofile aliases).each do |f|
  cookbook_file ::File.join(node['devbox']['home'], ".#{f}") do
    source f
    owner node['devbox']['user']
    group node['devbox']['user']
  end
end

oh_my_zsh = ::File.join(node['devbox']['home'], '.oh-my-zsh')

git oh_my_zsh do
  repository 'https://github.com/josephglanville/oh-my-zsh'
  user node['devbox']['user']
  group node['devbox']['user']
  action :checkout
  not_if { File.exist? oh_my_zsh }
end

execute "set zsh as shell for #{node['devbox']['user']}" do
  command "chsh -s /usr/bin/zsh #{node['devbox']['user']}"
  not_if { node['etc']['passwd'][node['devbox']['user']]['shell'] == '/usr/bin/zsh' }
end
