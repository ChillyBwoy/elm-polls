module App exposing (..)

import Html exposing (..)
import Json.Decode as Decode
import Http


-- MODELS


type alias Id =
    String


type alias Choice =
    { id : Id
    , text : String
    }


type alias Question =
    { id : Id
    , text : String
    , choices : List Choice
    }


type alias Poll =
    { id : Id
    , title : String
    , questions : List Question
    }


type alias Model =
    { polls : List Poll
    }



-- MESSAGES


type Msg
    = NoOp
    | FetchAll (Result Http.Error Model)



-- UPDATE


decodeChoiceItem : Decode.Decoder Choice
decodeChoiceItem =
    Decode.map2 Choice
        (Decode.field "id" Decode.string)
        (Decode.field "text" Decode.string)


decodeChoiceList : Decode.Decoder (List Choice)
decodeChoiceList =
    Decode.list decodeChoiceItem


decodeQuesionItem : Decode.Decoder Question
decodeQuesionItem =
    Decode.map3 Question
        (Decode.field "id" Decode.string)
        (Decode.field "text" Decode.string)
        (Decode.field "choices" decodeChoiceList)


decodeQuesionList : Decode.Decoder (List Question)
decodeQuesionList =
    Decode.list decodeQuesionItem


decodePollItem : Decode.Decoder Poll
decodePollItem =
    Decode.map3 Poll
        (Decode.field "id" Decode.string)
        (Decode.field "title" Decode.string)
        (Decode.field "questions" decodeQuesionList)


decodePollList : Decode.Decoder (List Poll)
decodePollList =
    Decode.list decodePollItem


decodeResponse : Decode.Decoder Model
decodeResponse =
    Decode.map Model
        (Decode.field "polls" decodePollList)


fetchAll : Cmd Msg
fetchAll =
    Http.get "http://localhost:8000/data.json" decodeResponse
        |> Http.send FetchAll


init : ( Model, Cmd Msg )
init =
    ( { polls = [] }, fetchAll )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        NoOp ->
            ( model, Cmd.none )

        FetchAll (Ok data) ->
            ( data, Cmd.none )

        FetchAll (Err error) ->
            ( model, Cmd.none )



-- VIEWS


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



-- MAIN


main : Program Never Model Msg
main =
    program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
