class SyncController < ApplicationController
  def manual_sync
    begin
      ScrapingJob.perform_now
      @message = 'Synchronization completed successfully.'
    rescue => e
      @message = 'Error during synchronization: ' + e.message
    end
  end
end
