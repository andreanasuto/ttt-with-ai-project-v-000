class Player
  attr_reader :token

  def initialize(token)
    player = Player.new(token)
    player.token = token
  end
end
