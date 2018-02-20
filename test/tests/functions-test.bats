#!./lib/bats/bin/bats


PROJECT_DIR=$(dirname "$(dirname $BATS_TEST_DIRNAME)")

load "../lib/bats-support/load"
load "../lib/bats-assert/load"

source $PROJECT_DIR/src/index.sh

@test 'shells::join_by' {
    arr=('a' 'b' 'c')
    assert_equal $(shells::join_by , a b c) 'a,b,c'
    assert_equal $(shells::join_by , ${arr[@]}) 'a,b,c'
}
