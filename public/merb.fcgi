#!/home/tlm/ruby-base/bin/ruby 
                                                               
require 'rubygems'
ENV['GEM_HOME']='/home/tlm/lib/ruby/gems/1.8'
require 'merb-core'

# this is Merb.root, change this if you have some funky setup.
merb_root = File.expand_path(File.dirname(__FILE__) / '../')
        
# If the fcgi process runs as apache, make sure
# we have an inlinedir set for Rubyinline action-args to work
unless ENV["INLINEDIR"] || ENV["HOME"]
  tmpdir = merb_root / "tmp"
  unless File.directory?(tmpdir)
    Dir.mkdir(tmpdir)
  end                
  ENV["INLINEDIR"] = tmpdir
end
#ENV["MERB_ENV"]= 'production'
   
# start merb with the fcgi adapter, add options or change the log dir here
Merb.start(:adapter => 'fcgi',
           :merb_root => merb_root,
           :log_file => merb_root /'log'/'merb.log',
           :environment => 'production')
