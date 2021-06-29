class Blogs::SearchesController < ApplicationController
  def index
    @blogs = Blog.where('title LIKE(?)', "%#{params[:title]}%")
    @blogs_value = "%#{params[:title]}%"
    if @blogs_value == "%%"
      
    else 
      respond_to do |format|
        format.html { redirect_to :root }

        # ↓検索結果のデータをレスポンスするコード
        format.json { render json: @blogs}
      end
    end  
  end
end