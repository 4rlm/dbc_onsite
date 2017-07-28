# view tags
# get '/tags' do
#   @tags = Tag.all
#   erb :'tags/index'
# end

# view tags
get '/tags' do
  ## query: joins, group, order, count, limit, count ##
  # @tags = Tag.joins(:taggings).group("tags.name, tags.id").order("count(tags.name) desc").limit(10)

  @tags = Tag.joins(:taggings).group("tags.name, tags.id").order("count(tags.name) desc")

  @tags = @tags.paginate(page: params[:page], per_page: 10)

  erb :'tags/index'
end

#############

# Show
get '/tags/:id' do
  @tag = Tag.find(params[:id])
  @entries = @tag.entries

  erb :'tags/show'
end


# Entry.select("entries, tags").joins("JOIN tags ON tags.taggable_id = entries.id")



##################

#1) Entry.select("entries.id, entries.author, entries.title, entries.body, tags.name").joins("JOIN tags ON tags.taggable_id = entries.id")

#2) Entry.find(1).tags  #=> 1 is id number.

#3) Entry.find(Tag.find(7).taggable_id)
