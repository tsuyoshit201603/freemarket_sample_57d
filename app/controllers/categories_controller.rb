class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    if @category.ancestry
      if @category.children.present?
        @family = "child"
      else
        @family = "grandchild"
      end
    else
      @family = "parent"
    end
  end
end
