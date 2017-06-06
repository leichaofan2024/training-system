class Scene < ApplicationRecord
  has_many :switchs
  has_many :lights 
end
