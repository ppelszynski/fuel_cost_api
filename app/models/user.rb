class User < ApplicationRecord
  devise :database_authenticatable,
         :jwt_authenticatable, 
         :registerable,
         jwt_revocation_strategy: JwtBlacklist

  validates_uniqueness_of :email
end
