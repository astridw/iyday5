# Record format
# Destination, What got shipped, Number of crates, Money we made

# Good news Rubyists!
# We have a week of records tracking what we shipped at Planet Express.
# I need you to answer a few questions for Hermes.

# How much money did we make this week?
# How much money did we make broken down by planet?
# ie.. how much did we make shipping to Earth? Mars? Saturn? etc.

# Also, bonuses are paid to employees who pilot the Planet Express
# Different employees have favorite destinations they always pilot to
# Fry - pilots to Earth (because he isn't allowed into space)
# Amy - pilots to Mars (so she can visit her family)
# Bender - pilots to Uranus (teeheee...)
# Leela - pilots everywhere else because she is the only responsible one

# How many trips did each employee pilot?
# They get a bonus of 10% of the money for the shipment as the bonus
# How much of a bonus did each employee get?

# BONUS - uses classes for each shipment; but not necessary
# open("planet_express_logs").each do |line|
#   p line.chomp
# end

def get_record(line)
  words = []
  word = ""
  planex = line.chomp.chars
  planex.each do |x|
    if x == ","
      words << word
      word = ""
    else
      word = word + x
    end
  end
  words << word
  return words
end

records = []
open("planet_express_logs").each do |line|
  record = get_record(line)
  p record
  records << record
end

p records

hash_records = []
records.each do |record|

  hash_records << {
    planet: record[0],
    cargo: record[1],
    num_cargo: record[2].to_i,
    revenue: record[3].to_i
  }
end

p hash_records
total_revenue = 0

hash_records.each do |hash|
    p hash[:revenue]
    total_revenue = total_revenue + hash[:revenue]
end

p total_revenue
