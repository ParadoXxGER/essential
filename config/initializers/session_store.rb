Essential::Application.config.session_store :redis_store, servers: [EssentialConfig::REDIS_SESSION_URL]
