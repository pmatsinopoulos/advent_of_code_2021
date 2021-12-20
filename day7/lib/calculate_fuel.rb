def calculate_fuel(array_of_integers)
  return 0 if array_of_integers.size == 1
  return (array_of_integers[0] - array_of_integers[1]).abs if array_of_integers.size == 2

  sorted = array_of_integers.sort
  len = sorted.size

  median = sorted[len / 2]

  array_of_integers.map { |i| (i - median).abs }.sum
end
