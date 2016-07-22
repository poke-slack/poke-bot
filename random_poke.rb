class RandomPoke
  POKES = ['Blastoise.png','Caterpie.png','Pidgeot.png','Pidgey.png','Rattata.png','avatar.png','charizard.jpg','charmeleon.jpg','metapod.png','venusaur.jpg','Beedrill.png','Butterfree.png','Kakuna.png','Pidgeotto.png','Raticate.png','Weedle.png','bulbasaur.jpg','charmander.jpg','ivysaur.jpg']

  def self.perform(client,channel_name)
    self.new.perform(client,channel_name)
  end

  def perform(client,channel_name)
    poke_file = POKES.sample
    poke_name = poke_file.split(".")[0]

    puts "picked pokemon: #{poke_name}"

    puts "uploading!"

    result = client.web_client.files_upload(
        channels: "#{channel_name}",
        as_user: true,
        file: Faraday::UploadIO.new("resources/#{poke_file}", 'image/jpg'),
        title: poke_name,
        filename: poke_file,
        initial_comment: "spotted: #{poke_name}"
    )


    sleep 30.seconds

    client.web_client.files_delete(file: result.file.id)
debugger
    client.web_client.message channel: channel_name, text: "Sorry! You missed a #{poke_name}"


    puts result.inspect
    puts result
  end
end
