require 'bunny'

class Bowling
  @var = "pre"

  def hit()
    conn = Bunny.new(:automatically_recover => false)
    conn.start
    ch   = conn.create_channel
    q    = ch.queue("hello")
    begin
      ch.default_exchange.publish("Hello World!", :routing_key => q.name)
      consumer = q.subscribe(:block => true) do |delivery_info, properties, body|
        @var = body
        conn.close
      end
    rescue Interrupt => _
      conn.close
      exit(0)
    end
  end

  def score
  	return @var
  end
end
