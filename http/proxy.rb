class Proxy
  attr_accessor :ip, :port

  def initialize(ip, port)
    @ip = ip
    @port = port
  end

  def to_s
    "%s %s\n" % [@ip, @port]
  end
end


