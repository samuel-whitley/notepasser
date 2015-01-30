class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
    end

      create_table :messages do |t|
        t.integer :user_id
        t.string :content
        t.boolean :read
    end
  end

    def self.down
      drop_table :users
      drop_tabel :messages
    end
  end

