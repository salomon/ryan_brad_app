require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(name: "Test user", email: "test@aol.com", 
                     password: "foobar", password_confirmation: "foobar")
  end


  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "  "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "  "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "r" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "r" * 256
    assert_not @user.valid?
  end

  test "email validation should accept valid email address" do
    valid_addresses = %w[user@example.com USER@example.com A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?
    end
  end


  test "email validation should catch invalid email address" do
    invalid_addresses = %w[user@example,com user.at_foo.org user.nameexample 
                           foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?
    end
  end


  test "email address should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should have minimum length" do
    @user.password = "a" * 5 
    @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end



end
