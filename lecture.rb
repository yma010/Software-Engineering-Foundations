def greet(name_first, name_last)
    p "Hey" + " " + name_first + " " + name_last + "!"
end

names = ["Marvin", "Ma"]

greet(*names)