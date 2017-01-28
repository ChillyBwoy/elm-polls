module Views exposing (..)

import Html exposing (..)
import Models exposing (..)
import Messages exposing (..)


view : Model -> Html Msg
view model =
    div []
        [ h2 [] [ text "Polls" ]
        , pollTableView model.polls
        ]


pollTableRowView : Poll -> Html Msg
pollTableRowView poll =
    tr []
        [ td [] [ text poll.id ]
        , td [] [ text poll.title ]
        , td [] [ text (toString (List.length poll.questions)) ]
        ]


pollTableView : List Poll -> Html Msg
pollTableView polls =
    table []
        [ thead []
            [ tr []
                [ td [] [ text "id" ]
                , td [] [ text "title" ]
                , td [] [ text "questions" ]
                ]
            ]
        , tbody [] (List.map pollTableRowView polls)
        ]
