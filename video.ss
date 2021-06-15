; TODO: video.ss - Most not implemented upstream.
(import :std/foreign)

(export #t)

(begin-ffi ((struct kinc_video_impl_t nothing)
            (struct kinc_video_t impl)
            kinc-video-formats
            kinc-video-init
            kinc-video-destroy
            kinc-video-play
            kinc-video-pause
            kinc-video-stop
            kinc-video-width
            kinc-video-height
            kinc-video-current-image
            kinc-video-duration
            kinc-video-position
            kinc-video-finished
            kinc-video-paused
            kinc-video-update)

  (c-declare "#include <stdbool.h>")
  (c-declare "#include <kinc/backend/video.h>")
  (c-declare "#include <kinc/graphics4/texture.h>")
  (c-declare "#include <kinc/video.h>")

  (c-define-type char* char-string)
  (c-define-type char** (pointer char*))
  (c-define-type kinc_g4_texture_t "kinc_g4_texture_t")
  (c-define-type kinc_g4_texture_t* (pointer kinc_g4_texture_t))

  (define-c-struct kinc_video_impl_t
    ((nothing . int))
    #f #f 'as-typedef)

  (define-c-struct kinc_video_t
   ((impl . kinc_video_impl_t))
   #f #f 'as-typedef)

  (define-c-lambda kinc-video-formats () char** "kinc_video_formats")
  (define-c-lambda kinc-video-init (kinc_video_t* char*) void "kinc_video_init")
  (define-c-lambda kinc-video-destroy (kinc_video_t*) void "kinc_video_destroy")
  (define-c-lambda kinc-video-play (kinc_video_t*) void "kinc_video_play")
  (define-c-lambda kinc-video-pause (kinc_video_t*) void "kinc_video_pause")
  (define-c-lambda kinc-video-stop (kinc_video_t*) void "kinc_video_stop")
  (define-c-lambda kinc-video-width (kinc_video_t*) int "kinc_video_width")
  (define-c-lambda kinc-video-height (kinc_video_t*) int "kinc_video_height")
  (define-c-lambda kinc-video-current-image (kinc_video_t*) kinc_g4_texture_t* "kinc_video_current_image")
  (define-c-lambda kinc-video-duration (kinc_video_t*) double "kinc_video_duration")
  (define-c-lambda kinc-video-position (kinc_video_t*) double "kinc_video_position")
  (define-c-lambda kinc-video-finished (kinc_video_t*) bool "kinc_video_finished")
  (define-c-lambda kinc-video-paused (kinc_video_t*) bool "kinc_video_paused")
  (define-c-lambda kinc-video-update (kinc_video_t* double) void "kinc_video_update"))
