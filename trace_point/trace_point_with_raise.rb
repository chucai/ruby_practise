trace = TracePoint.new(:raise) do |tp|
  binding.pry
  p [tp.lineno, tp.event, tp.raised_exception]
end

trace.enable

0 / 0
