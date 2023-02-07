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

  end

  context 'relationship (associations) testing' do
    should have_many :operations
  end
end
