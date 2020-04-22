class PostsController < ApplicationController
  def show
    current_post
  end

  def edit
    current_post
  end

  def new 
    @post = Post.new 
  end

  def create 
    @post = Post.new(post_params)
    if @post.valid?
      @post.save 
      redirect 
    else 
      render :new 
    end
  end

  def update
    current_post
    if @post.update(post_params) 
    redirect_to post_path(@post)
    else 
      render :edit
    end 
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end

  def current_post
    @post = Post.find(params[:id])
  end

  def redirect
    redirect_to post_path(@post)
  end

end
