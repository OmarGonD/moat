

setwd("C:\\d\\MOAT")


library(readxl)
library(ggplot2)
library(dplyr)
library(tibble)


moat_feb <- as_tibble(read.csv("moat-feb17.csv", stringsAsFactors = F))

moat_feb$Date <- as.Date(moat_feb$Date, format = "%Y-%m-%d")


str(moat_feb)


colnames(moat_feb)


moat_day <- moat_feb %>%
            group_by(Date, Campaign.Label) %>%
            summarise(Impressions = sum(Impressions.Analyzed..unfiltered.))


length(unique(moat_day$Campaign.Label))

ggplot(data = moat_day,
       mapping = aes(x = Date, y = Impressions, color = Campaign.Label)) +
  geom_point() +
  geom_line(aes(group = Campaign.Label), size = 0.8) +
  theme(legend.position = "none")



### Totales ###

### Impresiones Analizadas Unfiltered ###

ggplot(moat_feb,
       mapping = aes(x = Campaign.Label, y = Impressions.Analyzed..unfiltered.)) +
  geom_col() +
  coord_flip()


### Impressions.Analyzed..filtered.for.GIVT. ###

ggplot(moat_feb,
       mapping = aes(x = Campaign.Label, y = Impressions.Analyzed..filtered.for.GIVT.)) +
  geom_col() +
  coord_flip()


### Impressions.Analyzed

ggplot(moat_feb,
       mapping = aes(x = Campaign.Label, y = Impressions.Analyzed)) +
  geom_col() +
  coord_flip()





