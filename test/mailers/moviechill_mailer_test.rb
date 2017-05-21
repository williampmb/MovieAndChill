require 'test_helper'

class MoviechillMailerTest < ActionMailer::TestCase
  test "ticket_inbox" do
    mail = MoviechillMailer.ticket_inbox
    assert_equal "Ticket inbox", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
