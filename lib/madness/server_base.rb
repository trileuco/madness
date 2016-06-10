
module Madness

  class ServerBase < Sinatra::Application
    helpers ServerHelper

    config = Config.instance

    Sass::Plugin.options[:template_location] = 'styles'
    Sass::Plugin.options[:css_location] = 'public/css'
    Slim::Engine.set_options pretty: true

    use Sass::Plugin::Rack

    set :bind, config.bind
    set :port, config.port
    set :root, File.expand_path('../../', __dir__)
    set :views, File.expand_path('../../app/views', __dir__)
    set :public_folder, File.expand_path('../../app/public', __dir__)
  end

end