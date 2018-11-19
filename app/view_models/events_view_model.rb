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

  def show_event(id)
    @event = Event.find(id)
    @tickets = Ticket.new(event: @event)
  end
end
