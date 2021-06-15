(import :std/foreign)

(export #t)

(begin-ffi (kinc-init
            kinc-application-name
            kinc-set-application-name
            kinc-width
            kinc-height
            kinc-load-url
            kinc-system-id
            kinc-language
            kinc-vibrate
            kinc-safe-zone
            kinc-automatic-safe-zone
            kinc-set-safe-zone
            kinc-frequency
            kinc-timestamp
            kinc-time
            kinc-start
            kinc-stop
            kinc-login
            kinc-waiting-for-login
            kinc-unlock-achievement
            kinc-disallow-user-change
            kinc-allow-user-change
            kinc-set-keep-screen-on
            kinc-copy-to-clipboard
            kinc-set-update-callback
            kinc-set-foreground-callback
            kinc-set-resume-callback
            kinc-set-pause-callback
            kinc-set-background-callback
            kinc-set-shutdown-callback
            kinc-set-drop_files-callback
            kinc-set-cut-callback
            kinc-set-copy-callback
            kinc-set-paste-callback
            kinc-set-login-callback
            kinc-set-logout-callback)

  (c-declare "#include <kinc/system.h>")

  (c-define-type char* char-string)
  (c-define-type wchar_t* (pointer wchar_t))
  (c-define-type kinc_ticks_t unsigned-int64)
  (c-define-type kinc_framebuffer_options*
    (pointer (struct "kinc_framebuffer_options")))
  (c-define-type kinc_window_options*
    (pointer (struct "kinc_window_options")))
  (c-define-type void-void-callback (function () void)) ; void (*)(void)
  (c-define-type drop-files-callback (function (wchar_t*) void)) ; void (*)(wchar_t*)
  (c-define-type cut-copy-callback (function () char*)) ; char* (*)(void)
  (c-define-type paste-callback (function (char*) void)) ; void (*)(char*)

  (define-c-lambda kinc-init (char* int int kinc_window_options* kinc_framebuffer_options*) int "kinc_init")
  (define-c-lambda kinc-application-name () char* "kinc_application_name") ;TODO: kinc_application_name - fix discarded const warning
  (define-c-lambda kinc-set-application-name (char*) void "kinc_set_application_name")
  (define-c-lambda kinc-width () int "kinc_width")
  (define-c-lambda kinc-height () int "kinc_height")
  (define-c-lambda kinc-load-url (char*) void "kinc_load_url")
  (define-c-lambda kinc-system-id () char* "kinc_system_id") ;TODO: kinc_system_id - fix discarded const warning
  (define-c-lambda kinc-language () char* "kinc_language") ;TODO: kinc_language - fix discarded const warning
  (define-c-lambda kinc-vibrate (int) void "kinc_vibrate")
  (define-c-lambda kinc-safe-zone () float "kinc_safe_zone")
  (define-c-lambda kinc-automatic-safe-zone () bool "kinc_automatic_safe_zone")
  (define-c-lambda kinc-set-safe-zone (float) void "kinc_set_safe_zone")
  (define-c-lambda kinc-frequency () double "kinc_frequency")
  (define-c-lambda kinc-timestamp () kinc_ticks_t "kinc_timestamp")
  (define-c-lambda kinc-time () double "kinc_time")
  (define-c-lambda kinc-start () void "kinc_start")
  (define-c-lambda kinc-stop () void "kinc_stop")
  (define-c-lambda kinc-login () void "kinc_login")
  (define-c-lambda kinc-waiting-for-login () bool "kinc_waiting_for_login")
  (define-c-lambda kinc-unlock-achievement (int) void "kinc_unlock_achievement")
  (define-c-lambda kinc-disallow-user-change () void "kinc_disallow_user_change")
  (define-c-lambda kinc-allow-user-change () void "kinc_allow_user_change")
  (define-c-lambda kinc-set-keep-screen-on (bool) void "kinc_set_keep_screen_on")
  (define-c-lambda kinc-copy-to-clipboard (char*) void "kinc_copy_to_clipboard")
  (define-c-lambda kinc-set-update-callback (void-void-callback) void "kinc_set_update_callback")
  (define-c-lambda kinc-set-foreground-callback (void-void-callback) void "kinc_set_foreground_callback")
  (define-c-lambda kinc-set-resume-callback (void-void-callback) void "kinc_set_resume_callback")
  (define-c-lambda kinc-set-pause-callback (void-void-callback) void "kinc_set_pause_callback")
  (define-c-lambda kinc-set-background-callback (void-void-callback) void "kinc_set_background_callback")
  (define-c-lambda kinc-set-shutdown-callback (void-void-callback) void "kinc_set_shutdown_callback")
  (define-c-lambda kinc-set-drop_files-callback (drop-files-callback) void "kinc_set_drop_files_callback")
  (define-c-lambda kinc-set-cut-callback (cut-copy-callback) void "kinc_set_cut_callback")
  (define-c-lambda kinc-set-copy-callback (cut-copy-callback) void "kinc_set_copy_callback")
  (define-c-lambda kinc-set-paste-callback (paste-callback) void "kinc_set_paste_callback")
  (define-c-lambda kinc-set-login-callback (void-void-callback) void "kinc_set_login_callback")
  (define-c-lambda kinc-set-logout-callback (void-void-callback) void "kinc_set_logout_callback"))
