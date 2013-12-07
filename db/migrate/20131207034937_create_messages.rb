class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :description
      t.string :source
      t.string :country
      
      t.timestamps
    end
  end
end