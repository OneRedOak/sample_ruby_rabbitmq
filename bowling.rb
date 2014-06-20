require 'bunny'

class Bowling
  @var = ""

  def hit()
    conn = Bunny.new(:automatically_recover => false)
    conn.start

    ch   = conn.create_channel
    q    = ch.queue("hello")

    begin
      puts " [*] Waiting for messages. To exit press CTRL+C"
      q.subscribe(:block => true) do |delivery_info, properties, body|
        @var = body
        puts " [x] Received #{body}"
        conn.close
        exit(0)
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

