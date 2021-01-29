class Holidays

    def initialize(personal_holidays_filename)
        parse_public_holidays_and_weekends()
        parse_company_holidays()
        parse_personal_holidays(personal_holidays_filename)
    end

    def parse_public_holidays_and_weekends()
        @public_holidays_and_weekends = [
            '01-01-2021',
            '02-04-2021', '04-04-2021', '25-04-2021'
            '01-05-2021',
            '03-07-2021', '10-07-2021',
            '15-08-2021',
            '05-10-2021',
            '01-11-2021',
            '01-12-2021', '08-12-2021', '25-12-2021',
        ]
    end

    def parse_company_holidays()
        @company_holidays = [
            '16-02-2021',
            '24-12-2021', '31-12-2021'
        ]
    end

    def parse_personal_holidays(personal_holidays_filename)
        begin
            @personal_holidays = File.readlines(personal_holidays_filename, chomp:true).delete_if {|x| x == ''}
        rescue
            @personal_holidays = []
            puts "Warning: #{personal_holidays_filename} not found!"
        end
    end

    def is_public_holiday(date)
        @public_holidays_and_weekends.include?(date)
    end

    def is_company_holiday(date)
        @company_holidays.include?(date)
    end

    def is_personal_holiday(date)
        @personal_holidays.include?(date)
    end

    def is_working_day(date)
        !is_public_holiday(date) && !is_personal_holiday(date) && !is_company_holiday(date)
    end
end
