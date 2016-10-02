puts "parent: %d" % Process.pid

rd, wr = IO.pipe

tempid = fork do
  puts "fork: %d" % Process.pid
  rd.close

  Process.setsid

  exit if pid = fork

  puts "fork: fork: %d" % Process.pid

  wr.write Process.pid
  wr.close

  sleep 10
  puts "yes, i'm child child"

  exit

end

wr.close
pid = rd.read.to_i
puts pid
rd.close

Process.waitpid tempid

puts "after waitpid"
