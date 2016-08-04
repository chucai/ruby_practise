class User < ActiveRecord::Base
  cattr_accessor :value

  @@value = 1
end
