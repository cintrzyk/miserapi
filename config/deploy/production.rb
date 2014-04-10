set :branch, :master

server '188.226.144.35',
  user: 'miserapi',
  roles: %w{web app db},
  ssh_options: {
    forward_agent: true
  }
