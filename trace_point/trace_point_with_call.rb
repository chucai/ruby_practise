class C; def foo; end; end

trace = TracePoint.new(:call) do |tp|
  p [tp.lineno, tp.method_id, tp.defined_class]
end

trace.enable do
  C.new.foo
end
