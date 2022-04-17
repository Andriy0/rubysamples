# frozen_string_literal: true

require_relative 'cargohold'

ch = CargoHold.new
sc1 = Suitcase.new
sc2 = Suitcase.new
sc3 = Suitcase.new
ch.load_and_report(sc1)
ch.load_and_report(sc2)
ch.load_and_report(sc3)
first_unloaded = ch.unload
print 'The first suitcase off the plane is...'
puts first_unloaded.object_id
