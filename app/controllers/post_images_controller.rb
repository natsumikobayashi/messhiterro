class PostImagesController < ApplicationController
  
  def new
    @post_image = PostImage.new #画像投稿のための空箱用意
  end
  
  def create　#投稿データの保存
    @post_image = PostImage.new(post_image_params) #投稿するデータをPostImageモデルに紐づくデータとして保存する準備
    @post_image.user_id = current_user.id #@post_imageのuser_idをcurrent_user.id(今ログインしているユーザーのID)に指定することで投稿で0タに、今ログイン中のユーザのIDを持たせることができる
    @post_image.save
    redirect_to post_images_path #投稿一覧画面へリダイレクト
  end
  
  def index
    @post_images = PostImage.all
  end

  def show
  end
  
  #投稿データのストロングパラメータ
  private
  
  def post_image_params
    params.require(:post_image).permit(:shop_name, :caption)
  end
end