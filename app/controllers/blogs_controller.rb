class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy  ]
  before_action :logged_in_user, only:[:edit, :update, :destroy,:new,:deleted,:delete,:restore]
  before_action :baria_user, only: [:edit, :destroy, :update,:new,:deleted,:delete,:restore]
  
  impressionist :actions=> [:show]


  # GET /blogs or /blogs.json
  def index
    @blogs = Blog.all.page(params[:page]).per(5)
   
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
        
        format.html { redirect_to @blog, notice: "ブログを作成しました" }
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
      format.html { redirect_to blogs_url, notice: "ゴミ箱へ移動しました。." }
      format.json { head :no_content }
    end
  end

  def restore
    @id = params[:id]
    Blog.restore(@id)
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: "ブログを復元しました" }
      format.json { head :no_content }
    end
  end

  def delete
    @id = params[:id]
    @blog=Blog.only_deleted.find_by(id:@id)
    @blog.really_destroy!
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: "ブログを削除しました" }
      format.json { head :no_content }
    end
  end


  def deleted
    @blogs = Blog.only_deleted.where(user_id:current_user.id)
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      
      @blog = Blog.with_deleted.find(params[:id])
    end

    def baria_user
      unless Blog.with_deleted.find_by(params[:id]).user.id.to_i == current_user.id
          redirect_to blogs_path
      end
    end

  
    
end
