# frozen_string_literal: true

def calculate_rating(metrics, number_of_binary_digits)
  bit_position = 0

  metrics_copy = metrics.dup
  while metrics_copy.length > 1
    two_x_two_metrics = metrics_copy.map { |e| e.split('') }
    digits_on_bit_position = two_x_two_metrics.map { |e| e[bit_position] }
    count_0 = digits_on_bit_position.count('0')
    count_1 = digits_on_bit_position.count('1')

    metrics_copy = yield metrics_copy, digits_on_bit_position, count_0, count_1

    bit_position += 1
    bit_position = 0 if bit_position == number_of_binary_digits
  end

  metrics_copy[0].to_i(2)
end

def life_support_rating(metrics)
  return metrics[0].to_i(2) if metrics.length == 1

  number_of_binary_digits = metrics[0].length

  oxygen_generator_rating = calculate_rating(metrics, number_of_binary_digits) do |current_metrics, digits_on_bit_position, count_0, count_1|
    if count_0 > count_1
      current_metrics.select.with_index { |_, index| digits_on_bit_position[index] == '0' }
    else
      current_metrics.select.with_index { |_, index| digits_on_bit_position[index] == '1' }
    end
  end

  co2_scrubber_rating = calculate_rating(metrics, number_of_binary_digits) do |current_metrics, digits_on_bit_position, count_0, count_1|
    if count_0 > count_1
      current_metrics.select.with_index { |_, index| digits_on_bit_position[index] == '1' }
    else
      current_metrics.select.with_index { |_, index| digits_on_bit_position[index] == '0' }
    end
  end


  oxygen_generator_rating * co2_scrubber_rating
end
