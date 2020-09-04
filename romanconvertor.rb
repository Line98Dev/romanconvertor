def fromRoman(romanNumber)
  if romanNumber.count("IVXLCDM") == romanNumber.size
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
    reg = /M|CM|D|CD|C|XC|L|XL|X|IX|V|IV|I/
    # Use the scan method to generate an array whose elements consist of characters in the regular expression
    romanArray = romanNumber.scan(reg)
    # , calculate the number of each element in the original array, and then multiply the number by the corresponding value of the character. Finally add them together to get the final value.
    romanArray.inject(0) do |result, element|
      print element
      print arabicValues[element]
      result += romanArray.count(element) * arabicValues[element]
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
    string = ""
    arabicValues.each { |entry|
      arabic = entry[0]
      roman = entry[1]
      quotient, arabicNumber = arabicNumber.divmod(arabic)
      string << roman * quotient
    }
    string
  else
    raise RangeError
  end
end
