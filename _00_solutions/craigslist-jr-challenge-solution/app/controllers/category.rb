# homepage
get '/category' do
  @categories = Category.all
  erb :"category/index"
end

# list of articles for category
get '/category/:category_id/article' do
  @category = Category.find(params[:category_id])
  @articles = @category.articles
  erb :"article/index"
end
