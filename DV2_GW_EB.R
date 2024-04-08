### Data Visualization 2 Groupwork ###
### 10/27/2023 Elijah Bakam
# First we'll clean up our environment
rm(list=ls())
# Nowe we're going to load in our dataset
data <- read.csv("wdi_development_data.csv")


# Exercise 1: For a country of your choosing, plot the infant mortality (given per 1000 life births) against time for the years 1960-2005 
# in a line graph. Briefly explain what trend you observe in the infant mortality over time.

ggplot(subset(data, country %in% c("Cameroon")), # Will only show rows with Cameroon
       aes(x = year, y = inf_mort_WDI)) +
  geom_line() + # this is just how to make a line plot
  labs(title = "Infant Mortality from 1960-2005 in Cameroon",
       subtitle = "World Bank WDI Data",
       x = "Year",
       y = "Infant Mortality (per 100 births)") +
  theme_minimal() # BW background

# Infant mortality has decreased over time in Cameroon, likely coinciding with modern medecien developments. But the decrease hasn't been as sharp lately

# Exercise 2 Plot infant mortality for 5 countries

library(directlabels)

ggplot(subset(data, country %in% c("Cameroon", "Nigeria", "Chad", "Gabon", "Morocco")),
       aes(x = year, y = inf_mort_WDI, group = country, label = country, color = factor(country))) + #factor color gives each country a unique color
  geom_line() + 
  labs(title = "Infant Mortality from 1960-2005 for Cameroon, Nigeria, Chad, Gabon, and Morocco",
       subtitle = "World Bank WDI Data",
       x = "Year",
       y = "Infant Mortality (per 1000 births)",
       color = "Country") + # for the legend
  theme_minimal()
 # Steep decrease for most of these African countries at the beginning of the data but it has levelled off a lot as we move closer to modern day
# The Sub-Saharan countries have higher inf. mortality than Morocco

# Exercise 3 Scatterplot
ggplot(data, aes(x = year, y = inf_mort_WDI)) +
  geom_point(alpha = 0.2, position = position_jitter(width = 0.2)) + # adjusts my jitter and alpha = opacity
   theme_minimal() +
  labs(title = "Global Infant Mortality from 1985-2000",
       subtitle = "World Bank WDI Data",
       x = "Year",
       y = "Infant Mortality (per 1000 births)") +
  theme(plot.subtitle = element_text(hjust = .5)) + 
  theme(plot.title = element_text(face = "bold"),
        axis.line = element_line(size = 1, color = "black")) + # i like bolded titles and this does that
  stat_smooth(method = "lm") + # including trend line 
  coord_cartesian(xlim = c(1985, 2000)) # adjusts my limits to be within my timeline
# Again, it seems like there is a steady decline in infant mortality. Playing with opacity gives us a better view 
# Of all the datapoints and we can see that while the bottom isn't as full as we'd like, fewer countries exist at the very top of the scale anymore

# Exercise 4 plot with a dummy variable called wealthy to classify certain countries as wealthy

data$wealthy <- ifelse(data$gdppc_WDI >= mean(data$gdppc_WDI, na.rm = T), 1, 0) # creates the dummy
table(data$wealthy) 
ggplot(subset(data, !is.na(wealthy)), # we only want non-NA values here
       aes(x = year, y = inf_mort_WDI,
       color = factor(wealthy))) +
  geom_point(alpha = 0.2, position = position_jitter(width = 0.2)) + theme_minimal() + # white background
  labs(title = "Global Infant Mortality from 1985-2000",
       subtitle = "World Bank WDI Data",
       x = "Year",
       y = "Infant Mortality (per 1000  births)",
       color = "Wealth") +
  theme(plot.title = element_text(face = "bold"),
        axis.line = element_line(size = 1, color = "black")) + # again, i Like bolded titles
  theme(plot.subtitle = element_text(hjust = .5)) +
  stat_smooth(method = "lm") +
  coord_cartesian(xlim = c(1985, 2000))
# Kind of like #3, global decline but now we can see that with the dummy variable, almost every welathy country exists at the bottom
# So we could reasonably say that wealth correaltes to lower infant mortality rates






















































