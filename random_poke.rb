class RandomPoke
  POKES = ['Blastoise.png','Caterpie.png','Pidgeot.png','Pidgey.png','Rattata.png','avatar.png','charizard.jpg','charmeleon.jpg','metapod.png','venusaur.jpg','Beedrill.png','Butterfree.png','Kakuna.png','Pidgeotto.png','Raticate.png','Weedle.png','bulbasaur.jpg','charmander.jpg','ivysaur.jpg']

  def self.perform(client,channel_name)
    self.new.perform(client,channel_name)
  end

  def perform(client,channel_name)
    poke = POKES.sample

    puts "picked pokemon: #{poke}"

    puts "uploading!"

    client.web_client.files_upload(
        channels: "#{channel_name}",
        as_user: true,
        file: Faraday::UploadIO.new("resources/#{poke}", 'image/jpg'),
        title: poke,
        filename: poke,
        initial_comment: "spotted: #{poke}"
    )
  end
end
