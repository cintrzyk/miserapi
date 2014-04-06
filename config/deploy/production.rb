set :branch, :master

server 'miserapi.cinek.co',
  roles: %w{web app db},
  ssh_options: {
    forward_agent: true
  }
