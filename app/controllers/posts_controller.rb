class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[create show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def index
    if params[:user_id] == current_user.id
      @posts = User.find(params[:id]).posts 
    else 
      @posts = Post.published
=begin
      @posts = if params[:user_id]
                #Post.find(params[:user_id])
                Post.all
              else
                Post.published
              end
=end
    end
  end

  def show
    @post = Post.find(params[:id])
    @src = URI.extract(@post.post_content)[0]
    @new_comment = Comment.build_from(@post, current_user.id, '')

    if @post.published == false && @post.user_id != current_user.id 
      redirect_to :user_posts, warning: 'Post Not Published'
    elsif @post.published == false && @post.user_id == current_user.id 
      redirect_to :edit_user_post, info: 'Enable Publish to Public Posts'
    end
  end

  def new
    @post = Post.new
    @post.user_id = current_user.id
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
      @post.update(post_params)
      redirect_to :user_posts, info: 'Post Updated'
    else
      redirect_to :user_posts, error: 'Invalid Post Owner'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
      @post.destroy
      redirect_to :posts, info: 'Post Deleted'
    else
      redirect_to :posts, error: 'Not Authorized!'
    end
  end


  def render_404
    redirect_to :user_posts, error: 'Not Available'
  end

  private

  def set_post
    # @post = Post.find(params[:id])
    @post = Post.find_by(params[:id])
    # render_404 and return unless @post && User.find_by(id: @post.user_id)
  end

  def post_params
    params.require(:post).permit(:post_content, :published)
  end
end
