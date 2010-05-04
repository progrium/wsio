require 'rubygems'
require 'httpclient'
require 'highline/import'
require 'json'
require 'base64'

def start(args)
  host_and_path = args.pop
  if host_and_path.include? '@'
    auth, host_and_path = host_and_path.split('@')
    user, pass = (auth.split(':')<<nil)[0,2]
    #unless pass
    #  pass = ask("Password for #{user}: ") {|q| q.echo = false}
    #end
  end
  raise "No host specified" unless host_and_path
  args = args.join.gsub('-', '')
  scheme = (args.include? 's') ? 'https' : 'http'
  url = "#{scheme}://#{host_and_path}"
  if args.include? 'l'
    c = HTTPClient.new
    c.get_content(url) do |chunk|
      obj = JSON.parse(chunk)
      if obj.is_a? Array
        puts obj.first
      else
        puts chunk
      end
    end
  else
    STDIN.each_line do |line|
      begin
        obj = JSON.parse(line)
        if obj.is_a? Hash
          body = line
          headers = {"Content-Type" => "application/json"}
        elsif obj.is_a? Array
          body = obj.first.to_s
          headers = {"Content-Type" => "text/plain"}
        else 
          body = obj.to_s
          headers = {"Content-Type" => "text/plain"}
        end
      rescue JSON::ParserError
        body = line.strip
        if body.split('&').collect{|m| /^[^&^=]+=[^&^=]+$/.match(m) }.all?
          headers = {}
        else
          headers = {"Content-Type" => "text/plain"}
        end
      end
      c = HTTPClient.new
      #c.set_auth(url, 'user', 'pass') if user  ## This doesn't work?
      headers['Authorization'] = "Basic #{Base64.encode64([user,pass].join(':')).gsub("\n",'')}" if user # Fix set_auth
      c.ssl_config.verify_mode = nil if args.include? 'k'
      resp = c.post(url, body, headers)
      if resp.status != 200
        puts resp.content
      end
    end
  end
end