def fromRoman(romanNumber)
  # Replace the following line with the actual code!

  if romanNumber.count("IVXLCDM") == romanNumber.size
    number = [1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000]
    roman = %w[I IV V IX X XL L XC C CD D CM M]
    hash = roman.zip(number).inject({}) { |r, ele| r[ele.first] = ele.last; r }
    #generate a regular expression
    reg = /M|CM|D|CD|C|XC|L|XL|X|IX|V|IV|I/
    # Use the scan method to generate an array whose elements consist of characters in the regular expression
    temp = romanNumber.scan(reg)
    # , calculate the number of each element in the original array, and then multiply the number by the corresponding value of the character. Finally add them together to get the final value.
    temp.uniq.inject(0) do |r, ele|
      r += temp.count(ele) * hash[ele]
    end
  else
    raise TypeError
  end
end

def toRoman(arabicNumber)
  arabicValues = {
      1000 => "M",
      900 => "CM",
      500 => "D",
      400 => "CD",
      100 => "C",
      90 => "XC",
      50 => "L",
      40 => "XL",
      10 => "X",
      9 => "IX",
      5 => "V",
      4 => "IV",
      1 => "I"
  }
  if arabicNumber > 0 and arabicNumber < 4000
    if arabicValues[arabicNumber]
      arabicValues[arabicNumber]
    end
    arabicValues.reduce("") do  |string, (arabic, roman)|
      quotient, arabicNumber = arabicNumber.divmod(arabic)
      string << roman * quotient
      end
  else
    raise RangeError
  end
end
