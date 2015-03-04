require 'models/scorecard'

describe Scorecard do
  before do
    class_double('Score').as_stubbed_const
  end
  let(:user) { double('User', id: 1) }

  it 'creating a batch of scores' do
    scores = [{id: 1, score: 90},
      {id: 2, score: 95}]

    expect(Score).to receive(:create)
      .exactly(2).times
    scorecard = Scorecard.new(user: user)
    scorecard.create(scores)
  end
end
