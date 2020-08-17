class BoardsController < ApplicationController
    def show
        @article = Article.find(params[:id])
        @comments = @article.comments
    end

    private
    def board_params
        params.require(:board).permit(:title, :content, :eyecatch)
    end

end
