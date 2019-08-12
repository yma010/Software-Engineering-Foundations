require "Prime"

#Write a method no_dupes?(arr) that accepts an array as an arg and returns an 
#new array containing the elements that were not repeated in the array.

def no_dupes?(arr)
  counter_hash = Hash.new(0)
  arr.each { |ele| counter_hash[ele] += 1 }
  counter_hash.select { |key, val| val == 1 }.keys
  #counter_hash.keys.select { |blah| counter_hash[blah] == 1 }
end

# Examples
no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
no_dupes?([true, true, true])            # => []


# #Write a method no_consecutive_repeats?(arr) that accepts an array as an arg. 
# #The method should return true if an element never appears consecutively 
# #in the array; it should return false otherwise.

def no_consecutive_repeats?(array)
    (0...array.length - 1).each {|index| return false if array[index] == array[index + 1] }
    true
end

# Examples
no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
no_consecutive_repeats?(['x'])                              # => true

# # Write a method char_indices(str) that takes in a string as an arg. 
# # The method should return a hash containing characters as keys.
# # The value associated with each key should be an array containing the 
# # indices where that character is found.

def char_indices(str)
  indices = Hash.new { |char, idx| char[idx] = [] }
  str.each_char.with_index { |char, idx| indices[char].push(idx) }
  indices
end

# Examples
char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}


# # Write a method longest_streak(str) that accepts a string as an arg. 
# # The method should return the longest streak of consecutive characters in the string. 
# # If there are any ties, return the streak that occurs later in the string.

def longest_streak(string)
    index = 0
    counter = 0
    streak = ""
    largest_count = 0

    while index < string.length
        counter = 0
        curr_char = string[index]
        while curr_char == string[index]
            index +=1
            counter +=1
        end
        if counter >= largest_count
            largest_count = counter
            streak = curr_char
        end
    end
    streak * largest_count
end

# # Examples
longest_streak('a')           # => 'a'
longest_streak('accccbbb')    # => 'cccc'
longest_streak('aaaxyyyyyzz') # => 'yyyyy
longest_streak('aaabbb')      # => 'bbb'
longest_streak('abc')         # => 'c'

# # Write a method bi_prime?(num) that accepts a number as an arg and returns a 
# # boolean indicating whether or not the number is a bi-prime. 
# # A bi-prime is a positive integer that can be obtained by multiplying two prime numbers.

def bi_prime?(num)
  (1..num).each do |j|
    (j..num).each do |i|
      if j.prime? && i.prime?
        return true if num == j * i
      end
    end
  end
  false
end

# # Examples
bi_prime?(14)   # => true
bi_prime?(22)   # => true
bi_prime?(25)   # => true
bi_prime?(94)   # => true
bi_prime?(24)   # => false
bi_prime?(64)   # => false

# # A Caesar cipher takes a word and encrypts 
# # it by offsetting each letter in the word by a fixed number, 
# # called the key. Given a key of 3, for example: a -> d, p -> s, and y -> b.

# # A Vigenere Cipher is a Caesar cipher, but instead of a single key, a sequence of keys is used. 
# # For example, if we encrypt "bananasinpajamas" with the key sequence 1, 2, 3, then the result would be 
# # "ccqbpdtkqqcmbodt":

# # Message:  b a n a n a s i n p a j a m a s
# # Keys:     1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1
# # Result:   c c q b p d t k q q c m b o d t


# # Write a method vigenere_cipher(message, keys) 
# # that accepts a string and a key-sequence as args, 
# # returning the encrypted message. Assume that the message consists of 
# # only lowercase alphabetic characters.

def vigenere_cipher(message, keys)
    alphabet = ('a'..'z').to_a
    vigenere_str = ""

    message.each_char.with_index do |char, idx|
        old_idx = alphabet.index(char)
        temp_key = keys.shift
        keys.push(temp_key)
        new_idx = (old_idx + temp_key) % 26
        vigenere_str += alphabet[new_idx]
    end
    vigenere_str
end

# # Examples
vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
vigenere_cipher("zebra", [3, 0])            # => "ceerd"
vigenere_cipher("yawn", [5, 1])             # => "dbbo"

# # Write a method vowel_rotate(str) that accepts a string 
# # as an arg and returns the string where every vowel is 
# # replaced with the vowel the appears before it sequentially 
# # in the original string. The first vowel of the string should be 
# # replaced with the last vowel.

