class CommentsController < ApplicationController
    #@author = Author.find(params[:user_id])
 
	def index
 
 	end
	
	def new
	@comment = Comment.new
	@user = User.find_by(id: session[:user_id])
	end
	
	def create
	@comment = Comment.new()
	@newcomment = Comment.find_by(hotel_id: params[:hotel_id], author_id: params[:author_id])
	
	if @newcomment
		respond_to do |format|
			format.json { render :json => @newcomment}
		end
	else
		@comment.save!
		respond_to do |format|
			format.json { render :json => @comment}
		end
	end	
		 
	end
	
	private 
  	def comment_params 
   		  params.require(:comment).permit(:name, :description, :author_id, :hotel_id)
  	end


end
