module Messages exposing (..)

import Http
import Models exposing (Model)
import Poll.Messages


type Msg
    = NoOp
    | PollMsg Poll.Messages.Msg
    | FetchAll (Result Http.Error Model)
