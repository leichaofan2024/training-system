class Scene < ApplicationRecord
  has_many :switches
  has_many :lights
end
