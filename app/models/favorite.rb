class Favorite < ApplicationRecord

  belongs_to users, dependent: :destroy
  belongs_to books, dependent: :destroy
end
