module CustomHelpers
  def fill_slots(from, to, slots)
    slots.reduce [] do |result, slot|
      if result.empty?
        if slot['from'] > from
          result << {
            'type' => 'empty',
            'from' => from,
            'to' => slot['from']
          }
        end
      else
        if slot['from'] > result.last['to']
          result << {
            'type' => 'empty',
            'from' => result.last['to'],
            'to' => slot['from']
          }
        end
      end

      result << slot
    end
  end
end