module CalendarHelper
  def display_calendar(date_in_month, events)
    d = date_in_month
    # do th here
    range = (d.beginning_of_month.beginning_of_week(:sunday)..d.end_of_month.end_of_week(:sunday))
    # start od tbody
    # this is the tr level
    range.to_a.in_groups_of(7).flat_map do |group|
      ["<div class='week'>",
      group.map do |day|
        # this is the td level
        other_month = "other-month" if day.month != date_in_month.month
        has_events = events.select {|e| e.starts_at.to_date == day.to_date}.any?
        has_event = "has-event" if has_events

        css = "day #{other_month} #{has_event}".strip
        ["<span class='#{css}' data-date='#{day.to_s}'>",
        "<span class='number'><a href='#{new_profile_exercise_path(current_user.profile, 
          exercise: { starts_at: day.to_s })}'>#{day.day}</a></span>",
        has_events ? "E" : "",
        "</span>"].join('')
      end,
      "</div>"].join('')
    end.join('').html_safe
  end
end