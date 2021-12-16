def number_of_lanternfish(input, number_of_days)
  initial_ages = input.split(',').map(&:to_i)

  ages = Array.new(number_of_days + 1) { [] }
  ages[0] = initial_ages
  i = 0
  day = 0
  while i <= ages[day].size - 1
    number = ages[day][i]

    day_to_add_8 = number + 1
    while day_to_add_8 <= number_of_days
      ages[day_to_add_8].push(8)
      day_to_add_8 += 7
    end
    i += 1
  end
  # now for each day that has 8s, I need to find out how many other 8s it's going to generate
  # for the following days
  day = 1
  while day <= number_of_days
    number_of_8s = ages[day].count(8)
    if number_of_8s.positive?
      # this row (ages[day]) has at least 1 8. I need to see how many 8s it's going to generate
      # and for which days and add them to the array
      day_to_add_8 = day + 7 + 2
      while day_to_add_8 <= number_of_days
        number_of_8s.times { ages[day_to_add_8].push(8) }
        day_to_add_8 += 7
      end
      # an 8 on day 2, generates an 8 on day 11 (2 + 7 + 2),
      #                generates an 8 on day 20, e.t.c. (7 + 2)
      # an 8 on day 3, generates an 8 on day 12, (3 + 7 + 2)
      #                generates an 8 on day 19, (12 + 7)
      # an 8 on day 4, generates an 8 on day 13, (4 + 7 + 2)
      #                generates an 8 on day 20 (13 + 7)
      # an 8 on day 5, generates an 8 on day 14
      #                generates an 8 on day 21
    end
    day += 1
  end

  initial_ages.size + ages[1..number_of_days].map { |a| a.count(8) }.sum
end
