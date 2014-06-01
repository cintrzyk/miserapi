require 'spec_helper'

describe V1::UsersController do
  let(:user)  { create :user }
  let(:user2) { create :user }

  describe '#index' do
    subject { get :index }

    before { subject }

    it 'returns list of all users'
  end

  describe '#show' do
    subject { get :show, id: user.id }

    before { subject }

    it 'returns user'
  end
end
