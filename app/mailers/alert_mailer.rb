class AlertMailer < ApplicationMailer
  default from: 'some_email@example.com'

  def failure_email(message)
    @message = message
    mail(to: 'some_email@example.com', subject: 'Failure Alert: Product Sync')
  end
end
