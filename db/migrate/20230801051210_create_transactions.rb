class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.bigint     :amount, default: 0
      t.bigint     :bank_id
      t.bigint     :reciever_id
      t.timestamps
    end
  end
end
