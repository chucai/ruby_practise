require 'faraday'

proxy = "http://173.161.0.227:80"
connection = Faraday.new(:proxy => proxy)
#connection = Faraday.new
response = connection.get("http://www.csdn.net/")
puts response.status
