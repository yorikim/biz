module Biz
  module WeekTime
    ##
    # A <tt>WeekTime::Start</tt> is a specialized type of +WeekTime+ that acts
    # like the beginning of a day when representing a time on a day boundary.
    #
    class Start < Abstract

      def day_time
        @day_time ||= DayTime.from_minute(week_minute % Time.day_minutes)
      end

      private

      def day_of_week
        @day_of_week ||= begin
          DayOfWeek.all.find { |day_of_week|
            day_of_week.wday?(week_minute / Time.day_minutes % Time.week_days)
          }
        end
      end

    end
  end
end
