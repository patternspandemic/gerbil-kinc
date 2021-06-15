; TODO: window.ss - Most not implemented upstream.
(import :std/foreign)

(export #t)

(begin-ffi (KINC_WINDOW_MODE_WINDOW
            KINC_WINDOW_MODE_FULLSCREEN
            KINC_WINDOW_MODE_EXCLUSIVE_FULLSCREEN
            KINC_WINDOW_FEATURE_RESIZEABLE
            KINC_WINDOW_FEATURE_MINIMIZABLE
            KINC_WINDOW_FEATURE_MAXIMIZABLE
            KINC_WINDOW_FEATURE_BORDERLESS
            KINC_WINDOW_FEATURE_ON_TOP
            (struct kinc_framebuffer_options_t frequency vertical_sync color_bits depth_bits stencil_bits samples_per_pixel)
            (struct kinc_window_options_t title x y width height display_index visible window_features mode)
            kinc-window-create
            kinc-window-destroy
            kinc-count-windows
            kinc-window-resize
            kinc-window-move
            kinc-window-change-mode
            kinc-window-change-features
            kinc-window-change-framebuffer
            kinc-window-x
            kinc-window-y
            kinc-window-width
            kinc-window-height
            kinc-window-display
            kinc-window-get-mode
            kinc-window-show
            kinc-window-hide
            kinc-window-set-title
            kinc-window-set-resize-callback
            kinc-window-set-ppi-changed-callback
            kinc-window-vsynced
            )

  (c-declare "#include <kinc/window.h>")

  (c-define-type void* (pointer void))
  (c-define-type char* char-string)
  (c-define-type resize-callback (function (int int void*) void)) ; void(*)(int x, int y, void *data)  FIXME: this type?
  (c-define-type ppi-changed-callback (function (int void*) void)); void(*)(int ppi, void *data)  FIXME: this type?

  (c-define-type kinc_window_mode_t int)
  (define KINC_WINDOW_MODE_WINDOW 0)
  (define KINC_WINDOW_MODE_FULLSCREEN 1)
  (define KINC_WINDOW_MODE_EXCLUSIVE_FULLSCREEN 2)

  (define-const KINC_WINDOW_FEATURE_RESIZEABLE)
  (define-const KINC_WINDOW_FEATURE_MINIMIZABLE)
  (define-const KINC_WINDOW_FEATURE_MAXIMIZABLE)
  (define-const KINC_WINDOW_FEATURE_BORDERLESS)
  (define-const KINC_WINDOW_FEATURE_ON_TOP)

  (define-c-struct kinc_framebuffer_options_t
    ((frequency . int)
     (vertical_sync . bool)
     (color_bits . int)
     (depth_bits . int)
     (stencil_bits . int)
     (samples_per_pixel . int))
    #f #f 'as-typedef)

  (define-c-struct kinc_window_options_t
    ((title . char*) ; TODO: const char *title; - deal with const?
     (x . int)
     (y . int)
     (width . int)
     (height . int)
     (display_index . int)
     (visible . bool)
     (window_features . int)
     (mode . kinc_window_mode_t))
    #f #f 'as-typedef)

  (define-c-lambda kinc-window-create (kinc_window_options_t* kinc_framebuffer_options_t*) int "kinc_window_create")
  (define-c-lambda kinc-window-destroy (int) void "kinc_window_destroy")
  (define-c-lambda kinc-count-windows () int "kinc_count_windows")
  (define-c-lambda kinc-window-resize (int int int) void "kinc_window_resize")
  (define-c-lambda kinc-window-move (int int int) void "kinc_window_move")
  (define-c-lambda kinc-window-change-mode (int kinc_window_mode_t) void "kinc_window_change_mode")
  (define-c-lambda kinc-window-change-features (int int) void "kinc_window_change_features")
  (define-c-lambda kinc-window-change-framebuffer (int kinc_framebuffer_options_t*) void "kinc_window_change_framebuffer")
  (define-c-lambda kinc-window-x (int) int "kinc_window_x")
  (define-c-lambda kinc-window-y (int) int "kinc_window_y")
  (define-c-lambda kinc-window-width (int) int "kinc_window_width")
  (define-c-lambda kinc-window-height (int) int "kinc_window_height")
  (define-c-lambda kinc-window-display (int) int "kinc_window_display")
  (define-c-lambda kinc-window-get-mode (int) kinc_window_mode_t "kinc_window_get_mode")
  (define-c-lambda kinc-window-show (int) void "kinc_window_show")
  (define-c-lambda kinc-window-hide (int) void "kinc_window_hide")
  (define-c-lambda kinc-window-set-title (int char*) void "kinc_window_set_title")
  (define-c-lambda kinc-window-set-resize-callback (int resize-callback void*) void "kinc_window_set_resize_callback")
  (define-c-lambda kinc-window-set-ppi-changed-callback (int ppi-changed-callback void*) void "kinc_window_set_ppi_changed_callback")
  (define-c-lambda kinc-window-vsynced (int) bool "kinc_window_vsynced"))
