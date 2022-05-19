class AddClickedToLinks < ActiveRecord::Migration[6.0]
  def change
    add_column :links, :clicked, :integer, default: 0
    add_column :links, :expired_date, :datetime
  end
end
