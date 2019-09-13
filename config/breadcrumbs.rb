
# ルート
crumb :root do
  link "メルカリ", root_path
end

# マイページ
crumb :mypage do
  link "マイページ", user_path(current_user.id) 
  parent :root
end

# プロフィール
crumb :profile do
  link "プロフィール", new_user_profile_path(current_user.id)
  parent :mypage
end

# 支払い方法
crumb :credit do
  link "支払い方法", delete_credits_path
  parent :mypage
end

# クレジットカード情報入力
crumb :credit_information do
  link "クレジットカード情報入力", new_credit_path
  parent :credit
end

# 本人情報の登録
crumb :identification do
  link "本人情報の登録", user_identifications_path(current_user.id)
  parent :mypage
end

# ログアウト
crumb :log_out do
  link "ログアウト", logouts_path
  parent :mypage
end

# 出品した商品-出品中
crumb :exhibiting do
  link "出品した商品-出品中", user_exhibiting_path(current_user.id)
  parent :mypage
end

# 出品した商品-取引中
crumb :trading do
  link "出品した商品-取引中", user_trading_path(current_user.id) 
  parent :mypage
end

# 出品した商品-売却済み
crumb :sold do
  link "出品した商品-売却済み", user_sold_path(current_user.id)
  parent :mypage
end

# 出品商品画面
crumb :index do
  link "出品商品画面", product_path(current_user.id)
  parent :exhibiting
end

# カテゴリー
crumb :categories do
  link "カテゴリ一覧", root_path
  parent :root
end

crumb :category do
  category = Category.find(params[:id])
  if category.ancestry
    if category.children.present?
      # 子供である
      link category.parent.name, category_path(category.parent.id)
    else
      # 孫である
      link category.parent.parent.name, category_path(category.parent.parent.id)
    end
  else
    # 親である
    link category.name, category_path(params[:id])
  end
  parent :categories
end

crumb :childCategory do
  category = Category.find(params[:id])
  if category.children.present?
    # 子供である
    link category.name, category_path(params[:id])
  else
    # 孫である
    link category.parent.name, category_path(category.parent.id)
  end
  parent :category
end

crumb :grandchildCategory do
  link Category.find(params[:id]).name, category_path(params[:id])
  parent :childCategory
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).