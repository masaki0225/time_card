require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "masaki", 
                     email: "masaki@exaple.com", 
                     password: "326623",
                     password_confirmation: "326623")
  end 
  
  test "@user.name.valid?" do 
    @user.name = "  "
    assert_not @user.valid?
  end 
  
  test "@user.email.valid?" do
    @user.email = "  "
    assert_not @user.valid?
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end 
  
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end
  
  test "password valid?" do
    @user.password = "   "
    assert_not @user.valid?
    @user.password = @user.password_confirmation
    assert @user.valid?
  end 
  
  test "associated projects should be destroyed" do
    @user.save
    @user.projects.create!( title: "Spear of Justice",
                            content: "undine")
    assert_difference "Project.count", -1 do
      @user.destroy
    end
  end 
  
end
