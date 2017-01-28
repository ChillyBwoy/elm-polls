module Decoder exposing (..)

import Json.Decode as Decode
import Models exposing (..)


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
