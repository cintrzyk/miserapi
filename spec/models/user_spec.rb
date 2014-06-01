require 'spec_helper'

describe User do
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  it { should validate_uniqueness_of :auth_token }
  it { should validate_format_of(:email).not_to_allow 'invalid@email' }
  it { should be_timestamped_document }
  it { should validate_length_of(:password).greater_than 6 }
end
