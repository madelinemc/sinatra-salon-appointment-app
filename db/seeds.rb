Service.destroy_all

mani = Service.create(name: "Manicure", description: "Our signature manicure includes cuticle care, nail shaping, and hand massage with polish change.", price: "25")
deluxem = Service.create(name: "Deluxe Manicure", description: "The deluxe manicure adds botanical hand soak and moisturizing treatment.", price: "35")
pedi = Service.create(name: "Pedicure", description: "Our signature pedicure includes nail shaping, foot file, and foot massage with polish change", price: "30")
deluxep = Service.create(name: "Deluxe Pedicure", description: "The deluxe pedicure adds detoxing foot soak and softening scrub.", price: "45")
polish = Service.create(name: "Polish Change", description: "A quick polish color change.", price: "10")
custom = Service.create(name: "Custom Nail Art", description: "Any design and color you want.", price: "10")
