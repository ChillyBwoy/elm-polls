module Poll.Views exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import Poll.Models exposing (..)
import Poll.Messages exposing (..)


pollTableRowView : Poll -> Html Msg
pollTableRowView poll =
    tr []
        [ td [ onClick (SelectPoll poll) ] [ text poll.title ]
        , td [ onClick (SelectPoll poll) ] [ text (toString (List.length poll.questions)) ]
        ]


pollTableView : List Poll -> Html Msg
pollTableView polls =
    table []
        [ thead []
            [ tr []
                [ td [] [ text "title" ]
                , td [] [ text "questions" ]
                ]
            ]
        , tbody [] (List.map pollTableRowView polls)
        ]
