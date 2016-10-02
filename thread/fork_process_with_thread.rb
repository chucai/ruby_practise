def spawn_thread(number)
  Thread.new {
    puts "spawn_thread... #{number}"
  }
end


fork {
  spawn_thread(2)
}

spawn_thread(1)

sleep 10

