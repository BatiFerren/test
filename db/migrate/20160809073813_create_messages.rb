class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :date_message
      t.text :text_message

      t.timestamps
    end
  end
end
