class Customer
   
    attr_reader :name

    @@all = []

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def accounts
        Account.all.select{|account| account.customer == self }
    end

    def banks
        accounts.map{|account| account.bank.name }.uniq
    end

    def new_account(number, balance, bank)
        Account.new(number, balance, bank, self)
    end

    def self.average_number_of_accounts
        account_total=Account.all.length
        account_total/all.length
    end





   
end