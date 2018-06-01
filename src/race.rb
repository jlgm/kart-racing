class Race

    #This class handles the racing logic

    MAX_LAPS = "4"

    def initialize(lines)
        @lines = lines
        @players = Hash.new
        @finished = Hash.new
        # @first = ""
    end

    def mount
        @lines.each do |line|
            if (line != nil)
                (time, code, name, lap, lap_time, speed) = [line[0], line[1], line[3], line[4], line[5], line[6]]
                if (@players[code])
                    @players[code].push([time, code, name, lap, lap_time, speed])
                else
                    @players[code] = []
                    @players[code].push([time, code, name, lap, lap_time, speed])
                end
                if (lap == MAX_LAPS)
                    @finished[code] = time
                    # if (@first == "")
                    #     @first = time
                    # end
                end
            end
        end
    end

    def print_stats
        pos = 0
        min_race = "99:99:99.999"
        print "pos code\tname\tlaps\ttotal_time\tbest_lap\tavg_speed\n"
        @finished.each do |key, player|
            #the ones who finished were inserted in order into this hash
            (code, name, time) = [key, @players[key][0][2], self.total_time(key)]
            min_lap = self.min_lap(key)
            min_race = [min_race, min_lap].min
            avg_speed = self.avg_speed(key)
            print "#{pos+=1}: #{code}\t#{name}\t#{MAX_LAPS}\t#{time}\t#{min_lap}\t#{avg_speed}\n"
        end
        @players.sort_by {|name, values| [values.length, name]}.reverse.each do |key, player|
            #print the ones who didn't finish
            #uses a stable sort to sort for laps completed
            if (@finished[key] == nil)
                (code, name, cnt, time) = [key, @players[key][0][2], @players[key].length, self.total_time(key)]
                min_lap = self.min_lap(key)
                min_race = [min_race, min_lap].min
                avg_speed = self.avg_speed(key)
                print "#{pos+=1}: #{code}\t#{name}\t#{cnt}\t#{time}\t#{min_lap}\t#{avg_speed}\n"
            end
        end
        print "\nSORTEST LAP TIME: #{min_race}\n"
    end

    #Utility functions below:

    def total_time(code)
        player = @players[code]
        seconds = 0
        player.each do |lap|
            times = lap[4].split(":")
            seconds += times[0].to_f*60.0 + times[1].to_f
        end
        return Time.at(seconds).utc.strftime("%H:%M:%S.%L")
    end

    def min_lap(code)
        player = @players[code]
        ans = 5555555
        player.each do |lap|
            times = lap[4].split(":")
            ans = [ans, (times[0].to_f*60.0 + times[1].to_f)].min
        end
        return Time.at(ans).utc.strftime("%H:%M:%S.%L")
    end

    def avg_speed(code)
        player = @players[code]
        total = 0.0
        player.each do |lap|
            speeds = lap[5].split(",")
            total += speeds[0].to_i
            total += speeds[1].to_i * 0.001
        end
        return total / (player.length)
    end

end