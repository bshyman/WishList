class AddSomePermissions < ActiveRecord::Migration[5.2]
  def change
    Permission.create(name: 'superuser')
    Permission.create(name: 'admin')
    Permission.create(name: 'member')
  end
end
