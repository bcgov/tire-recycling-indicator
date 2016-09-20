# Copyright 2016 Province of British Columbia
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
# http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.

## Loading packages
require(reshape2) #reshape dataframe
require(dplyr) #data munging
require(ggplot2) #plotting
require(envreportutils) #plot theme

## Load CSV data files from BC Data Catalogue -- see README for links to metadata records and licensing details.
bc.data<- read.csv("https://catalogue.data.gov.bc.ca/dataset/a29ad492-29a2-44b9-8693-d27a8cc8e686/resource/ed24cca3-d8cb-4f5e-8f53-67d819640d71/download/EPRBCFIRSTTIRES1991-2006data.csv",
                   na.strings=c("", "NA"), stringsAsFactors = FALSE)
tsbc.data<- read.csv("https://catalogue.data.gov.bc.ca/dataset/f791329b-c2dc-4f82-9993-209780f2a1c6/resource/fc8d18ad-02c0-4dbb-8e6f-d87b7bd693ac/download/TSBCtirerecyclingdata.csv",
                     na.strings=c("", "NA"), stringsAsFactors = FALSE)

## Merge two dataframes
tire.data <- rbind(bc.data, tsbc.data)

## Drop Notes column
tire.data$Notes <- NULL

## Renaming column headers
colnames(tire.data)[colnames(tire.data) == 'SCRAP.TIRES.CAPTURED..Tonnes.'] <- 'SCRAP TIRES CAPTURED (Tonnes)'
colnames(tire.data)[colnames(tire.data) == 'SCRAP.TIRES.RECYCLED..Tonnes.'] <- 'SCRAP TIRES RECYCLED (Tonnes)'
colnames(tire.data)[colnames(tire.data) == 'SCRAP.TIRES.for.ENERGY.RECOVERY..Tonnes.'] <- 'SCRAP TIRES for ENERGY RECOVERY (Tonnes)'

## Change dataframe format to long (form wide)
tire.data.long <- melt(tire.data, id.vars = c("Year"))

## Creating 2 dataframes for plotting
captured.data <- tire.data.long %>% 
  filter(tire.data.long$variable == "SCRAP TIRES CAPTURED (Tonnes)")
captured.data$variable <- factor(captured.data$variable)

recycled.data <- tire.data.long %>% 
  filter(tire.data.long$variable != "SCRAP TIRES CAPTURED (Tonnes)")
recycled.data$variable <- factor(recycled.data$variable)
recycled.data <- order_df(recycled.data, target_col = "variable", value_col = "value", fun = mean)

##barchart colours
colr <- c("SCRAP TIRES RECYCLED (Tonnes)" = "#4daf4a", "SCRAP TIRES for ENERGY RECOVERY (Tonnes)" = "#377eb8")

## plotting chart
chart <- ggplot() +
  geom_bar(data=recycled.data, aes(x=Year, y=value, fill = variable), stat="identity", alpha = 0.8) +
  geom_line(data=captured.data, aes(x=Year, y=value, group = variable, colour = variable), size = 1) +
  geom_point(data=captured.data, aes(x=Year, y=value), size=2) +
  scale_colour_manual(values = "black", drop = FALSE, name = NULL, label = "SCRAP TIRES\nCAPTURED") +
  scale_fill_manual(values = colr, drop = FALSE, name = NULL, label = c("SCRAP TIRES for\nENERGY RECOVERY", "SCRAP TIRES\nRECYCLED")) +
  guides(colour = guide_legend(order = 1), 
         fill = guide_legend(order = 2, reverse=TRUE)) +
  ylab("Tonnes") + xlab("Year") +
  scale_x_discrete(expand = c(0, 0)) +
  scale_y_continuous(expand = c(0, 0), breaks = seq(0, 45000, 5000), limits = c(0, 45000)) +
  theme_soe() +
  theme(text = element_text(family = "Verdana", size = 18),
        panel.grid.major.x = element_blank(),
        axis.text.x = element_text(angle = 60, hjust = 1, size = 14),
        legend.key.height=unit(2.2,"line"))
plot(chart)

png(filename = "./out/tire_chart.png", width = 930, height = 550, units = "px", type = "cairo-png")
plot(chart)
dev.off()
