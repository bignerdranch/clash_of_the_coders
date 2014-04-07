require 'spec_helper'
require 'users/import'

describe Users::Import do
  before do
    stub_const('Users::Stable', Class.new)
  end

  let(:user_1) { double('Users::Stable::Nerd',
      email: 'email@mail.com',
      attributes: Hash.new) }
  let(:user_2) { double('Users::Stable::Nerd',
      email: 'email@emails.com',
      attributes: Hash.new) }
  let(:user_list) { Array[user_1, user_2] }
  let(:user_factory) { double('User', where: Array.new) }

  it 'creates a user for every nerd in stable' do
    allow(Users::Stable).to receive(:all)
      .and_return(user_list)
    expect(user_factory).to receive(:create)
      .exactly(2).times

    Users::Import.run(user_factory)
  end
end
