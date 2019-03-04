### avl_tab ----
avl_tab <- tabItem(
  tabName = "avl_tab",
  h3("ANOVA vs LMER"),
  p("Set the parameters below for a face rating task where people (subjects) rate faces (stimuli) of each of two types (A and B). The dependent variable (DV) is rating (1-7)."),
  HTML("<p>The simulation defaults to an effect for stimulus type of 0.5 (a half-point difference between stimuli of type A and B) and random effects with the same SDs as the open data from the <a href='https://figshare.com/articles/Face_Research_Lab_London_Set/5047666'>Face Research London Set</a>. You can change these defaults under the Fixed Effects or Random Effects tab.</p>"),
  fluidRow(
    # sample size input ----
    box(
      title = "Sample Size",
      solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
      width = 4,
      sliderInput("sub_n", "Subjects:", 
                  min = 10, max = 500, value = 50, step = 10),
      sliderInput("stim_n", "Stimuli per Group:", 
                  min = 5, max = 50, value = 10, step = 5)
    ),
    # fixed effects input ----
    box(
      title = "Fixed Effects",
      solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
      width = 4,
      hidden(
        sliderInput("grand_i", "Overall Mean", min = 1, max = 7, value = 3, step = 0.1)
      ),
      sliderInput("stim_type_eff", "Main Effect of Stimulus Type in Raw Score: mean(B) - mean(A)", 
                  min = -2, max = 2, value = 0.5, step = 0.05)
      
    ),
    # random effects input ----
    box(
      title = "Random Effects",
      solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
      width = 4,
      sliderInput("sub_sd", "Subject intercept SD:", min = 0, max = 2, value = 0.85, step = 0.05),
      sliderInput("stim_sd", "Stimulus intercept SD:", min = 0, max = 2, value = 0.75, step = 0.05),
      sliderInput("error_sd", "Residual (error) SD:", min = 0, max = 2, value = 1.10, step = 0.05),
      sliderInput("stim_type_sd", "Subject slope (stim type):", 
                  min = 0, max = 2, value = 0.50, step = 0.05)
    )
  ),
  actionButton("resim", "Re-Simulate"),
  fluidRow(
    box(
      title = "Descriptives",
      width = 8,
      tableOutput("descr_table")
    ),
    box(
      title = "Plot Type",
      width = 4,
      checkboxGroupInput(
        "dat_plot_view", 
        "View:",
        c("violin" = "violin",
          "boxplot" = "boxplot"),
        selected = c("violin", "boxplot")
      )
    )
  ),
  fluidRow(
    column(
      width = 8,
      box(
        title = "By-Stimuli ANOVA",
        width = NULL,
        tableOutput("stim_coef")
      )
    ),
    column(
      width = 4,
      box(
        title = "Aggregated by Stimuli",
        width = NULL,
        plotOutput(outputId = "dat_stim_plot", height = "auto")
      )
    )
  ),
  fluidRow(
    column(
      width = 8,
      box(
        title = "By-Subjects ANOVA",
        width = NULL,
        tableOutput("sub_coef")
      )
    ),
    column(
      width = 4,
      box(
        title = "Aggregated by Subject",
        width = NULL,
        plotOutput(outputId = "dat_sub_plot", height = "auto")
      )
    )
  ),
  fluidRow(
    column(
      width = 8,
      box(
        title = "LMER",
        width = NULL,
        p("The p-value for the main effect in LMER will be identical to the by-stimuli ANOVA if the random slope for the main effect is set to zero (i.e., where between-subject variation in the effect of stimulus type is 0)."),
        tableOutput("lmer_coef")
      )
    ),
    column(
      width = 4,
      box(
        title = "Not Aggregated",
        width = NULL,
        plotOutput(outputId = "dat_plot", height = "auto")
      )
    )
  )
)
