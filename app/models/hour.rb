class Hour < ActiveRecord::Base
  
  belongs_to :project
  belongs_to :user
  belongs_to :activity
  
  validates_presence_of :log_date
  validates_presence_of :from
  validates_presence_of :to
  validates_presence_of :description
  validates_presence_of :project_id
  validates_presence_of :user_id
  
  validates_associated :user
  validates_associated :project
  
  validates_each :to, :from do |record, attr, value|
    if( attr == :from )
      if( value.to_i > record.to.to_i )
        record.errors.add(attr, 'should be less than To')
      end
    elsif( attr == :to )
      if( value.to_i < record.from.to_i )
        record.errors.add(attr, 'should be greater than From')
      end
    end
  end
  
  def time_period(args = {})
    time_diff_in_sec = self.to.to_i - self.from.to_i
    if time_diff_in_sec > 60*60
      return [time_diff_in_sec.to_f/(60.0*60.0), "H"]
    else
      if args[:only_hrs]
        return [time_diff_in_sec.to_f/(60.0*60.0), "H"]
      else
        return [time_diff_in_sec.to_f/(60.0), "M"]
      end
    end
  end
  
end
