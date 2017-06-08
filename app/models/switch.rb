class Switch < ApplicationRecord
  belongs_to :scene
  has_many :training_switches 
  has_many :switch_relationships
  has_many :lights, :through => :switch_relationships, :source => :light
end
