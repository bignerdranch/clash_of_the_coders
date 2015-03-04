require 'models/scoring/processor'

describe Scoring::Processor do
  let(:user) { double('User', id: 1) }
  let(:scores) { Array[double('TeamScore', team_id: 1, score: 10),
      double('TeamScore', team_id: 2, score: 20)] }
  let(:score_factory) { double('Score') }
  let(:config) { Scoring::Configuration.new(scores: scores,
      score_factory: score_factory,
      user: user) }

  describe '#save' do
    let(:processor) { Scoring::Processor.new(config) }

    it 'creates a Score for each team' do
      expect(score_factory).to receive(:create)
        .exactly(2).times
      processor.save
    end


    it 'returns true' do
      allow(score_factory).to receive(:create)
        .exactly(2).times
      .and_return(true)

      expect(processor.save).to be_truthy
    end
  end
end
