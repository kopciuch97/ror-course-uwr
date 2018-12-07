# frozen_string_literal: true

class EventsViewModel
  def events(name)
    @events = if name
                Event.visible.where('name LIKE ?', "%#{name}%")
              else
                Event.visible
              end
    @events.left_joins(:tickets).group(:event_id, :id)
  end
end
