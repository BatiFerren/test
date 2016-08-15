class Message < ActiveRecord::Base
    acts_as_commentable
    validates :text_message, presence: true, length: { minimum: 4 }
end
