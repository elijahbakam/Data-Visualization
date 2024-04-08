#### Data Visualization Homework 1 ####
#### Elijah Bakam 10/12/2023 ####

# Load in productive pacificsts data 

ppdata <- load("/Users/elijahbakam/Library/CloudStorage/GoogleDrive-bakam@usc.edu/.shortcut-targets-by-id/19DfrFWKARGNjNlJ0nheNeauY-8DKul1a/412_413 shared AY23-24/Training Data Fall 23/ProductivePacifists_Data.RDATA")

# Exercise 1: Create a histogram of GDP Per Capita in the year 2000 (WorldBank_gdppc_2010_con_estimate) 
# a. Make this figure in color. Make it pretty. Give it an informative title.

plot1 <- ggplot(data = dat, aes(x= WorldBank_gdppc_2010_con_estimate)) +
  geom_histogram()

plot1

# Making it in color, for 2010, and with a descriptive title
dat %>%
  filter(year %in% c(2000)) %>%
  ggplot(aes(x = WorldBank_gdppc_2010_con_estimate)) +
  geom_histogram(bins = 15, color = "gray15", fill = "darkorchid2") + # the color is my borders of the bars and fill is the color of the bars
  labs(title = "Global GDP Per Capita in 2000",
       subtitle = "Distribution of WorldBank_gdppc_2010_con_estimate",
       x = "GDP per capita",
       y = "Count") +
  coord_cartesian(ylim = c(0, 20), xlim = c(4.75,10.75)) # I needed to icnrease the limits of the graph


# Optional Bonus Use facet wrapping to create a kernel density plot of the continuous measure 
# of land- orientation for the year 1900, 1950, and 2000 (land_oriented_medium_continuous). 
# a. Make this figure in color. Make it pretty. Give it an informative title.
  
dat %>%
  filter(year %in% c(1900,1950,2000)) %>%
  ggplot(aes(x = land_oriented_medium_continuous)) +
  geom_density(fill = "darkblue", color = "gray0", alpha = 0.5) +
  labs(title = "Continuous Land Orientation (1900, 1950, 200)",
       subtitle = "Using land_oriented_medium_continuous",
       x = "Land Oriented Medium Continuous",
       y = "Density") +
  coord_cartesian(ylim = c(0, 1), xlim = c(0,9.5)) +
  facet_wrap(~year)













































