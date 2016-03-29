module RailsSharedRoutes
  module RouteHelper

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def has_shared_route(name, options={})
        @host ||= options[:host] || ::RailsSharedRoutes::Settings.send("#{name}_host")
        @protocol ||= options[:protocol] || ( ::RailsSharedRoutes::Settings.send("#{name}_protocol") rescue nil) || "http"
        @port ||= options[:port] || (::RailsSharedRoutes::Settings.send("#{name}_port") rescue nil) || 80
        self.instance_eval <<-RUBY
          def host; @host; end
          def protocol; @protocol; end
          def port; @port; end

          def mount_#{name}_routes(app_obj)
            RailsSharedRoutes::CallingRailsApp.instance.app = app_obj
            route_file_name = File.join(RailsSharedRoutes::GEM_ROOT,'lib/rails_shared_routes/routes/#{name}.rb')
            app_obj.routes.draw  do
              draw route_file_name
            end
          end
        RUBY
      end

      def method_missing(meth, *args, &block)
        if meth.to_s =~ /^(.+)_url$/
          ::Rails.application.routes.url_helpers.send(meth.to_s, *args, :host => self.host, :protocol => self.protocol, :port => self.port)
        elsif meth.to_s =~ /^(.+)_path$/
          raise "Only url helpers are supported. Relative paths are not supported."
        else
          raise "This format is not supported"
        end

      end
    end
  end
end
