class CommentsController < ApplicationController
    def create
      @comment = Comment.new(comment_params)
      @comment.save
      render :index
    end
    
      private
    
    def comment_params
      params.require(:comment).permit(:body, :blog_id)
    end
    
    
end
