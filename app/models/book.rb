class Book < ApplicationRecord

   belongs_to :user

   validates :title, presence: true,
              length: { minimum: 2, maximum: 20}
   validates :opinion,presence: true


end