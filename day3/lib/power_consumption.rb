# frozen_string_literal: true

def power_consumption(metrics)
  number_of_binary_digits = metrics[0].strip.length
  digits_map = Array.new(number_of_binary_digits) { { '0' => 0, '1' => 0 } }

  metrics.each do |metric|
    metric.strip.each_char.with_index do |char_digit, index|
      digits_map[index][char_digit] += 1
    end
  end

  final_digits_for_gamma = digits_map.map do |digits|
    digits['0'] >= digits['1'] ? '0' : '1'
  end
  gamma = final_digits_for_gamma.join.to_i(2)

  all_1s = (2 ** number_of_binary_digits) - 1
  epsilon = gamma ^ all_1s
  first_digit_set_to_1_int = 2 ** (number_of_binary_digits - 1)
  if gamma < first_digit_set_to_1_int
    epsilon = epsilon.to_s(2).rjust(number_of_binary_digits, '1').to_i(2)
  end
  gamma * epsilon
end
