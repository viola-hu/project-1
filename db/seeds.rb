# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
u1 = User.create name:'Viola', email:'viola@ga.co', password:'chicken'
puts "Created #{User.all.length} users."



Food.destroy_all

f1 = Food.create! name:'APPLE', image:'', description:'Apples are rich antioxidant nutrients - specifically flavonoids, which have been shown to neutralize the effects of oxidative stress on the body.'
f2 = Food.create! name:'CRANBERRY', image:'', description:'Cranberries have long been hailed for their vitamin C content and urinary tract protection, but recent laboratory experiments have linked the small red fruits to increased lifespan.'
f3 = Food.create! name:'GOJI BERRIES', image:'', description:'Also known and sold as the wolfberry, this antioxidant powerhouse is renowned for slowing the aging process, protecting the brain and defending the body against disease.'
f4 = Food.create! name:'POMEGRANATE', image:'', description:'The small seeds of this ancient fruit are filled with polyphenol antioxidants, which have been shown to support the prevention of heart disease and certain cancers.'
f5 = Food.create! name:'RED BELL PEPPER', image:'', description:'Bell peppers are high in antioxidant carotenoids, which are highly regarded for their eye health-supporting and disease-fighting properties.'
f6 = Food.create! name:'CAMU CAMU', image:'', description:"Native to the Amazon region, camu camu contains one of nature's highest concentration of vitamin C. Including camu-camu in your daily regimen, especially during cold and flu season, can help your body biuld its defenses against harmful invaders."
f7 = Food.create! name:'CARROT', image:'', description:'Carrots are highly regarded for their beta-carotene content, an antioxidant carotenoid that the body convers into vitamin A.'
f8 = Food.create! name:'ORANGE', image:'', description:'This juicy citrus is filled with vitamin C, as well as fiber, folate, vitamin B1, and potassium.'
f9 = Food.create! name:'RED LENTIL', image:'', description:'Lentils contain a wealth of nutrients including vitamin B6, zinc, and iron - all of which play an important role in immune support.'
f10 = Food.create! name:'SWEET POTATO', image:'', description:"Nutritionally similar to carrots, sweet potatoes contain a wealth of beta-carotene and vitamin A. It's advisable that pairing sweet potatoes with a small amount of healthful plant-based fats can maximize your body's absorption of beta-carotene. "
f11 = Food.create! name:'GINGER', image:'', description:'Known for its anti-nausea effects, ginger is also a powerful anti-inflammatory food due to its suppression of compounds known to signal the inflammatory response.'
f12 = Food.create! name:'GOLDEN BEETS', image:'', description:'Many of the betalains found in beets function both as antioxidants and anti-inflammatory molecules.'
f13 = Food.create! name:'PINEAPPLE', image:'', description:'Pineapples contain the enzyme bromelain, which has been shown to reduce inflammation associated with arthritis, sinusitis, tendonitis, sprains, and other inflammatory conditions.'
f14 = Food.create! name:'RAINIER CHERRIES', image:'', description:'Numerous clinical studies have found cherries to be especially helpful in relieving muscular damage and inflammation that follow vigorous exercise.'
f15 = Food.create! name:'SAFFRON', image:'', description:'Its antioxidant and scavenging properties help the body fight against pro-inflammatory cytokine proteins and various free fadicals.'
f16 = Food.create! name:'ARTICHOKE', image:'', description:'Artichokes have been shown in human studies to increase the production of bile, which helps to eliminate toxins in the body by flushing them out through the colon.'
f17 = Food.create! name:'BROCCOLI', image:'', description:'A member of the brassica family, broccoli is rich in sulfur-containing compounds known as glucosinates.'
f18 = Food.create! name:'CILANTRO & PARSLEY', image:'', description:'These herbs are know for their heavy-metal chelating capabilities - meaning they help bind metal ions for easier elimination from the body.'
f19 = Food.create! name:'CHLORELLA', image:'', description:'This single-cell algae has been shown to bind heavy metals such as mercury and other toxic pollutants together to escort them out of vital tissues.'
f20 = Food.create! name:'GREEN TEA', image:'', description:'Green tea is rich in antioxidants known as catechins. These have shown to boost liver function and help reduce fat storage in the liver.'
f21 = Food.create! name:'BLACK BEANS', image:'', description:'Studies suggest that they may help the brain recover from trauma and help protect against age-related brain degeneration.'
f22 = Food.create! name:'BLACKBERRIES', image:'', description:'Blackberries are anthocyanin-rich fruit, can potentially increase signaling between neurons in the brain, which could help to prevent inflammation in the brain.'
f23 = Food.create! name:'EGGPLANTS', image:'', description:"Specifically, the globe eggplant contains the anthocyanin nasunin, which has proven especially effective in protecting the brain's fatty tissues."
f24 = Food.create! name:'PLUMS', image:'', description:'While plums come in a variety of colors, those with the darkest skin and flesh are typically highest in anthocyanin antioxidants.'
f25 = Food.create! name:'PURPLE CABBAGE', image:'', description:'In addition to its brain-protecting anthocyanin pigments, cabbage also contains fulfuric compounds known to assist in anti-inflammatory and detoxifying processes within the body.'

