class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
 skip_before_filter :verify_authenticity_token

  # GET /posts
  # GET /posts.json

  def site
  @posts = Post.All
  end

  def index
    @posts = Post.all
       # render 'home/site
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end


 def komen 
    @komen = Post.find(params[:post_id]).komens.new
  @komen.isi=params[:isi_komen] 
  @komen.email=params[:email_komen]
    # @komentar.gambar = params[:gambar_gambar]
  @komen.save
  redirect_to root_path
  end 


def cek_auth
    unless user_signed_in?
      redirect_to root_path and return 
end      
end
  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
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
      params.require(:post).permit(:title, :body)
    end
end
