(import :std/foreign)

(export #t)

(begin-ffi ((struct kinc_display_mode_t x y width height pixels_per_inch frequency bits_per_pixel)
            kinc-display-init
            kinc-primary-display
            kinc-count-displays
            kinc-display-available
            kinc-display-name
            kinc-display-current-mode
            kinc-display-count-available-modes
            kinc-display-available-mode)

  (c-declare "#include <kinc/display.h>")

  (c-define-type char* char-string)

  (define-c-struct kinc_display_mode_t
    ((x . int)
     (y . int)
     (width . int)
     (height . int)
     (pixels_per_inch . int)
     (frequency . int)
     (bits_per_pixel . int))
    #f #f 'as-typedef)

  (define-c-lambda kinc-display-init () void "kinc_display_init")
  (define-c-lambda kinc-primary-display () int "kinc_primary_display")
  (define-c-lambda kinc-count-displays () int "kinc_count_displays")
  (define-c-lambda kinc-display-available (int) bool "kinc_display_available")
  (define-c-lambda kinc-display-name (int) char* "___return((char*)kinc_display_name(___ARG1));")
  (define-c-lambda kinc-display-current-mode (int) kinc_display_mode_t "kinc_display_current_mode")
  (define-c-lambda kinc-display-count-available-modes (int) int "kinc_display_count_available_modes")
  (define-c-lambda kinc-display-available-mode (int int) kinc_display_mode_t "kinc_display_available_mode"))
