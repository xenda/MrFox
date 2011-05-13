require 'mr_fox/wayne_machine'

module MrFox
  class Railtie < Rails::Railtie
    
    initializer "MrFox.insert_middleware" do |app|
      app.config.middleware.use "MrFox::WayneMachine"
    end
  end
end