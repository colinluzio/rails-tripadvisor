class CommentsController < ApplicationController
    #@author = Author.find(params[:user_id])
 
	def index
 
 	end
	
	def new
	@comment = Comment.new
	end
	
	def create
	@comment = Comment.new(comment_params)
	if @comment.save
		redirect_to '/'
	else
		render 'new'
	end
	end
	
	private 
  	def comment_params 
   		  params.require(:comment).permit(:name, :description, :author_id, :hotel_id)
  	end


end
