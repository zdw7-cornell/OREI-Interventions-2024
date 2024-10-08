#powder boxplot by test type with individual data points overlaid
ggplot(powder, aes(x = test, y = log_conc, fill = int_type)) +
  geom_boxplot(position = 'dodge') +
  scale_fill_discrete(labels = c("Pre-Intervention", "Post-Intervention"),
                      name = "") +
  geom_point(position = position_jitterdodge(jitter.width=0), size=1.5,) +
  labs(x = 'Test', y = 'Mean log CFU/mL')
