require 'slack-ruby-client'
require 'logging'
require 'byebug'
require_relative 'random_poke.rb'

logger = Logging.logger(STDOUT)
logger.level = :debug

Slack.configure do |config|
  config.token = ENV['SLACK_TOKEN']
  if not config.token
    logger.fatal('Missing ENV[SLACK_TOKEN]! Exiting program')
    exit
  end
end

while true do
  begin
    client = Slack::RealTime::Client.new

    channel = client.web_client.channels_list.channels.sample
    channel_name = channel.name

    puts "picked channel: #{channel_name}"

    client.web_client.channels_join({name: channel_name})


    RandomPoke.perform(client,channel_name)

    sleep 30
  rescue StandardError => e
    puts "EROR!"
    puts e.message
    puts e.backtrace
  end
end
