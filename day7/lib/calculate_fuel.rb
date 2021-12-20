def calculate_fuel(array_of_integers)
  sorted = array_of_integers.sort
  len = sorted.size

  median = sorted[len / 2]

  sum_for_median = array_of_integers.map do |i|
    if i == median
      0
    else
      n = (i - median).abs
      n * (1 + n) / 2
    end
  end.sum

  current = sum_for_median

  ((median + 1)..sorted[-1]).each do |number|
    sum = array_of_integers.map do |i|
      if i == number
        0
      else
        n = (i-number).abs
        n * (1 + n) / 2
      end
    end.sum
    if sum < current
      current = sum
    else
      break
    end
  end

  current
end
