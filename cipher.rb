


def cipher(string, shift)
  
  # Convert characters to lowercase and to ordinal code 
  ord_array = string.downcase.chars.map {|char| char.ord}

  # Shift Characters:
  adjusted_ord_array = ord_array.map do |char_code|
    case char_code
    when 97..122
      new_char_code = char_code + shift 
      new_char_code -= 26 while new_char_code > 122  # loops to a after z
      new_char_code
    else
      char_code
    end
  end
  
  # Convert adjusted ord codes back into characters 
  converted_array = adjusted_ord_array.map { |char_code| char_code.chr }.join

  # return cipher
  converted_array

end

# Use cases
p cipher('I will shift 4 characters', 4) # => "m ampp wlmjx 4 glevegxivw"
p cipher("I only change letters (@#*!", 9) # => ""r xwuh lqjwpn unccnab (@#*!"
