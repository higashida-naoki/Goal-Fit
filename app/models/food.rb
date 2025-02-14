class Food < ApplicationRecord
  def self.search_for(content, method)
    if method == 'perfect'
      Food.where(name: content).or(Food.where(category: content))
    elsif method == 'forward'
      Food.where('name LIKE ? OR category LIKE ?', content + '%', content + '%')
    elsif method == 'backward'
      Food.where('name LIKE ? OR category LIKE ?', '%' + content, '%' + content)
    else
      Food.where('name LIKE ? OR category LIKE ?', '%' + content + '%', '%' + content + '%')
    end
  end
end
