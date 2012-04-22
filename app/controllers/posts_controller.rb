class PostsController < ApplicationController
  respond_to :html, :json, :xml

  def index
    @posts = Post.all
  end
end
