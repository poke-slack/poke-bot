class RandomPoke
  POKES = ['Blastoise.png','Caterpie.png','Pidgeot.png','Pidgey.png','Rattata.png','avatar.png','charizard.jpg','charmeleon.jpg','metapod.png','venusaur.jpg','Beedrill.png','Butterfree.png','Kakuna.png','Pidgeotto.png','Raticate.png','Weedle.png','bulbasaur.jpg','charmander.jpg','ivysaur.jpg']

  def self.perform(client,channel_name)
    self.new.perform(client,channel_name)
  end

  def perform(client,channel_name)
    poke_file = POKES.sample
    poke_name = poke_file.split(".")[0]

    puts "picked pokemon: #{poke_name}"

    puts "uploading to channel #{channel_name}!"

    result = client.web_client.files_upload(
        channels: "#{channel_name}",
        as_user: true,
        file: Faraday::UploadIO.new("resources/#{poke_file}", 'image/jpg'),
        title: poke_name,
        filename: poke_file,
        initial_comment: "spotted: #{poke_name}"
    )
    return result,poke_name
  end
end
