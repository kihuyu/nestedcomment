require_dependency "nestedcomments/application_controller"

module Nestedcomments
  class CommentsController < ApplicationController
    before_action :authorize, only: [:create]
    before_action :authorize_edit, only: [:edit, :destroy]
    def authorize
      redirect_to comments_path, alert:"Only authorized users can comment" if session[:username].nil?
    end
    def authorize_edit
      @comment = Comment.find(params[:id])
      if session[:username].nil?
        redirect_to comments_path, alert: "You must be logged in to edit or delete"
      else
        redirect_to comments_path, alert: "Only author can edit or delete" if session[:username] != @comment.username && !current_user.nil?
      end
    end

    def index
      @comments = Comment.all
    end
    def show
      @comment = Comment.find(params[:id])
      session[:comment_id] = @comment.id
    end

    def edit
      @comment = Comment.find(params[:id])
    end
    def new
      @comment = Comment.new
    end

    def create
      @comment = Comment.new (comment_params)
      @comment.username = session[:username]
      @comment.article_id = session[:id]
      if params['commit'] == "reply"
        @comment.commentable_type = "Comment"
      else
        @comment.commentable_type = "Article"
        @comment.commentable_id = session[:id]
        @comment.body = params['orig_comment_body']
        session[:comment_id] = @comment.id
      end
      if @comment.save
        redirect_to comments_path, alert: "Posted"
      else
        redirect_to comments_path, alert: "Failed"
      end
    end
    def update
      @comment = Comment.find(params[:id])
      if @comment.update(params.require(:comment).permit(:body, :username, :commentable_id, :commentable_type))
        redirect_to @comment
      else
        render 'edit'
      end
    end
    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy

      redirect_to comments_path
    end


  private

  def comment_params
    params.permit(:body, :username, :commentable_id, :commentable_type)
  end

  end
end
