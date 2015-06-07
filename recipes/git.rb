include_recipe 'git'

%w(gitconfig gitignore).each do |f|
  cookbook_file ::File.join(node['devbox']['home'], ".#{f}") do
    source f
    owner node['devbox']['user']
    group node['devbox']['user']
  end
end
