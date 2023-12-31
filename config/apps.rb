##
# This file mounts each app in the Padrino project to a specified sub-uri.
# You can mount additional applications using any of these commands below:
#
#   Padrino.mount('blog').to('/blog')
#   Padrino.mount('blog', :app_class => 'BlogApp').to('/blog')
#   Padrino.mount('blog', :app_file =>  'path/to/blog/app.rb').to('/blog')
#
# You can also map apps to a specified host:
#
#   Padrino.mount('Admin').host('admin.example.org')
#   Padrino.mount('WebSite').host(/.*\.?example.org/)
#   Padrino.mount('Foo').to('/foo').host('bar.example.org')
#
# Note 1: Mounted apps (by default) should be placed into the project root at '/app_name'.
# Note 2: If you use the host matching remember to respect the order of the rules.
#
# By default, this file mounts the primary app which was generated with this project.
# However, the mounted app can be modified as needed:
#
#   Padrino.mount('AppName', :app_file => 'path/to/file', :app_class => 'BlogApp').to('/')
#

##
# Setup global project settings for your apps. These settings are inherited by every subapp. You can
# override these settings in the subapps as needed.
#
Padrino.configure_apps do
  # enable :sessions
  # set :session_secret, '0948bac113a27084bfe987ce678ccf72cb595d76a6b45bfd06b9d11be0de220c'
  # set :protection, :except => :path_traversal
  # set :protect_from_csrf, true
  set :server, :puma
  set :reload, true
  set :autoload_paths, %w[app/models app/helpers app/controllers app/graphql app/graphql/types]
  use Rack::Cors do
    allow do
      origins '*'
      resource '*', headers: :any, methods: [:get, :post, :put, :delete, :options]
    end
  end
end

# Padrino::Application.configure do |app|
#   app.set :autoload_paths, %w[app/models app/helpers app/controllers app/graphql]
# end

# Padrino.configure do |app|
#   set :autoload_paths, %w[app/models app/helpers app/controllers app/graphql]
# end

# Mounts the core application for this project
Padrino.mount('EmployeeApiPadrino::App', :app_file => Padrino.root('app/app.rb')).to('/')
