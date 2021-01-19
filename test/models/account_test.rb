require "test_helper"

class AccountTest < ActiveSupport::TestCase
  test "has a valid factory" do
    assert build(:account).valid?
  end

  test "must have a login" do
    refute_predicate build(:account, login: nil), :valid?
  end

  test "must have a unique login" do
    existing = create(:account)

    refute_predicate build(:account, login: existing.login), :valid?
  end

  test "must have a name" do
    refute_predicate build(:account, name: nil), :valid?
  end

  test "must have an email" do
    refute_predicate build(:account, email: nil), :valid?
  end

  test "must have a unique email" do
    existing = create(:account)

    refute_predicate build(:account, email: existing.email), :valid?
  end

  test "must have a valid email" do
    refute_predicate build(:account, email: "foo"), :valid?
  end
end
