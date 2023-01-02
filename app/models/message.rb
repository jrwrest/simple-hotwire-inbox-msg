class Message < ApplicationRecord
  belongs_to :inbox
  acts_as_tenant :account
  

  # lets you use dom_id in a model
  include ActionView::RecordIdentifier

  after_create_commit do 
    broadcast_prepend_to [inbox, :messages], target: dom_id(inbox, :messages), partial: "messages/message", locals: { message: self }
    # broadcast_prepend_to [inbox, :messages], target: ActionView::RecordIdentifier.dom_id(inbox, :messages)
  end

  after_update_commit do
    broadcast_update_to [inbox, :messages], target: self, partial: "messages/message", locals: { message: self }
  end

  after_destroy_commit do
    broadcast_remove_to [inbox, :messages], target: self
  end
end
