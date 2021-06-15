(import :std/foreign)

(export #t)

(begin-ffi (KINC_IMAGE_COMPRESSION_NONE
            KINC_IMAGE_COMPRESSION_DXT5
            KINC_IMAGE_COMPRESSION_ASTC
            KINC_IMAGE_COMPRESSION_PVRTC
            KINC_IMAGE_FORMAT_RGBA32
            KINC_IMAGE_FORMAT_GREY8
            KINC_IMAGE_FORMAT_RGB24
            KINC_IMAGE_FORMAT_RGBA128
            KINC_IMAGE_FORMAT_RGBA64
            KINC_IMAGE_FORMAT_A32
            KINC_IMAGE_FORMAT_BGRA32
            KINC_IMAGE_FORMAT_A16
            (struct kinc_image_t width height depth format internal_format compression data data_size)
            (struct kinc_image_read_callbacks_t read seek pos size)
            kinc-image-init
            kinc-image-init3d
            kinc-image-size-from-file
            kinc-image-size-from-callbacks
            kinc-image-size-from-encoded-bytes
            kinc-image-init-from-file
            kinc-image-init-from-callbacks
            kinc-image-init-from-encoded-bytes
            kinc-image-init-from-bytes
            kinc-image-init-from-bytes3d
            kinc-image-destroy
            kinc-image-at
            kinc-image-get-pixels
            kinc-image-format-sizeof)

    (c-declare "#include <kinc/image.h>")
  
    (c-define-type int* (pointer int))
    (c-define-type void* (pointer void))
    (c-define-type char* char-string)
    (c-define-type size-t unsigned-long)
    (c-define-type size-t* (pointer size-t))
    (c-define-type uint8-t unsigned-int8)
    (c-define-type uint8-t* (pointer uint8-t))

    (c-define-type kinc_image_compression_t int)
    (define KINC_IMAGE_COMPRESSION_NONE 0)
    (define KINC_IMAGE_COMPRESSION_DXT5 1)
    (define KINC_IMAGE_COMPRESSION_ASTC 2)
    (define KINC_IMAGE_COMPRESSION_PVRTC 3)

    (c-define-type kinc_image_format_t int)
    (define KINC_IMAGE_FORMAT_RGBA32 0)
    (define KINC_IMAGE_FORMAT_GREY8 1)
    (define KINC_IMAGE_FORMAT_RGB24 2)
    (define KINC_IMAGE_FORMAT_RGBA128 3)
    (define KINC_IMAGE_FORMAT_RGBA64 4)
    (define KINC_IMAGE_FORMAT_A32 5)
    (define KINC_IMAGE_FORMAT_BGRA32 6)
    (define KINC_IMAGE_FORMAT_A16 7)

    (define-c-struct kinc_image_t
      ((width . int)
       (height . int)
       (depth . int)
       (format . kinc_image_format_t)
       (internal_format . unsigned-int)
       (compression . kinc_image_compression_t)
       (data . void*)
       (data_size . int))
      #f #f 'as-typedef)

    (define-c-struct kinc_image_read_callbacks_t
      ((read . (function (void* void* size-t) int))
       (seek . (function (void* int) void))
       (pos . (function (void*) int))
       (size . (function (void*) size-t)))
      #f #f 'as-typedef)

    (define-c-lambda kinc-image-init (kinc_image_t* void* int int kinc_image_format_t) size-t "kinc_image_init")
    (define-c-lambda kinc-image-init3d (kinc_image_t* void* int int int kinc_image_format_t) size-t "kinc_image_init3d")
    (define-c-lambda kinc-image-size-from-file (char*) size-t "kinc_image_size_from_file")
    (define-c-lambda kinc-image-size-from-callbacks (kinc_image_read_callbacks_t void* char*) size-t "kinc_image_size_from_callbacks")
    (define-c-lambda kinc-image-size-from-encoded-bytes (void* size-t char*) size-t "kinc_image_size_from_encoded_bytes")
    (define-c-lambda kinc-image-init-from-file (kinc_image_t* void* char*) size-t "kinc_image_init_from_file")
    (define-c-lambda kinc-image-init-from-callbacks (kinc_image_t* void* kinc_image_read_callbacks_t void* char*) size-t "kinc_image_init_from_callbacks")
    (define-c-lambda kinc-image-init-from-encoded-bytes (kinc_image_t* void* void* size-t char*) size-t "kinc_image_init_from_encoded_bytes")
    (define-c-lambda kinc-image-init-from-bytes (kinc_image_t* void* int int kinc_image_format_t) void "kinc_image_init_from_bytes")
    (define-c-lambda kinc-image-init-from-bytes3d (kinc_image_t* void* int int int kinc_image_format_t) void "kinc_image_init_from_bytes3d")
    (define-c-lambda kinc-image-destroy (kinc_image_t*) void "kinc_image_destroy")
    (define-c-lambda kinc-image-at (kinc_image_t* int int) int "kinc_image_at")
    (define-c-lambda kinc-image-get-pixels (kinc_image_t*) uint8-t* "kinc_image_get_pixels")
    (define-c-lambda kinc-image-format-sizeof (kinc_image_format_t) int "kinc_image_format_sizeof"))

; TODO: kinc_image_read_callbacks_t - How to assign Scheme procs as callbacks?
; TODO: kinc-image-size-from-callbacks & kinc-image-init-from-callbacks - How to deal with kinc_image_read_callbacks_t by value?