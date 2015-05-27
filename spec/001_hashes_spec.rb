describe "Hashes" do
  language = {:name => "Ruby", :creator => "Yukihiro Matsumoto"}

# standard format: hash_name[:'keyname'] = 'value'
  it 'adds a new key for type and give it the value "dynamic"' do
      language[:"type"] = "dynamic"
    expect(language[:type]).to eq("dynamic")
  end

# iterates through items in the hash, assignes keys as 'key', values as 'value', then uses puts to print them out
# important to remember " " after puts
# otput will have each key-value pair on a separate line
# alternative: language.each {|key, value| puts "#{key}: #{value}"}
  it 'prints out all the key/value pairs in the hash' do
    expect(STDOUT).to receive(:puts).with("name: Ruby")
    expect(STDOUT).to receive(:puts).with("creator: Yukihiro Matsumoto")
    expect(STDOUT).to receive(:puts).with("type: dynamic")
    language.each do |key,value|
        puts "#{key}: #{value}"
    end
  end

# standard format: hash_name[:'keyname'] will result in value
# is it the same as using language[:"name"]? Output seems to be the same.
  it 'returns the value given key name' do
      expect(language[:name]).to eq("Ruby")
  end

# standard format: hash_name.key("value_name") will result in key
  it 'returns the key creator given the value' do
    expect(language.key("Yukihiro Matsumoto")).to eq(:creator)
  end
end
