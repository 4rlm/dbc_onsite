# filter that allows only logged in users to do posts under all category pages
before "/category/*" do
  if !request.get?
    if !current_user
      redirect "/login"
    end
  end
end

# show article
get "/category/:category_id/article/:id" do
  @article = Article.find_by(id: params[:id], category_id: params[:category_id])
  if session[:edit_key]
    @edit_key = session[:edit_key]
  end
  erb :"article/show"
end

# new article form
get "/category/:category_id/new_article" do
  @category_id = params[:category_id]
  erb :"article/new"
end

# post to create article
post "/category/:category_id/article" do
  new_article = Article.new(params[:article])
  new_article.save
  session['edit_key'] = new_article.edit_key
  redirect "/category/#{params[:category_id]}/article/#{new_article.id}"
end

# edit article form with unique edit key
get "/category/:category_id/article/:id/edit" do
  @article = Article.find_by(id: params[:id], category_id: params[:category_id])
  @key_to_compare = params[:key]
  if @article.edit_key == @key_to_compare
    erb :"article/edit"
  else
    "You do not have permission to edit this page."
  end
end

# put to update article
put "/category/:category_id/article" do
  @updated_article  = Article.find(params[:article][:id])
  @updated_article.update(params[:article])

  redirect "/category/#{params[:category_id]}/article/#{@updated_article.id}"
end