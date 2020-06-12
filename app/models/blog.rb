class Blog < ApplicationRecord
validates :title, :content, presence: true, length: { in: 3..30 }
end
