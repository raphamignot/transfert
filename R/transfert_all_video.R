#' Tranfert une video
#'
#' @param une_video chemin vers une video
#' @param path_video chemin ou copier la video
#'
#' @export
#'
video_transfert <- function(une_video, path_video = "/home/cervan/video"){
  file.copy(from = une_video, to = path_video)
  file.remove(une_video)
}

#' Tranfert all video
#'
#' @param videos liste de chemin de video
#'
#' @export
#'
tranfert_all_video <- function(videos = list.files(path = "~", pattern = "(mp4|mkv)", full.names = TRUE)){
  ok <- lapply( videos , video_transfert)
  check <- all(unlist(ok))
  if(check){
    message("Ok, les videos ont ete deplace.")
  }else{
    message("Probleme !!! Certaines videos ne sont pas deplace.")
  }
}
