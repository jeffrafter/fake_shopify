class AppEvent < ActiveRecord::Base
  KINDS = [
    :install,
    :uninstall,
  ]
end
