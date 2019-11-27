class Permission < ApplicationRecord
  ADMIN     = Permission.find_by_name('administrator')
  MEMBER    = Permission.find_by_name('member')
  SUPERUSER = Permission.find_by_name('superuser')
end
