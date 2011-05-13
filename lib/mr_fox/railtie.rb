require 'mr_fox/middleware'

module MrFox
  class Railtie < Rails::Railtie
    initializer "mr_fox.insert_middleware" do |app|
      app.config.middleware.use "MrFox::Middleware"
    end
  end
end