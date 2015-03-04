require 'models/users/import'
require 'models/users/stable'

describe Users::Import do
  before do
    class_double('Users::Stable').as_stubbed_const
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
    allow(Users::Stable).to receive(:all) { user_list }
    expect(user_factory).to receive(:create).exactly(2).times

    Users::Import.run(user_factory)
  end
end
