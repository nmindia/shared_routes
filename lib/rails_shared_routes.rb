require 'action_dispatcher_extension'
require 'settingslogic'
require 'semantic_logger' unless defined?(logger)


module RailsSharedRoutes
  GEM_ROOT = File.join(File.dirname(__FILE__), '..')

  logger = SemanticLogger['RailsSharedRoutes']

	class Settings < Settingslogic
    namespace ( ( ::Rails.env rescue nil ) || ENV['RAILS_ENV'] )
    source "./config/rails_shared_routes.yml"
	end

  settings = (Settings.to_hash rescue nil)
  logger.info "RailsSharedRoutes loaded settings: ", settings: settings
  if settings.nil?
    logger.warn "Failed to load settings from rails_shared_routes.yml"
  else
    logger.info "Loaded Settings", Settings.to_hash
  end
end

Settings = RailsSharedRoutes::Settings

require 'rails_shared_routes/version'
require 'rails_shared_routes/helpers/calling_rails_app'
require 'rails_shared_routes/routes/test'
require 'rails_shared_routes/route_helpers/route_helper'
require 'rails_shared_routes/route_helpers/test_route_helper'
