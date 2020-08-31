class CommentsController < ApplicationController
    before_action :authenticate_user!

    def create
        commentable = commentable_type.constantize.find(commentable_id)
        @comment = Comment.build_from(commentable, current_user.id, body)


          if @comment.save
              make_child_comment
              # format.html  { redirect_to(:back, :notice => 'Comment was successfully added.') }
              redirect_back(fallback_location: root_path)
              flash[:notice] = "Comment Created"
              # add notification here 
          end


    end
    
    def destroy
        @comment = @commentable.comments.find(params[:id])
        @comment.destroy
=begin
        @comment = current_user.comments.find(params[:id])
        @comment_id = params[:id]
        @comment.destroy
=end
    end
    

private

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type, :comment_id)
  end

  def commentable_type
    comment_params[:commentable_type]
  end

  def commentable_id
    comment_params[:commentable_id]
  end

  def comment_id
    comment_params[:comment_id]
  end

  def body
    comment_params[:body]
  end

  def make_child_comment
    return "" if comment_id.blank?

    parent_comment = Comment.find comment_id
    @comment.move_to_child_of(parent_comment)
  end    


  def find_commentable
    @commentable_type = params[:commentable_type].classify
    @commentable = @commentable_type.constantize.find(params[:commentable_id])
  end
end
