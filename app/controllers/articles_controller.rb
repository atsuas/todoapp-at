class ArticlesController < ApplicationController
    before_action :authenticate_model!, only: [:new, :create, :edit, :update, :destroy]

    def index
        @articles = Article.all.order("id DESC")
        
    end

    def show
        @articles = Article.where('id >= ?', params[:id])
    end

    def new
        @article = current_model.articles.build
    end

    def create
        @article = current_model.articles.build(article_params)
        if @article.save
          redirect_to article_path(@article), notice: 'Save complete'
        else
          flash.now[:error] = 'save error'
          render :new
        end
    end

    def edit
        @article = current_model.articles.find(params[:id])
    end

    def update
        @article = current_model.articles.find(params[:id])
        if @article.update(article_params)
        redirect_to article_path(@article), notice: 'update successful!!'
        else
            flash.now[:error] = 'update failed'
            render :edit
        end
    end

    def destroy
        article = current_model.articles.find(params[:id])
        article.destroy!
        redirect_to root_path, notice: 'delete successful!!'
    end


    private
    def article_params
        params.require(:article).permit(:title, :content, :eyecatch)
    end

end
