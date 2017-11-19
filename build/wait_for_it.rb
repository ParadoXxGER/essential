require 'socket'
require 'timeout'
require 'uri'

@services = %w[
  DATABASE_URL
  REDIS_SESSION_URL
  REDIS_CACHE_URL
].map do |service|
  URI.parse(ENV[service])
end

@services.each do |service|
  puts "INFO: ====> Checking #{service.host}:#{service.port}"
  begin
    Timeout.timeout(30) do
      begin
        Socket.tcp(service.host, service.port, connect_timeout: 5)
      rescue StandardError => e
        puts "ERROR: ====> #{service.host}:#{service.port} An error occurred!"
        puts e.message.humanize.to_s
        sleep 5
        retry
      end
    end
  rescue Timeout::Error
    puts 'ERROR: ====> All operations timed out!'
    exit 255
  end
end

exit 0
