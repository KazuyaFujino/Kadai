class CreateKyokus < ActiveRecord::Migration[5.1]
  def change
    create_table :kyokus do |t|
      t.text :day
      t.text :senkei
      t.text :comment
      t.text :kif

      t.timestamps
    end
  end
end
