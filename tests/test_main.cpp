//
// Created by illidansr on 26.02.2021.
//
#define CATCH_CONFIG_MAIN
#include <catch2/catch.hpp>
#include <lib_a/lib_a.hpp>

SCENARIO("TEST 1") {
    REQUIRE_NOTHROW(RunServer());
}