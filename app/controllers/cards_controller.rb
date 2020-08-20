class CardsController < ApplicationController

    def new
        article = Article.find(params[:article_id])
        @card = article.cards.build
    end

    def create
        article = Article.find(params[:article_id])
        @card = article.cards.build(card_params)
        if @card.save
          redirect_to article_path(article), notice: 'Add card'
        else
          flash.now[:error] = 'Could not update'
          render :new
        end
      end
    private
    def card_params
        params.require(:card).permit(:title, :content)
    end
end