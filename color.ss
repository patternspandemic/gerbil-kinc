(import :std/foreign)

(export #t)

(begin-ffi (KINC_COLOR_BLACK
            KINC_COLOR_WHITE
            KINC_COLOR_RED
            KINC_COLOR_BLUE
            KINC_COLOR_GREEN
            KINC_COLOR_MAGENTA
            KINC_COLOR_YELLOW
            KINC_COLOR_CYAN
            kinc-color-components)

  (c-declare "#include <kinc/pch.h>")
  (c-declare "#include <kinc/color.h>")
  
  (c-define-type uint32-t unsigned-int32)
  (c-define-type float* (pointer float))

  (define KINC_COLOR_BLACK ((c-lambda () unsigned-long "___return(KINC_COLOR_BLACK);")))
  (define KINC_COLOR_WHITE ((c-lambda () unsigned-long "___return(KINC_COLOR_WHITE);")))
  (define KINC_COLOR_RED ((c-lambda () unsigned-long "___return(KINC_COLOR_RED);")))
  (define KINC_COLOR_BLUE ((c-lambda () unsigned-long "___return(KINC_COLOR_BLUE);")))
  (define KINC_COLOR_GREEN ((c-lambda () unsigned-long "___return(KINC_COLOR_GREEN);")))
  (define KINC_COLOR_MAGENTA ((c-lambda () unsigned-long "___return(KINC_COLOR_MAGENTA);")))
  (define KINC_COLOR_YELLOW ((c-lambda () unsigned-long "___return(KINC_COLOR_YELLOW);")))
  (define KINC_COLOR_CYAN ((c-lambda () unsigned-long "___return(KINC_COLOR_CYAN);")))

  (define-c-lambda kinc-color-components (uint32-t float* float* float* float*) void "kinc_color_components"))
