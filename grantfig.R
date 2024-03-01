#load required libraries
library(tibble)
library(readr)
library(ggplot2)
library(ganttrify)
library(dplyr)

Gantt <- read_csv("/Users/tanishalohchab/Documents/project_gantt_data2.csv", show_col_types = FALSE)
print(Gantt)

#draw the chart 
gantt_chart <- ganttrify(
  project = Gantt,
  project_start_date = as.Date("2025-01-01"), 
  by_date = TRUE, 
  font_family = "sans", 
  size_text_relative = 1, 
  mark_quarters = TRUE, 
  mark_years = TRUE 
)
#adjust the axis 
gantt_chart <- gantt_chart + theme(
  axis.text.x.top = element_blank(),
  axis.ticks.x.top = element_blank(),
  axis.title.x.top = element_blank()
)

#save it!
ggsave(filename = "gantt_chart.png", plot = gantt_chart, width = 12, height = 8, bg = "white")

print(gantt_chart)