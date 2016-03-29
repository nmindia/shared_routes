require 'singleton'


module RailsSharedRoutes
  class CallingRailsApp
    include Singleton
    attr_accessor :app
  end
end

