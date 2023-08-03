class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bank, null: false, foreign_key: true
      t.string     :number
      t.bigint     :balance, default: 0
      t.integer     :status, default: 0
      t.timestamps
    end
  end
end
