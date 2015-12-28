RSpec.configure do |config|
  config.alias_example_to :fit, focus: true
  config.alias_example_to :pit, pending: true
end
