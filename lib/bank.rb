class Bank
    attr_reader :name, :city

    @@all = []

    def initialize(name, city)
        @name = name
        @city = city
        @@all << self
    end

    def self.all
        @@all
    end

    def accounts
        Account.all.select{|account| account.bank == self}
    end

    def customers
        accounts.map{|account| account.customer }
    end

    def new_account(number, balance, customer)
        Account.new(number, balance, self, customer)
    end

    def oldest_account
        accounts.min_by(&:open_year)
    end

    def self.most_customers
        all.max_by{|bank| bank.customers.length}
    end

    



    
end 

