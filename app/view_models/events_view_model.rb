class EventsViewModel
  # def initialize(name)
  #   @name ||= name
  # end

  def events(name)
    @events = if name
                Event.where('name LIKE ?', "%#{name}%")
              else
                Event.all
              end
  end

  def show_event(id)
    @event = Event.find(id)
    @tickets = Ticket.new(event: @event)
  end
end