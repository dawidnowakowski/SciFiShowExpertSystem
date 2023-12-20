(deffacts setup
   (start)
)

(defrule start
   (start)
   =>
   (assert (question "Which genre do you like the most?" "Fantasy" "SciFi" "Horror" "Slipstream"))
)

(defrule urb-per
   ?answer <- (answer "Fantasy")
   ?question <- (question "Which genre do you like the most?" "Fantasy" "SciFi" "Horror" "Slipstream")
   =>
   (retract ?answer)
   (retract ?question)
   (assert (question "Urban or Period?" "Urban" "Period"))
)

(defrule like-sh
   ?answer <- (answer "Urban")
   ?question <- (question "Urban or Period?" "Urban" "Period")
   =>
   (retract ?answer)
   (retract ?question)
   (assert (question "Like Superheroes?" "Yep" "Nope"))
)

(defrule anim-liveact1
   ?answer <- (answer "Yep")
   ?question <- (question "Like Superheroes?" "Yep" "Nope")
   =>
   (retract ?answer)
   (retract ?question)
   (assert (question "Animated or Live Action?" "Live" "Toons"))
   (assert (previous_question "Like Superheroes?"))
)

(defrule smallville
   ?previous_question <- (previous_question "Like Superheroes?")
   ?answer <- (answer "Live")
   ?question <- (question "Animated or Live Action?" "Live" "Toons")
   =>
   (retract ?previous_question)
   (retract ?question)
   (retract ?answer)
   (assert (result "Smallville"))
)

(defrule the-tick
   ?previous_question <- (previous_question "Like Superheroes?")
   ?answer <- (answer "Toons")
   ?question <- (question "Animated or Live Action?" "Live" "Toons")
   =>
   (retract ?previous_question)
   (retract ?question)
   (retract ?answer)
   (assert (result "The Tick"))
)

(defrule how-ab-myth
   ?answer <- (answer "Nope")
   ?question <- (question "Like Superheroes?" "Yep" "Nope")
   =>
   (retract ?answer)
   (retract ?question)
   (assert (question "How about Mythology" "Yep" "Nope"))
)

(defrule highlander
   ?answer <- (answer "Yep")
   ?question <- (question "How about Mythology" "Yep" "Nope")
   =>
   (retract ?question)
   (retract ?answer)
   (assert (result "Highlander"))
)

(defrule dresden-files
   ?answer <- (answer "Nope")
   ?question <- (question "How about Mythology" "Yep" "Nope")
   =>
   (retract ?question)
   (retract ?answer)
   (assert (result "Dresden Files"))
)

(defrule myth-legends
   ?answer <- (answer "Period")
   ?question <- (question "Urban or Period?" "Urban" "Period")
   =>
   (retract ?answer)
   (retract ?question)
   (assert (question "Myths or Legends?" "Myths" "Legends"))
)

(defrule dudes-girls
   ?answer <- (answer "Myths")
   ?question <- (question "Myths or Legends?" "Myths" "Legends")
   =>
   (retract ?answer)
   (retract ?question)
   (assert (question "Buff dudes or Hot Girls?" "Dudes" "Ladies"))
)

(defrule xena
   ?answer <- (answer "Ladies")
   ?question <- (question "Buff dudes or Hot Girls?" "Dudes" "Ladies")
   =>
   (retract ?question)
   (retract ?answer)
   (assert (result "Xena: Warrior Princess"))
)

(defrule hercules
   ?answer <- (answer "Dudes")
   ?question <- (question "Buff dudes or Hot Girls?" "Dudes" "Ladies")
   =>
   (retract ?question)
   (retract ?answer)
   (assert (result "Hercules: The Legendary Journeys"))
)

(defrule anim-liveact3
   ?answer <- (answer "Legends")
   ?question <- (question "Myths or Legends?" "Myths" "Legends")
   =>
   (retract ?answer)
   (retract ?question)
   (assert (question "Animated or Live Action?" "Live" "Toons"))
   (assert (previous_question "Myths or Legends?"))
)

