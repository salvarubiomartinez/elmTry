import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)


main =
  Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }



-- MODEL

type alias Comment =
    { id : Int
    , content : String   
    }


type alias Model ={ comments : List Comment, newComment : String , updateComment : String, updateId: Int, counter : Int}


model : Model
model = { comments = [ { id  = 1, content =  "Mi primer comentario"} ],
        newComment = "",
        updateComment = "",
        updateId = 0,
        counter = 2
        }



-- UPDATE


type Msg
    = Add String
    | Update String Int
    | Delete Int
    | AddInput String
    | UpdateComment String
    | SelectUpdate Int String


update : Msg -> Model -> Model
update msg model =
  case msg of
    Add comment ->
        if not <| String.isEmpty comment then       
        { model | comments = model.comments ++ [{id = model.counter, content = comment} ], newComment = "", counter = model.counter + 1}
        else model
    Update comment id ->
        let
            updateComment comm= if comm.id == id then {comm | content = comment} else comm  
        in
            { model | comments = List.map updateComment model.comments, updateComment = ""}
    Delete id ->
        { model | comments = List.filter (\ item -> item.id /= id)  model.comments }
    AddInput value ->
        {model | newComment = value}
    UpdateComment value ->
        {model | updateComment = value}
    SelectUpdate id content ->
        {model | updateComment = content, updateId = id}



-- VIEW


view : Model -> Html Msg
view model =
  div []
    [
        input [type_ "text", placeholder "new Comment", onInput (\x -> AddInput x), value model.newComment ][],
        button [ onClick <| Add model.newComment][text "new"],
        ul [] 
        <| List.map (\ comment -> li [ ][ text comment.content, button [onClick <| SelectUpdate comment.id comment.content][text "edit"], button [onClick <| Delete comment.id][text "delete"]]) model.comments,
        input [type_ "text", placeholder "update Comment", onInput (\x -> UpdateComment x), value model.updateComment ][],
        button [ onClick <|Update model.updateComment model.updateId][text "update"]
    
    ]
 --   [ input [ type_ "text", placeholder "Name", onInput Name ] []
  --  , input [ type_ "password", placeholder "Password", onInput Password ] []
  --  , input [ type_ "password", placeholder "Re-enter Password", onInput PasswordAgain ] []
  --  , viewValidation model
  --  ]


