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

@test 'shells::get_external_ip' {
    skip 'I have no idea how to mock input yet'
    run shells::get_external_ip
    assert_output -e '([0-9]{1,3}\.?){4}'
}

