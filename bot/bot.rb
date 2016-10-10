class Bot < SlackRubyBot::Bot
  @id = 0

  def self.next_id
    @id = @id % 10 + 1
  end

  command 'say' do |client, data, match|
    Rails.cache.write next_id, { text: match['expression'] }
    client.say(channel: data.channel, text: match['expression'])
  end
  
  match(/^(.*)$/i) do |client, data, match|
    client.say(channel: data.channel, text: "I'm going to post that to the internet! (#{match[:location]})")
  end
end
