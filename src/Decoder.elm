module Decoder exposing (..)

import Json.Decode as Decode
import Models exposing (Model)
import Poll.Decoder exposing (decodePollList)


decodeResponse : Decode.Decoder Model
decodeResponse =
    Decode.map Model
        (Decode.field "polls" decodePollList)
