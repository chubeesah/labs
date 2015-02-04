#Jan 13

class User
  attr_accessor :name, :email, :password, :twitter

  def initialize(name, email, password, twitter)
    @name = name
    @email = email
    @password = password
    @twitter = twitter
  end

  def to_s
    "<User> Name: #{@name}, Email: #{@email}, Twitter: {#{@twitter}"
  end
end


#============================================================================
#Jan 14

# "load /file_name.rb" reloads program.
#"self" either refers to the class or the instance
# class.ancestors
# How to 'each' on your class:
# 1. Expose the Enumerable thing with an 'attr_reader', interact with it directly
#  attr_reader :cards
#  deck = Deck.new
#  deck.each
#
# 2. Define an each method that talks to the Enumerable thing
#  deck = Deck.new
#  deck.each { |c| blah blah blah }
class Card
  RANKS = (2..10).to_a + [:J, :Q, :K, :A]
  SUITS = [:hearts, :spades, :diamonds, :clubs]

  attr_reader

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "The #{@rank} of #{@suit}!"
end

deck = []
Card::SUITS.each do |s|
  Card::RANKS.each do |r| 
    deck << Card.new(r, s)
        #"Card.new" makes a new card, "(r, s)" passes the "rank" and "suit" of the card from 
        #the class, and "<<" pushes card into array
  end
end  

class KeywordCard #1.9
  def initialize(opts={})
    puts "The opts hash contains: #{opts}"
    @rank = opts[:rank]
    @suit = opts[:suit]
  end
end

class NewKeywordCard #2.0
  def initialize rank: nil, suit: nil
    @rank = rank
    @suit = suit
  end
end
    
  end
deck


#===========================================
#Jan 21
#database speaks SQL.
#Thought process: I have blogs, and I want to know the months. what do I do? the date!
#I don't need anything but the month. I need the date column, but just the month.
#How do I do it?

#Blarg::Models::Post.select(:date).to_sql
#Blarg::Models::Post.select(:date)[0].strftime('%m')

#Relations: A query that ActiveRecord hasn't run yet.
#We want to build queries in pieces sometimes.
#Kickers: Make an unrun query run.

#===========================================
#Jan 26
#HTTP: Hyper Text Transfer Protocol
httparty
curl, curl -i,
200 = ok
201 = created
401 = unauthorized
404 = page not found
HTTP Methods: GET, POST, PUT, DELETE
GET: Retrieve existing thing(s)
POST: Create a new thing
PUT: Update an existing thing
DELETE: Remove an existing thing
API: Application Programming "Interface"
JSON: Javascript Option Notation
require json
JSON.parse my_text
curl -i https://api.github.com/users/chubeesah/followers | less

#==========================================
Jan 28
bundle exec camping -s webrick lib/blarg.rb



















