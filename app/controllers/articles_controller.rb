class ArticlesController < ApplicationController


 def show
  @article  = Article.find(params[:id])
    # => byebug

#  format.html { render :template => "Articles/show" }
  render :template => "Articles/show"


 end

 def index
   @articles = Article.all

   render :template => "Articles/index"
 end
def new
#  abort params.to_s
@article = Article.new
render :template => "Articles/new"
end

def create
    # TO DEBUG SET KEYWORD DEBUGGER ANYWHERE YOU WANT TO # DEBUG:
  title  = params[:article][:title]
  desc   = params[:article][:description]
  #render plain: params.require(:article).permit(:title,:description)
  @article = Article.new(params.require(:article).permit(:title,:description))

if  @article.save
    #  render(plain:article_path(@article))
      flash[:notice] = "Article Was Created Successfully."
      redirect_to @article

    else render :template => "Articles/new"


    end
#  @article= Article.new(title:title,description:desc)
#  @article.save
  #redirect_to @new_article
  #redirect_to article_path(@article)

 #render plain: desc
  #render plain: params[:article][:title]

end

def edit #get
@article = Article.find(params[:id])
render :template => "Articles/edit"
end

def update
@article = Article.find(params[:id])
if @article.update(params.require(:article).permit(:title,:description))
  flash[:notice] = "Updated Successfully The #{@article.id} Article"
  redirect_to @article
else
  render :template => "Articles/edit"
end

end

 def destroy
   @article = Article.find(params[:id])
   if @article.destroy
     flash[:notice] = "Deleted Successfully The #{@article.id} Article"
     redirect_to @article
   else
     render :template => "Articles/edit"
   end
 end


end
