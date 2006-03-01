module Admin::OverviewHelper
  def render_events(events, later = false)
    if events.any?
      text = []
      events.each_with_index { |evt, i| text << render(:partial => "#{evt.mode}_event", :locals => { :event => evt, :shaded => (i % 2 > 0), :later => later }) }
      %(<ul class="events">#{text.join}</ul>)
    end
  end

  def event_time_for(event, long = false)
    long ? event.created_at.to_ordinalized_s(:plain) : event.created_at.to_s(:time_only)
  end
end
