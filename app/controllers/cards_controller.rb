class CardsController < ApplicationController

    def new
        article = Article.find(params[:article_id])
        @card = article.cards.build
    end
end