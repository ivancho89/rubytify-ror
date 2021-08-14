class Artist < ApplicationRecord
    has_many :albums
    accepts_nested_attributes_for :albums
end
