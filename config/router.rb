# Merb::Router is the request routing mapper for the merb framework.
#
# You can route a specific URL to a controller / action pair:
#
#   r.match("/contact").
#     to(:controller => "info", :action => "contact")
#
# You can define placeholder parts of the url with the :symbol notation. These
# placeholders will be available in the params hash of your controllers. For example:
#
#   r.match("/books/:book_id/:action").
#     to(:controller => "books")
#   
# Or, use placeholders in the "to" results for more complicated routing, e.g.:
#
#   r.match("/admin/:module/:controller/:action/:id").
#     to(:controller => ":module/:controller")
#
# You can also use regular expressions, deferred routes, and many other options.
# See merb/specs/merb/router.rb for a fairly complete usage sample.

Merb.logger.info("Compiling routes...")
Merb::Router.prepare do 
  # RESTful routes
  # r.resources :posts

  # This is the default route for /:controller/:action/:id
  # This is fine for most cases.  If you're heavily using resource-based
  # routes, you may want to comment/remove this line to prevent
  # clients from calling your create or destroy actions with a GET
  resources :users
  identify User => :username do
    match('/feed/:username(.:format)').to(:controller => 'users', :action => 'feed').name(:feed)
  end
  match('/').to(:controller => 'main', :action => 'index').name(:index)
  match('/login').to(:controller => 'main', :action => 'login').name(:login)
  match('/logout').to(:controller => 'main', :action => 'log_user_out').name(:logout)
  match('/faq').to(:controller => 'main', :action => 'faq').name(:faq)
  match('/privacy').to(:controller => 'main', :action => 'privacy').name(:privacy)
  match('/about').to(:controller => 'main', :action => 'about').name(:about)
  match('/contact').to(:controller => 'main', :action => 'contact').name(:contact)
  match('/terms').to(:controller => 'main', :action => 'terms').name(:terms)
  match('/bad_sites/batch_update').to(:controller => 'users', :action => 'batch_update_bad_sites').name(:update_bad_sites)

  
  default_routes

  # Change this for your home page to be available at /
  # r.match('/').to(:controller => 'whatever', :action =>'index')
end
