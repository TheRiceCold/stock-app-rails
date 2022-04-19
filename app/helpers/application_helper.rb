module ApplicationHelper
  def num_with_commas(num)
    num.to_s.gsub(/\B(?=(...)*\b)/, ',')
  end
end
