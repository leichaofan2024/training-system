class TrainingSwitch < ApplicationRecord
  belongs_to :training
  belongs_to :switch
  has_many :training_switch_ships
  has_many :training_lights, :through => :training_switch_ships
end
