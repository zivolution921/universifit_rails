class EventRegistration < ApplicationRecord
  
  
  HOW_HEARD_OPTIONS = [ 
    'Newsletter',
    'Blog Post',
    'Facebook',
    'Web Search',
    'Friend/Coworker',
    'Other'
  ]
  
  validates :how_heard, 
            inclusion: { in: HOW_HEARD_OPTIONS }
  validates_uniqueness_of :profile_id, :scope => :event_id

  belongs_to :event
  belongs_to :profile
end
