module Actions exposing (..)

import Http
import Messages exposing (..)
import Decoder exposing (decodeResponse)


fetchAll : Cmd Msg
fetchAll =
    Http.get "http://localhost:8000/data.json" decodeResponse
        |> Http.send FetchAll
