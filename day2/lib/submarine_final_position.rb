def submarine_final_position(movements)
  horizontal = 0
  depth = 0
  aim = 0
  movements.each do |movement|
    direction = movement[:direction]
    length = movement[:length]
    if direction == 'forward'
      horizontal += length
      depth += (aim * length)
    elsif direction == 'down'
      aim += length
    elsif direction == 'up'
      aim -= length
    end
  end
  horizontal * depth
end
