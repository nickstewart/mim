require "test_helper"

class PrescriptionTest < ActiveSupport::TestCase
  test "should not save article without name" do
    article = Prescription.new
    assert_not article.save, 'Saved the article without a name'
  end
end
