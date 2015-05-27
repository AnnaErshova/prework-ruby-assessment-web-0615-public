describe "Arrays" do
  languages = ["Ruby", "JavaScript", "HTML"]

# can also use <<
# adds to the end of the array
# or this syntax languages.push("Python")
  it 'adds an element to an array' do
    languages.push "Python"
    expect(languages.count).to eq(4) 
  end

# use 'puts' as the easiest way to print it out
  it 'prints out all the elements in the array' do
    expect(STDOUT).to receive(:puts).with(languages)
    puts languages
  end

# standard format: array_name[index] => returns what is stored in the array under that index
  it 'returns the value at index 1' do
    expect(languages[1]).to eq("JavaScript")
  end

# standard format: array_name.index('value_name')
  it 'returns the index for the value "HTML"' do 
    expect(languages.index('HTML')).to eq(2)
  end
end

