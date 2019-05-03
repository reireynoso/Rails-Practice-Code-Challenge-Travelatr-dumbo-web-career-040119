class Blogger < ApplicationRecord

    has_many :posts
    has_many :destinations, through: :posts

    validates_presence_of :name, :bio, :age
    validates_uniqueness_of :name

    validates_numericality_of :age, {
        greater_than: 0,
        only_integer: true
    }

    validates :bio, length: {minimum: 30} 

end
