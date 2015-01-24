#----------------------------------------------------------------------------------------------------------------------
# Copyright (C) 2015, M. G. Tsai.
# ALL RIGHTS RESERVED.
#----------------------------------------------------------------------------------------------------------------------
# Asserts for checking whether two strings are equal (using STREQUAL).
function(assert_strequal
    actual      # (input)  The actual string
    expected    # (input)  The expected string
    msg         # (input)  The message for this assertion
)
    if (NOT (actual STREQUAL expected))
        message(FATAL_ERROR "${msg}: Expected \"${expected}\" but actually \"${actual}\"")
    endif()
endfunction()
#----------------------------------------------------------------------------------------------------------------------