(defrule gmboy
   ?previous_question <- (previous_question "Myths or Legends?")
   ?answer <- (answer "Toons")
   ?question <- (question "Animated or Live Action?" "Live" "Toons")
   =>
   (retract ?answer)
   (retract ?question)
   (retract ?previous_question)
   (assert (question "Do you have a Gameboy" "Yep" "Nope"))
)

(defrule pokemon
   ?answer <- (answer "Yep")
   ?question <- (question "Do you have a Gameboy" "Yep" "Nope")
   =>
   (retract ?question)
   (retract ?answer)
   (assert (result "Pokemon"))
)

(defrule Avatar
   ?answer <- (answer "Nope")
   ?question <- (question "Do you have a Gameboy" "Yep" "Nope")
   =>
   (retract ?question)
   (retract ?answer)
   (assert (result "Avatar: The Last Airbender"))
)

(defrule nudity
   ?previous_question <- (previous_question "Myths or Legends?")
   ?answer <- (answer "Live")
   ?question <- (question "Animated or Live Action?" "Live" "Toons")
   =>
   (retract ?answer)
   (retract ?question)
   (retract ?previous_question)
   (assert (question "Like lots of nudity" "Yep" "Nope"))
)

(defrule spartacus
   ?answer <- (answer "Yep")
   ?question <- (question "Like lots of nudity" "Yep" "Nope")
   =>
   (retract ?question)
   (retract ?answer)
   (assert (result "Spartacus: Blood and Sand"))
)

(defrule seeker
   ?answer <- (answer "Nope")
   ?question <- (question "Like lots of nudity" "Yep" "Nope")
   =>
   (retract ?question)
   (retract ?answer)
   (assert (result "Legend of the Seeker"))
)

(defrule anthologies1
   ?answer <- (answer "SciFi")
   ?question <- (question "Which genre do you like the most?" "Fantasy" "SciFi" "Horror" "Slipstream")
   =>
   (retract ?answer)
   (retract ?question)
   (assert (previous_question "Which genre do you like the most?"))
   (assert (question "Like anthologies?" "Yep" "Nope"))
)

(defrule the_outer_limits
   ?previous_question <- (previous_question "Which genre do you like the most?")
   ?answer <- (answer "Yep")
   ?question <- (question "Like anthologies?" "Yep" "Nope")
   =>
   (retract ?previous_question)
   (retract ?question)
   (retract ?answer)
   (assert (result "The outer limits"))
)

(defrule space_opera
   ?previous_question <- (previous_question "Which genre do you like the most?")
   ?answer <- (answer "Nope")
   ?question <- (question "Like anthologies?" "Yep" "Nope")
   =>
   (retract ?answer)
   (retract ?question)
   (retract ?previous_question)
   (assert (question "Space Opera or close to home?" "Home" "Stars"))
)

(defrule friends_invaders
   ?answer <- (answer "Home")
   ?question <- (question "Space Opera or close to home?" "Home" "Stars")
   =>
   (retract ?answer)
   (retract ?question)
   (assert (question "Friends or invaders?" "Friends" "Invaders"))
)

(defrule alien_nation
   ?answer <- (answer "Friends")
   ?question <- (question "Friends or invaders?" "Friends" "Invaders")
   =>
   (retract ?question)
   (retract ?answer)
   (assert (result "Alien Nation"))
)

(defrule anim-liveact2
   ?answer <- (answer "Invaders")
   ?question <- (question "Friends or invaders?" "Friends" "Invaders")
   =>
   (retract ?answer)
   (retract ?question)
   (assert (question "Animated or Live Action?" "Live" "Toons"))
   (assert (previous_question "Friends or invaders?"))
)

