class PostsController < ApplicationController
  include SuggestedUsers

  before_action :set_suggested_users, only: %i[index]

  before_action :set_post, only: %i[ show  ]

  # GET /posts or /posts.json
  def index
    # flash.now[:notice] = "Notice!"

    @posts = Post.all.order(created_at: :desc)
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params.merge(created_by: current_user))

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post foi criado com sucesso." }
        format.json { render :show, status: :created, location: @post }
      else
        flash.now[:alert] = @post.errors.full_messages.to_sentence

        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:photo, :description)
    end
end
