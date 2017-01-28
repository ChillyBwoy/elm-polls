module App exposing (..)

import Html exposing (..)
import Models exposing (Model, Poll)
import Messages exposing (..)
import Actions exposing (fetchAll)
import Update exposing (update)
import Views exposing (view)


-- UPDATE


init : ( Model, Cmd Msg )
init =
    ( { polls = [] }, fetchAll )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Never Model Msg
main =
    program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