(defrule V
   ?previous_question <- (previous_question "Friends or invaders?")
   ?answer <- (answer "Live")
   ?question <- (question "Animated or Live Action?" "Live" "Toons")
   =>
   (retract ?previous_question)
   (retract ?question)
   (retract ?answer)
   (assert (result "V"))
)

(defrule Invader_zim
   ?previous_question <- (previous_question "Friends or invaders?")
   ?answer <- (answer "Toons")
   ?question <- (question "Animated or Live Action?" "Live" "Toons")
   =>
   (retract ?previous_question)
   (retract ?question)
   (retract ?answer)
   (assert (result "Invader Zim"))
)

(defrule comedy
   ?answer <- (answer "Stars")
   ?question <- (question "Space Opera or close to home?" "Home" "Stars")
   =>
   (retract ?answer)
   (retract ?question)
   (assert (question "Comedy?" "Yep" "Nope"))
)

(defrule british_american1
   ?answer <- (answer "Yep")
   ?question <- (question "Comedy?" "Yep" "Nope")
   =>
   (retract ?answer)
   (retract ?question)
   (assert (question "British or American?" "UK" "USA"))
   (assert (previous_question "Comedy?"))
)

(defrule red_dwarf
   ?previous_question <- (previous_question "Comedy?")
   ?answer <- (answer "UK")
   ?question <- (question "British or American?" "UK" "USA")
   =>
   (retract ?previous_question)
   (retract ?question)
   (retract ?answer)
   (assert (result "Red Dwarf"))
)

(defrule futurama
   ?previous_question <- (previous_question "Comedy?")
   ?answer <- (answer "USA")
   ?question <- (question "British or American?" "UK" "USA")
   =>
   (retract ?previous_question)
   (retract ?question)
   (retract ?answer)
   (assert (result "Futurama"))
)

(defrule trekkie
   ?answer <- (answer "Nope")
   ?question <- (question "Comedy?" "Yep" "Nope")
   =>
   (retract ?answer)
   (retract ?question)
   (assert (question "Trekkie?" "Yep. But seen em all 1000X" "Yep" "Nope"))
)

(defrule earth_final_confilct
   ?answer <- (answer "Yep. But seen em all 1000X")
   ?question <- (question "Trekkie?" "Yep. But seen em all 1000X" "Yep" "Nope")
   =>
   (retract ?question)
   (retract ?answer)
   (assert (result "Earth: Final Confilct"))
)

(defrule will_wheaton
   ?answer <- (answer "Yep")
   ?question <- (question "Trekkie?" "Yep. But seen em all 1000X" "Yep" "Nope")
   =>
   (retract ?answer)
   (retract ?question)
   (assert (question "Will Wheaton?" "Woot" "NOOOO!"))
)

(defrule star_trek_next_generation
   ?answer <- (answer "Woot")
   ?question <- (question "Will Wheaton?" "Woot" "NOOOO!")
   =>
   (retract ?question)
   (retract ?answer)
   (assert (result "Star Trek: The Next Generation"))
)

(defrule what_do_you_study
   ?answer <- (answer "NOOOO!")
   ?question <- (question "Will Wheaton?" "Woot" "NOOOO!")
   =>
   (retract ?answer)
   (retract ?question)
   (assert (question "What do you study?" "Poli-sci" "Womens Lib" "Sociology" "History"))
)

(defrule star_trek_deep_space_nine
   ?answer <- (answer "Poli-sci")
   ?question <- (question "What do you study?" "Poli-sci" "Womens Lib" "Sociology" "History")
   =>
   (retract ?question)
   (retract ?answer)
   (assert (result "Star Trek: Deep Space Nine"))
)

(defrule star_trek_voyager
   ?answer <- (answer "Womens Lib")
   ?question <- (question "What do you study?" "Poli-sci" "Womens Lib" "Sociology" "History")
   =>
   (retract ?question)
   (retract ?answer)
   (assert (result "Star Trek: Voyager"))
)

