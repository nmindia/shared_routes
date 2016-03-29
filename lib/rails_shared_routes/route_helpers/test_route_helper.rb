module RailsSharedRoutes
  class TestRouteHelper
    include RailsSharedRoutes::RouteHelper
    has_shared_route 'test'
  end
end
