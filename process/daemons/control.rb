#  ruby control.rb start
#  ruby control.rb restart
#  ruby control.rb stop

require 'pry'
require 'daemons'

Daemons.run_proc('sample.rb') do
  loop do
    sleep(5)
  end
end

