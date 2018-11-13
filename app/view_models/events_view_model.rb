class EventsViewModel
  # def initialize(name)
  #   @name ||= name
  # end

  def events(name)
    @events = if name
                Event.where('name LIKE ? and status = 0', "%#{name}%")
              else
                Event.show_events(:show)
              end
  end

  def show_event(id)
    @event = Event.find(id)
    @tickets = Ticket.new(event: @event)
  end
end