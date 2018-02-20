#!./lib/bats/bin/bats

PROJECT_DIR=$(dirname "$(dirname $BATS_TEST_DIRNAME)")

load "../lib/bats-support/load"
load "../lib/bats-assert/load"

source $PROJECT_DIR/src/index.sh

@test 'shells::has_cmd' {
    run shells::has_cmd bash
    assert_success
    run shells::has_cmd Im-not-exist
    assert_failure
}

@test 'shells::get_running_shell' {
    local shell=$(shells::get_running_shell)
    assert_equal $shell 'bash'
}

@test 'shells::get_os' {
    local OSTYPE='darwin'
    assert_equal "$(shells::get_os)" 'OSX'
    local OSTYPE='linux'
    assert_equal "$(shells::get_os)" 'LINUX'
    assert_equal "$(shells::get_os 'darwin')" 'OSX'
    assert_equal "$(shells::get_os 'linux')" 'LINUX'
}
