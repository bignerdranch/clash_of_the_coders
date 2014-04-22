require 'spec_helper'
require 'scorecard'

describe Scorecard do
  before do
    stub_const('Score', Class.new)
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
