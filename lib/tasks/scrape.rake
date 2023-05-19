namespace :scrape do
  desc 'Scrape products'
  task products: :environment do
    begin
      ScrapingJob.perform_now
    rescue => e
      AlertMailer.failure_email(e.message).deliver_now
    end
  end
end