(defrule star_trek_original
   ?answer <- (answer "Sociology")
   ?question <- (question "What do you study?" "Poli-sci" "Womens Lib" "Sociology" "History")
   =>
   (retract ?question)
   (retract ?answer)
   (assert (result "Star Trek: The Original Series"))
)

(defrule star_trek_enterprise
   ?answer <- (answer "History")
   ?question <- (question "What do you study?" "Poli-sci" "Womens Lib" "Sociology" "History")
   =>
   (retract ?question)
   (retract ?answer)
   (assert (result "Star Trek: Enterprise"))
)

(defrule like_westerns
   ?answer <- (answer "Nope")
   ?question <- (question "Trekkie?" "Yep. But seen em all 1000X" "Yep" "Nope")
   =>
   (retract ?answer)
   (retract ?question)
   (assert (question "Like westerns?" "Yep" "Nope"))
)

(defrule firefly
   ?answer <- (answer "Yep")
   ?question <- (question "Like westerns?" "Yep" "Nope")
   =>
   (retract ?question)
   (retract ?answer)
   (assert (result "Firefly"))
)

(defrule time_space_gateways
   ?answer <- (answer "Nope")
   ?question <- (question "Like westerns?" "Yep" "Nope")
   =>
   (retract ?answer)
   (retract ?question)
   (assert (question "Time/Space Gateways?" "Yep" "Nope"))
)

(defrule classic_moder
   ?answer <- (answer "Nope")
   ?question <- (question "Time/Space Gateways?" "Yep" "Nope")
   =>
   (retract ?answer)
   (retract ?question)
   (assert (question "Classic or Modern?" "Classic" "Modern"))
)

(defrule battlestar_galactica1
   ?answer <- (answer "Modern")
   ?question <- (question "Classic or Modern?" "Classic" "Modern")
   =>
   (retract ?question)
   (retract ?answer)
   (assert (result "Battlestar Galactica (season one)"))
)

(defrule battlestar_galactica_serues 
   ?answer <- (answer "Classic")
   ?question <- (question "Classic or Modern?" "Classic" "Modern")
   =>
   (retract ?question)
   (retract ?answer)
   (assert (result "Battlestar Galactica (whole series)"))
)

(defrule british_american2
   ?answer <- (answer "Yep")
   ?question <- (question "Time/Space Gateways?" "Yep" "Nope")
   =>
   (retract ?answer)
   (retract ?question)
   (assert (question "British or American?" "UK" "USA"))
   (assert (previous_question "Time_Space?"))
)

(defrule stargate
   ?previous_question <- (previous_question "Time_Space?")
   ?answer <- (answer "USA")
   ?question <- (question "British or American?" "UK" "USA")
   =>
   (retract ?previous_question)
   (retract ?question)
   (retract ?answer)
   (assert (result "Stargate SG-1"))
)

(defrule doctor_who
   ?previous_question <- (previous_question "Time_Space?")
   ?answer <- (answer "UK")
   ?question <- (question "British or American?" "UK" "USA")
   =>
   (retract ?previous_question)
   (retract ?question)
   (retract ?answer)
   (assert (result "Doctor Who"))
)

(defrule vampires_zombies
   ?answer <- (answer "Horror")
   ?question <- (question "Which genre do you like the most?" "Fantasy" "SciFi" "Horror" "Slipstream")
   =>
   (retract ?answer)
   (retract ?question)
   (assert (question "Vampires or Zombies?" "Zombies" "Vampires" "Neither"))
)

(defrule the_walking_dead
   ?answer <- (answer "Zombies")
   ?question <- (question "Vampires or Zombies?" "Zombies" "Vampires" "Neither")
   =>
   (retract ?question)
   (retract ?answer)
   (assert (result "The Walking Dead"))
)

(defrule anthologies2
   ?answer <- (answer "Neither")
   ?question <- (question "Vampires or Zombies?" "Zombies" "Vampires" "Neither")
   =>
   (retract ?answer)
   (retract ?question)
   (assert (previous_question "Vampires or Zombies?"))
   (assert (question "Like anthologies?" "Yep" "Nope"))
)

