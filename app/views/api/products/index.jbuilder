if @childrenCategories
  json.array! @childrenCategories do |category|
    json.id       category.id
    json.name     category.name
    json.ancestry category.ancestry
  end
end