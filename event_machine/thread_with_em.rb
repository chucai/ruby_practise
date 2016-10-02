require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)

#EventMachine.run do
  #puts 'EM start'

  #EM.stop
#end

# EM只要在进程中启动就行了，不需要将EM的代码写在block中
Thread.new { EventMachine.run { sleep 10 } } unless EventMachine.reactor_running?
Thread.pass unless EventMachine.reactor_running?

EventMachine.add_periodic_timer( 1 ) { $stderr.write "$" }

sleep
