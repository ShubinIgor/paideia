class CreateBokmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :bokmarks do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
