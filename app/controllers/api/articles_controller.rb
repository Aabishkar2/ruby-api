module Api
	class ArticlesController < ApplicationController
		def index
			articles = Article.order('created_at DESC')
			render json: { status: 'success', message: 'Loaded', data:articles},status: :ok
	    end
	   
	    def show
	    	if Article.exists?(:id => params[:id])
	    		articles = Article.find(params[:id])
	    		render json: { status: 'success', message: 'Loaded', data:articles},status: :ok
	    	else
	    		render json: { status: 'Error' ,message:'The articles with the given id does not exist' },status: :unprocessable_entity
	    	end
	    end
	   
	    def new
	    end
	   
	    def create
	    	article = Article.new(article_params)
	    	if article.save
	    		render json: { status: 'success', message: 'Saved', data:article},status: :ok
	    	else
	    		render json: { status: 'Error', message: 'Not saved', data:article.errors},status: :unprocessable_entity
	    	end

	    end
	   
	   
	    def update
	    	article = Article.find(params[:id])
	    	if article.update_attributes(article_params)
	    		render json: { status: 'success', message: 'Update', data:article},status: :ok
	    	else
	    		render json: { status: 'Error', message: 'Not Updated', data:article.errors},status: :unprocessable_entity
	    	end

	    end
	   
	    def destroy
	    	article = Article.find(params[:id])
	    	article.destroy
	    	render json: { status: 'success', message: 'Loaded', data:article},status: :ok
	    end

	    private
	    def article_params
	    	params.permit(:title, :body)
	    end
	end
end