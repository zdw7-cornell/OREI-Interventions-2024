#APC Wilcoxon signed rank exact test and determining log changes for each farm (A-D)
wilcox.test(apc$post, apc$pre, paired = TRUE, alternative = "l")
apc$diff <- apc$pre - apc$post
apc

#MSC Wilcoxon signed rank exact test and determining log changes for each farm (A-D)
wilcox.test(msc$post, msc$pre, paired = TRUE, alternative = "l")
msc$diff <- msc$pre - msc$post
msc

#TSC Wilcoxon signed rank exact test and determining log changes for each farm (A-D)
wilcox.test(tsc$post, tsc$pre, paired = TRUE, alternative = "l")
tsc$diff <- tsc$pre - tsc$post
tsc

#BAB MPN Wilcoxon signed rank exact test and determining log changes for each farm (A-D)
wilcox.test(bab$post, bab$pre, paired = TRUE, alternative = "l")
bab$diff <- bab$pre - bab$post
bab

#PSC MPN Wilcoxon signed rank exact test and determining log changes for each farm (A-D)
wilcox.test(psc$post, psc$pre, paired = TRUE, alternative = "l")
psc$diff <- psc$pre - psc$post
psc


#powder data did not meet ANOVA assumptions
powderlm <- lm(log_conc ~ test + int_type, data = powder)
anova(powderlm)
hist(residuals(powderlm))
plot(predict(powderlm), residuals(powderlm)) #does not meet assumptions

#powder MSC Wilcoxon rank sum exact test
wilcox.test(p.msc$post, p.msc$pre, paired = FALSE, alternative = "l")

#powder TSC Wilcoxon rank sum exact test
wilcox.test(p.tsc$post, p.tsc$pre, paired = FALSE, alternative = "l")

#powder standard deviations
p.msc.pre <- subset(powder, int_type == "pre" | test == "MSC")
sd(p.msc.pre$log_conc)
p.msc.post <- subset(powder, int_type == "post" | test == "MSC")
sd(p.msc.post$log_conc)

p.tsc.pre <- subset(powder, int_type == "pre" | test == "TSC")
sd(p.tsc.pre$log_conc)
p.tsc.post <- subset(powder, int_type == "post" | test == "TSC")
sd(p.tsc.post$log_conc)
