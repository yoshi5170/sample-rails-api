class Post < ApplicationRecord
  def index
    @posts = Post.all
    render json: @posts
  end
end
