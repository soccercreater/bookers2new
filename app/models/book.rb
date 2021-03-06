class Book < ApplicationRecord
   belongs_to :user
   has_one_attached :profile_image

   validates :title, presence: true,
       length: { minimum: 2}
   validates :body,presence: true,
              length: { maximum: 200}
 def get_profile_image(size)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      profile_image.variant(resize: size).processed
 end


end