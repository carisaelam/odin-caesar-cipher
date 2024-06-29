# frozen_string_literal: true

class CaesarCipher
  # turns each char of string into its ordinal number
  def ord_array(string)
    string.downcase.chars.map(&:ord)
  end

  # adjust each char ord number by the shift factor
  def adjusted_ord_array(ord_array, shift)
    ord_array.map do |char_code|
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
  end

  # shifts a string by (shift) digits according to caesar cipher
  def cipher(string, shift)
    ord_array = ord_array(string)
    adjusted_ord_array = adjusted_ord_array(ord_array, shift)
    adjusted_ord_array.map(&:chr).join
  end
end

# Use cases
example = CaesarCipher.new
p example.cipher('I will shift 4 characters', 4) # => "m ampp wlmjx 4 glevegxivw"
p example.cipher('I only change letters (@#*!', 9) # => ""r xwuh lqjwpn unccnab (@#*!"
