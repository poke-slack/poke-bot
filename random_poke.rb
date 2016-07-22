class RandomPoke
  POKES = ['Blastoise.png','Caterpie.png','Pidgeot.png','Pidgey.png','Rattata.png','avatar.png','charizard.jpg','charmeleon.jpg','metapod.png','venusaur.jpg
Beedrill.png','Butterfree.png','Kakuna.png','Pidgeotto.png','Raticate.png','Weedle.png','bulbasaur.jpg','charmander.jpg','ivysaur.jpg']

  def self.perform(client)
    self.new.perform(client)
  end

  def perform(client)
    poke = POKES.sample

    client.web_client.files_upload(
        channels: '#general',
        as_user: true,
        file: Faraday::UploadIO.new("resources/#{poke}", 'image/jpg'),
        title: poke,
        filename: poke,
        initial_comment: "spotted: #{poke}"
    )
  end
end
