class TrainingSwitch < ApplicationRecord
  belongs_to :training
  belongs_to :switch
  has_many :training_switch_ships
  has_many :training_lights, :through => :training_switch_ships


  def update_training_switch_status!
    if self.is_on?
      self.update(:is_on => false)
    else
      self.update(:is_on => true)
    end
  end

end
