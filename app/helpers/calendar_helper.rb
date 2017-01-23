module CalendarHelper
  def display_calendar(date_in_month, events)
    d = date_in_month
    range = (d.beginning_of_month.beginning_of_week(:sunday)..d.end_of_month.end_of_week(:sunday))
    range.to_a.in_groups_of(7).flat_map do |group|
      ["<div class='week'>",
      group.map do |day|
        other_month = "other-month" if day.month != date_in_month.month
        has_events = events.select {|e| e.starts_at.to_date == day.to_date}.any?
        has_event = "has-event" if has_events

        css = "day #{other_month} #{has_event}".strip
        ["<span class='#{css}'>",
        "<span class='number'>#{day.day}</span>",
        has_events ? "E" : "",
        "</span>"].join('')
      end,
      "</div>"].join('')
    end.join('').html_safe
  end
end