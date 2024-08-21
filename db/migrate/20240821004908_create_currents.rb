class CreateCurrents < ActiveRecord::Migration[7.2]
  def change
    create_table :currents do |t|
      t.timestamps
    end
  end
end
