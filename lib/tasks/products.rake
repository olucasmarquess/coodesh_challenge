namespace :products do
  desc 'Check products synchronization'
  task check_sync: :environment do
    if Product.unsynced.exists?
      AlertMailer.failure_email('Sync failure: Some products were not synchronized.').deliver_now
    end
  end
end
