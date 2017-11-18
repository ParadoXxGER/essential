Rails.application.configure do
  module EssentialConfig
    BASE_URL = ENV['BASE_URL'] || puts('WARNING ====> No BASE_URL given')
    REDIS_SESSION_URL = ENV['REDIS_SESSION_URL'] || puts('WARNING ====> No REDIS_SESSION_URL given')
    REDIS_CACHE_URL = ENV['REDIS_CACHE_URL'] || puts('WARNING ====> No REDIS_CACHE_URL given')
    SESSION_LIFETIME_IN_HOURS = ENV['SESSION_LIFETIME_IN_HOURS'] || puts('WARNING ====> No SESSION_LIFETIME_IN_HOURS given')
    RAILS_MAX_THREADS = ENV['RAILS_MAX_THREADS'] || puts('WARNING ====> No RAILS_MAX_THREADS given')
    PORT = ENV['PORT'] || puts('WARNING ====> No PORT given')
    WEB_CONCURRENCY = ENV['WEB_CONCURRENCY'] || puts('WARNING ====> No WEB_CONCURRENCY given')
    CACHE_ENABLED = ENV['CACHE_ENABLED'] || puts('WARNING ====> No CACHE_ENABLED given')
    DATABASE_URL = ENV['DATABASE_URL'] || puts('WARNING ====> No DATABASE_URL given') && exit(255)
  end
end