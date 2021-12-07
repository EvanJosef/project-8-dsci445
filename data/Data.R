df <- read.csv("OlympicsData/athlete_events.csv")

df <- df[df$Year == c(2002,2006,2010,2014),] %>%
  replace_na(list(Medal = "No Medal", 
                  Height = round(mean(na.omit(df$Height)), 0), 
                  Weight = round(mean(na.omit(df$Weight)), 0), 
                  Age = round(mean(na.omit(df$Age)), 0))) %>%
  mutate(ID = NULL, Games = NULL, 
         Weight = Weight * 2.2046226218, 
         Medal = factor(Medal))

twoandfour <- df[df$Event == "Bobsleigh Men's Two" | df$Event == "Bobsleigh Men's Four",]
write.csv(twoandfour, "tafmens.csv")

binary <- twoandfour %>%
  mutate(Medal = factor(ifelse(Medal == "No Medal" , 0, 1)))
write.csv(binary, "binary.csv")