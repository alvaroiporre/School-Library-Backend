require_relative 'base_decorator'

class TrimmerDecorator < BaseDecorator
    def correct_name
        if @nameable.correct_name.length > 10
            return @nameable.correct_name.strip
        else
            return @nameable.correct_name
        end
    end
end