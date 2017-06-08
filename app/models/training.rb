class Training < ApplicationRecord

  belongs_to :user
  belongs_to :scene
  has_many :training_lights, dependent: :destroy
  has_many :training_switches, dependent: :destroy
  
end
