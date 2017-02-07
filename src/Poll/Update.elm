module Poll.Update exposing (..)

import Poll.Messages exposing (..)
import Poll.Models exposing (Poll)


update : Msg -> Poll -> ( Poll, Cmd Msg )
update message poll =
    case message of
        SelectPoll poll ->
            ( poll, Cmd.none )
