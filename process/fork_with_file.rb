require 'pry'

f = File.open("test.txt", "a+")

fork do
  puts "child"
  puts f.object_id
  f.write "hello"
  puts f.object_id
  puts f.fileno
  f.close
end


sleep 2

puts f.object_id
puts f.fileno

puts f.readlines
