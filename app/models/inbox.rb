class Inbox < ApplicationRecord
   
    acts_as_tenant :account
    has_many :messages
    # broadcasts_to ->(inbox) {:inbox_list}
end
