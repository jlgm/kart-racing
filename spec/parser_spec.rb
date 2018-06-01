require '../src/parser'

RSpec.describe Parser, "log" do
	it "should receive the log in the constructor" do
		p = Parser.new("----------")
		expect(p.log).to eq "----------"
	end
end

RSpec.describe Parser, "lines" do
	it "should start as an empty array" do
		p = Parser.new("----------")
		expect(p.lines).to eq []
	end
end

RSpec.describe Parser, "parse_line" do
	it "should parse a line in the format of the log and return an array of length 7" do
		p = Parser.new("-----")
        s = p.parse_line("23:49:08.277      038 – F.MASSA                           1		1:02.852                        44,275")
        expect(s[0]).to eq "23:49:08.277"
        expect(s[1]).to eq "038"
        expect(s[3]).to eq "F.MASSA"
		expect(s.length).to eq 7
	end
end