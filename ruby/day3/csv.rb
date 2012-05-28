module ActsAsCsv
    def self.included(base)
        base.extend ClassMethods
    end

    module ClassMethods
        def acts_as_csv
            include InstanceMethods
            include Enumerable
        end
    end

    module InstanceMethods
        def read
            @csv_contents = []
            filename = self.class.to_s.downcase + '.txt'
            file = File.new(filename)
            @headers = file.gets.chomp.split(', ')

            file.each do |row|
                @csv_contents << CsvRow.new(@headers, row.chomp.split(', '))
            end
        end

        attr_accessor :headers, :csv_contents

        def initialize
            read
        end
        
        def each
            @csv_contents.each {|r| yield r}
        end
    end    
end

class CsvRow
    attr_accessor :headers, :data
    def initialize headers, data
        @headers = headers
        @data = data
    end
    
    def method_missing(name, *args)
        col = headers.index(name.to_s)
        return data[col] if col
        return nil
    end
end

class Animals
    include ActsAsCsv
    acts_as_csv
end

Animals.new().each {|r| puts r.awesomeness }