require 'pry'

trace = TracePoint.new(:class) do |tp|
  p [tp.lineno, tp.defined_class, tp.method_id, tp.event]
end

trace.enable do
  module TestKlass; end
end

