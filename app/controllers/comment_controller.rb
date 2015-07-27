class CommentController < ApplicationController
 @author = Author.find(params[:user_id])
end
