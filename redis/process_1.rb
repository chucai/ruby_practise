require 'redis'
require 'thread'

$redis = Redis.new # 使用默认的配置
$lock = Mutex.new

def do_self_work
  puts "我在做自己的工作"
  sleep 1
end

$queue = [] # 任务队列，全局变量，保存任务信息

def main

  # 新开一个线层读取redis 的数据
  Thread.new do
    $redis.subscribe 'read_book' do |on|
      on.subscribe do |channel, subscriptions|
        puts "建立链接... ..."
      end

      on.message do |channel, msg|
        $lock.synchronize do
          $queue << msg
        end
      end
    end
  end

  # 程序不会结束
  loop do
    unless $queue.empty?
      $lock.synchronize do
        value = $queue.shift
        puts value
      end
    end
    do_self_work
  end

end

main
