class TrainingLight < ApplicationRecord
  belongs_to :training
  belongs_to :light
  has_many :training_switch_ships
  has_many :training_switches, :through => :training_switch_ships, :source => :training_switch
end
