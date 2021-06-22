class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy ]
  before_action :logged_in_user, only:[:edit, :update, :destroy]
  
  impressionist :actions=> [:show]


  # GET /blogs or /blogs.json
  def index
    @blogs = Blog.all
    
  end

  def rank
    @blogs = Blog.all
    @blogs = Blog.search(params).order(created_at: :desc)
    @most_viewed = Blog.order('impressions_count DESC').take(3)
    @all_ranks = Blog.find(Like.group(:blog_id).order('count(blog_id) desc').limit(3).pluck(:blog_id))
    @all_ranks_comment = Blog.find(Comment.group(:blog_id).order('count(blog_id) desc').limit(3).pluck(:blog_id))
    @all_ranks_user_blog = User.find(Blog.group(:user_id).order('count(user_id) desc').limit(3).pluck(:user_id))
    

  end

  # GET /blogs/1 or /blogs/1.json
  def show
    @like = Like.new
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
    
  end

  # POST /blogs or /blogs.json
  def create

    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    
  
    respond_to do |format|
      if @blog.save
        
        format.html { redirect_to @blog, notice: "Blog was successfully created." }
        format.json { render :show, status: :created, location: @blog }
        
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
      
    end
    
  end 

  
  def blog_params
    # titleとbodyを受け取る
    params.fetch(:blog, {}).permit(:title, :body)
  end
  
  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: "Blog was successfully updated." }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: "Blog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end
    
    

    
    
    

    
end
