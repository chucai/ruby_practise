require 'redis'

$redis = Redis.new # 使用默认的配置

def do_self_work
  puts "我在做自己的工作"
  sleep 1
end

$queue = [] # 全局变量，保存任务信息

def main

  # 新开一个线层读取redis 的数据
  Thread.new do
    $redis.subscribe 'read_book' do |on|
      on.subscribe do |channel, subscriptions|
        puts "建立链接... ..."
      end

      on.message do |channel, msg|
        $queue << msg
      end
    end
  end

  # 程序不会结束
  loop do
    unless $queue.empty?
      value = $queue.shift
      puts value
    end
    do_self_work
  end

end

main
