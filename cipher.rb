# frozen_string_literal: true

def cipher(string, shift)
  # turns each char of string into its ordinal number
  ord_array = string.downcase.chars.map(&:ord)
  p "ord_array: #{ord_array}"

  # adjust each char ord number by the shift factor
  adjusted_ord_array = ord_array.map do |char_code|
    p "char code: #{char_code}"
    case char_code

    # a=97 z=122; ensures only a-z
    when 97..122
      new_char_code = char_code + shift
      new_char_code -= 26 while new_char_code > 122 # loops to a after z
      new_char_code

    # for characters not a-z like (.), return that same char
    else
      char_code
    end
  end

  adjusted_ord_array.map(&:chr).join
end

# Use cases
p cipher('abcd..z', 2)

# p cipher('I will shift 4 characters', 4) # => "m ampp wlmjx 4 glevegxivw"
# p cipher('I only change letters (@#*!', 9) # => ""r xwuh lqjwpn unccnab (@#*!"
