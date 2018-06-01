# https://github.com/jlgm/kart-racing

# Author: jlgm

start:
	@ruby src/main.rb

test:
	@cd spec && rspec *