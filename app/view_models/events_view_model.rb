# frozen_string_literal: true

class EventsViewModel
  def events(phrase)
    @events = if phrase
                Event.visible.where('name LIKE ? OR city LIKE ? OR content LIKE ?',
                                    "%#{phrase}%", "%#{phrase}%", "%#{phrase}%")
              else
                Event.visible
              end
    @events.left_joins(:tickets).group(:event_id, :id)
  end
end
