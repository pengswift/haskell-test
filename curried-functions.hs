--  柯里化函数

-- haskell 所有函数都有一个参数
-- 拥有多个参数的的参数都是Curried functions， 柯里化函数
-- 函数的Curry化 是指把接受多个参数的函数变换成接受一个单一参数（最初的第一个参数）的函数，并返回接受余下的参数且返回结果的新函数

{--
    max 4 5 
    (max 4) 5

    max :: (Ord a) => a -> a -> a
    max :: (Ord a) => a -> (a -> a)
    //读作: max取一个参数a, 并回传一个函数， 这个函数取一个型别a的参数，回传一个a
--}

-- 如果我们以不全的参数来呼叫某函数， 就可以得到一个不全呼叫函数
multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z

{--
    multThree :: (Num a) => a -> (a -> (a -> a)) 

    (Num a) => a -> (a -> a)
    (Num a) => a -> a

    let multTwoWithNine = multThree 9
    multTwoWithNine 2 3

    let multWithEighteen = multTwoWithNine 2
    multWithEighteen 10
--}

{--
    compare 型别 (Ord a) => a -> (a -> Ording)
    使用100 呼叫后，回传函数的型别是 (Num a, Ord a) => a -> Ordering

    所以可以省略参数 x
--} 
compareWithHundred :: (Num a, Ord a) => a -> Ordering
--compareWithHundred x = compare 100 x
compareWithHundred = compare 100 


-- 中缀函数也可以不全呼叫
-- 用括号把它和一边的参数括在一起 如 （/10)
-- 回传函数是 取一个参数并将其补到缺少的那一端
divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

-- (/10) 200  与 200 / 10 等价

divideByTen' :: (Floating a) => a -> a
divideByTen' = (10/)

-- (10/) 200 与 10 / 100 等价

-- 唯一例外的的运算符是－， 负号，(-10) 2 不能理解为 2 - 10
-- (-10) 只表示负数
-- (subtract 4) 2  可以表示为 2 - 4

subtractByFour :: (Floating a) => a -> a
subtractByFour = (subtract 4)


-- 高级函数 函数作为参数和回传值
-- 函数可以看作传入2个参数，回传一个值， 其中第一个参数时函数
applyTwice :: (a -> a) -> a -> a
applyTwice f x  = f (f x)

{--
    applyTwice (+3) 10 
    applyTwice (++ " HAHA") "HEY"
    applyTwice ("HAHA " ++ ) "HEY"
    applyTwice (multThree 2 2) 9
    applyTwice (3:) [1]
--}

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys


-- 这里用f 表示第一个输入参数是的function , y x 表示function的参数 
-- 通过where 重新定义function, 交换其参数, 返回的是g函数
flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
    where g x y = f y x

-- 也可以直接将 函数名 和参数同时指定， 返回交换后的函数
flip'' :: (a -> b -> c) -> b -> a -> c
flip'' f y x = f x y

{--
    -- 根据柯里化性质推倒所得
    (a -> b -> c) -> (b -> a -> c) 
    (a -> b -> c) -> (b -> (a -> c))
    (a -> b -> c) -> b -> a -> c
--}

-- 第一参数是function, 传入一个字元，返回一个字元
-- 传入第二个参数list a， 回传的是 list b
-- 通过: 拆分list, 取出首个元素, 呼叫f函数, 并且连接 map' f xs
map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

{--
    map (+3) [1,5,3,1,6] 
    map (++ "!") ["BIFF", "BANG", "POW"]
    map (replicate 3) [3..6]
    map (map (^2)) [[1,2],[3,4,5,6],[7,8]]
    map fst [(1,2),(3,5),(6,3),(2,6),(2,5)]


    [x+3 | x <- [1,5,3,1,6]]
--}

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs)
    | p x = x : filter' p xs
    | otherwise = filter' p xs 

{--
    filter' (>3) [1,5,3,2,1,6,4,3,2,1]
    filter' (==3) [1,2,3,4,5]
    filter' even [1..10]
    let notNull x = not (null x) in filter notNull [[1,2,3],[],[3,4,5],[2,2],[],[],[]]
    filter' (`elem` ['a'..'z']) "u Laass wwee DDFa aaFF"
--}

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = 
    let smallerSorted = quicksort (filter (<=x) xs)
        biggerSorted = quicksort (filter (>x) xs)
    in smallerSorted ++ [x] ++ biggerSorted


largestDivisible :: (Integral a) => a
largestDivisible = head (filter p [100000,99999..])
    where p x = x `mod` 3829 == 0

{--
    sum (takeWhile (<10000) (filter odd (map (^2) [1..])))
    sum (takeWhile (<10000) [m | m <- [n^2 | n <- [1..]], odd m])
--}

chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n 
    | even n = n:chain (n `div` 2)
    | odd n = n:chain (n*3 + 1)

numLongChains :: Int
numLongChains = length (filter isLong (map chain [1..100]))
    where isLong xs = length xs > 15


-- map 单参数
-- map (*2) [0..]
-- 型别 (Num a) => [a]

-- map 2个参数
-- map (*) [0..]
-- *的型别(Num a) => a -> a -> a
-- 型别 (Num a) => [a->a] , 得到的是包含函数的list
-- 结果如 [(0*), (1*), (2*)..]

-- lambda 匿名函数
-- 斜线\开始, 空格分割参数，-> 接函数体
numLongChains' :: Int
numLongChains' = length (filter (\xs -> length xs > 15) (map chain [1..100]))


{--
    map (+3) [1,6,3,2] 
    map (\x -> x + 3) [1,6,3,2]
--}

-- lambda 也可取多个参数
{--
    zipWith (\a b -> (a * 30 + 3) /b) [5,4,3,2,1] [1,2,3,4,5] 
--}

-- lambda 支持模式匹配
{--
    map (\(a,b) -> a + b) [(1,2), (3,5), (6,3), (2,6), (2,5)] 
--}

addThree :: (Num a) => a -> a -> a -> a
addThree x y z = x + y + z

addThree' :: (Num a) => a -> a -> a -> a
addThree' = \x -> \y -> \z -> x + y + z

addThree'' :: (Num a) => a -> a -> a -> a
addThree'' = \x y z -> x + y + z

flip''' :: (a -> b -> c) -> b -> a -> c
flip''' f = \x y -> f y x
























