class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
  end

  def create
	  @author = Author.new(author_params(:name, :email))
	  if @author.valid?
	  	@author.save
	  	redirect_to author_path(@author)
	  else 
	  	render :new
	  end
	end

  private

  def author_params(*args)
  	params.require(:author).permit(*args)
	end
end
