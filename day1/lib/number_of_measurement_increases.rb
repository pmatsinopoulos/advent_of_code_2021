# frozen_string_literal: true

def number_of_measurement_increases(measurements)
  previous_measurement = nil
  result = 0
  measurements.each do |measurement|
    result += 1 unless previous_measurement.nil? || measurement <= previous_measurement

    previous_measurement = measurement
  end
  result
end

def number_of_measurement_with_sliding_window_increases(measurements)
  return 0 if measurements.size <= 3

  # we have more than 4 elements
  window_size = 3
  left = 0
  right = left + window_size - 1
  previous_sum = nil
  result = 0

  while left <= measurements.size - window_size
    if previous_sum
      sum = previous_sum + measurements[right] - measurements[left - 1]
    else
      sum = measurements[left..right].sum
    end

    if previous_sum && sum > previous_sum
      result += 1
    end

    previous_sum = sum
    left += 1
    right += 1
  end

  result
end
