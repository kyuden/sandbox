require 'socket'

def run
  simple_server = TCPServer.new("0.0.0.0", 8080)

  loop do
    connection = simple_server.accept
    handle connection
  end
end

def get_request(connection)
  connection.gets
end

def process(request)
  "OK"
end

def handle(connection)
 request = get_request connection
 response = process request
 connection.puts response
 connection.close
end

run