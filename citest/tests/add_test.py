import citest.hello as hello
import pytest


def test_add():
    assert hello.add(1, 2) == 3
    assert hello.add(1, 3) == 4
