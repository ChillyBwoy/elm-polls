module Models exposing (..)

import Poll.Models exposing (Poll)


type alias Id =
    String


type alias Model =
    { polls : List Poll
    }
