module Poll.Models exposing (..)


type alias Choice =
    { id : String
    , text : String
    }


type alias Question =
    { id : String
    , text : String
    , choices : List Choice
    }


type alias Poll =
    { id : String
    , title : String
    , questions : List Question
    }
