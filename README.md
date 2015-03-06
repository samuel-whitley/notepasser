# Notepasser

Pass notes to your friends with HTTP and ruby!

## Usage

Run `bundle exec camping -s webrick -h YOUR_IP_ADDRESS lib/notepasser.rb`
to get the server running. Have your friends write a client to send you
messages with HTTParty. Add a short two to three line decription to this
file's "API Calls" section whenever you add support for an API call.

The description should include the HTTP method to use,
the route, and any parameters and what they do.

## API Calls
User Name
Get domain/user/list

Delete User

delete domain/user/list/name

Create User

Post domain/user/make/name

List User measages

Get domain/user/test

Http Party Example

def list(opts = {:userid => 7} )
      options = opts
      res = HTTParty.get("http://192.168.1.106:3301/user/test/", :body => options)
      list = JSON.parse(res.body)
      list.each do |x|
      puts "the recivers id is #{x['user_id']} and the messages are #{x['content']}"
        end
    end

Delete User mesage

Delete domain/user/test

Http party example

def delete(opts = {:id => 25})
      options = opts
      res = HTTParty.delete("http://192.168.1.106:3301/user/test/",:body => options)
      del = JSON.parse(res.body)
      
    end


Mark Read

Patch Domain user/test

Http party Example

def open(opts = {:id => 31})
      options = opts
      res = HTTParty.patch("http://192.168.1.106:3301/user/test/",:body => options)
      stats = JSON(res.body)
      binding.pry
end



























































































































































































































































































































