class Project < ActiveRecord::Base
  belongs_to :user
  has_many :updates

  def progress
    return 0 if self.last_update.nil?
    diff = self.ends_at.to_d - self.starts_at.to_d
    (self.last_update.value.to_d - self.starts_at.to_d) * 100.0 / diff
  end

  def last_update
    self.updates.last
  end
end
