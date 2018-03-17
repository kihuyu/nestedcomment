Rails.application.routes.draw do
  mount Nestedcomments::Engine => "/nestedcomments"
end
