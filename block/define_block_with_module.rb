module A

  def method_a
    p = lambda {
      render
    }
    p
  end

  def render
    puts "A.render"
  end
end

class AController
  #include A
  prepend A

  def render
    puts "Acontroller.render"
  end
end


def render
  puts "Main.render"
end

AController.new.method_a.call
