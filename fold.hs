-- fold  传入一个二元函数， 一个初始值（累加值), 一个需要折叠的LIST
-- 回传是单个值
-- 回传值是新的累加值

-- foldl 左折叠
sum' :: (Num a) => [a] -> a
sum' xs = foldl (\acc x -> acc + x) 0 xs

-- 函数的柯里化
sum'' :: (Num a) => [a] -> a
sum'' = foldl (+) 0

elem' :: (Eq a) => a -> [a] -> Bool
elem' y ys = foldl (\acc x -> if x == y then True else acc) False ys

-- 右折叠
map' :: (a->b) -> [a] -> [b]
map' f xs = foldr (\x acc -> f x : acc) [] xs

-- 左折叠
map'' f xs = foldl (\acc x -> acc ++ [f x]) [] xs

-- foldl1 foldr1 无需提供初始值，会取LIST首个元素作为起始值，从旁边开始折叠, 前提要保证LIST非空

maximum' :: (Ord a) => [a] -> a
maximum' = foldr1 (\x acc -> if x > acc then x else acc)

reverse' :: [a] -> [a]
reverse' = foldl (\acc x -> x : acc) []

product' :: (Num a) => [a] -> a
product' = foldr1 (*)

filter' :: (a -> Bool) -> [a] -> [a]
filter' p = foldr (\x acc -> if p x then x : acc else acc) []

head' :: [a] -> a
head' = foldr1 (\x _ -> x)

last' :: [a] -> a
last' = foldl1 (\_ x -> x)


-- scanl , scanr 记录下累积值所有状态到一个LIST
{--
    scanl (+) 0 [3,5,2,1] 
    scanr (+) 0 [3,5,2,1]
    
    scanl1 (\acc x -> if x > acc then x else acc) [3,4,5,3,7,9,2,1]
    scanl (flip (:)) [] [3,2,1]
--}

-- 取所有自然数的平方和
sqrtSums :: Int
sqrtSums = length (takeWhile (<1000) (scanl1 (+) (map sqrt [1..]))) + 1

-- $ 函数  函数呼叫符, 优先级最低， 但却是右结合, 用于减少括号的数目
{--
    ($) :: (a -> b) -> a -> b
    f $ x = f x
    sum(map sqrt [1..130])
    sum $ map sqrt [1..130]

    sum (filter (> 10) (map (*2) [2..10]))
    sum $ filter (> 10) $ map (*2) [2..10]
--}

-- $还可以将数据作为函数使用
-- map ($ 3) [(4+),(10*),(^2),sqrt]







