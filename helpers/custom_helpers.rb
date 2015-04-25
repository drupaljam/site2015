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

  def program_time_columns(program)
    (program['from']...program['to']).step(15*60).reduce([]) do |result, t|
      from = t
      to = t + 15*60

      split = result.empty? || program['rooms'].any? do |room|
        room['slots'].any? do |slot|
          (slot['from'] == from) || (slot['to'] == from)
        end
      end
      
      if split
        result << {
          'from' => from,
          'to' => to
        }
        next result
      end

      result.last['to'] = to
      next result
    end
  end

  def h1(title, key = nil)
    key = title.parameterize

    content_tag :h1, title, id: key
  end

  def host_with_port
    [host, optional_port].compact.join(':')
  end

  def optional_port
    port unless port.to_i == 80
  end

  def image_url(source)
    protocol + host_with_port + image_path(source)
  end
end