puts "Created #{Food.all.length} foods."



Category.destroy_all

c1 = Category.create! name:'THE REDS', feature:'ANTI-AGING', image:'THEREDS.jpg', description:"SEEING RED ISN'T ALWAYS A BAD THING. In the case of diet and nutrition, red pigmentation often indicates a special blend of vitamins, minerals and antioxidant nutrients that help to protect the body from certain stressors associated with aging."
c2 = Category.create! name:'THE ORANGES', feature:'IMMUNE-BOOSTING', image:'THEORANGES.jpg', description:'THE IMMUNE SYSTEM ACTS AS THE FIRST LINE OF DEFENSE against harmful invaders like viruses and illness-causing bacteria, and as "damage control" for the entire body - helping to heal and repair infection or disease-induced harm. The nutrients commonly found in orange foods have long been associated with immune support.'
c3 = Category.create! name:'THE YELLOWS', feature:'INFLAMMATION-SOOTHING', image:'THEYELLOWS.jpg', description:"IF YOU'VE EVER ENJOYED A DELICIOUS BOWL OF INDIAN CURRY, you are most likely familiar with turmeric - the spice that gives traditional curry its glowing yellow color.Turmeric is one of nature's most petent anti-inflammatory foods due to its concentrated content of the phenol circumin, and it is not the only yellow-hued food to assist in the body's regulation of inflammation."
c4 = Category.create! name:'THE GREENS', feature:'DETOXIFYING', image:'THEGREENS.jpg', description:"DETOXIFICATION IS A NATURAL BODILY PROCESS and most organ systems have developed their own methods of self-cleansing. However, in our modern era, our exposure to environment, chemical, dietary, and even emotional toxin is greater than ever before and most bodies could do with a little external assistance."
c5 = Category.create! name:'THE BLUES & PURPLES', feature:'BRAIN-EMPOWERING', image:'THEBLUESANDPURPLES.jpg', description:"GETTING THE BLUES NEVER SEEMED SO SMART! Foods that are physically blue or purple in color contain a wealth of antioxidant nutrients that benefit the brain and central nervous system. In particular, anthocyanin - the antioxidant pigment that gives these foods their indigo shades - has been linked to maintaining long-term brain health, extending the sharpness of memory and overall cognitive functioning that tend to decline with age."

puts "Created #{Category.all.length} categories."



Recipe.destroy_all
r1 = Recipe.create! name:'YOUNG AT HEART', image:'zfj1jgze25bevmduoqvm', ingredients: %Q{2 cups spinach
  1 frozen medium banana
  1 cup cranberries
  1/4 cup dried goji berries
  2 Tbsp cacao powder
  1 tablespoon almond butter
  2 cups unsweetened vanilla almond milk}

