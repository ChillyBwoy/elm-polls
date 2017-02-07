module Update exposing (..)

import Messages exposing (..)
import Models exposing (Model)


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        NoOp ->
            ( model, Cmd.none )

        FetchAll (Ok data) ->
            ( data, Cmd.none )

        FetchAll (Err error) ->
            ( model, Cmd.none )

        PollMsg subMsg ->
            ( model, Cmd.none )
