require 'models/scoring/validator'

describe Scoring::Validator do
  let(:team_factory) { double('Team') }
  let(:score_factory) { double('Score') }
  let(:user) { double('User', id: 1) }
  let(:team_1) { double('Team', id: 1) }
  let(:team_2) { double('Team', id: 2) }
  let(:team_1_score) { double('Scores', team_id: team_1.id, score: 10) }
  let(:team_2_score) { double('Scores', team_id: team_2.id, score: 20) }
  let(:scores) { [team_1_score, team_2_score] }

  it 'is valid when user has voted for every team once' do
    allow(team_factory).to receive(:in_same_year).with(team_1.id) { [team_1, team_2] }

    validator = Scoring::Validator.new(scores: scores,
      team_factory: team_factory,
      score_factory: score_factory,
      user: user)

    expect(validator.valid?).to be true
  end

  it 'is invalid if a score is greater than the max allowed score of 85' do
    allow(team_factory).to receive(:in_same_year).with(team_1.id) { [team_1] }
    big_score = double('Score', team_id: team_1.id, score: 86)
    validator = described_class.new(scores: [big_score], team_factory: team_factory)

    expect(validator.valid?).to be false
  end
end
