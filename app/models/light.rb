class Light < ApplicationRecord

  belongs_to :scene
  has_many :switch_relationships
  has_many :switch ,:through => :switch_relationships, source: :switch
end
