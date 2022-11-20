class PostImage < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def get_image #特定の処理を名前で呼び出し何かしらの画像を表示させる
    unless image.attached? #結果がfalseの場合に処理実行
      file_path = Rails.root.join('app/assets/images/no_image.jpg') #app/assets/image/no_imagesに格納されるno_image.jpgという画像をデフォルト画像として
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg') #ActiveStorageに格納し、格納した画像を表示させる
    end
      image #結果がtrueの場合に処理実行
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end