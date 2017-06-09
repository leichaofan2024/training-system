class Switch < ApplicationRecord
  belongs_to :scene
  has_many :training_switches
  has_many :switch_relationships
  has_many :lights, :through => :switch_relationships, :source => :light


  def update_switch_status!
    if self.is_on?
      self.update(:is_on => false)
    else
      self.update(:is_on => true)
    end
  end
end
