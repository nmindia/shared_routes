unless RailsSharedRoutes::CallingRailsApp.instance.app.nil?
  RailsSharedRoutes::CallingRailsApp.instance.app.routes.draw do
    scope '/test_portal', :as => 'test' do
      root 'home#home'
      get '/login', to: "home#login", as: :login
      get '/logout', to: "application#logout", as: :logout

      resource :test, :only => [ :show ] do
      	collection do
      		get :test_details
      	end
      end

    end
  end
end

