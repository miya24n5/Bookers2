class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # has_one :profile_image, dependent: :destroy
  # accepts_nested_attributes_for :profile_image
  # accepts_attachments_for :profile_image, attachment: :profile_image

  has_one_attached :image
  has_many :books, dependent: :destroy


  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
    # profile_image.variant(resize: size).processed
  end


end
