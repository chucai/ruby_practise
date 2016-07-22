require 'ostruct'
require 'date'
require 'gruff'
require 'pry'

records = []

position = 0
delta = 6
lines = File.readlines("7.txt")

while position < lines.size
  record = OpenStruct.new(
    start_at:      lines[position].chomp,
    stop_at:       lines[position+1].chomp,
    business_name: lines[position+2].chomp,
    origin_money:  lines[position+3].chomp,
    type:          lines[position+4].chomp,
    money:         lines[position+5].chomp.gsub(/[^-\d\.]/, '').to_f
  )
  records << record if record.money > 0
  position += delta
end

def print_record(record)
  puts record.start_at + '  ' + record.business_name + '  '+ record.money.to_s
end

puts "一共花费: #{ records.map(&:money).inject(0) { |sum, item| sum += item } }"
puts "排名前20的花费:"
records.sort! { |x, y| y.money <=> x.money }
(0..19).to_a.each do |i|
  print_record records[i]
end

more_than_100_records = records.select { |item| item.money >= 100 }
puts "消费上100的单子有: #{more_than_100_records.count}"
puts "    一共花销了: #{more_than_100_records.map(&:money).inject(0) { |sum, item| sum += item } }"

# 统计出每天的消费的图表
current_month = 6
labels = {}
dateset = {}

g = Gruff::Bar.new(2000)
g.title = "day records"
at_the_begin_of_day = Date.parse("2016-06-19")
at_the_begin_of_day.step(at_the_begin_of_day.next_month).each do |date|
  mday = date.mday
  date_key = date.strftime("%Y-%m-%d")
  value = records.select { |item| item.start_at == date_key }.inject(0.0) { |sum, item| sum += item.money  }
  dateset[mday] = [value]
  labels[mday] = date_key
end
dateset.each do |k, v|
  g.data(k, v)
end
g.labels = labels

g.write('day.png')
