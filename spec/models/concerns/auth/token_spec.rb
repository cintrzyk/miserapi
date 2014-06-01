require 'spec_helper'

describe Concerns::Auth::Token do

  let (:test_class) do
    Struct.new(:first_name, :last_name) { include Concerns::Auth::Token }
  end

  let (:with_token) { test_class.new("Stewart", "Home") }

  it "has a full_name" do
    puts 'yah!', with_token
  end

end
