# Preview all emails at http://localhost:3000/rails/mailers/moviechill_mailer
class MoviechillMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/moviechill_mailer/ticket_inbox
  def ticket_inbox
    MoviechillMailer.ticket_inbox
  end

end
