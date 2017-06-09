class TrainingLight < ApplicationRecord
  belongs_to :training
  belongs_to :light
  has_many :training_switch_ships
  has_many :training_switches, :through => :training_switch_ships, :source => :training_switch

  def update_training_light_status!
    if self.is_on?
      self.update(:is_on => false)
    else
      self.update(:is_on => true)
    end
  end
end
