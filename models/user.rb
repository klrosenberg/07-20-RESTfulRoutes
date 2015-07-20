class User < AcitveRecord::Base
  validates :name, presence: true, uniqueness: true
end