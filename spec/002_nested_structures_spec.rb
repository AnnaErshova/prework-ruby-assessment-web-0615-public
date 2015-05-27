# this is a hash where some values are arrays that have hashes inside them

describe "Nested Structures" do
  school = {
  :name => 'Happy Funtime School',
  :location => 'NYC',
  :instructors => [
    {:name=>'Blake', :subject=>'being awesome' },
    {:name=>'Steven', :subject=>'being better than blake'},
    {:name=>'Jeff', :subject=>'karaoke'}
  ],
  :students => [
    {:name => 'Marissa', :grade => 'B'},
    {:name=>'Billy', :grade => 'F'},
    {:name => 'Frank', :grade => 'A'},
    {:name => 'Sophie', :grade => 'C'}
  ]
  }

# will add this to the name of the hash
  it 'adds a key to the school hash called "founded_in" and sets it to the value 2013' do
      school[:founded_in] = 2013
    expect(school[:founded_in]).to eq(2013)
  end

# calls on the hash (school) first, then on the student key, where the value is an array that has hashes inside it. It then adds a hash with key-value pair to that array.
# alternative: use 'push'
  it 'adds a student to the school student array' do
      school[:students] << {:name => 'Anna', :grade => 'A'}
    expect(school[:students].count).to eq(5)
  end
  
# using one of several available methods to delete == this one deletes from the 2nd absolute position in the students array, so Frank moves up to the 2nd position
  it 'removes "Billy" from the student array' do
      school[:students].delete_at(1)
    expect(school[:students][1]).to eq({:name => 'Frank', :grade => 'A'})
  end

# iterates over student hashes and adds a semester key
# alternative: school[:students][0..3].each {|student| student[:semester] = "Summer"}
  it 'adds a key to every student in the students array called "semester" and assign it the value "Summer"' do
      school[:students].each do |student|
          student[:semester] = "Summer"
      end
    expect(school[:students][0].has_key?(:semester)).to eq(true)
  end

# calls on the instructor at 2nd absolute position in the instructors array because we know where it is located
# alternative use gsub! like in CodeAcademy. Something like this: school[:instructors][1][:subject].gsub!(/being better than blake/, "being almost better than Blake") // Blake is not capitalized in what we are subbing
  it "changes Steven's subject to 'being almost better than Blake'" do
      school[:instructors][1][:subject] = "being almost better than Blake"
    expect(school[:instructors][1][:subject]).to eq("being almost better than Blake")
  end

# we know Frank has moved up to 2nd absolute position, so we update his grade from there; simply recall the grade and replace it with a new variable
  it "changes Frank's grade from 'A' to 'F'" do
    school[:students][1][:grade] = "F"
    expect(school[:students][1][:grade]).to eq('F')
  end

# this is a 'hack' because we just return name of a student in that 1st absolute position in the array. Alternatively, we could search for a student with a matching value of 'B' is we were confident was featured only once among students
  it "returns the name of the student with a 'B'" do
      expect(school[:students][0][:name]).to eq("Marissa")
    end

# this is a 'hack' because we just return subject of the instructor in the 3rd absolute position by recalling his key => returns value
  it "returns the subject of the instructor 'Jeff'" do
    expect(school[:instructors][2][:subject]).to eq("karaoke")
  end
end
