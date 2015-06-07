package 'vim'

%w(vimrc).each do |f|
  cookbook_file ::File.join(node['devbox']['home'], ".#{f}") do
    source f
    owner node['devbox']['user']
    group node['devbox']['user']
  end
end

bundle_dir = ::File.join(node['devbox']['home'], '.vim/bundle')

directory bundle_dir do
  owner node['devbox']['user']
  group node['devbox']['user']
  recursive true
end

vundler = ::File.join(bundle_dir, 'vundle.vim')

git vundler do
  repository 'https://github.com/gmarik/vundle.vim'
  user node['devbox']['user']
  group node['devbox']['user']
  action :checkout
  not_if { File.exist? vundler }
end

execute 'install vundle packages' do
  command "vim -c 'set shortmess=at' +PluginInstall +qa"
  user node['devbox']['user']
  group node['devbox']['user']
  environment 'HOME' => node['devbox']['home']
end
