class Inbox < ApplicationRecord
    has_many :messages
    broadcasts_to ->(inbox) {:inbox_list}
end
