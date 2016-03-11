module Biz
  module WeekTime
    ##
    # A <tt>WeekTime::End</tt> is a specialized type of +WeekTime+ that acts
    # like the end of a day when representing a time on a day boundary.
    #
    class End < Abstract

      def day_time
        @day_time ||= DayTime.from_minute(day_of_week.day_minute(week_minute))
      end

      private

      def day_of_week
        @day_of_week ||= DayOfWeek.all.find { |day| day.contains?(week_minute) }
      end

    end
  end
end
