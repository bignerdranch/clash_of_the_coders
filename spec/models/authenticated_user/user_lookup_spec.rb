require 'spec_helper'
require 'active_support/core_ext/object/blank'
require 'authenticated_user/user_lookup'

describe AuthenticatedUser::UserLookup do
  let(:email) { 'fake@email.com' }
  let(:stable_auth) { instance_double('AuthenticatedUser::StableAuth') }
  let(:user_factory) { double('User') }
  let(:user) { double('User') }
  let(:user_lookup) { AuthenticatedUser::UserLookup.new(stable_auth,
      user_factory: user_factory) }

  it 'returns an existing user when there is one with the given email address' do
    allow(stable_auth).to receive(:email)
      .and_return(email)
    allow(user_factory).to receive(:where)
      .with(email: email)
      .and_return([user])

    expect(user_lookup.run).to eq(user)
  end

  it 'returns a newly created user when there is not user with the email address' do
    allow(stable_auth).to receive(:email)
      .and_return(email)
    allow(stable_auth).to receive(:name)
      .and_return('any name')
    allow(stable_auth).to receive(:uid)
      .and_return(1)
    allow(user_factory).to receive(:where)
      .with(email: email)
      .and_return(Array.new)
    allow(user_factory).to receive(:create)
      .and_return(user)

    expect(user_lookup.run).to eq(user)
  end
end
