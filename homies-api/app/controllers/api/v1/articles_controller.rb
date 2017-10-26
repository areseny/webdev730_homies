module Api::V1
  class ArticlesController < ApplicationController

    def index
      @articles_json = Article.all.as_json(include: {article_likes: {only: :user_id}, article_comments: {only: [:user_id, :content]}})
      render json: @articles_json
    end



    def like_destroy
      @article_likes = ArticleLike.where(api_id: params[:article_id], user_id: session[:user_id])
      @article_likes.destroy

    end

    def like_create
      @article_likes = ArticleLike.new(article_likes_params)
      @article_likes.save
    end

    def like_number
      @article_likes = ArticleLike.where(api_id: params[:article_id])
      render json: @article_likes.length
    end

    private

    def article_likes_params
      params.require(:article_likes).permit(
        :api_id,
        :user_id
      )
    end

  end
end