import qualified Data.Map as Map
-- type class (型别类)  derived instances  (派生)

data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
                     } deriving (Eq, Show, Read)

{--
    let mikeD = Person {firstName = "Michael", lastName = "Diamond", age = 43} 
    let adRock = Person {firstName = "Adam", lastName = "Horovitz", age = 41}
    let mca = Person {firstName = "Adam", lastName = "Yauch", age = 44}
    mca == adRock
    mikeD == adRock
    mikeD = Person {firstName = "Michael", lastName = "Diamond", age = 43}

    mikeD is: " ++ show mikeD
    read "Person {firstName =\"Michael\", lastName =\"Diamond\", age = 43}" :: Person
    
--}

data Day = Monday | Tuesday | Wednesday | Thursday | Firday | Saturday | Sunday deriving (Eq, Show, Read, Ord, Bounded, Enum)

{--
    Wednesday 
    show Wednesday
    read "Saturday" :: Day
    Saturday == Sunday
    Saturday > Friday
    Monday `compare` Wednesday
    minBound :: Day
    maxBound :: Day
    succ Monday
    pred Saturday
    [Thursday .. Sunday]
    [minBound .. maxBound] :: [Day]
--}

-- type synonyms 类型别名
-- 使函数定义更具通用性
--type String = [Char]

--type PhoneBook = [(String, String)]

type PhoneNumber = String
type Name = String
type PhoneBook = [(Name, PhoneNumber)]

inPhoneBook :: Name -> PhoneNumber -> PhoneBook -> Bool
inPhoneBook name pnumber pbook = (name, pnumber) `elem` pbook

-- 带参数的类型别名 
type AssocList k v = [(k,v)]



data Either' a b = Left' a | Right' b deriving (Eq, Ord, Read, Show)

data LockerState = Taken | Free deriving (Show, Eq)

type Code = String

type LockerMap = Map.Map Int (LockerState, Code)

lockerLookup :: Int -> LockerMap -> Either' String Code
lockerLookup lockerNumber map = 
    case Map.lookup lockerNumber map of
        Nothing -> Left' $ "Locker number " ++ show lockerNumber ++ " doesn't exist!"
        Just (state, code) -> if state /= Taken
                                then Right' code
                                else Left' $ "Locker " ++ show lockerNumber ++ " is already taken!"


lockers :: LockerMap
lockers = Map.fromList
    [(100,(Taken,"ZD39I"))
    ,(101,(Free,"JAH3I"))
    ,(103,(Free,"IQSA9"))
    ,(105,(Free,"QOTSA"))
    ,(109,(Taken,"893JJ"))
    ,(110,(Taken,"99292"))
    ]


{--
    lockerLookup 101 lockers
    lockerLookup 100 lockers
    lockerLookup 102 lockers
    lockerLookup 110 lockers
    lockerLookup 105 lockers
--}

--data List a = Empty | Cons a (List a) deriving (Show, Read, Eq, Ord)
{--
    Empty
    5 `Cons` Empty
    4 `Cons` (5 `Cons` Empty)
    4 (Cons 5 Empty)
    3 `Cons` (4 `Cons` (5 `Cons` Empty))
    3 (Cons 4 (Cons 5 Empty))
--}

-- fixity 将函数定义成operator   指定结合方向和优先级
-- infixl 左结合
-- infixr 右结合

infixr 5 :-:
data List a = Empty | a :-: (List a) deriving (Show, Read, Eq, Ord)
{--
    3 :-: 4 :-: 5 :-: Empty
    let a = 3 :-: 4 :-: 5 :-: Empty
    100 :-: a
--}

--infixr 5 .++
--(.++) :: [a] -> [a] -> [a]
--[] .++ ys = ys
--(x:xs) .++ ys = x : (xs .++ ys)

infixr 5 .++
(.++) :: List a -> List a -> List a
Empty .++ ys = ys
(x :-: xs) .++ ys = x :-: (xs .++ ys)
{--
    let a = 3 :-: 4 :-: 5 :-: Empty    
    let b = 6 :-: 7 :-: Empty
    a .++ b
--}















