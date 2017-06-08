class Light < ApplicationRecord
  has_many :training_lights
  belongs_to :scene
  has_many :switch_relationships
  has_many :switches,:through => :switch_relationships,:source => :switch

end