def vowel_rotate(str)
  vowels = "aeiou"
  new_str = str[0..-1] 
  
  vowel_idx = (0...str.length).select { |i| vowels.include?(str[i]) }
  new_vowels = vowel_idx.rotate(-1)
  vowel_idx.each_with_index do |vowel, i|
    new_vowel = str[new_vowels[i]]
    new_str[vowel] = new_vowel
  end
  new_str
end

# # Examples
vowel_rotate('computer')      # => "cempotur"
vowel_rotate('oranges')       # => "erongas"
vowel_rotate('headphones')    # => "heedphanos"
vowel_rotate('bootcamp')      # => "baotcomp"
vowel_rotate('awesome')       # => "ewasemo"

# # Extend the string class by defining a String#select method that accepts a block. 
# # The method should return a new string containing characters of the 
# # original string that return true when passed into the block. If no block is passed, 
# # then return the empty string. Do not use the built-in Array#select in your solution.

class String
    def select(&prc)
        new_str = ""
        return new_str if prc.nil?
        self.each_char {|char| new_str += char if prc.call(char)}
        new_str
    end



# # Extend the string class by defining a String#map! method that accepts a block. 
# # The method should modify the existing string by replacing every character 
# # with the result of calling the block, passing in the original character 
# # and it's index. Do not use the built-in Array#map or Array#map! in your solution.

    def map!(&prc)
      self.each_char.with_index { |char, i| self[i] = prc.call(char, i) }
    end

end

# Examples
"app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
"HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
"HELLOworld".select          # => ""

# Examplp 
word_1 = "Lovelace"
word_1.map! do |ch| 
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
p word_1        # => "Lov3l4c3"

word_2 = "Dijkstra"
word_2.map! do |ch, i|
    if i.even?
        ch.upcase
    else
        ch.downcase
    end
end
p word_2        # => "DiJkStRa"


# # Write a method multiply(a, b) that takes in two numbers and returns their product.

# # You must solve this recursively (no loops!)
# # You must not use the multiplication (*) operator

def multiply(a, b)
    return 0 if b == 0
    
    if a < 0 && b < 0
        a = a.abs + multiply(a, b + 1)
    elsif a > 0 && b < 0
        -a = a.abs - multiply(a, b + 1)
    else
        a = a + multiply(a, b - 1)
    end

end

# # Examples
p multiply(3, 5)        # => 15
p multiply(5, 3)        # => 15
p multiply(2, 4)        # => 8
p multiply(0, 10)       # => 0
p multiply(-3, -6)      # => 18
p multiply(3, -6)       # => -18
p multiply(-3, 6)       # => -18


# # The Lucas Sequence is a sequence of numbers. The first number of the sequence is 2. 
# # The second number of the Lucas Sequence is 1. To generate the next number of the sequence, 
# # we add up the previous two numbers. For example, 
# # the first six numbers of the sequence are: 2, 1, 3, 4, 7, 11, ...

# # Write a method lucasSequence that accepts a number representing a length as an arg. 
# # The method should return an array containing the Lucas Sequence up to the given length. 
# # Solve this recursively.

def lucas_sequence(n)
  return [] if n == 0
  return [2] if n == 1
  return [2, 1] if n == 2

  sequence = lucas_sequence(n - 1)
  next_sequence = sequence[-1] + sequence[-2]
  sequence << next_sequence
end

# # Examples
lucas_sequence(0)   # => []
lucas_sequence(1)   # => [2]    
lucas_sequence(2)   # => [2, 1]
lucas_sequence(3)   # => [2, 1, 3]
lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

# # The Fundamental Theorem of Arithmetic states that every positive integer is either 
# # a prime or can be represented as a product of prime numbers.

# # Write a method prime_factorization(num) that accepts a number and returns an 
# # array representing the prime factorization of the given number. 
# # This means that the array should contain only prime numbers that multiply together to the given num. 
# # he array returned should contain numbers in ascending order. Do this recursively.


# 24 == 2, 12  => 2, 2, 6 => 2, 2, 2, 3

def prime_factorization(n)
    new_arr = []
    (2...n).each do |i|
        if n % i == 0
            dividend = n / i
            return [*prime_factorization(i), *prime_factorization(dividend)]
        end
    end
    new_arr << n
end

# arr_1 = ["a", "b"]
# arr_2 = ["d", "e"]
# arr_3 = [ *arr_1, "c", *arr_2 ]
# p arr_3 # => ["a", "b", "c", "d", "e"]


# # Examples
p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]