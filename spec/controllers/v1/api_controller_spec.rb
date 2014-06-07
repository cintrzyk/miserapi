require 'spec_helper'

describe V1::APIController do
  describe '#authenticate!' do
    subject { V1::APIController.new }

    context 'when successful authentication by token' do
      before { allow(subject).to receive(:authenticate_token).and_return(true) }

      it 'calls authenticate_token' do
        expect(subject).to receive(:authenticate_token)
        subject.authenticate!
      end
    end

    context 'when authentication by token has been failed' do
      before {
        allow(subject).to receive(:authenticate_token).and_return(false)
        allow(subject).to receive(:render).and_return(true)
        allow(subject).to receive(:headers).and_return({})
      }

      it 'calls render_unauthorized' do
        expect(subject.headers).to receive(:[]=).with('Authorization', "Token miser='token'")
        expect(subject).to receive(:render).with({
          json: { error: 'bad credentials' },
          status: 401
        })
        subject.authenticate!
      end
    end
  end
end
