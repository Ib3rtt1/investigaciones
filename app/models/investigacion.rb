class Investigacion < ApplicationRecord
  has_and_belongs_to_many :investigadores
end
