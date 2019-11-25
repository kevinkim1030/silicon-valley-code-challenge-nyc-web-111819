class Startup

    attr_reader :founder, :domain
    attr_accessor :name


    @@all = []
    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain

        @@all << self
    end

    def pivot(domain, name)
        # given a string of a domain and a string of a 
        # name, change the domain and name of the startup. 
        # This is the only public method through which the 
        # domain can be changed.
        @domain = domain
        @name = name


    end

    def self.all
        @@all
    end

    def self.find_by_founder(fname)
        @@all.select do |startup|
            startup.founder == fname
        end
    end

    def self.domains
        @@all.map do |startup|
            startup.domain
        end
    end

    def sign_contract(venture_capitalist, type, investment)
        # given a venture capitalist object, type of 
        # investment (as a string), and the amount invested
        #  (as a float), creates a new funding round and 
        #  associates it with that startup and venture 
        #  capitalist.
        FundingRound.new(self, venture_capitalist, type, investment)
        
    end

    def funding_rounds
        FundingRound.all.select do |fr|
            fr.startup == self
        end
    end


    def num_funding_rounds
        # Returns the total number of funding rounds 
        # that the startup has gotten
        funding_rounds.length
        
    end

    def total_funds
        # Returns the total sum of investments that 
        # the startup has gotten
        funds = 0
        funding_rounds.each do |fr|
            funds += fr.investment
        end
        funds
    end


    def investors
        funding_rounds.map do |fr|
            fr.venture_capitalist
        end.uniq

    end
# ****************
    def big_investors
        # Returns a unique array of all the venture capitalists
        #  that have invested in this company and are in the 
        #  Trés Commas club
        VentureCapitalist.tre_commas_club & investors
    end

end
