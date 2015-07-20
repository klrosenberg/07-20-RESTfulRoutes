# Create database for this program.
DATABASE = SQLite3::Database.new("database.db")

unless ActiveRecord::Base.connection.table_exists?(:users)
  ActiveRecord::Base.connection.create_table :users do |t|
    t.string :email
    t.string :name
    t.text :password
  end  
end