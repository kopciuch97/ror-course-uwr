class EventsViewModel

  def events(name)
    @events = if name
                Event.visible.where('name LIKE ?', "%#{name}%")
              else
                Event.visible
              end
  end

  def show_event(id)
    @event = Event.find(id)
    @tickets = Ticket.new(event: @event)
  end
end