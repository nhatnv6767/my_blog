require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "Category should be valid" do
    @category = Category.new(name: "Sports")
    asset @category.valid?
  end
end