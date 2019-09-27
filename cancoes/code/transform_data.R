lana <- readr::read_csv("data/lana.csv")

mode_tom <- lana %>% 
    dplyr::group_by(album_name, mode_name) %>% 
    dplyr::mutate(tom = n())

mode_tom_major <- lana %>% 
    dplyr::filter(mode_name == "major") %>% 
    dplyr::group_by(album_name, mode_name) %>% 
    dplyr::summarise(major = n())

mode <- dplyr::bind_rows(mode_tom_major, mode_tom_minor) %>% 
    dplyr::select(-mode_name)

readr::write_csv(mode_tom, "data/tom.csv")
