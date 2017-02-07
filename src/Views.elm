module Views exposing (..)

import Html exposing (..)
import Models exposing (..)
import Messages exposing (Msg(..))
import Poll.Views exposing (pollTableView)


view : Model -> Html Msg
view model =
    div []
        [ h2 [] [ text "Polls" ]
        , Html.map PollMsg (pollTableView model.polls)
        ]
