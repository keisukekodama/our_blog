class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts #Userテーブルに紐付いたpostテーブルのデータをアソシエーションでとってきている
  end
end
