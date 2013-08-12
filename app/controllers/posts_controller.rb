class PostsController < ApplicationController
  layout 'admin'
  before_action :set_post, only: [:show, :view, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    #@posts = Post.all
    @category = Category.find(params[:category_id])
    @posts = initialize_grid(Post.where(category_id: @category), 
                              # include: :category, 
                              order: 'id', 
                              order_direction: 'desc')
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  def view
    @post_prev = @post.category.prev(@post.id)
    @post_next = @post.category.next(@post.id)

    render layout: 'view_post'
  end

  # GET /posts/new
  def new
    @category = Category.find(params[:category_id])
    @post = Post.new
    @post.category = @category
  end

  # GET /posts/1/edit
  def edit
    @category = Category.find(params[:category_id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to category_posts_path(@post.category), notice: 'Post was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to category_posts_path(@post.category), notice: 'Post was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :category_id)
    end
end
