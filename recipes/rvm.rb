node.set['rvm']['installs'] = {
  node['devbox']['user'] => true
}

execute 'install RVM gpg key' do
  command "gpg --keyserver hkp://keys.gnupg.net --recv-keys #{node['rvm']['gpg_key']}"
  user node['devbox']['user']
  environment 'HOME' => node['devbox']['home']
  not_if "gpg -k #{node['rvm']['gpg_key']}",
    user: node['devbox']['user'],
    environment: {
      'HOME' => node['devbox']['home']
    }
end

include_recipe 'rvm::user'

rvm_ruby node['devbox']['ruby'] do
  user node['devbox']['user']
  install_options binary: true
end
