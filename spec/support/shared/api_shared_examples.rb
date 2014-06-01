shared_examples 'API request' do |status|
  it "has response status #{status ||= 200}" do
    expect(response.status).to eq status
  end

  it 'returns response with JSON Content-Type header' do
    expect(response.header['Content-Type']).to match /json/
  end
end

shared_examples 'API array response' do |keys|
  it 'returns an array' do
    expect(json_response.class).to be Array
  end
end

shared_examples 'API array response with length' do |length|
  it "equals #{length}" do
    expect(json_response.count).to eq length
  end
end

shared_examples 'API array response with keys' do |keys|
  keys = [keys] unless keys.is_a? Array
  it "has keys: #{keys.join(', ')}" do
    json_response.each { |h| expect_same_keys h, keys }
  end
end

shared_examples 'API response with keys' do |keys|
  keys = [keys] unless keys.is_a? Array
  it "has keys: #{keys.join(', ')}" do
    expect_same_keys json_response, keys
  end
end

def expect_same_keys hash, keys
  expect(hash.keys - keys).to be_empty
end
