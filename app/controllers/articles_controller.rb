class ArticlesController < ApplicationController
   before_action :set_article,only: [:show,:edit,:update,:destroy]

   def show
      #debugger
      #set_article
   end
   def index
      @articles=Article.all;
   end

   def new
      @article=Article.new;
   end

   def create   
      @article=Article.new(article_params);
      #render plain: @article.inspect
      if @article.save
         flash[:alert]="Article was successfully created";
         #redirect_to article_path(@article)
         redirect_to Article
      else
         render :new
      end      
   end 
   
   def edit
      #set_article
   end

   def update
      #set_article
      if @article.update(article_params)
         flash[:alert]="Article was successfully updated";
         redirect_to article_path(@article.id)
      else
         render :edit
      end
   end

   def destroy
      #set_article
      @article.destroy
      flash[:alert]="Article was successfully deleted";
      redirect_to articles_path
      #redirect_to prefix_path ---> generalization
      #redirect_to Articles
   end   
   
   private
   
   def set_article
      @article=Article.find(params[:id])
   end
   
   def article_params
      params.require(:article).permit(:title, :description)
   end   
   
end    