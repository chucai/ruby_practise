require 'net/http'
require 'nokogiri'
require_relative './proxy'

def get(uri)
  http = Net::HTTP.get uri
  http
end

def parse(html)
  result = []
  html_doc = Nokogiri::HTML html

  html_doc.css('table').first.css('tbody').first.css('tr').each do |tr|
    ip = tr.css('td')[0].text
    port = tr.css('td')[1].text
    result << Proxy.new(ip, port)
  end

  result
end

def write(file_name, values)
  File.open(file_name, 'a') do |f|
    f << values.join('')
  end
end

1.upto(6).each do |index|
  url = "http://www.kxdaili.com/dailiip/1/#{index}.html"
  uri = URI.parse url

  write("ip.txt", parse(get(uri)))
end
