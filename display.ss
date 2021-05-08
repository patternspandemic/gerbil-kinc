; It sort of works
; TODO: Probably best is to add structure tags upstream and get rid of the struct redef.

(import :std/foreign)

(export #t)

(begin-ffi ((struct kinc_display_mode x y width height pixels_per_inch frequency bits_per_pixel)
            kinc-display-init
            kinc-primary-display
            kinc-count-displays
            kinc-display-available
            kinc-display-name
            kinc-display-current-mode
            kinc-display-count-available-modes
            kinc-display-available-mode)

  (c-declare "#include <kinc/pch.h>")
  (c-declare "#include <kinc/display.h>")
  ; Give the struct a tag
  (c-declare #<<c-declare-end
struct kinc_display_mode {
  int x;
  int y;
  int width;
  int height;
  int pixels_per_inch;
  int frequency;
  int bits_per_pixel;
};
c-declare-end
  )

  (c-define-type char* char-string)

  ; typedef struct <kinc_display_mode> kinc_display_mode_t - The struct given TAG above
  (c-define-type kinc-display-mode-t (type "kinc_display_mode_t"))
  (define-c-struct kinc_display_mode
    ((x . int)
     (y . int)
     (width . int)
     (height . int)
     (pixels_per_inch . int)
     (frequency . int)
     (bits_per_pixel . int)))

  (define-c-lambda kinc-display-init () void "kinc_display_init")
  (define-c-lambda kinc-primary-display () int "kinc_primary_display")
  (define-c-lambda kinc-count-displays () int "kinc_count_displays")
  (define-c-lambda kinc-display-available (int) bool "kinc_display_available")
  (define-c-lambda kinc-display-name (int) char* "___return((char*)kinc_display_name(___ARG1));")
  (define-c-lambda kinc-display-current-mode (int) kinc-display-mode-t "kinc_display_current_mode")
  (define-c-lambda kinc-display-count-available-modes (int) int "kinc_display_count_available_modes")
  (define-c-lambda kinc-display-available-mode (int int) kinc-display-mode-t "kinc_display_available_mode"))
