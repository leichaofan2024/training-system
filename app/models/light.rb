class Light < ApplicationRecord
  has_many :training_lights
  belongs_to :scene
  has_many :switch_relationships
  has_many :switches,:through => :switch_relationships,:source => :switch


  def update_light_status!
    if self.is_on?
      self.update(:is_on => false)
    else
      self.update(:is_on => true)
    end
  end
end
