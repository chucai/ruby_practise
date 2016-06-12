require 'pry'

## 类实例变量 会保护数据，类变量 无法保护数据，所以在写宏的时候，建议使用类实例变量来保存数据
@@business_attrs = 'test'

@var2 = true

class Main
  # 类变量的定义 和 初始化
  @@business_attrs = []

  @var2 = []

  class << self
    attr_accessor :var1

    @var1 = []
  end

  # 宏 其实就是 类方法
  def self.attr_business(*attr)
    # 将数据保存在类变量上
    @@business_attrs = attr
    @var2 = attr
  end

  attr_business :name, :username, :password
end

Main.class_variable_get("@@business_attrs") == [:name, :username, :password]
puts "*" * 20
puts Main.instance_variable_get("@var2") == [:name, :username, :password]

# 如下的值等于 [:name, :username, :password] 类变量会出现在继承树中，所以 类变量要慎用
puts @@business_attrs
puts @var2

