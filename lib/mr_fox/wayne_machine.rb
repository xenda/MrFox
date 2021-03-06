require 'net/http'
require 'uri'

module MrFox
  class WayneMachine

    def initialize(app)
      @app = app
    end
    
    def call(env)
      dup._call(env)
    end
    
    def _call(env)

      # SEND STUFF TO MrFox WayneMachine
      @starting = Time.now
      @status, @headers, @response = @app.call(env)
      @stopping = Time.now

      params = {:record => 
                  { :status => @status, 
                    :headers => @headers, 
                    :response => @response
                  }  
                }
      
      # UPDATE STUFF ON Mr Fox WayneMachine
      Net::HTTP.post_form(URI.parse('http://mr-fox-server.dev/records.json'),params)
      [@status, @headers, self]      
    end
    
    def each(&block)


      unless [304,404,500].include? @status        
        if @headers['Content-Type'].include? "text/html"
          block.call("<!-- Watched by MrFox. Rendered in #{@stopping - @starting}ms -->\n")
        end
      end
      @response.each(&block)
    end
    
  end
end