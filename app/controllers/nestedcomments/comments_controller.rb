require_dependency "nestedcomments/application_controller"

module Nestedcomments
  class CommentsController < ApplicationController
    before_action :authorize, only: [:create]
    def authorize
      redirect_to comments_path, alert:"Only authorized users can comment" if session[:username].nil?
    end

    def index
      @comments = Comment.all
    end
    def create
    @comment = Comment.new (comment_params)
    @comment.username = session[:username]
    @comment.article_id = session[:id]
    if @comment.save
      redirect_to comments_path, alert: "Posted"
    else
      redirect_to comments_path, alert: "Failed"
    end
  end

  private

  def comment_params
    params.permit(:body, :username, :article_id)
  end

  #def find_commentable
  #  @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
  #end
  end
end
