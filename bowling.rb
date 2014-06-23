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
      puts " [x] Sent 'Hello World!'"
      puts " [*] Waiting for messages. To exit press CTRL+C"
      consumer = q.subscribe(:block => true) do |delivery_info, properties, body|
        @var = body
        puts " [x] Received #{body}"
        ch.close
      end
    rescue Interrupt => _
      conn.close

      exit(0)
    end
    puts "--------444444---------"
  end

  def score
  	return @var
  end
end
