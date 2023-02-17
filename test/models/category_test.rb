require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  context 'validation testing' do
    should validate_presence_of(:name)
    should validate_presence_of(:description)

    should validate_uniqueness_of(:name)
  end

  context 'fixtures testing' do
    # according to test/fixtures/files/categories.yml

    should 'find category with name: Харчування' do
      assert_equal('Харчування', Category.find_by(name: 'Харчування').name)
    end

    should 'find category with name: Комуналка' do
      assert_equal('Комуналка', Category.find_by(name: 'Комуналка').name)
    end

    should 'not find category with name: Одяг' do
      assert_nil(Category.find_by(name: 'Одяг'))
    end
  end

  context 'scope(methods) testing' do
    should 'be able to search categories by name using scope' do
      assert_equal('Garbage collection', Category.search_by_category_name_scope('Garbage collection').pluck(:name)[0])
    end
  end

  context 'relationship (associations) testing' do
    should have_many :operations
  end
end
