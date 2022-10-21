
# StudyCase 02 ------------------------------------------------------------

browseURL("https://github.com/Aleemc11/LPE22013334.git")

# Install and load libreries ----------------------------------------------

if (!require("pacman"))install.packages("pacman")
pacman::p_load(pacman, magrittr, productplots, psych, RColorBrewer, tidyverse)
library (pacman)

#library (magrittr)
#library (tidyverse)
#library (productplots)
#library (psych)
#library (RColorBrewer)
#pacman = load and unload
# magrittr = bidirecctional piping
#productplots = graphics and cat var.
#psych = statatistics.
#RColorBrewer = painting and colour palette.

# Loas and prepare data ---------------------------------------------------

browseURL("http://j.mp/37Wxvv7")
#?happy #ver documentacion       #que_tipo<-happy
df_happy <-happy %>% as.tibble()
levels(df_happy$happy) #te dice el orden de los niveles ([1] "not too happy" "pretty happy" [3] "very happy")

# Reverser levels (dar la vuelta a los miveles / ordenarlos)

df_happy %<>% mutate(happy=fct_rev(happy))
# df %>% mutate (marte_reverse = fct_rev(happy)) creando una nueva columna para poner los levels distintos - no usar 

df_happy %>% ggplot() + geom_bar(aes(happy, fill=happy))+
                                   theme(axis.title.x = element_blank(), legend.position = "none")
# Frecuency for happy
df %>% count (happy)
df %<>% select(happy:health) %>% view()
