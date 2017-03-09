import Html
import Http

a : Int
a = 2 + 2

b: Bool
b = List.isEmpty [] == True

name : String
name = "Alonzo Church"


multiply : number -> number -> number
multiply x y = x * y

max : comparable -> comparable -> comparable
max a b = if a > b then a else b



multiplyByFour : number -> number
multiplyByFour = multiply 4

result : number
result = multiplyByFour 2 -- ( = 8 )



main : Html.Html msg
main = Html.text <| toString <| 
    --List.filter (\a -> String.length a > 5) lista
    --List.map String.length lista
    --List.foldl (+) 0 <| List.map String.length lista
    --String.join " " ["Hello", "Hackathon"]
    --List.foldl (\a b -> if a > b then a else b) 0 [1,123,34,4,25,6]
    --max_ [-455,2344,23,65]
    --quicksort [3443,223,4,656]
    --map_ (\ x -> x * 10) [2,4,7,1]
    --f 't' << g 7
    getHtml


getHtml = Http.getString "www.google.es"

uno : Int -> Char -> String   
uno i c = toString i ++ " " ++ toString c

g: Char -> String
g = uno 34

f: String
f = g 'h'

lista: List String
lista  = ["Pere", "Joan", "Miguel"]

max_ list =
    case list of
        [] -> Debug.crash "maximum of empty list"
        [x] -> x
        (x::xs) ->
            let
              maxTail = max_ xs
            in
              if x > maxTail then x else maxTail 

x = List.head lista
xs = List.tail lista

max2 a b = if a > b then a else b


map1 : (a -> b) -> List a -> List b
map1 f list = 
    case list of
        [] -> []
        (x::xs) -> f x :: map3 f xs

map2 : (a -> b) -> List a -> List b
map2 f = List.foldr (\x xs -> f x :: xs) []

map3 : (a -> b) -> List a -> List b
map3 f = List.foldr ((::) << f) []




eee f = (::)<<f

maxList : List comparable -> comparable
maxList list =
    case list of
        [] -> Debug.crash "maximum of empty list"
        [x] -> x
        (x::xs) -> max x (maxList xs)


quicksort : List comparable -> List comparable
quicksort list = 
    case list of
        [] -> []
        (x::xs) ->
            let
                smallerSorted = quicksort (List.filter ((>) x) xs)
                biggerSorted = quicksort (List.filter ((<=) x) xs)
            in  
                smallerSorted ++ [x] ++ biggerSorted





type alias Person = { name : String, age : Int}

--bill : Person
bill = Person "Gates" 57
--steve: Person
steve =  { bill | name = "Jobs" }

getAge : Maybe Person -> Maybe Int
getAge person = case person of
    Nothing -> Nothing
    Just person -> Just person.age

billAge : Maybe Int
billAge = getAge <| List.head [bill, steve]
-- => Just 57

noOneAge : Maybe Int
noOneAge = getAge <| List.head []
-- => Nothing

isEven : Int -> Bool
isEven a = a % 2 == 0

--evenNumbers : List Int
--evenNumbers = List.filter isEven [1,2,3,4,5,6,7,8,9,10]
-- => [2,4,6,8,10]

square : Int -> Int
square x = x * x

--squareNumbers : List Int
--squareNumbers = List.map square [1,2,3,4,5,6,7,8,9,10]
-- => [1,4,9,16,25,36,49,64,81,100]

sumNumbers : Int
sumNumbers = List.foldr (+) 0 [1,2,3,4,5,6,7,8,9,10]
-- => 55




--lastUpper = Maybe.map String.toUpper <| 

lastUpper : List String -> Maybe String
lastUpper = Maybe.map String.toUpper << List.head << List.reverse 

--lastUpper ["jumpkick", "roundhouse", "uppercut"]
-- => "UPPERCUT"



evenNumbers : List Int
evenNumbers = List.filter (\ x -> x % 2 == 0) [1,2,3,4,5,6,7,8,9,10]
-- => [2,4,6,8,10]

squareNumbers : List Int
squareNumbers = List.map (\ x -> x * x) [1,2,3,4,5,6,7,8,9,10]
-- => [1,4,9,16,25,36,49,64,81,100]