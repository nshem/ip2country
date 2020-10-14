class ApplicationController < ActionController::API
  before_action :limit_rate

  private

  def limit_rate
    curr_time = Time.now.to_i

    times_of_last_requests = (JSON.parse(REDIS.get('times_of_last_requests')) || [])
      .filter { |req_time| req_time >= ENV['THROTTLE_TIMEFRAME_MINUTES'].to_i.minute.ago.to_i }
      .append(curr_time)

    REDIS.set('times_of_last_requests', times_of_last_requests)
    
    if times_of_last_requests.length >= ENV['THROTTLE_MAX_REQUESTS'].to_i

      render json: { error: "Too Many Requests" }, :status => 429
    else
      true
    end
  end
end
