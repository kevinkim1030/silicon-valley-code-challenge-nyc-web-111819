require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


s1 = Startup.new("apple", "alanna", "d1")
s2 = Startup.new("bestbuy", "brian", "d2")
s3 = Startup.new("coach", "chris", "d3")
s4 = Startup.new("dior", "dana", "d1")

vc1 = VentureCapitalist.new("zoe", 1000000000)
vc2 = VentureCapitalist.new("yoo", 2000000000)
vc3 = VentureCapitalist.new("xee", 3000)
vc4 = VentureCapitalist.new("waa", 4000)

fd1 = FundingRound.new(s1, vc1, "series a", 5000)
fd2 = FundingRound.new(s2, vc2, "series b", 7000)
fd3 = FundingRound.new(s3, vc3, "series c", 9000)
fd4 = FundingRound.new(s3, vc3, "series c", 10000)
fd5 = FundingRound.new(s3, vc2, "ser 3", 24523423)








binding.pry
0 #leave this here to ensure binding.pry isn't the last line