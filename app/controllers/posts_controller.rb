class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:create, :show, :edit, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound, :with => :render_404

  def index 
    @posts = Post.all
  end

  def show
        
        @post = Post.find(params[:id])
        @src = URI.extract(@post.post_content)[0]
        #@dat_post = @src.to_s.gsub('"', '')
        #@preview = LinkThumbnailer.generate(@dat_post)
        #@preview_title = @preview.title 
        #@preview_desc = @preview.description
        #@preview_image = @preview.images.first
        #preview_json = @preview.to_json
        #p preview_json
        #@comments = @post.comments.all
        #commontator_thread_show(@poss)
        @new_comment = Comment.build_from(@post, current_user.id, "")
 
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
    if @user == current_user
       @post.update(post_params)
       redirect_to @post
    else 
       flash[:error] = "Invalid User"
       redirect_to @post
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
=begin
    @post.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
    end
=end
  end

  def render_404
    puts "ERROR"
  end


private

  def set_post
    @post = Post.find_by(params[:id])
    #@post = Post.find(params[:id])
    #render_404 and return unless @post && User.find_by(id: @post.user_id)
  end

  def post_params
    params.require(:post).permit(:post_content)
  end
end
