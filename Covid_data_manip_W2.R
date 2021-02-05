library(tidyverse)
load("covid_data_hub_oxford.RData")
##template with geoms
ggplot(data = covid) +
  geom_point(aes(x = date, y = tests)) +
  geom_line(mapping = aes(x = date, y = tests, color = state))
##multiple geoms
ggplot(covid) +
  geom_line(aes(x = date, y = tests, color = state)) +
  geom_smooth(aes(x = date, y = tests, color = state))
##Inherited aes
ggplot(covid, aes(x = date, y = tests)) +
  geom_point(aes(color = as.factor(workplace_closing)), size = .2) +
  geom_smooth(aes(color = state), size = 0.1)
##Grouping
ggplot(covid, aes(x = date, y = tests)) +
  geom_point(aes(color = state), size = 1) +
  stat_smooth(aes(group = state), color='black', alpha = 0.5, geom = "line")
##Faceting
ggplot(covid, aes(x = date, y = tests)) +
  geom_point(aes(color = state)) +
  facet_wrap(~ as.factor(workplace_closing))
##Facet Grid
ggplot(covid, aes(x = date, y = tests)) +
  geom_point(aes(color = state)) +
  facet_grid(as.factor(school_closing)~ as.factor(workplace_closing))
##Discrete Data in bar graph
ggplot(covid) + geom_bar(aes(x = school_closing))
##Statistical Transformations with after_stat
ggplot(covid) +
  geom_bar(aes(x = school_closing,
               y = after_stat(count/sum(count))))
##Stat trans other summaries
ggplot(covid) + stat_summary(
  aes(x = school_closing, y = confirmed),
  fun = mean, geom = "bar")
##boxplot with stat_summary
ggplot(covid, aes(x = school_closing, y = confirmed)) +
  stat_summary(fun = mean, fun.min = min, fun.max = max,
               geom = "pointrange")
##more aesthetics
ggplot(covid) +
  geom_bar(aes(x = school_closing, fill = state))
##Position adjustments
ggplot(covid) +
  geom_bar(aes(x = school_closing, fill = state),
           position = "dodge")
##position and proportions
ggplot(covid) + geom_bar(aes(x = school_closing, fill = state), position = "fill")
##coordinate systems boxplot
ggplot(covid, aes(factor(school_closing),
                  confirmed)) +
  geom_boxplot()
##coordinate systems boxplot flipped
ggplot(covid, aes(factor(school_closing),
                  confirmed)) +
  geom_boxplot() +
  coord_flip()
##cartesian coordinate system (default)
ggplot(covid, aes(x = factor(1),
                  fill = factor(school_closing))) +
  geom_bar(width = 1)  + facet_wrap(~state)
##coordinate system polar
ggplot(covid, aes(x = factor(1),
                  fill = factor(school_closing))) +
  geom_bar(width = 1)  + facet_wrap(~state) +
  coord_polar(theta = "y")
##scale functions 
ggplot(covid) +
  geom_point(aes(x = date, y = confirmed))
##log10
ggplot(covid) +
  geom_point(aes(x = date, y = confirmed)) +
  scale_y_log10("cumulative confirmed cases")
