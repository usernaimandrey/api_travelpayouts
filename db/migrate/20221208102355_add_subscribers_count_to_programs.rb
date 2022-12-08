class AddSubscribersCountToPrograms < ActiveRecord::Migration[6.1]
  def change
    add_column :programs, :subscribers_count, :integer
  end
end
