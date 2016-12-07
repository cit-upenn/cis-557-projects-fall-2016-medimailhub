require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
<<<<<<< HEAD
  test "new_appointment" do
    mail = UserMailer.new_appointment
    assert_equal "New appointment", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

=======
  # test "the truth" do
  #   assert true
  # end
>>>>>>> nidhi_initial
end
