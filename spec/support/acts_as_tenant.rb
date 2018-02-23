RSpec.configure do |config|
  config.before(:suite) do
    ActsAsTenant.current_tenant = Hotel.create!(name:      'Test Hotel',
                                                time_zone: 'Istanbul',
                                                currency:  'TRY',
                                                subdomain: 'testhotel')
  end

  config.after(:suite) do
    ActsAsTenant.current_tenant = nil
    Hotel.destroy_all
  end
end