# frozen_string_literal: true

# This class deals with holidays and days off
class Holidays
  def initialize(filename)
    @public_holidays = %w[01-01-2021 02-04-2021 04-04-2021 25-04-2021 01-05-2021 03-07-2021 10-07-2021
                          15-08-2021 05-10-2021 01-11-2021 01-12-2021 08-12-2021 25-12-2021]
    @company_holidays = %w[16-02-2021 24-12-2021 31-12-2021]
    @personal_holidays = File.readlines(filename, chomp: true).delete_if { |x| x == '' }
  rescue StandardError
    @personal_holidays = []
    puts "Warning: #{filename} not found!"
  end

  def public_holiday?(date)
    @public_holidays.include?(date)
  end

  def company_holiday?(date)
    @company_holidays.include?(date)
  end

  def personal_holiday?(date)
    @personal_holidays.include?(date)
  end

  def working_day?(date)
    !public_holiday?(date) && !personal_holiday?(date) && !company_holiday?(date)
  end
end
