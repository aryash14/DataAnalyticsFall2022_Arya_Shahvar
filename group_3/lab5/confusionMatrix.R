# install.packages("cvms")
library(cvms)
library(tibble)   # tibble()

set.seed(1)
d_binomial <- tibble("target" = rbinom(100, 1, 0.7),
                     "prediction" = rbinom(100, 1, 0.6))

d_binomial
# creating confusion matrix manually
basic_table <- table(d_binomial)
basic_table

cfm <- as_tibble(basic_table)
cfm
plot_confusion_matrix(cfm, 
                      target_col = "target", 
                      prediction_col = "prediction",
                      counts_col = "n")
# At the bottom, we have the column percentage. Of all the observations where Target is 1, 63.2% of them were predicted 
#to be 1 and 36.8% 0.
# At the right side of each tile, we have the row percentage. Of all the observations where Prediction is 1, 71.7% of 
#them were actually 1, while 28.3% were 0.

# Creating confusion matrix w/ evaluate()
eval <- evaluate(d_binomial,
                 target_col = "target",
                 prediction_cols = "prediction",
                 type = "binomial")

eval

conf_mat <- eval$`Confusion Matrix`[[1]]
conf_mat
plot_confusion_matrix(conf_mat)


d_multi <- tibble("target" = floor(runif(100) * 3),
                  "prediction" = floor(runif(100) * 3))

d_multi
conf_mat <- confusion_matrix(targets = d_multi$target,
                             predictions = d_multi$prediction)

conf_mat
plot_confusion_matrix(conf_mat$`Confusion Matrix`[[1]])

plot_confusion_matrix(conf_mat$`Confusion Matrix`[[1]],
                      add_sums = TRUE)

# having x-axis at the bottom
plot_confusion_matrix(conf_mat$`Confusion Matrix`[[1]], 
                      place_x_axis_above = FALSE)

# having only the count in the middle
plot_confusion_matrix(conf_mat$`Confusion Matrix`[[1]], 
                      add_normalized = FALSE)

# change the color
plot_confusion_matrix(conf_mat$`Confusion Matrix`[[1]],
                      palette = "Oranges")

plot_confusion_matrix(conf_mat$`Confusion Matrix`[[1]],
                      palette = "Greens")

plot_confusion_matrix(
  conf_mat$`Confusion Matrix`[[1]],
  add_sums = TRUE,
  sums_settings = sum_tile_settings(
    palette = "Oranges",
    label = "Total",
    tc_tile_border_color = "black"
  )
)


# changing the font
plot_confusion_matrix(
  conf_mat$`Confusion Matrix`[[1]],
  font_counts = font(
    size = 10,
    angle = 45,
    color = "red"
  ),
  add_normalized = FALSE,
  add_col_percentages = FALSE,
  add_row_percentages = FALSE
)
