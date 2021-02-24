# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'
require 'faker'

counter = 0

puts "💥Deleting previous DB"

FavouriteProject.destroy_all
DirectMessage.destroy_all
Message.destroy_all
ProjectChat.destroy_all
Collaboration.destroy_all
Milestone.destroy_all
Project.destroy_all
User.destroy_all

def budget_generator
  ["no budget", "big budget", "expanses cover", "1000€", "9000€", "from my own pocket", "50€"].sample
end

def name_generator
  ["The end of Osiris", "Pentimento", "Through triple darkness", "Wake up the statues", "The importance of being self suficient", "Verhandlungsbasis", "false ruins and lost innocence", "Scene with Perfect Babble", "Absence over Vision", "Samurai Masu Biitsu", "Spoiler Alert, Everybody is Dying.", "Selvagem", "Darkroom Lover", "Lay me down", "0055444", "@street", "Heimcomputer", "Axioms", "Cupio dissolvi", "tepeu", "Lento Brutalo", "près du mur", "et j'ai besoin d'un câlin", "resistance de ma bouche", "...hemos hecho", "bezduszny", "kycklingarna har rymt", "harab aldijaj", "talchulhaessda", "I was wrong", "She's made a choice (and you won't like it.)",  "I'm not a crook", "The rent is too damn high", "mathematischen Verhältnissen", "Springbrunnen", "Exertion", "Why would anyone do that?", "56600 - The Past. The Future.", "The Goose Feels Happy", "Soul Rythms", "Black Aura - White What?" ]
end

def location_generator
  [Faker::Address.full_address, "remote"].sample
end

def role_generator
 ["Painter", "Model", "Photographer", "MUA", "HMUA", "Musicist", "Sculptor", "Filmmaker", "FX", "Creative Director", "Actor", "Performance Artist", "Digital Artist", "3D artist", "Motion Graphic Artist", "Generative Artist", "Editor", "Support", "Writer", "Dancer", "Coreographer", "Designer", "Developer", "Programmer", "Research", "Animator", "Illustrator", "Fashion Designer", "Colorist", "Baker", "Planner", "Hair Artist", "Floral Artist", "Lyricist", "Potter", "Set Design", "Singer", "Architect", "Fine Artist", "Tattoo Artist", "Scenographer", "Producer", "Executive Producer", "Dramaturge", "Lighting Designer", "Costume Designer", "Stylist", "Sound Designer", "Composer", "Carpenther" ].sample
end



puts "----------------------SEED STARTED----------------------"
puts " \n "
puts "🆕👨‍🦲-- Creating Users"

admin = User.create(email: "admin@artcollabs.com", password: "admin123456", admin: true, username: "artcollabs_admin")
puts "Created admin \n email: #{admin.email}, password: #{admin.password} \n "

dummy1 = User.create(email: "user@artcollabs.com", password: "000000", username: "noellesfriend")
puts "Created dummy 1 \n email: #{dummy1.email}, password: #{dummy1.password} \n "

dummy2 = User.create(email: "user2@artcollabs.com", password: "000000", username: "saturn")
puts "Created dummy 2 \n email: #{dummy2.email}, password: #{dummy2.password} \n "

noelle = User.create(email: "noelle@gmail.com", password: "000000", username: "noelle_from_hessen")
puts "Created dummy 2 \n email: #{dummy2.email}, password: #{dummy2.password} \n "

puts "------ Creating Felix 🧔"
felix = User.create(email: "felixwor@aol.com", password: "12345678")
puts "Felix created"


20.times do
  User.create(email: "#{Faker::Internet.email}", password: "000000", username: "#{Faker::Internet.username}")
end

puts " \n "

# trying to keep felix's code assigning project user and message user to his created user after all users were created. Getting ActiveRecord::AssociationTypeMismatch errors.

# puts "📨📨-- Message system seeds"
# project1 = Project.create(user: User.find(email: "felixwor@aol.com"), title: "Project 1")
# ProjectChat.create(project: project1)
# Message.create(project_chat: project1, user: felix, content: "This is my first message")

