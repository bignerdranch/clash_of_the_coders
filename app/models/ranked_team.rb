require 'active_support/core_ext/integer/inflections'

class RankedTeam < SimpleDelegator
  def initialize(team: nil, position: nil)
    @position = position
    super(team)
  end

  def position
    @position.ordinalize
  end
end
