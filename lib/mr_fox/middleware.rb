module MrFox
  class Middleware

    def initialize(app)
      @app = app
    end

    def call(env)
      [200, {"Content-type"=> "text/html"}, "Hello World"]
    end
    
  end
end