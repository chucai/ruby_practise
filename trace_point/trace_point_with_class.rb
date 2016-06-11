require 'pry'

trace = TracePoint.new(:class) do |tp|
  binding.pry
  p [tp.lineno, tp.event]
  p tp.inspect
end

trace.enable do
  class TestKlass; def initialize; @x = 1; end; end
  TestKlass.new
end

