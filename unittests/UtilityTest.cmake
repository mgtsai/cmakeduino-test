#----------------------------------------------------------------------------------------------------------------------
# Copyright (C) 2015, M. G. Tsai.
# ALL RIGHTS RESERVED.
#----------------------------------------------------------------------------------------------------------------------
include(${CMAKE_CURRENT_LIST_DIR}/Assert.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../cmakeduino/cmake/Utility.cmake)
#----------------------------------------------------------------------------------------------------------------------
set(test_list 123 456)
cmakeduino_util_list_append_uniquely(test_list abc 123 abc xyz 123)
assert_strequal("${test_list}" "123;456;abc;xyz" "")
#----------------------------------------------------------------------------------------------------------------------
cmakeduino_util_parse_arguments(test "AB;CD;EF" "GH;IJ;KL" "MN;OP;QR" GH 123 CD QR abcd 1234 MN xyz AB IJ 987)
assert_strequal("${test.AB}" "TRUE" "")
assert_strequal("${test.CD}" "TRUE" "")
assert_strequal("${test.EF}" "FALSE" "")
assert_strequal("${test.GH}" "123" "")
assert_strequal("${test.IJ}" "987" "")
assert_strequal("${test.KL}" "" "")
assert_strequal("${test.MN}" "xyz" "")
assert_strequal("${test.OP}" "" "")
assert_strequal("${test.QR}" "abcd;1234" "")
#----------------------------------------------------------------------------------------------------------------------
set(test_in.abc in-ab1)
set(test_in.def in-de2)
set(test_in.ghi in-gh3)
set(test_out.def out-de4)
set(test_out.xyz out-xy5)
cmakeduino_util_copy_subvariables_if_not_set(test_out test_in abc def tuv xyz)
assert_strequal("${test_out.abc}" "in-ab1" "")
assert_strequal("${test_out.def}" "out-de4" "")
assert_strequal("${test_out.ghi}" "" "")
assert_strequal("${test_out.tuv}" "" "")
assert_strequal("${test_out.xyz}" "out-xy5" "")
#----------------------------------------------------------------------------------------------------------------------
cmakeduino_util_read_includes(test_incs ${CMAKE_CURRENT_LIST_DIR}/testsrc/TestInclude.c)
assert_strequal("${test_incs}" "abc.h;def.h;ghi.h;xyz.h" "")
#----------------------------------------------------------------------------------------------------------------------
set(expected_test_files
    ${CMAKE_CURRENT_LIST_DIR}/testsrc/SearchInRootDir.c
    ${CMAKE_CURRENT_LIST_DIR}/testsrc/SearchInRootDir.cc
    ${CMAKE_CURRENT_LIST_DIR}/testsrc/SearchInRootDir.hpp
    ${CMAKE_CURRENT_LIST_DIR}/testsrc/TestInclude.c
)

cmakeduino_util_find_files_by_exts(test_files ${CMAKE_CURRENT_LIST_DIR}/testsrc FALSE c cc hpp)
list(SORT test_files)
assert_strequal("${test_files}" "${expected_test_files}" "")
#----------------------------------------------------------------------------------------------------------------------
set(expected_test_files
    ${CMAKE_CURRENT_LIST_DIR}/testsrc/SearchInRootDir.c
    ${CMAKE_CURRENT_LIST_DIR}/testsrc/SearchInRootDir.cc
    ${CMAKE_CURRENT_LIST_DIR}/testsrc/SearchInRootDir.hpp
    ${CMAKE_CURRENT_LIST_DIR}/testsrc/TestInclude.c
    ${CMAKE_CURRENT_LIST_DIR}/testsrc/subdir/SearchInSubdir.c
    ${CMAKE_CURRENT_LIST_DIR}/testsrc/subdir/SearchInSubdir.cc
    ${CMAKE_CURRENT_LIST_DIR}/testsrc/subdir/SearchInSubdir.hpp
)

cmakeduino_util_find_files_by_exts(test_files ${CMAKE_CURRENT_LIST_DIR}/testsrc TRUE c cc hpp)
list(SORT test_files)
assert_strequal("${test_files}" "${expected_test_files}" "")
#----------------------------------------------------------------------------------------------------------------------
