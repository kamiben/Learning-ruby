require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "test story association" do
    assert_equal stories(:one), votes(:one).story # vérifie que le retour est le meme pour les deux expressions (la story appelée one et l'objet vote appelé one)
  end
end
