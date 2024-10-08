library(dplyr)
raw_milk <- read.csv("rawmilk.txt")
powder <- read.csv("powder.txt")

#reorder factor levels
raw_milk$int_type <- factor(raw_milk$int_type, levels = c("pre", "post"))
powder$int_type <- factor(powder$int_type, levels = c("pre", "post"))

#tables for each raw_milk test type
apc <- raw_milk %>%
  filter(test == "APC") %>%
  group_by(farmID, int_type) %>%
  summarize(meanlog = mean(log_conc)) %>%
  pivot_wider(names_from = int_type, values_from = meanlog)
msc <- raw_milk %>%
  filter(test == "MSC") %>%
  group_by(farmID, int_type) %>%
  summarize(meanlog = mean(log_conc)) %>%
  pivot_wider(names_from = int_type, values_from = meanlog)
tsc <- raw_milk %>%
  filter(test == "TSC") %>%
  group_by(farmID, int_type) %>%
  summarize(meanlog = mean(log_conc)) %>%
  pivot_wider(names_from = int_type, values_from = meanlog)
bab <- raw_milk %>%
  filter(test == "BAB_MPN") %>%
  group_by(farmID, int_type) %>%
  summarize(meanlog = mean(log_conc)) %>%
  pivot_wider(names_from = int_type, values_from = meanlog)
psc <- raw_milk %>%
  filter(test == "PSC_MPN") %>%
  group_by(farmID, int_type) %>%
  summarize(meanlog = mean(log_conc)) %>%
  pivot_wider(names_from = int_type, values_from = meanlog)

#tables for each powder test type
p.msc <- powder %>%
  filter(test == "TSC") %>%
  group_by(sampleID, int_type) %>%
  summarize(meanlog = mean(log_conc)) %>%
  pivot_wider(names_from = int_type, values_from = meanlog)
p.tsc <- powder %>%
  filter(test == "TSC") %>%
  group_by(sampleID, int_type) %>%
  summarize(meanlog = mean(log_conc)) %>%
  pivot_wider(names_from = int_type, values_from = meanlog)