r2 = Recipe.create! name:'RUBY SIPPER', image:'nlgrgnqhb02or9wwdbdj', ingredients: %Q{2 cups Red Swiss Chard
  2 small Red BEETS
  1/2 cup pure pomegranate juice
  1 banana
  1/4 almonds
  1/2 tsp fresh lemon juice
  2 cups water
}
r3 = Recipe.create! name:'SWEET PAPAYA PUNCH', image:'kv2hncq8qt85ynzfowdr', ingredients: %Q{2 cups Swiss chard
  1.5 cups papaya
  1 medium steamed sweet potato
  2 tbsp almond butter
  2 tsp cinnamon
  2 cups water
}
r4 = Recipe.create! name:'MORNING STAR', image:'lb4nygjnhrrosikh3oey', ingredients: %Q{2 cups spanich
  1.5 bananas
  2 tbsp pumpkin seeds
  1 orange
  2 medium carrot sticks
  2 tbsp plant-based protein powder
  2 cups unsweetened vanilla almond milk
}
r5 = Recipe.create! name:'BEST BLAST EVER', image:'pbqdvd3iikcy1a1brlbi', ingredients: %Q{2 cups spanich
  1 frozen banana
  1 cup peach slices
  1 cup frozen pineapple
  2 tbsp unsweetened coconut flakes
  2 small drops pure vanilla extract
  1/4 tsp cinnamon
  1 cup coconut water
  1 cup unsweetened almond milk
}
r6 = Recipe.create! name:'TURMERIFIC', image:'aurkwpeu2qjjmhq55a47', ingredients: %Q{2 cups spanich
  1 cup diced pineapple
  1/2 cup diced papaya
  1/4 lime
  1/4 lemon
  1/2 cup grapefruit slices
  1 tbsp flax seeds
  1/2 tsp ginger powder
  2 cups water
}
r7 = Recipe.create! name:"GREEN LOVER'S BLAST", image:'vgyi8s1xtkv6hpzzmpo4', ingredients: %Q{1 cup baby broccolli
  1 cup spinach
  1/4 cup sliced cucumber
  1/4 cup sliced zucchini
  2 medium celery stalks
  1 cup fresh pineapple
  1/4 cup fresh parsley
  2 tbsp chia seeds
  2 tsp chlorella powder
  1 cup coconut water
  1 cut brewed green tea
}
r8 = Recipe.create! name:'GREEN DETOX MACHINE', image:'viwkgpqy87jpdr4jsvmm', ingredients: %Q{2 cups artichokes
  2 green apples
  1 cup cucumber
  1 celery stalk
  1/2 cup pineapple
  1/2 lemon
  1/4 cup hemp seeds
  2 fresh mint leaves
  1 cup coconut water
  1 cup water
}
r9 = Recipe.create! name:'BRAINIAC BLAST', image:'vscgsbxfw9gr4aqygrum', ingredients: %Q{2 cups baby kale
  1.5 cup plums
  1 avocado
  2 tbsp hemp seeds
  1 cup cocomut water
  1 cup green tea
  1 tbsp lime juice
  1 tsp chlorella powder
}
r10 = Recipe.create! name:'BLUES BE GONE', image:'fy8hwdeb00h97jeay4oi', ingredients: %Q{2 cups kale
  1 cup blackberreis
  1 cup blueberries
  1 banana
  1/2 cup cooked black beans
  1/4 cup walnuts
  2 tbsp raw cacao
  2 cups almond milk
}


puts "Created #{Recipe.all.length} recipes."



# #####Associations#####################################
# categories & foods
c1.foods << f1 << f2 << f3 << f4 << f5
c2.foods << f6 << f7 << f8 << f9 << f10
c3.foods << f11 << f12 << f13 << f14 << f15
c4.foods << f16 << f17 << f18 << f19 << f20
c5.foods << f21 << f22 << f23 << f24 << f25


# categories & recipes
c1.recipes << r1 << r2
c2.recipes << r3 << r4
c3.recipes << r5 << r6
c4.recipes << r7 << r8
c5.recipes << r9 << r10

# users & recipes
u1.recipes << r1 << r2 << r3 << r4 << r5 << r6 << r7 << r8 << r9 << r10


# foods & recipes
r1.foods << f2 << f3
r2.foods << f4
r3.foods << f10
r4.foods << f7 << f8
r5.foods << f13
r6.foods << f11 << f13
r7.foods << f13 << f17 << f18 << f19 << f20
r8.foods << f13 << f16
r9.foods << f19 << f20 << f24
r10.foods << f21 << f22
