key = 13  # => 13

message = "This is My secret"  # => "This is My secret"

def message_to_letters(message)
  message.chars                  # => ["T", "h", "i", "s"], ["i", "s"], ["M", "y"], ["s", "e", "c", "r", "e", "t"]
end                              # => nil

def letters_to_indices(letters)
  letters.map do |l|             # => ["T", "h", "i", "s"], ["i", "s"], ["M", "y"], ["s", "e", "c", "r", "e", "t"]
    alphabet.index(l)            # => 45, 7, 8, 18, 8, 18, 38, 24, 18, 4, 2, 17, 4, 19
  end                            # => [45, 7, 8, 18], [8, 18], [38, 24], [18, 4, 2, 17, 4, 19]
end                              # => nil

def convert_indices(indices)
  indices.map do |i|          # => [45, 7, 8, 18], [8, 18], [38, 24], [18, 4, 2, 17, 4, 19]
    imod = i % 26             # => 19, 7, 8, 18, 8, 18, 12, 24, 18, 4, 2, 17, 4, 19
    # if imod < 13              # => false, true, true, false, true, false, true, false, false, true, true, false, true, false
    #   i + 13                  # => 20, 21, 21, 51, 17, 15, 17
    # else
    #   i - 13                  # => 32, 5, 5, 11, 5, 4, 6
    # end                       # => 32, 20, 21, 5, 21, 5, 51, 11, 5, 17, 15, 4, 17, 6

    case i                    # => 45, 7, 8, 18, 8, 18, 38, 24, 18, 4, 2, 17, 4, 19
    when (0...13)
      i + 13                  # => 20, 21, 21, 17, 15, 17
    when (13...26)
      i - 13                  # => 5, 5, 11, 5, 4, 6
    when (26...39)
      i + 13                  # => 51
    when (39...52)
      i - 13                  # => 32
    end                       # => 32, 20, 21, 5, 21, 5, 51, 11, 5, 17, 15, 4, 17, 6
  end  # => [32, 20, 21, 5], [21, 5], [51, 11], [5, 17, 15, 4, 17, 6]
end    # => nil

def convert_to_letters(indices)
  indices.map do |i|             # => [32, 20, 21, 5], [21, 5], [51, 11], [5, 17, 15, 4, 17, 6]
    alphabet[i]                  # => "G", "u", "v", "f", "v", "f", "Z", "l", "f", "r", "p", "e", "r", "g"
  end                            # => ["G", "u", "v", "f"], ["v", "f"], ["Z", "l"], ["f", "r", "p", "e", "r", "g"]
end                              # => nil

def convert_to_string(string_array)
  string_array.join                  # => "Guvf", "vf", "Zl", "frperg"
end                                  # => nil

def alphabet
  %w(a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)  # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"], ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"], ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"], ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s",...
end                                                                                                            # => nil

def encrypted_message(message)
  message.split.map do |word|   # => ["This", "is", "My", "secret"]
    encrypt_word(word)          # => "Guvf", "vf", "Zl", "frperg"
  end.join(" ")                 # => "Guvf vf Zl frperg"
end                             # => nil

def encrypt_word(word) # word --> string representing a word
  convert_to_string(convert_to_letters(convert_indices(letters_to_indices(message_to_letters(word)))))  # => "Guvf", "vf", "Zl", "frperg"
end                                                                                                     # => nil

encrypted_message(message)  # => "Guvf vf Zl frperg"
