class EveningQuestion < ApplicationRecord
  has_many :evening_answers, dependent: :delete_all
end
