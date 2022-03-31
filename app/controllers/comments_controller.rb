class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Comment was created successfully."
      redirect_to post_path(@post)
    else
      flash[:alert] = "Error creating comment. Please try again."
      redirect_to post_path(@post)
    end    
  end

  def update
    @comment = @post.comments.find(params[:id])

    if @comment.update(comment_params)
      flash[:notice] = "Comment was updated successfully."
      redirect_to post_path(@post)
    else
      flash[:alert] = "Error updating comment. Please try again."
      redirect_to post_path(@post)
    end        
  end

  def destroy    
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)    
  end

  private

  def set_post
    @post = Post.find(params[:post_id])    
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
