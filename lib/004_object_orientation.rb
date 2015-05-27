# Goals: keeps track of how many instances of school have been created; can count how many schools have been created; can reset schools that have been created;
# Names of methods: count; all; reset_all; add_student; remove_student -- these are all from the spec file


class School #name as per spec file
    
    # starting off with school count at zero and an empty array; we will then return to that state when re-setting
    @@count = 0
    @@instance = []
    
    #can play around with either attr_reader or attr_accessor
    attr_reader :ranking, :name, :location, :instructors, :students
        #spec code communicates intent for reader to not be able to change school ranking, so ranking has to be under attr_reader -- passes test
    
    #can see the spec file expects 3 initializes pertaining to a school: name, location, ranking
    def initialize(name, location, ranking)
        # initializes with a name, location, ranking -- passes test
        @name = name
        @location = location
        @ranking = ranking
        
        # empty array of students, empty array of instructors -- passes test
        @students = []
        @instructors = []
        
        @@count += 1 #increments by 1 each time
        @@instance << self #pushes current school into what was an empty school_instances array
    end
    
    #---
    # three methods below are for keeping track of instance, counting, and resetting.
 
    # @@instance = [] also passes the test, but that must be tautonomous as we have already intialized as an empty array
    def self.all
        @@instance
    end

    def self.count
        @@count
    end

    #ok -- passes test
    #returns school count to zero and empties the instances array
    def self.reset_all
        @@count = 0
        @@instance = []
    end
    #---

    #---
    # two methods below are for manipulating students array: adding and deleting from it
    # add a student, given name, grade, semester
    def add_student(name, grade, semester)
        @students << {:name => name, :grade => grade, :semester => semester}
    end
    
    # removes a student, given a name
    def remove_student(name)
        @students.delete_if {|to_del| to_del[:name] == name}
    end
    #---

end #end of class School
