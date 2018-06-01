# kart-racing

This is a parser for a kart racing log written in Ruby. 

## Requirements
- Ruby 2.3.1+
- Rspec 3.4.3+

## Running
- Run with the command `make start`

## Example output
```
pos code	name	laps	total_time	best_lap	avg_speed
1: 038	F.MASSA	4	00:04:11.578	00:01:02.768	44.24575
2: 033	R.BARRICHELLO	4	00:04:16.079	00:01:03.716	43.36
3: 002	K.RAIKKONEN	4	00:04:15.152	00:01:03.076	43.517
4: 023	M.WEBBER	4	00:04:17.721	00:01:04.215	43.191250000000004
5: 015	F.ALONSO	4	00:04:54.221	00:01:07.010	37.9605
6: 011	S.VETTEL	3	00:06:27.275	00:01:18.097	25.745666666666665

SORTEST LAP TIME: 00:01:02.768
```

## Testing
- Run tests with the command `make test`