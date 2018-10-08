-module(ethunit).

-export([convert/1]).
-export([convert/3]).
-export([units/0]).

-type unit() ::
    wei        |
    kwei       |
    ada        |
    femtoether |
    mwei       |
    babbage    |
    picoether  |
    gwei       |
    shannon    |
    nanoether  |
    nano       |
    szabo      |
    microether |
    micro      |
    finney     |
    milliether |
    milli      |
    ether      |
    kether     |
    grand      |
    einstein   |
    mether     |
    gether     |
    tether.

-export_type([unit/0]).

-spec convert(Value :: integer() | float()) -> float().
convert(Value) ->
    convert(wei, ether, Value).

-spec convert(From :: unit(), To :: unit(), Value :: integer() | float()) -> float().
convert(From, To, Value) ->
    Units = units(),
    Value * maps:get(From, Units) / maps:get(To, Units).

-spec units() -> #{unit() => pos_integer()}.
units() ->
    #{
        wei        => 1,
        kwei       => 1000,
        ada        => 1000,
        femtoether => 1000,
        mwei       => 1000000,
        babbage    => 1000000,
        picoether  => 1000000,
        gwei       => 1000000000,
        shannon    => 1000000000,
        nanoether  => 1000000000,
        nano       => 1000000000,
        szabo      => 1000000000000,
        microether => 1000000000000,
        micro      => 1000000000000,
        finney     => 1000000000000000,
        milliether => 1000000000000000,
        milli      => 1000000000000000,
        ether      => 1000000000000000000,
        kether     => 1000000000000000000000,
        grand      => 1000000000000000000000,
        einstein   => 1000000000000000000000,
        mether     => 1000000000000000000000000,
        gether     => 1000000000000000000000000000,
        tether     => 1000000000000000000000000000000
    }.
