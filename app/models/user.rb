class User < ApplicationRecord
    validates_uniqueness_of :token
end
