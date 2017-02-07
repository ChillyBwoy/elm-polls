module Poll.Decoder exposing (..)

import Json.Decode as Decode
import Poll.Models exposing (..)


decodeChoice : Decode.Decoder Choice
decodeChoice =
    Decode.map2 Choice
        (Decode.field "id" Decode.string)
        (Decode.field "text" Decode.string)


decodeChoiceList : Decode.Decoder (List Choice)
decodeChoiceList =
    Decode.list decodeChoice


decodeQuesion : Decode.Decoder Question
decodeQuesion =
    Decode.map3 Question
        (Decode.field "id" Decode.string)
        (Decode.field "text" Decode.string)
        (Decode.field "choices" decodeChoiceList)


decodeQuesionList : Decode.Decoder (List Question)
decodeQuesionList =
    Decode.list decodeQuesion


decodePoll : Decode.Decoder Poll
decodePoll =
    Decode.map3 Poll
        (Decode.field "id" Decode.string)
        (Decode.field "title" Decode.string)
        (Decode.field "questions" decodeQuesionList)


decodePollList : Decode.Decoder (List Poll)
decodePollList =
    Decode.list decodePoll
