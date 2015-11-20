require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @vendor = vendors(:tasty)
    @comment = @user.comments.build(content: "Lorem ipsum", vendor_id: @vendor.id)
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "user id should be present" do
    @comment.user_id = nil
    assert_not @comment.valid?
  end
  
  test "vendor id should be present" do
    @comment.vendor_id = nil
    assert_not @comment.valid?
  end
  
  test "content should be present " do
    @comment.content = "   "
    assert_not @comment.valid?
  end

  test "content should be at most 200 characters" do
    @comment.content = "a" * 201
    assert_not @comment.valid?
  end
  
  test "order should be most recent first" do
    assert_equal Comment.first, comments(:most_recent)
  end
  
end
