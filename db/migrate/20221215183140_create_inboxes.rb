class CreateInboxes < ActiveRecord::Migration[7.0]
  def change
    create_table :inboxes do |t|
      t.string :name
      t.references :account, null: false, foreign_key: true


      t.timestamps
    end
  end
end
