require 'spec_helper'

describe V1::UsersController do
  let(:user)      { create :user }

  describe '#index' do
    before {
      create :user
      api_get user, :index
    }

    it_behaves_like 'API request'
    it_behaves_like 'API array response with length', 2
    it_behaves_like 'API array response with keys', %w(id name email)
  end

  describe '#show' do
    before { api_get user, :show, id: user.id }

    it_behaves_like 'API response with keys', %w(id name email)

    it 'returns user' do
      expect(obj_response.id).to eq user.id.to_s
    end
  end
end
