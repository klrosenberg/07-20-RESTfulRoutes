class User < AcitveRecord::Base
  validates :email, presence: true, uniqueness: true
end