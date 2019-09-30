lana <- readr::read_csv("../data/lana.csv")

mode_tom <- lana %>% 
    dplyr::group_by(album_name, mode_name) %>% 
    dplyr::mutate(tom = n())

mode_tom_major <- lana %>% 
    dplyr::filter(mode_name == "major") %>% 
    dplyr::group_by(album_name, mode_name) %>% 
    dplyr::summarise(major = n())

mode <- dplyr::bind_rows(mode_tom_major, mode_tom_minor) %>% 
    dplyr::select(-mode_name)

group_tracks <- lana %>% 
    dplyr::group_by(track_name, album_name) %>% 
    dplyr::summarise(danceability_median = median(danceability),
                     energy_median = median(energy))

readr::write_csv(group_tracks, "../data/group_track_name.csv")