(defrule charmed
   ?previous_question <- (previous_question "Vampires or Zombies?")
   ?answer <- (answer "Nope")
   ?question <- (question "Like anthologies?" "Yep" "Nope")
   =>
   (retract ?previous_question)
   (retract ?question)
   (retract ?answer)
   (assert (result "Charmed"))
)

(defrule psychological_gory
   ?previous_question <- (previous_question "Vampires or Zombies?")
   ?answer <- (answer "Yep")
   ?question <- (question "Like anthologies?" "Yep" "Nope")
   =>
   (retract ?answer)
   (retract ?question)
   (retract ?previous_question)
   (assert (question "Psychological or Gory?" "Psycho" "Gory"))
)

(defrule the_twilight_zone
   ?answer <- (answer "Psycho")
   ?question <- (question "Psychological or Gory?" "Psycho" "Gory")
   =>
   (retract ?question)
   (retract ?answer)
   (assert (result "The Twilight Zone"))
)

(defrule tales_from_the_crypt
   ?answer <- (answer "Gory")
   ?question <- (question "Psychological or Gory?" "Psycho" "Gory")
   =>
   (retract ?question)
   (retract ?answer)
   (assert (result "Tales From The Crypt"))
)

(defrule how_old_are_you
   ?answer <- (answer "Vampires")
   ?question <- (question "Vampires or Zombies?" "Zombies" "Vampires" "Neither")
   =>
   (retract ?answer)
   (retract ?question)
   (assert (question "How old are you?" "<16" ">16"))
)

(defrule the_vampire_diaries
   ?answer <- (answer "<16")
   ?question <- (question "How old are you?" "<16" ">16")
   =>
   (retract ?question)
   (retract ?answer)
   (assert (result "The Vampire Diares"))
)

(defrule sfw_nsfw
   ?answer <- (answer ">16")
   ?question <- (question "How old are you?" "<16" ">16")
   =>
   (retract ?answer)
   (retract ?question)
   (assert (question "SFW or NSFW?" "SFW" "NSFW"))
)

(defrule seen_buffy
   ?answer <- (answer "SFW")
   ?question <- (question "SFW or NSFW?" "SFW" "NSFW")
   =>
   (retract ?answer)
   (retract ?question)
   (assert (question "Seen Buffy?" "Nope" "Yep"))
)

(defrule buffy_the_vampire_slayer
   ?answer <- (answer "Nope")
   ?question <- (question "Seen Buffy?" "Nope" "Yep")
   =>
   (retract ?question)
   (retract ?answer)
   (assert (result "Buffy the Vampire Slayer"))
)

(defrule angel
   ?answer <- (answer "Yep")
   ?question <- (question "Seen Buffy?" "Nope" "Yep")
   =>
   (retract ?question)
   (retract ?answer)
   (assert (result "Angel"))
)

(defrule british_american3
   ?answer <- (answer "NSFW")
   ?question <- (question "SFW or NSFW?" "SFW" "NSFW")
   =>
   (retract ?answer)
   (retract ?question)
   (assert (question "British or American?" "UK" "USA"))
   (assert (previous_question "SFW or NSFW?"))
)

(defrule being_human
   ?previous_question <- (previous_question "SFW or NSFW?")
   ?answer <- (answer "UK")
   ?question <- (question "British or American?" "UK" "USA")
   =>
   (retract ?previous_question)
   (retract ?question)
   (retract ?answer)
   (assert (result "Being Human"))
)

(defrule true_blood
   ?previous_question <- (previous_question "SFW or NSFW?")
   ?answer <- (answer "USA")
   ?question <- (question "British or American?" "UK" "USA")
   =>
   (retract ?previous_question)
   (retract ?question)
   (retract ?answer)
   (assert (result "True Blood"))
)

