class Bot < SlackRubyBot::Bot
  @id = 0

  def self.next_id
    @id = @id % 10 + 1
  end

  #command 'say' do |client, data, match|
  #  Rails.cache.write next_id, { text: match['expression'] }
  #  client.say(channel: data.channel, text: match['expression'])
  #end
  
  match /^(.*)$/ do |client, data, match|
    Rails.cache.write next_id, { text: match['message'] }
    client.say(channel: data.channel, text: "message")
  end
  
end
