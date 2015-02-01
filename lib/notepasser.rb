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
    #validates
    belongs_to :user
  end
end

module Notepasser::Controllers
    class Users < R '/user/new/([^/]+)'
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
  
      def delete(id)
        remove = Notepasser::Models::User.find(id)
        remove.destroy
        remove.to_json
        binding.pry
      end 

    end

    class List < R '/user/list/'
      def get
        dis = Notepasser::Models::User.group(:name)
        dis.to_json
      end
    end
    
    class Messages < R '/user/test/'
      def post
        new_msg = Notepasser::Models::Message.create(:user_id => @input['userid'], :content => @input['content'], :read => false)
        new_msg.to_json
      end
    
      def get
      msgs = Notepasser::Models::Message.where(:user_id => @input['userid'])
      msgs.to_json
      end

      def delete
      binding.pry
      msg = Notepasser::Models::Message.find(@input['id'])
      msg.destroy
      msg.to_json
      end

      def patch
        binding.pry
        edit = Notepasser::Models::Message.find(@input['id'])
        edit.update(:id => @input['id'],:read => true)
        edit.save
        
      end
    end
end
binding.pry
