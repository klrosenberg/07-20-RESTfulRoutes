unless ActiveRecord::Base.connection.table_exists?(:users)
  ActiveRecord::Base.connection.create_table :users do |t|
    t.string :email
    t.string :name
    t.text :password
  end  
end

unless ActiveRecord::Base.connection.table_exists?(:stories)
  ActiveRecord::Base.connection.create_table :stories do |t|
    t.string :title
  end  
end