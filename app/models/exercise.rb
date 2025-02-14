class Exercise < ApplicationRecord
  def self.search_for(content, method)
    if method == 'perfect'
      Exercise.where(name: content)
              .or(Exercise.where(category: content))
              .or(Exercise.where(target_body_part: content))
    elsif method == 'forward'
      Exercise.where('name LIKE ? OR category LIKE ? OR target_body_part LIKE ?', content + '%', content + '%', content + '%')
    elsif method == 'backward'
      Exercise.where('name LIKE ? OR category LIKE ? OR target_body_part LIKE ?', '%' + content, '%' + content, '%' + content)
    else
      Exercise.where('name LIKE ? OR category LIKE ? OR target_body_part LIKE ?', '%' + content + '%', '%' + content + '%', '%' + content + '%')
    end
  end
end
