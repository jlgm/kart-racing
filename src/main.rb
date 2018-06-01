require_relative 'parser'
require_relative 'race'

class Main

	def initialize(file)
		@parser = Parser.new(File.read(file))
	end
	
	def run
		@parser.run
        @race = Race.new(@parser.lines)
        @race.mount
        @race.print_stats
	end
	
end

m = Main.new("../log/race.log")
m.run

