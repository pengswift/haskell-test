lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
lucky x = "Sorry,you're out of luck,pal!"

sayMe :: (Integral a) => a -> String
sayMe 1 = "One!"
sayMe 2 = "Two!"
sayMe 3 = "Three!"
sayMe 4 = "Four!"
sayMe 5 = "Five!"
sayMe x = "Not between 1 and 5"

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors a b = (fst a + fst b, snd a + snd b)

addVectors' :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors' (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

first :: (a, b, c) -> a
first (x, _, _) = x

second :: (a, b, c) -> b
second (_, y, _) = y

third :: (a, b, c) -> c
third (_, _, z) = z

head' :: [a] -> a
head'[] = error "Can't call head on an empty list,dummy!"
head' (x:_) = x

tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
--tell (x:[]) = "The list has one element:" ++ show x
tell ([x]) = "The list has one element:" ++ show x
--tell (x:y:[]) = "The list has two elements:" ++ show x ++ " and " ++ show y
tell ([x,y]) = "The list has two elements:" ++ show x ++ " and " ++ show y
tell (x:y:_) = "The list is long. The first two elements are:" ++ show x ++ " and " ++ show y

length' :: (Num b) => [a] -> b
length' [] = 0
-- _:xs 一次取一个元素，长度自然为1, 在递归计算后面长度
length' (_:xs) = 1 + length' xs

sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs

-- as模式
-- 表示方式 @  符号前面名字是对其整体的引用，
capital :: String -> String
capital "" = "Empty string,whoops!"
capital all@(x:xs) = "The first letter of" ++ all ++ " is " ++ [x]

-- Guards模式
-- 该模式是检查一个值某项属性是否为真,如果为真，则使用其对应的函数体
bmiTell :: (RealFloat a) => a -> String
bmiTell bmi
    | bmi <= 18.5 = "You're underweight,you emo,you!"
    | bmi <= 25.0 = "You're supposedly normal. Pffft,I bet you're ugly!"
    | bmi <= 30.0 = "You're fat!Lost some weight, fatty!"
    | otherwise = "You're a whale, congratulations!"

bmiTell' :: (RealFloat a) => a -> a -> String
bmiTell' weight height 
    | weight / height ^ 2 <= 18.5 = "You're underweight,you emo,you!"
    | weight / height ^ 2 <= 25.0 = "You're supposedly normal. Pffft,I bet you're ugly!"
    | weight / height ^ 2 <= 30.0 = "You're fat!Lost some weight, fatty!"
    | otherwise = "You're a whale, congratulations!"


max' :: (Ord a) => a -> a -> a
max' a b
    | a > b = a
    | otherwise = b

myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
    | a > b  = GT
    | a == b = EQ
    | otherwise = LT

-- where 关键字, 用于定义多个名字和函数
-- 对每个guard可见, 只作用于本函数
bmiTell'' :: (RealFloat a) => a -> a -> String
bmiTell'' weight height 
    | bmi <= skinny = "You're underweight,you emo,you!"
    | bmi <= normal = "You're supposedly normal. Pffft,I bet you're ugly!"
    | bmi <= fat = "You're fat!Lost some weight, fatty!"
    | otherwise = "You're a whale, congratulations!"
    where bmi = weight / height ^ 2
          --skinny = 18.5
          --normal = 25.0
          --fat = 30.0
          -- where 支持模式匹配
          (skinny, normal, fat) = (18.5, 25.0, 30.0)

initials :: String -> String -> String
initials firstname lastname = [f] ++ "." ++ [l] ++ "."
    where (f:_) = firstname
          (l:_) = lastname

-- let 关键字, 同where关键字，不同之处在于let 绑定的表达式，只在in部分可见 , where绑定的是语法结构
cylinder :: (RealFloat a) => a -> a -> a
cylinder r h = 
    let sideArea = 2 * pi * r * h
        topArea = pi * r ^ 2
    in sideArea + 2 * topArea
{-- 
    4 * (let a = 9 in a + 1) + 2 
    -- 支持绑定函数
    [let square x = x * x in (square 5, square 3, square 2)]
    -- 支持绑定多个 分号分割
    (let a = 100; b = 200; c = 300 in 
    a*b*c, let foo = "Hey"; bar = "there!" in foo ++ bar)
--}

-- case 表达式  模式匹配
head'' :: [a] -> a
head'' [] = error "No head for empty lists!"
head'' (x:_) = x

head''' ::  [a] -> a
head''' xs = case xs of [] -> error "No head for empty lists!"
                        (x:_) -> x


{--
    case expression of pattern -> result 
                        pattern -> result
                        pattern -> result
                        ...
--}

-- 函数参数的模式匹配只能在定义函数时使用，而case表达式可以用在任何地方
describeList :: [a] -> String
describeList xs = "The list is " ++ case xs of [] -> "empty."
                                               [x] -> "a singleton list."
                                               xs -> "a longer list."

-- 模式匹配的本质 是 case 表达式的语法糖
describeList' :: [a] -> String
describeList' xs = "The list is " ++ what xs
    where what [] = "empty."
          what [x] = "a singleton list."
          what xs = "a longer list."

