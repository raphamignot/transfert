#' Tranfert une video
#'
#' @param une_video chemin vers une video
#' @param path_video chemin ou copier la video
#'
#' @export
#'
video_transfert <- function(une_video, path_video, delete_source = TRUE){
  resultat_copy <- file.copy(from = une_video, to = path_video,recursive = TRUE)
  if ( resultat_copy & delete_source){
    file.remove(une_video)
  }
  resultat_copy
}

#' Tranfert all video
#'
#' @param videos liste de chemin de video
#'
#' @export
#'
tranfert_all_video <- function(videos = list.files(path = "~", pattern = "(mp4|mkv)$", full.names = TRUE,recursive = TRUE),
                               path_video,
                               delete_source = TRUE){
  ok <-
    lapply(videos ,
           video_transfert,
           delete_source = delete_source,
           path_video = path_video)
  check <- all(unlist(ok))
  if (check) {
    message("Ok, les videos ont ete deplace.")
  } else{
    message("Probleme !!! Certaines videos ne sont pas deplace.")
  }
}
