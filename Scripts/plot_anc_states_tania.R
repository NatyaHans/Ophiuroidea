################################################################################
# Plot ancestral placental types inferred usingCTMC models of character evolution.
###############################################################################

# if you do not have RevGadgets installed, then follow these instructions
#install.packages("devtools")
#library(devtools)
#install_github("GuangchuangYu/ggtree")
#install_github("revbayes/RevGadgets")

library(RevGadgets)
library(ggplot2)

tree_file = "Downloads/tania/ase_mk.tree"
g <- plot_ancestral_states(tree_file, summary_statistic="MAP",
                      tip_label_size=2.5,
                      tip_label_offset=0.5,
                      xlim_visible=NULL,
                      #node_pp_label_size=2, # shows posterior prob
                      node_pp_label_nudge_x=0.1,
                      node_label_size=0,
                      show_state_legend=TRUE,
                      show_tree_scale=TRUE,
                      show_posterior_legend=TRUE,
                      pie_nudge_x=0.0,
                      pie_nudge_y=0.0,
                      node_size_range=c(1,7),
                      fig_height=3,
                      fig_width=15,
                      alpha=0.75)
g

ggsave("Downloads/tania/Ophio_ASE_MK.pdf", g, width = 42, height = 20)
