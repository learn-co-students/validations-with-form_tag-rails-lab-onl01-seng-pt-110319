class AuthorsController < ApplicationController
  def show
    current_author
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.valid? 
      @author.save 
      redirect
    else 
      render :new 
    end 
  end

  def edit
    current_author
  end


  private

  
  def author_params
    params.permit(:name, :email, :phone_number)
  end

  def current_author
    @author = Author.find(params[:id])
  end

  def redirect 
    redirect_to author_path(@author)
  end
end
