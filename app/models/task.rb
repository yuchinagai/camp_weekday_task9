class Task < ApplicationRecord
  enum status:{ draft:0, published:1, archieved:2 }
  validates :title, presence: true, uniqueness: true
  validates :memo, presence: true, length: { in: 10..30 }  
end
