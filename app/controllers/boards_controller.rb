class BoardsController < ApplicationController
    def show
        @article = Article.where(params[:id])
        @comments = @article.comments
    end

    private
    def board_params
        params.require(:board).permit(:title, :content, :eyecatch)
    end

end
