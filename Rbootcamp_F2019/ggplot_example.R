source('styleguide.R')
house = read.csv("house_elections.csv")


party.temp = as.character(house$party)
party.temp[house$party != "democrat" & house$party != "republican"] = "other"
party.temp[house$writein] = "writein"
house$party = factor(party.temp, levels = c("democrat", 'republican', 'other', 'writein'))
table(house$party)

mi = house[house$electiondistrict == "MI3",] 

a <- ggplot(data=mi, aes(x=year, y=candidatevotes)) +
  geom_line(aes(colour = factor(party))) +
  geom_point(aes(colour = factor(party))) + 
  scale_color_manual(values = c("#78C4D4", "#EE3838","#4B5973", 'cornflowerblue'),name="Party") +
  labs(title="MI3 Elections") +
  xlab("Year") +
  ylab("Votes") +
  theme(legend.position="bottom") +
  theme_hodp()
a

ggplotly(a)
