require "notepasser/version"
require "notepasser/init_db"
require "camping"
require "pry"

Camping.goes :Notepasser

module Notepasser
end

module Notepasser::Models
  class User < ActiveRecord::Base
    has_many :messages, dependent: :destroy
  end

  class Message < ActiveRecord::Base
    belongs_to :user
  end
end

module Notepasser::Controllers
    class Users < R '/user/([^/]+)'
      def get(name)
      user = Notepasser::Models::User.where(:name == name)
      user.to_json
      
      end
    end

    class Make < R '/user/make/([^/]+)'
      def post(name)
        new_usr = Notepasser::Models::User.find_or_create_by(:name => name)
       new_usr.save
       new_usr.to_json
     end
    end

    class List < R '/user/list/'
      def get
        dis = Notepasser::Models::User.group(:name)
        dis.to_json
      end
    end
    
    class Send
      def patch(msg = {})

       #send = Notepasser::Models::Message.create(:user_id => ??? ,:content => , :read => false)
      end
    end
end
binding.pry
