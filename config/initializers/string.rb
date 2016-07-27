class String
  def converted_to_days
    number_in_string = self[/\A\d+/].to_i
    if self.match(/week/)
      number_in_string * 7
    elsif self.match(/month/)
      number_in_string * 30
    elsif self.match(/year/)
      number_in_string * 365
    elsif self.match(/day/)
      number_in_string
    end
  end
end
