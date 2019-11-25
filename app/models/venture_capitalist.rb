class VentureCapitalist

    attr_accessor :name, :total_worth
    

    @@all = []
    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth

        @@all << self
    end

    def self.all
        @@all
    end

    def self.tre_commas_club
        @@all.select do |vc|
            vc.total_worth >= 1000000000
        end
    end

    def offer_contract(startup, type, investment)
        # given a startup object, type of investment 
        # (as a string), and the amount invested (as a float), 
        # creates a new funding round and associates it 
        # with that startup and venture capitalist.
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        # returns an array of all funding rounds 
        # for that venture capitalist
        FundingRound.all.select do |fr|
            fr.venture_capitalist == self
        end
    end

    def portfolio
        # Returns a unique list of all startups this 
        # venture capitalist has funded
        funding_rounds.map do |fr|
            fr.startup
        end.uniq
    end

    def biggest_investment
        # returns the largest funding round given 
        # by this venture capitalist
        biggest_investment = funding_rounds.map do |fr|
            fr.investment
        end.max
        funding_rounds.find do |fr|
            fr.investment == biggest_investment
        end
    
    end
# *******************
    def invested(domain)
        all_investment = funding_rounds.select do |fr|
            fr.startup.domain == domain
        end
        all_investment.map do |investment|
            investment.investment
        end.sum
    end
end
