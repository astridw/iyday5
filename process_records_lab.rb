require './shipment'

money = 0
fry_bonus = 0
amy_bonus = 0
bender_bonus = 0
leela_bonus = 0

mercurymoney = 0
earthmoney = 0
moonmoney = 0
marsmoney = 0
saturnmoney = 0
uranusmoney = 0
plutomoney = 0




shipments = []


open("planet_express_logs").each do |line|

  values_array = line.chomp.split(",")

  shipment = Shipment.new
  shipment.destination      = values_array [0]
  shipment.what_got_shipped = values_array[1]

  #binding.pry  *means stop here and check and see what's going on/
  # a way to help you check your code

  shipment.how_many         = values_array[2].to_i
  shipment.money            = values_array[3].to_i




  money += shipment.money
  shipments << shipment

 # this deals with the bonuses
   case shipment.destination
   when "Earth"
     fry_bonus += shipment.money * 0.10
     earthmoney += shipment.money

   when "Mars"
     amy_bonus += shipment.money * 0.10
     marsmoney += shipment.money

   when "Uranus"
     bender_bonus += shipment.money * 0.10
     uranusmoney += shipment.money

   when "Moon"
         moonmoney += shipment.money
   when "Mercury"
       mercurymoney += shipment.money
   when "Saturn"
       saturnmoney  += shipment.money
   when "Pluto"
        plutomoney += shipment.money

   else
     leela_bonus += shipment.money * 0.10

   end


end

# How much money did we make this week?
p "how much money did we make this week?"
p "Money : #{money}"
# How much money did we make broken down by planet?
p "how much money did we make at each planet"
p "We collected #{mercurymoney} from mercury"
p "We collected #{earthmoney} from earth"
p "We collected #{moonmoney} from the moon"
p "We collected #{marsmoney} from mars"
p "We collected #{saturnmoney} from saturn"
p "We collected #{uranusmoney} from uranus"
p "We collected #{plutomoney} from pluto"


  earth_trips = shipments.select do |planet|
    planet.destination == "Earth"
  end

  moon_trips = shipments.select do |planet|
    planet.destination == "Moon"
  end

  mars_trips = shipments.select do |planet|
    planet.destination == "Mars"
  end

  uranus_trips = shipments.select do |planet|
    planet.destination == "Uranus"
  end

  mercury_trips = shipments.select do |planet|
    planet.destination == "Mercury"
  end

  saturn_trips = shipments.select do |planet|
    planet.destination == "Saturn"
  end

  pluto_trips = shipments.select do |planet|
    planet.destination == "Pluto"
  end




  puts "Mercury trips: #{mercury_trips.length}"
  puts "Earth trips: #{earth_trips.length}"
  puts "Moon trips: #{moon_trips.length}"
  puts "Mars trips: #{mars_trips.length}"
  puts "Saturn Trips: #{saturn_trips.length}"
  puts "Uranus trips: #{mars_trips.length}"
  puts "Pluto _trips: #{pluto_trips.length}"



# They get a bonus of 10% of the money for the shipment as the bonus
# How much of a bonus did each employee get?
p "Fry's bonus is #{fry_bonus}"
p "Amy's bonus is #{amy_bonus}"
p "bender's bonus is #{bender_bonus}"
p "leela's bonus is #{leela_bonus}"

#p "shipments: #{shipments}"

# How many trips did each employee pilot?
p "Fry made #{earth_trips.length} trips"
p "Amy made #{mars_trips.length} trips"
p "Bender made #{uranus_trips.length} trips"
p  "Leela made #{mercury_trips.length + saturn_trips.length + moon_trips.length} trips"
