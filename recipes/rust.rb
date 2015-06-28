execute 'install-rust' do
  command 'curl -sSf https://static.rust-lang.org/rustup.sh | sh -s -- --channel=nightly -y'
end
