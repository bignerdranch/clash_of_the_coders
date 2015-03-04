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
        learning_points: score_obj.learning_points,
        wizardry_points: score_obj.wizardry_points)
    end
  end

  private
  attr_reader :user
end
