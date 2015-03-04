require 'ostruct'

class Scorecard
  def self.create(scores: nil, user: nil)
    new(user: user)
      .create(scores)
  end

  def initialize(user: nil)
    @user = user
  end

  def create(scores)
    scores.each do |score|
      score_obj = OpenStruct.new(score)
      Score.create(team_id: score_obj.id,
        user: user,
        value: score_obj.score)
    end
  end

  private
  attr_reader :user
end
