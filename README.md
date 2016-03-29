#RailsSharedRoutes

The idea evolved out of the need to share routes across mutiple rails app without actually hardcoding things or using bunch of config files.

## Installation

Add this line to your application's Gemfile:

    gem 'rails_shared_routes'

And then execute:

    $ bundle

## Usage
To use a route of a different app :
  You need to clone the gem and add a helper in the route_helper folder. You can look at the test_route_helper.rb on how to make that happen.
  After that, the routes that you want to publish need to be added in the routes folder. The test.rb file in routes folder explains how this needs to happen.

Once you have published the routes, then to consume them in a different app:  
Add this to your routes.rb file (for the TestRoute):
RailsSharedRoutes::TestRouteHelper.mount_test_routes(RailsApplication::Instance)

This line would mount all the test routes to your app and make them available as URL helpers.

Thereafter, to use the url helpers in the code: RailsSharedRoutes::TestRouteHelper.login_url etc.

Note: The _path helpers are not supported.

