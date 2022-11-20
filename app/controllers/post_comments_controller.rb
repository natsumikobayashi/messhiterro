class PostCommentsController < ApplicationController
  def create
    post_image = PostImage.find(params[:post_image_id]) #コメントを紐づけるPostImageを見つける
    comment = current_user.post_comments.new(post_comment_params) #コメントをログインしてるユーザーの投稿したコメントたちに保存する準備
    comment.post_image_id = post_image.id #コメントとコメントされたpost_image_idをpost_image.idに持たせる
    comment.save
    redirect_to post_image_path(post_image)
  end
  
  def  destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end
  
  private
  
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