(defrule action_drama
   ?answer <- (answer "Slipstream")
   ?question <- (question "Which genre do you like the most?" "Fantasy" "SciFi" "Horror" "Slipstream")
   =>
   (retract ?answer)
   (retract ?question)
   (assert (question "Action or Drama?" "Drama" "Action"))
)

(defrule seen_x_files
   ?answer <- (answer "Drama")
   ?question <- (question "Action or Drama?" "Drama" "Action")
   =>
   (retract ?answer)
   (retract ?question)
   (assert (question "Have you seen X-files?" "Nope" "Yep" "Hated it"))
)

(defrule x_files
   ?answer <- (answer "Nope")
   ?question <- (question "Have you seen X-files?" "Nope" "Yep" "Hated it")
   =>
   (retract ?question)
   (retract ?answer)
   (assert (result "The X Files"))
)

(defrule fringe
   ?answer <- (answer "Yep")
   ?question <- (question "Have you seen X-files?" "Nope" "Yep" "Hated it")
   =>
   (retract ?question)
   (retract ?answer)
   (assert (result "Fringe"))
)

(defrule let_down
   ?answer <- (answer "Hated it")
   ?question <- (question "Have you seen X-files?" "Nope" "Yep" "Hated it")
   =>
   (retract ?answer)
   (retract ?question)
   (assert (question "Are you OK with being let down?" "Yep" "Nope"))
)

(defrule lost
   ?answer <- (answer "Yep")
   ?question <-(question "Are you OK with being let down?" "Yep" "Nope")
   =>
   (retract ?question)
   (retract ?answer)
   (assert (result "Lost"))
)

(defrule scott_bakula
   ?answer <- (answer "Nope")
   ?question <- (question "Are you OK with being let down?" "Yep" "Nope")
   =>
   (retract ?answer)
   (retract ?question)
   (assert (question"How do you feel about Scott Bakula?" "Who?" "I'm a Fan"))
)

(defrule quantum_leap
   ?answer <- (answer "I'm a Fan")
   ?question <- (question"How do you feel about Scott Bakula?" "Who?" "I'm a Fan")
   =>
   (retract ?question)
   (retract ?answer)
   (assert (result "Quatnum Leap"))
)

(defrule warehouse_13
   ?answer <- (answer "Who?")
   ?question <- (question"How do you feel about Scott Bakula?" "Who?" "I'm a Fan")
   =>
   (retract ?question)
   (retract ?answer)
   (assert (result "Warehouse 13"))
)

(defrule biopunk_steampunk
   ?answer <- (answer "Action")
   ?question <- (question "Action or Drama?" "Drama" "Action")
   =>
   (retract ?answer)
   (retract ?question)
   (assert (question "Biopunk or Steampunk?" "Biopunk" "Steampunk"))
)

(defrule sanctuary
   ?answer <- (answer "Steampunk")
   ?question <- (question "Biopunk or Steampunk?" "Biopunk" "Steampunk")
   =>
   (retract ?question)
   (retract ?answer)
   (assert (result "Sanctuary"))
)

(defrule whedon_cameron
   ?answer <- (answer "Biopunk")
   ?question <- (question "Biopunk or Steampunk?" "Biopunk" "Steampunk")
   =>
   (retract ?answer)
   (retract ?question)
   (assert (question "Whedon or Cameron?" "Cameron" "Whedon"))
)

(defrule dark_angel
   ?answer <- (answer "Cameron")
   ?question <- (question "Whedon or Cameron?" "Cameron" "Whedon")
   =>
   (retract ?question)
   (retract ?answer)
   (assert (result "Dark Angel"))
)

(defrule dolhouse
   ?answer <- (answer "Whedon")
   ?question <- (question "Whedon or Cameron?" "Cameron" "Whedon")
   =>
   (retract ?question)
   (retract ?answer)
   (assert (result "Dolhouse"))
)