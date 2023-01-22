## General Options ----

options(prompt    = "> ",
        continue  = "_ ", 
        width     = 80, 
        scipen    = 100, 
        warn      = 0,
        editor    = "codium", 
        tab.width = 2)


## Optimize packages installation ----

options(Ncpus = 4)


## Graphical Device Dimensions ----

grDevices::X11.options(width = 6, height = 6)


## CRAN Mirror ----

local({
  r         <- getOption("repos")
  r["CRAN"] <- "https://cloud.r-project.org/"
  options(repos = r)
})


## Quit R without Saving ----

.env   <- new.env()
.env$q <- function(save = "no", ...) quit(save = save, ...)
attach(.env, warn.conflicts = FALSE)


## Print Message on R Loading/Quitting ----

.First <- function() { }
.Last  <- function() { }


## RCompendium Credentials ----

options(given  = "Nicolas", 
        family = "Casajus", 
        orcid  = "0000-0002-5537-5294",
        email  = "nicolas.casajus@fondationbiodiversite.fr")


## Usethis Credentials ----

options(usethis.full_name   = "Nicolas Casajus",
        usethis.description = list(
          "Authors@R" = utils::person(
            given   = "Nicolas", 
            family  = "Casajus",
            email   = "nicolas.casajus@fondationbiodiversite.fr",
            role    = c("aut", "cre", "cph"),
            comment = c(ORCID = "0000-0002-5537-5294")),
          Version = "0.0.0.9000"),
        usethis.protocol    = "ssh",
        usethis.overwrite   = TRUE)
