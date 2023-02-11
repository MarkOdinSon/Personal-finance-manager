require "test_helper"

class OperationTest < ActiveSupport::TestCase
  context 'validation testing' do
    should validate_presence_of(:amount)
    should validate_presence_of(:odate)
    should validate_presence_of(:description)

    should validate_numericality_of(:amount).is_greater_than(0)
  end

  context 'fixtures testing' do
    # according to test/fixtures/files/operations.yml

    should 'find operation with amount: 250.50' do
      assert_equal(250.50, Operation.find_by(amount: 250.50).amount)
    end

    should 'find all operations with category_id: 1' do
      assert_equal([1, 3], Operation.where(category_id: 1).ids)
    end

    should 'not find any operations with amount: 100' do
      assert_equal(false, Operation.where(amount: 100).exists?)
    end
  end

  context 'scope(methods) testing' do
    should 'be able to search operations by category name using scope' do
      assert_equal(590.95, Operation.search_by_category_name_scope('Medications').pluck(:amount)[0])
    end
  end

  context 'relationship (associations) testing' do
    should belong_to :category
  end
end
