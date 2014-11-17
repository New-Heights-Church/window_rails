if(Rails.version.split('.').first.to_i > 2)
  Rails.application.routes.draw do
    match 'window_rails/open_window' => 'window_rails#open_window', :as => :open_window, via: [:get, :post]
  end
else
  ActionController::Routing::Routes.draw do |map|
    map.open_window 'window_rails/open_window', :controller => :window_rails, :action => :open_window
  end
end
