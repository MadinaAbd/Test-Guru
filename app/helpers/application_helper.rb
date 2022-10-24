module ApplicationHelper

  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to "Проект Test Guru", "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flsh_messages(type)
    content_tag(:p, flash[type], class: "flash #{type}") if flash[type]
  end

end
