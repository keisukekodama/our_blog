class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user) #n+1問題を解決している
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id]) #編集したいレコードの情報
    post.update(post_params) #レコードをupdateメソッドで更新する。
    redirect_to post_path(post.id)
  end

  # def des
  #   post = Post.find(params[:id]) #編集したいレコードの情報
  #   post.destroy #レコードをupdateメソッドで更新する。
  #   redirect_to root_path
  # end

  def destroy
    post = Post.find(params[:id]) #編集したいレコードの情報
    post.destroy #レコードをupdateメソッドで更新する。
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content).merge(user_id: current_user.id) #requireのなかみはモデル名。form_withをつかうときに使用、mergeを使用することで新しく作成したカラムuser.idの値をparamsに入れている
  end
end
