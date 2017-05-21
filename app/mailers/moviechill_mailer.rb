class MoviechillMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.moviechill_mailer.ticket_inbox.subject
  #
  def ticket_inbox(ticket)
    @tic = ticket
    #ticket.user.email has to be a valid email to receive the ticket!
    mail to: ticket.user.email, subject: "Eletronic Ticket"
  end
end
