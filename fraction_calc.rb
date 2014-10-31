require "rational"

def simplify(fract_array)
  n = fract_array[0]
  d = fract_array[1]
  # find gcd
  divis = n.gcd(d)
  # divide numerator and denominator by the gcd to get the new fraction
  new_d = d / divis
  new_n = n / divis
  [new_n, new_d]
end

def multiply(n1, d1, n2, d2)
  # code that multiplies them
  n3 = n1*n2
  d3 = d1*d2
  # simplifies it too
  simplify([n3, d3])
end

def add(n1, d1, n2, d2)
  # code that adds them
  # first we find a common denominator
  common_denom = d1 * d2
  # then we multiply the numerators by the opposite denominators to find the new addable numerators
  new_n1 = n1 * d2
  new_n2 = n2 * d1
  # we then add them to find the new numerator
  n3 = new_n1 + new_n2
  # finally, we simplify this new fraction if it can be
  simplify([n3, common_denom])
end

def subtract(n1, d1, n2, d2)
  # code that subtracts them
  # first we find a common denominator
  common_denom = d1 * d2
  # then we multiply the numerators by the opposite denominators to find the new subtractable numerators
  new_n1 = n1 * d2
  new_n2 = n2 * d1
  # we then subtract them to find the new numerator
  n3 = new_n1 - new_n2
  # finally, we simplify this new fraction if it can be
  simplify([n3, common_denom])
end

def divide(n1, d1, n2, d2)
  # code that divides them
  # another way to divide is multiply by the reciprocal
  multiply(n1, d1, d2, n2)
end

def output_fraction(fract_array)
  # neat way to output the fraction so it looks nicer
  n = fract_array[0]
  d = fract_array[1]
  puts "#{n}/#{d}"
end

def fract_to_decimal(n, d)
  # converts fraction to a decimal
  n = n.to_f
  d = d.to_f
  dec = n / d
  dec
end

def dec_to_fract(dec)
  # converts decimal to a fraction
  d = 1
  while dec % 1 != 0
    dec = dec * 10
    d = d * 10
  end
  dec.to_i
  d.to_i
  simplify([dec, d])
end
