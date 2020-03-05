library(readxl)
library(stringr)
library(jsonlite)

data <- read_excel("../data/obaly-recyklace.xlsx", col_names = F)

roky <- 2018:2003

# vzniklé odpadové obaly celkem
vznikle_obalove_odpady <- data$...3[c(6:14, 20:28, 34:42, 48:56, 62:70, 76:84, 90:98, 104:112, 118:126, 132:140, 146:154, 160:168, 174:182, 188:196, 202:210, 216:224)]
vznikle_obalove_odpady <- str_replace_all(vznikle_obalove_odpady, " ", "")
vznikle_obalove_odpady <- as.numeric(vznikle_obalove_odpady)

popisky <- c("sklo", "plasty", "papír a lepenka", "ocel", "hliník", "kovy celkem", "dřevo", "jiné", "celkem")

vznikle_obalove_odpady <- data.frame(rok=rep(roky, each=9), material=popisky, tun=vznikle_obalove_odpady)

as.list(vznikle_obalove_odpady)

toJSON(vznikle_obalove_odpady)

