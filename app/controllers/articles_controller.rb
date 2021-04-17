class ArticlesController < ApplicationController
    before_action :find_article, only: [:show, :edit, :update, :destroy]
    
    def home; end

    def index
        @articles = Article.all
    end

    def show; end

    def new
        @article = Article.new # needed to instantiate the form_for
    end

    def create
        @article = Article.new(article_strong_params)
        @article.save
        # no need for app/views/tasks/create.html.erb
        redirect_to article_path(@article)
    end

    def edit; end

    def update
        @article.update(article_strong_params)
        # no need for app/views/restaurants/update.html.erb
        redirect_to article_path(@article)
    end

    private

    def article_strong_params
        params.require(:article).permit(:title, :content)
    end

    def find_article
        @article = Article.find(params[:id])
    end
end
