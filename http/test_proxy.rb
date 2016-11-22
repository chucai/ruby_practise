require 'net/http'
require 'uri'
require_relative './proxy'


def test_connection(proxy)

  uri = URI.parse('http://google.com')
  proxy_uri = URI.parse("http://#{proxy.ip}:#{proxy.port}")

  http = Net::HTTP.new(uri.host, uri.port, proxy_uri.host, proxy_uri.port)

  request = Net::HTTP::Get.new(uri.request_uri)
  response = http.request(request)

  puts response.status
end

# return Array list
def get_proxies(file_name)
  File.readlines(file_name).map do |line|
    ip, port = line.gsub(/\n/, '').split(" ")
    proxy = Proxy.new(ip, port)
    yield proxy if block_given?
    proxy
  end
end

get_proxies('ip.txt') do |proxy|
  test_connection proxy
end

