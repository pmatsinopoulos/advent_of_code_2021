def submarine_final_position(movements)
  horizontal = 0
  depth = 0
  movements.each do |movement|
    direction = movement[:direction]
    length = movement[:length]
    if direction == 'forward'
      horizontal += length
    elsif direction == 'down'
      depth += length
    elsif direction == 'up'
      depth -= length
    end
  end
  horizontal * depth
end