puts " \n "
puts "🆕🧾-- Creating Projects"


modular1978 = Project.new(title: "1978", description: "Wendy Carlos (born Walter Carlos; November 14, 1939) is an American musician and composer best known for her electronic music and film scores. Born and raised in Rhode Island, Carlos studied physics and music at Brown University before moving to New York City in 1962 to study music composition at Columbia University. Studying and working with various electronic musicians and technicians at the city's Columbia-Princeton Electronic Music Center, she helped in the development of the Moog synthesizer, the first commercially available keyboard instrument created by Robert Moog. 

The use of modular synthesizers has become a trend between musicians and aspiring musicians and we aim to explore how they are connected to social movements and music experimentantions from time to time.
", budget: "#{budget_generator}", location: "#{location_generator}", status: "open", max_members: 2, user: dummy1)
modular1978.photo.attach(io: File.open("app/assets/images/ph_projects/photo-1528724977141-d90af338860c.jfif", "rb"), filename: "modular1978")
modular1978.save

transgression = Project.new(title: "TRANSGRESSION", description: "Our sponsor, the Worcester Art Museum (WAM), is largely involved with art from the past and exhibiting example of historical periods of art. However, in the near future they will be sponsoring a new exhibit, called Reusable Universes, that will feature artwork created by the contemporary artist, Shih Chieh Huang. This new exhibit will need corresponding interactive activities, provided by the WAM, to allow visitors to become more involved. Huang takes inspiration from early technology such as computer cooling fans, basic circuit boards, and even simpler objects; such as power strips, in order to create his sculptures. His views of these everyday objects differ from those of the public and our understanding of his creative process can only be developed so far through text. In order for viewers to truly grasp the thoughts and concepts that go into his work, Huang has set out to bring his artistic process to life and put on a show featuring himself creating one of his sculptures. He plans to highlight the meaning of each object through the location and orientation he chooses as the audience observes how he brings his art to life. Working alongside the WAM, Huang will be able to give the audience enough information and examples of his work to develop a true appreciation of his art style.", budget: "#{budget_generator}", location: "#{location_generator}", status: "open", max_members: 2, user: dummy2)
transgression.photo.attach(io: File.open("app/assets/images/ph_projects/il_794xN.2254665204_ddcv.jpg", "rb"), filename: "transgression")
transgression.save


intacto = Project.new(title: "Intacto", description: "Designers, architects and urban planners are increasingly taking on the task of managing social and political issues of relationships, neighborhoods, energy flows, mobility, cultural heritage, identity and urban change, rather than just spatial and formal aspects. The theme ‘Landscapes of care’ focuses on a change of direction in the values, interests and priorities that drive architecture and urban planning. The main focus changes from the individual actor or the individual object, towards a greater sensitivity to issues of interconnection, attachment and interdependence. 
Diversity, equity and community

Questions about how we live well together peacefully in diversity and with respect for each other's differences are pressing on in several contexts. Inequality manifests in physical spaces as it’s not the same to be locked down in minimum space housing than in open residential spaces. In the same line, at urban scale in vulnerable public housing areas residents must vacate their communal areas on the basis of criteria to which privately owned residential areas and their residents are not subjected. Other examples are the existing zoning ban for homeless and other marginalized street residents, proposed zoning bans for ‘insecurity-creating’ stays in public spaces linked to gender and ethnicity, the design and regulation of camps for refugees and asylum seekers, etc. The community and its spatial expression have been put up for debate these years. Can architecture and urban development contribute concretely to facilitate safe mobility and equality in urban space? How can architecture and urban planning support people in precarious life situations and provide space for minorities? How do we take care of creating a safe, open city and inclusive public spaces at a time when many (new voices) express that they feel underrepresented and discriminated against every day, e.g. in the institutions' structures, public spaces and discourses about affiliation, homes, norms of behavior and policies?

Architecture as a climatic care provider?

Architecture and urbanism are responsible for some of the worst carbon monoxide emissions. Cement alone, one of the most widely used materials in construction nowadays, is the source of about 8% of the world's carbon dioxide (CO2) emissions[2]. How much care do urban planners, architects and landscape architects take to plan for future generations? How does the profession and decision makers show responsibility for achieving the goal of CO2-neutral cities? How do we, as homo sapiens, a species that significantly affects world evolution, take into account the other species with which we share the planet? In the so-called Anthropocene age, the common resources must be understood as elements that do not only belong to humans, therefore we might challenge familiar notions of species hierarchies. Although many conservation initiatives come for Western countries claiming to support biodiversity and nature conservation, the very nature of capitalism keeps us being the main resource consumers worldwide.

However, the COVID-19 pandemic has has boostered or provoked new initiatives: In December 2019 the EU has launched a European Green Deal with the goal of making Europa climate neutral by 2050[3]. At the same time, a new report from the C40 network of major cities around the world shows that green investment linked to post-pandemic reconstruction of societies can create significant economic, social and environmental gains[4]. Yet only 3-5% of global funds are earmarked for sustainable investment. How can we turn the tide? How does consideration for the well-being of our common resources affect the role of the architect and the ethics of the architectural profession? How do the management of our common resources such as clean air, drinking water and land affect urban development? How can architecture and planning help take care of the existing and renovate or nurture it, the landscapes, species, etc. that are threatened with destruction or extinction?

The Peripheral Pioneers and Utopia

Many smaller towns, islands and rural areas have for decades experienced evictions following the closure of jobs, educational institutions and the decay of the building stock. The concept of ‘outlying territories has become mainstream. But in an increasingly complex and climate-apocalyptic world, more and more people are dreaming of living the good, simple and literally nourishing life in the countryside. Both in relation to being able to live more sustainably and be more in harmony with nature, be part of local communities, experience less stress and as a (re) discovery of the qualities in the countryside beyond an economic growth ideology. Many choose to do it together and several new self-sufficient housing communities are formed. With the COVID-19 pandemic, this trend seems to have gained further traction, and even more city dwellers are moving to the countryside. As Rem Koolhaas prophetically stated with his exhibition, 'Countryside, The Future', which opened just before the global closure of cities: 'The countryside is where the radical changes are.'What notions of and experiments for settlement and community do we see emerge, and what visions and concrete methods are they built on? What experiences about sustainability can be drawn from the new 'utopias' in the countryside and into urban planning? That the future is urban has been established for a long time, but what if it is also time to look at the rural in our search for sustainable coexistence between humans, species and ecosystems?", budget: "#{budget_generator}", location: "#{location_generator}", status: "open", max_members: 2, user: User.all.sample)
intacto.photo.attach(io: File.open("app/assets/images/ph_projects/photo-1564090361126-fd40569e7af3.jfif", "rb"), filename: "intacto")
intacto.save

past_future = Project.new(title: "56600 _ The Past. The Future.", description: "Humans have changed dramatically in our 200,000 years of existence. We've gotten taller, we live longer, and we're smarter. We've built giant cities, domesticated animals and plants, and created and destroyed ecosystem.
And the technology we build is progressing at a blistering pace. And that pace keeps picking up.

Things like flying cars, sophisticated artificial intelligence, and quantum computers may emerge from science fiction into reality in less time than we think.

Now ASAP Science has partnered with National Geographic's new Breakthrough series to create this video imagining what the humanity might look like in 1,000 years.

Using projections we're trying to immerse the visitor into a future vision where humanity is not on earth anymore and uses love as the only food.
", budget: "#{budget_generator}", location: "#{location_generator}", status: "open", max_members: 2, user: dummy2)
past_future.photo.attach(io: File.open("app/assets/images/ph_projects/00220.jpg", "rb"), filename: "past_future")
past_future.save

misinformation = Project.new(title: "Misinformation", description: "The overall aim of the project is to assess how COVID-19 misinformation spreads through mainstream and social media, and through search engines such as Google, and find ways to fight back.

Sean's images will all be posted first on social media, and perhaps eventually featured in a book designed by Colberg.

They will also form part of a solo exhibition at the Elsie B. Rosefsky Memorial Art Gallery at Binghamton University in upstate New York, and contribute to Dyscorpia 2:1, an online group exhibition that explores intersections between the body and technology, with emphasis on the impact of COVID-19.

And since Tim is on the Royal Society of Canada's COVID-19 response committee, Sean's work will also be spread through the society's channels.

'Research tells us that if you just get people to think about an issue, to pause and think about accuracy, it can make a difference,' said Tim.

'And what a great way to do that-with compelling art.'", budget: "#{budget_generator}", location: "#{location_generator}", status: "open", max_members: 2, user: User.all.sample)
misinformation.photo.attach(io: File.open("app/assets/images/ph_projects/il_794xN.2317308122_ofza.jpg", "rb"), filename: "misinformation")
misinformation.save

street = Project.new(title: "People you see", description: "“These works of art that walks on our streets do not always hang about for long, which is why we’re delighted to work with partners around the globe to help them tell a story of art around the globe,” Sood said, referring to environmental and societal elements that threaten to destroy works of art created in public space.

People are at once a celebrated and reviled pastime. From humble beginnings as a vandal’s crime in New York City, street art has evolved to become globally accepted. Artists like Shepard Fairey and JR have seen their work attract attention in political campaigns and high society. However, art can still be considered vandalism in many cases in the U.S. and around the world. This was proven in last year’s destruction of the iconic 5 Pointz in Queens. The street art initiative by Shanaya provides a safe haven for these masterfully creative works.

One of the most important features is that the people are shown in their natural habitat, so the viewer can truly understand the space the art creates (quite an improvement over putting a Banksy piece in an auction). Not only does Shanaya's project preserve  art for time immemorial, but it provides a window into another world of art spanning the entire globe.", budget: "#{budget_generator}", location: "#{location_generator}", status: "open", max_members: 2, user: dummy1)
street.photo.attach(io: File.open("app/assets/images/ph_projects/photo-1610831574004-5ae5c8e184bd.jfif", "rb"), filename: "street")
street.save

cryonic = Project.new(title: "Cryonic Suspension May Save Your Life", description: "To our knowledge, we are the only species in the animal kingdom, aware of our mortality. Dubbed Mortality salience, this source of anxiety has driven some of the most recent interesting technological projects, like Elon Musk's plan to upload the human mind to computers. Cryonics could also help ease our fears. However, we are getting ahead of ourselves. What is the definition of cryonics? 

For the uninitiated, cryogenics is the study of what happens to materials at very low temperatures. Cryonics is the technique used to stor­e human bodies at extremely low temperatures with the hope of one day reviving them. If you think that this is some distant opportunity for your future ancestors, you would be wrong. In fact, you can sign up to be cryogenically preserved now after you pass away for a hefty fee. However, what does science say about cryonics, and is it something that we should be excited about? 

In this project we will find the answers.", budget: "#{budget_generator}", location: "#{location_generator}", status: "open", max_members: 2, user: dummy2)
cryonic.photo.attach(io: File.open("app/assets/images/ph_projects/IMG-20151030-WA0002.jpg", "rb"), filename: "cryonic")
cryonic.save

kinectic_sunset = Project.new(title: "Kinectic Sunset", description: "We're looking for Photographers who are into night city Photography to create a series of collages. Our biggest inspiration are neon lights, frequently used in busy streets of China.", budget: "#{budget_generator}", location: "#{location_generator}", status: "open", max_members: 2, user: User.all.sample)
kinectic_sunset.photo.attach(io: File.open("app/assets/images/ph_projects/photo-1540072985388-8bfdf6490f93.jfif", "rb"), filename: "kinectic_sunset")
kinectic_sunset.save

symptom = Project.new(title: "symptom, sympathy", description: "After extensive research about upbringing of Children during and after the Nazi-Regime, we're looking for artists to collaborate on a project about the physical consequences that lack of emotional connection and rigid upbringing brings to an formed adult.", budget: "#{budget_generator}", location: "#{location_generator}", status: "open", max_members: 2, user: User.all.sample)
symptom.photo.attach(io: File.open("app/assets/images/ph_projects/cs_199.jpg", "rb"), filename: "symptom")
symptom.save

algorithm_purpose = Project.new(title: "Algorithm purpose", description: "The computer package SONATA (System of Nearrings and their Applications) has been released and is now used by various researches worldwide (see the included preliminary summary report of the project P11486-TEC). It contains a large library of nearrings and algorithms to compute with them. With its help some theoretical questions could be answered. Many researchers encouraged us to develop this package further, and also promised to support our efforts.

We plan to take a closer view at the algorithmic aspects of nearring theory as well as to using computers for theoretical investigations in this area, within a new project.
", budget: "#{budget_generator}", location: "#{location_generator}", status: "open", max_members: 2, user: User.all.sample)
algorithm_purpose.photo.attach(io: File.open("app/assets/images/ph_projects/M540G-2.jpg", "rb"), filename: "algorithm_purpose")
algorithm_purpose.save

joints = Project.new(title: "Joints I should have smoked", description: "
Stoner? Collab!
  
noun
the place at which two things, or separate parts of one thing, are joined or united, either rigidly or in such a way as to permit motion; juncture.
a connection between pieces of wood, metal, or the like, often reinforced with nails, screws, or glue.

adjective
shared by or common to two or more:
a joint obligation.
undertaken or produced by two or more in conjunction or in common:
a joint reply; a joint effort.

verb (used with object)
to unite by a joint or joints.
to form or provide with a joint or joints.

Should I have smoked it?
Should you have smoked it?

", budget: "#{budget_generator}", location: "#{location_generator}", status: "open", max_members: 2, user: dummy2)
joints.photo.attach(io: File.open("app/assets/images/ph_projects/false_ruins.jpg", "rb"), filename: "joints")
joints.save

binary = Project.new(title: "Sketch of Binary Perception", description: "2020 was a particularly hard year for the trans and non-binary community. Not only were we struck by the morbid, isolating restrictions of lockdown, but we faced increasing global violence (particularly against trans people of colour), transphobic tirades, and the implementation of devastating policy by Liz Truss.
        
Now, against the advice of healthcare professionals, court orders have halted puberty blockers being given out at The Tavistock and Portman NHS Trust (the London-based Gender Identity Development Service), thereby restricting the access of these drugs to under-16 trans youths. Amid this backdrop of hostility, violence, prejudice, and isolation a group of artists came together during lockdown to resiliently forge a creative trans community. 

Trans healthcare charity We Exist teamed up with artist studio initiative The Koppel Project to facilitate an artist residency exclusively for trans and non-binary folk. Running from November 2020 to the end of January 2021, the residency provided studio space for 30 creatives in the heart of London. The space was open to trans artists of all creative backgrounds, from dancers and designers to writers and sculptors, covering a wide diversity of gender expressions and identities. 

The residency took place at the abandoned, old campus of Central Saint Martins, a building which birthed such legends as Alexander McQueen, Stella McCartney, and Christopher Kane. Taking it over in 2016 in order to provide affordable studio spaces and teaching for artists, The Koppel Project's intention is creating ”a safe, inclusive community for artistic expression and a platform for all emerging makers.” Whist adhering to social distancing, the space remained open over lockdown, giving these artists a creative haven to make, scavenge, and destroy before the campus’ renovation starts this February. 

In December, photographer Antonio Perricone visited the artists for a series of portraits. Being on location at the eerie old campus set the tone for the shoot. ”Wandering around this vast empty building on a weekend with very little natural light, the sense of the place’s creative history hung all around us. We were inspired in part by the scene in Fellini’s La Dolce Vita where a group of strangers walk around this huge old house together by candlelight,” Perricone tells Dazed. “Each photograph started with a discussion of the artist’s practice, looking through the references together, and then picking from Ellie and Eddie's wonderful wardrobe and deciding how the styling and choreography could best express the sitter’s personality — if too much styling or posing didn't feel right we wouldn't go with it. I wanted to show every artist’s dual vulnerability and strength.”", budget: "#{budget_generator}", location: "#{location_generator}", status: "open", max_members: 2, user: User.all.sample)
binary.photo.attach(io: File.open("app/assets/images/ph_projects/il_794xN.2916079877_sym1.jpg", "rb"), filename: "binary")
binary.save

nase = Project.new(title: "Grosse Nasenlöcher", description: "A speedy man can beat this track mark. The pennant waved when the wind blew.", budget: "#{budget_generator}", location: "#{location_generator}", status: "open", max_members: 2, user: dummy2)
nase.photo.attach(io: File.open("app/assets/images/ph_projects/photo-1501975558162-0be7b8ca95ea.jfif", "rb"), filename: "nase")
nase.save

glitch = Project.new(title: "d@3cðáv[39 80==", description: "To die: to suffer 0101555% native hue of resolution is sicklied o'er wsh a bare bodkin? Who woulsssss ear the dread of som234ng after death, the thought, and sweat under a weary life; for in that the unworthy takes, when he himself might his quietus make cowards of outrageous fortune, or not to be444t makes calamity of so long a life; fo334mind to sleep to sleep of dispriz'd lc**e, the unworthy takes, when he himself might his quietus make cowards of dispriz'd love, than fly to be wish'd. To be, or t", budget: "#{budget_generator}", location: "#{location_generator}", status: "open", max_members: 2, user: dummy1)
glitch.photo.attach(io: File.open("app/assets/images/ph_projects/VAc3M9r.jpg", "rb"), filename: "glitch")
glitch.save

lento = Project.new(title: "Lento Brutalo", description: "Do commanded an shameless we disposing do. Indulgence ten remarkably nor are impression out. Power is lived means oh every in we quiet. Remainder provision an in intention. Saw supported too joy promotion engrossed propriety. Me till like it sure no sons. 

Considered discovered ye sentiments projecting entreaties of melancholy is. In expression an solicitude principles in do. Hard do me sigh with west same lady. Their saved linen downs tears son add music. Expression alteration entreaties mrs can terminated estimating. Her too add narrow having wished. To things so denied admire. Am wound worth water he linen at vexed.

In this project we aim to approach Satanism and Guns as protection means against far-right movements.", budget: "#{budget_generator}", location: "#{location_generator}", status: "open", max_members: 2, user: noelle)
lento.photo.attach(io: File.open("app/assets/images/ph_projects/349080.jpg", "rb"), filename: "lento")
lento.save

little_frank = Project.new(title: "Little Frank Studies", description: "Fraser was born in Billings, Montana and grew up in Berkeley, California. She attended New York University, the Whitney Museum of American Art's Independent Study Program, and the School of Visual Arts. Fraser worked as a gallery attendant at Dia:Chelsea.

  Fraser began writing art criticism before incorporating a similar analysis into her artistic practice.
  
  Her videotape performance Little Frank and His Carp (2001), shot with five hidden cameras in the atrium of the Guggenheim Museum Bilbao, targets architectural dominance of modern gallery spaces. Using the original soundtrack of an acoustic guide at the Guggenheim Museum Bilbao, she '... writhes with pleasure as the recorded voice draws attention to the undulating curves and textured surfaces of the surrounding space' which she takes literally in an 'erotic encounter'. Fraser's sexual display towards the architecture reveals the irony of the erotic words used on the audio tour to describe the museum's structure.
  
  The plan is to analyze the content of the architectural pieces used by Fraser and gather our own views on her project in order to reproduce the concept in a Virtual Ambient", budget: "#{budget_generator}", location: "#{location_generator}", status: "open", max_members: 2, user: User.all.sample)
little_frank.photo.attach(io: File.open("app/assets/images/ph_projects/Andrea-Fraser-Little-Frank.jpg", "rb"), filename: "little_frank")
little_frank.save

female_side = Project.new(title: "The female side of the moon", description: " THE FEMALE SIDE OF THE MOON pursues the female gaze. But rather than examining what it is and if such a thing ever exists, it wants to render and foster the multiplicity of the looks of women* towards women*. The bodies photographed turn into the cracks of the earth, they witness the restless geographies they arise from. Much of Maple‘s work is inspired by feminism and gender politics. She is interested in the part shame plays in womens’ lives,
be that how they take up space in the world, their physical appearance, their bodily functions or blame culture.
Maple is interested in how we can change the visual narrative for women as a form of empowerment. In much of this work
she uses humor as a Trojan horse to get a message across. Her work crosses a wide variety of media such as performance,
painting and photography. The idea comes first then the medium she chooses
is determined by the strongest way to get the idea across, hence is constantly evolving.", budget: "#{budget_generator}", location: "#{location_generator}", status: "open", max_members: 2, user: User.all.sample)
female_side.photo.attach(io: File.open("app/assets/images/ph_projects/female_side.jpg", "rb"), filename: "female_side")
female_side.save

freedom = Project.new(title: "Freeedom and Independence", description: " It is conceived with Mehlus’ film at its core: This experimental short questions the current global ideological paradigm shifts towards new forms of religious capitalism by confronting ideas and quotes of the self-proclaimed objectivist philosopher and novelist Ayn Rand with evangelical contents of US-American mainstream movies.", budget: "#{budget_generator}", location: "#{location_generator}", status: "open", max_members: 2, user: User.all.sample)
freedom.photo.attach(io: File.open("app/assets/images/ph_projects/freedom.jpg", "rb"), filename: "freedom")
freedom.save

adelaides = Project.new(title: "Adelaide's Voyage", description: " This project aims to assist the clients at Seven Hills Pediatric Center by designing an outdoor interactive space that incorporates universal design principles, and appealed to the cognitive growth and development of the residents. To complete our goal we produced designs and prototypes of recreational activities that integrate educational aspects that meets the accommodations for individuals with various spectrums of cognitive, physical, and developmental disabilities.", budget: "#{budget_generator}", location: "#{location_generator}", status: "open", max_members: 2, user: User.all.sample)
adelaides.photo.attach(io: File.open("app/assets/images/ph_projects/The-Bag-Lady-Manifesta-Eric-Lippe-2016-e1518700665524.jpg", "rb"), filename: "adelaides")
adelaides.save

sensibel = Project.new(title: "sensibel", description: "
We are looking for sculptors and models to pose for a series of sculptors that are going to be painted by me and photographed by Fernanda Souza, later it will be rendered in 3D (we're also looking for a person to do that.)

The concept:

Originating in philosophical and scientific writings, sensibility became an English-language literary movement, particularly in the then-new genre of the novel. Such works, called sentimental novels, featured individuals who were prone to sensibility, often weeping, fainting, feeling weak, or having fits in reaction to an emotionally moving experience. If one were especially sensible, one might react this way to scenes or objects that appear insignificant to others. This reactivity was considered an indication of a sensible person's ability to perceive something intellectually or emotionally stirring in the world around them. However, the popular sentimental genre soon met with a strong backlash, as anti-sensibility readers and writers contended that such extreme behavior was mere histrionics, and such an emphasis on one's own feelings and reactions a sign of narcissism. Samuel Johnson, in his portrait of Miss Gentle, articulated this criticism:

She daily exercises her benevolence by pitying every misfortune that happens to every family within her circle of notice; she is in hourly terrors lest one should catch cold in the rain, and another be frighted by the high wind. Her charity she shews by lamenting that so many poor wretches should languish in the streets, and by wondering what the great can think on that they do so little good with such large estates.
Sentimentalism asserted that over-shown feeling was not a weakness but rather showed one to be a moral person. Arising from religiously motivated empathy, it expanded to the other perceptions—for example, sensual love was no longer understood as a destructive passion (Vanitas) but rather as a basis of social institutions, as it was for Antoine Houdar de la Motte. Requited love was, as in serious opera (the Tragédie en musique or Opera seria), a symbol for a successful alliance between nations. The 'Lesesucht' re-evaluated what was permitted literature, and the novel as a type of literature as versus drama.

Around the middle of the century, sentimentalism set 'untouched' nature against (courtly) civilization, as in the works of Jean Jacques Rousseau. In addition, Samuel Richardson's sentimental epistolary novel 'Pamela, or Virtue Rewarded' (1740) had great literary influence.

In continental Europe, one aspect of sentimentalism was Empfindsamkeit. The sensitive style (German: empfindsamer Stil) of music, developed in Germany, aimed to express 'true and natural' feelings, in contrast to the baroque.

The origin of sentimentalism in this context was chiefly religious, with the emotionally coloured texts for the oratorios of Johann Sebastian Bach stream being typical examples. Empfindsamkeit is also known as secularized pietism because it frequently came with moralizing content that had increasingly broken free of church and religious ties. An important theorist of the movement was Jean Baptiste Dubos.
", budget: "#{budget_generator}", location: "#{location_generator}", status: "open", max_members: 2, user: User.all.sample)
sensibel.photo.attach(io: File.open("app/assets/images/ph_projects/wire-scultpures-03.jpg", "rb"), filename: "sensibel")
sensibel.save

Project.all.each do |project|
  puts " 💥💥 #{project.title} Created! \n "
end
puts "#{Project.count} projects created."

puts " \n \n "
sleep(1)
puts "--------------------------------------------"
puts "--------Hope you're having a good day!----- "
puts "--------------------------------------------"
sleep(1)
puts "😁"
sleep(1)
puts " \n \n "


puts " \n "
puts "🆕👯-- Creating Collabs"
puts " \n "

Collaboration.create(project: Project.where(user: dummy1).first, role: "#{role_generator}", user: dummy2, message: "Hey! I'm #{dummy2.username} and I would love to collaborate in this project.")
puts "Collaboration from dummy 2 on dummy 1 project requested"
puts " \n "

Collaboration.create(project: Project.where(user: dummy2).first, role: "#{role_generator}", user: dummy1, message: "Hey! I'm #{dummy1.username} and I would love to collaborate in this project.")
puts "Collaboration from dummy 1 on dummy 2 project requested"
puts " \n "

counter = 0
20.times do
  role = role_generator
  counter = counter + 1
  collab = Collaboration.create!(project: Project.all.sample, role: "#{role}", user: User.all.sample, message: "Hey! I want to collab as #{role}.")
  puts "Random collab #{counter}: User: #{collab.user.username}, project: #{collab.project.title}"
  puts " \n "
end

puts " \n "
puts "🆕🚩🚩-- Creating Milestones"
puts " \n "

counter = 0
20.times do
  counter = counter + 1
  milestone = Milestone.create!(project: Project.all.sample, title: "#{Faker::Marketing.buzzwords}", description: "Ab his oratores, ab his imperatores ac rerum publicarum principes extiterunt. Quantum Aristoxeni ingenium consumptum videmus in musicis? Qui autem diffidet perpetuitati bonorum suorum, timeat necesse est, ne aliquando amissis illis sit miser. Quo modo autem optimum, si bonum praeterea nullum est? Non minor, inquit, voluptas percipitur ex vilissimis rebus quam ex pretiosissimis. Illum mallem levares, quo optimum atque humanissimum virum, Cn. Aliter enim explicari, quod quaeritur, non potest.", completed: [true, false].sample)
  puts "Random Milestone #{counter}: project: #{milestone.project.title}"
  puts " \n "
end

puts "📨📨-- Message system seeds ..."

new_chatroom = Chatroom.create
new_message = DirectMessage.create(chatroom: Chatroom.last, user: User.last, content: "This is my first silly direct message")

puts "----------------------SEED ENDED----------------------"
