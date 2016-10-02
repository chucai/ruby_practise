require 'socket'

Socket.tcp_server_loop(4888) do |connection|
  puts "connnection"
  sleep 5

  connection.close
end
