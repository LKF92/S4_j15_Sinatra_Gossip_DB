require 'csv'
require 'pry'

class Gossip
  attr_accessor :author, :content


  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    ###we iterate through each line to create instances of Gossip that we map into an array
    all_gossips = CSV.read("./db/gossip.csv").map {|csv_line| Gossip.new(csv_line[0], csv_line[1])}
    return all_gossips
  end

  def self.find(id)
    self.all[id]
  end
end
