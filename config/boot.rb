require 'rubygems'

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])


def informurl()
  begin
    require 'socket'
    ip_addr = Socket::getaddrinfo(Socket.gethostname, "echo", Socket::AF_INET)[0][3]
    url = "http://#{ip_addr}:#{3000}/mac/control" # todo: remove hard coding of port
    puts "**** goto URL below ****"
    puts url
  rescue Exception => e
    puts "*** Cannot generate URL! ***"
  end

end

informurl()
