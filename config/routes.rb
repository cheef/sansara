JqueryCarousel::Application.routes.draw do
  match 'carousel' => 'carousel#show'
  root :to => 'carousel#show'
end
