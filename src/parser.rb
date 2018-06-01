class Parser

    attr_accessor :log, :lines

    def initialize(log)
        @log = log
        @lines = []
        @cnt = 0
    end

    def run
        lines = @log.split("\n")
        lines.each do |line|
            @lines[@cnt += 1] = self.parse_line(line)
        end
    end

    def parse_line(line)
        pattern = /\d+:\d+:\d+.\d+\s{2,}\w+ – \w+.\w+\s{1,}\d+\s{2,}\d+:\d+.\d+\s{2,}\d+,\d+/
        match = pattern.match(line)
        code = match.to_s.split(" ")
        return code
    end
end