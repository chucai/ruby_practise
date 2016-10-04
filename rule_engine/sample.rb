require 'rubygems'
require 'wongi-engine'

engine = Wongi::Engine.create

engine << [ 'Alice', 'friend', 'Bob' ]
engine << [ 'Bob', 'friend', 'Jobh' ]
engine << [ 'Luce', 'friend', 'Alice' ]
engine << [ 'Alice', 'age', 35 ]

# iterator
engine.each "Alice", :_, :_ do |item|
  puts "Alice's #{item.predicate} is #{item.object}"
end

# rule
#   一级关系
friends = engine.rule "friends" do
  forall {
    has :PersonA, "friend", :PersonB
  }
end

friends.tokens.each do |token|
  puts "%s and %s are friends" % [ token[:PersonA], token[:PersonB] ]
end

# rule
#   二级关系
remote = engine.rule "remote friends" do
  forall {
    has :PersonA, "friend", :PersonB
    has :PersonB, "friend", :PersonC
  }
end

remote.tokens.each do |token|
  puts "%s and %s are friends through %s" % [ token[ :PersonA ], token[ :PersonC ], token[ :PersonB ] ]
end
