
# passes the school variable to each of the methods to include it in scope.
# most of these shoudl really be asking for inputs via the gets method, but we'll pretend we don't need that

# ---
# method 1: returns student's name, given his/her grade
# starts with creating a grade variable, which is then assigned a value from the hash, given the student name key. The value is then returned.

def get_grade(school, name) 
			 grade = nil
             school[:students].each do |student|
                 if student[:name] == name
                     grade = student[:grade]
                 end
             end
             return grade
end

# method 1 alternative: school[:students].each {|student| grade = student if student[:name] == name}
# ---

# method 2: updates instructors's subject given instructor's name and his/her new subject
# checks if instructor's name is in the array, and if it is, update his / her subject with a new one
# this would really need an error message if instructor is not in the array

def update_subject(school, instructor_name, new_subject)
    school[:instructors].each do |instructor|
        if instructor[:name] == instructor_name
            instructor[:subject] = new_subject
        end
    end
end

# method 2 alternative: school[:instructors].each {|instr| instr.replace({:name=> instructor, :subject=> subject})}
# ---

# method 3: adds a new student to the school student array
# << to add to the array

def add_new_student(school, name)
    school[:students] << {:name => name}
end

# method 3 alternative school[:students].push ({:name => student})
# is there a prefered method for push vs <<?

# ---
# method 4: adds a new key to the top level of the school hash, given a key and a value
# standard hash update procedure: hash_name[new_key] = new_value... we don't really need a standalone method for that

def add_new_key(school, key, value)
    school[key] = value
end