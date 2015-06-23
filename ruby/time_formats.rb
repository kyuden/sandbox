Time::DATE_FORMATS[:date_time_seconds] = "%m/%d/%Y %H:%M:%S"
Time::DATE_FORMATS[:date_time] = "%m/%d/%Y %H:%M"
Time::DATE_FORMATS[:time] = "%B %Y"
Time::DATE_FORMATS[:mdy] = "%m/%d/%Y"
Time::DATE_FORMATS[:star_mdy] = "*%m/*%d/%y"
Time::DATE_FORMATS[:star_dmy] = "*%d/*%m/%y"
Time::DATE_FORMATS[:full] = "%B %d, %Y"
Time::DATE_FORMATS[:star_full] = "%B *%d, %Y"
Time::DATE_FORMATS[:star_full_dmy] = "*%d %B %Y"
Time::DATE_FORMATS[:hours_minutes] = "%H:%M"
Time::DATE_FORMATS[:star_hours_minutes] = "*%H:%M"
Time::DATE_FORMATS[:hours_minutes_ampm] = "%I:%M %p"
Time::DATE_FORMATS[:star_hours_minutes_ampm] = "*%I:%M %p"
Time::DATE_FORMATS[:msoft] = "%Y-%m-%dT%H:%M:%S.000"
Time::DATE_FORMATS[:sql] = "%Y-%m-%d"
Time::DATE_FORMATS[:hgrant] = "%Y%m%dT%H:%M-0000"
Time::DATE_FORMATS[:month_year] = "%B, %Y"
Time::DATE_FORMATS[:abbrev_month_year] = "%b, %Y"
Time::DATE_FORMATS[:iso_date] = "%Y-%m-%d"

def strip_zeros_from_date(marked_date_string)
  marked_date_string.gsub('*0', '').gsub('*', '').gsub(/ 0(\d\D)/, ' \1').gsub(/-0(\d\D)/, '-\1').gsub(/\/0(\d\D)/, '/\1').gsub(/^0(\d\D)/, '\1')
end
