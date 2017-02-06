module Messages exposing (..)

import Http
import Models exposing (Model, Poll)


type Msg
    = NoOp
    | FetchAll (Result Http.Error Model)
    | SelectPoll Poll
