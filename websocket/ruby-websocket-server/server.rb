require 'eventmachine'
require 'websocket-eventmachine-server'

$client_number = 0

EM.run do

  WebSocket::EventMachine::Server.start(:host => "0.0.0.0", :port => 8080) do |ws|
    ws.onopen do
      $client_number += 1
      puts "Client connected: #{$client_number}"
    end

    ws.onmessage do |msg, type|
      puts "Received message: #{msg}"
      ws.send msg, :type => type
    end

    ws.onclose do
      $client_number -= 1
      puts "Client disconnected"
    end
  end

end
