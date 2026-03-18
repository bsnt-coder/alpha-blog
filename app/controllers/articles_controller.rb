class ArticlesController < ApplicationController
   def show
      #debugger
      @article=Article.find(params[:id])
   end
   def index
      @articles=Article.all;
   end

   def new
      @article=Article.new;
   end

   def create   
      @article=Article.new(params.require(:article).permit(:title, :description));
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
   end

   def update
   end
      
end    