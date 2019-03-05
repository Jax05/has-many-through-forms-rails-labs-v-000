class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  # accepts_nested_attributes_for :categories

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      if category_attribute[:name].present?
        category = Category.find_or_create_by(category_attribute)
        if !self.categories.include?(category)
          self.categories << category
        end
      end
    end
  end

  # def users_attributes=(user_attribute)
  #   user_attribute.values.each do |username|
  #     user = User.find_or_create_by(username)
  #     self.users << user
  #   end
  # end
end
