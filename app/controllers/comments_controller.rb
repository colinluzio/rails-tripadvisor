class CommentsController < ApplicationController
    #@author = Author.find(params[:user_id])
 
	def index
 
 	end
	
	def new
	@comment = Comment.new
	end
	
	def create
	@comment = Comment.new(comment_params)
	@comment.save!
	respond_to do |format|
		format.html {redirect_to @comment}
		format.js #render comments/create.js.erb
	end 
	end
	
	private 
  	def comment_params 
   		  params.require(:comment).permit(:name, :description, :author_id, :hotel_id)
  	end


end
