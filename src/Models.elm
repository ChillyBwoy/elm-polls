module Models exposing (..)


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
