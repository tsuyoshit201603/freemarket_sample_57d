
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