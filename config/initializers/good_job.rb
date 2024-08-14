# frozen_string_literal: true

GoodJob::Engine.middleware.use(Rack::Auth::Basic) do |username, password|
  ActiveSupport::SecurityUtils.secure_compare(ENV.fetch('GOOD_JOB_USERNAME', nil), username) &
    ActiveSupport::SecurityUtils.secure_compare(ENV.fetch('GOOD_JOB_PASSWORD', nil), password)
end
