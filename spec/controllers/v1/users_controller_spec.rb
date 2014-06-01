require 'spec_helper'

describe V1::UsersController do
  let(:user)  { create :user }
  let(:user2) { create :user }

  describe '#index' do
    subject { get :index }

    before { subject }

    it 'returns list of all users' do
      expect(json_response).to eq({})
    end
  end

  describe '#show' do

  end
end
