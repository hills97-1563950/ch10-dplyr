# Exercise 6: dplyr join operations

# Install the `nycflights13` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library(nycflights13)
library(dplyr)

# Create a dataframe of the average arrival delays for each _destination_, then 
# use `left_join()` to join on the "airports" dataframe, which has the airport
# information
# Which airport had the largest average arrival delay?
largest_arrival_delay <- flights %>%
  group_by(desk) %>%
  summarize(avg_delay = mean(arr_delay, na.rm = TRUE)) %>%
  mutate(faa = desk)

joined <- full_join(largest_arrival_delay, airports, by = 'faa')

  filter(avg_delay == max(avg_delay, na.rm = TRUE))
largest_arrival_delay
# Create a dataframe of the average arrival delay for each _airline_, then use
# `left_join()` to join on the "airlines" dataframe
# Which airline had the smallest average arrival delay?
smallest_arrival_delay <- flights %>%
  group_by(desk) %>%
  summarize(avg_delay = mean(arr_delay, na.rm = TRUE)) %>%
  mutate(faa = desk)

joined <- full_join(largest_arrival_delay, airports, by = 'faa')

filter(avg_delay == min(avg_delay, na.rm = TRUE))
smallest_arrival_delay
