# if no packages, shows nothing

    Code
      cat(econdataverse_attach_message(character()))

# message lists all core econdataverse packages

    Code
      cat(econdataverse_attach_message(core))
    Output
      -- Attaching core EconDataverse packages ---------------- econdataverse 1.0.0 --
      v econdatasets 1.0.0     v oecdoda      1.0.0
      v econid       1.0.0     v owidapi      1.0.0
      v econtools    1.0.0     v uisapi       1.0.0
      v imfapi       1.0.0     v wbids        1.0.0
      v imfweo       1.0.0     v wbwdi        1.0.0

# highlights dev versions in red

    Code
      highlight_version(c("1.0.0", "1.0.0.9000", "0.9000.0.9000", "1.0.0-rc"))
    Output
      [1] "1.0.0"                                        
      [2] "1.0.0.\033[31m9000\033[39m"                   
      [3] "0.\033[31m9000\033[39m.0.\033[31m9000\033[39m"
      [4] "1.0.0-rc"                                     

