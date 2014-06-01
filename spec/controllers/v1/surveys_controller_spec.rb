require 'spec_helper'

describe V1::SurveysController do
  let(:user)   { create :user }
  let(:survey) { create :survey, user: user }

  describe '#index' do
    before {
      create :survey, user: user
      create :survey
      survey
      api_get user, :index
    }

    it_behaves_like 'API request'
    it_behaves_like 'API array response with length', 2
    it_behaves_like 'API array response with keys', %w(id name)
  end

  describe '#show' do
    before { api_get user, :show, id: survey.id }

    it_behaves_like 'API response with keys', %w(id name)

    it 'returns survey' do
      expect(obj_response.id).to eq survey.id.to_s
    end
  end

  describe '#create' do
    context 'with valid params' do
      let(:survey_params) { { survey: { name: 'IQ test'} } }

      before { api_post user, :create, survey_params }

      it_behaves_like 'API request', 201
      it_behaves_like 'API response with keys', %w(id name)

      it 'returns created survey' do
        expect(obj_response.name).to eq 'IQ test'
      end

      it 'belongs to current_user' do
        expect(Survey.find(obj_response.id).user).to eq user
      end
    end

    context 'with invalid params' do
      let(:survey_params) { { survey: { name: ''} } }

      before { api_post user, :create, survey_params }

      it_behaves_like 'API request', 422
      it_behaves_like 'API response with keys', 'errors'

      it "returns validation error msg on name" do
        expect(obj_response.errors.name).to include "can't be blank"
      end
    end
  end

  describe '#update' do
    context 'with valid params' do
      let(:new_name) { 'Test iq best' }
      let(:survey_params) { { id: survey.id, survey: { name: new_name} } }

      before { api_put user, :update, survey_params }

      it_behaves_like 'API request'
      it_behaves_like 'API response with keys', %w(id name)

      it "updates survey's name" do
        expect(survey.name).to_not eq new_name
        expect(obj_response.name).to eq new_name
      end
    end

    context 'with invalid params' do
      let(:survey_params) { { id: survey.id, survey: { name: ''} } }

      before { api_put user, :update, survey_params }

      it_behaves_like 'API request', 422
      it_behaves_like 'API response with keys', 'errors'

      it "returns validation error msg on name" do
        expect(obj_response.errors.name).to include "can't be blank"
      end
    end
  end
end
