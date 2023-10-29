class Investigador < ApplicationRecord
  has_and_belongs_to_many :investigaciones
  belongs_to :user
end
