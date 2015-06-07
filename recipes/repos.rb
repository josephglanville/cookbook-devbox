file '/etc/apt/sources.list' do
  content '# APT sources are completely managed by sources.list.d'
end

apt_repository 'internode' do
  uri 'http://mirror.internode.on.net/pub/ubuntu/ubuntu/'
  arch 'amd64'
  distribution node['lsb']['codename']
  components %w(main multiverse universe restricted)
end
