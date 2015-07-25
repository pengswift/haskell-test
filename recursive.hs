--  取list头部和尾部的最大值比较， 如果大于，则头部是最大值， 如果小于, (则返回尾部的最大值)
maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list"
maximum' [x] = x
maximum' (x:xs) 
    | x > maxTail = x
    | otherwise = maxTail
    where maxTail = maximum' xs

maximum'' :: (Ord a) => [a] -> a
maximum'' [] = error "maximum of empty list"
maximum'' [x] = x
maximum'' (x:xs) = max x (maximum' xs)

-- 重复一个元素多少次， 返回list
-- 当次数小于等于0时，返回空list
-- 取当前要重复的元素 和 后面的元素做连接操作: , 后面操作的元素等于当前次数－1 和需要重复的元素
-- Num, Ord 时独立的TypeClass, 需要单独列出来
replicate' :: (Num i, Ord i) => i -> a -> [a]
replicate' n x
    | n <= 0    = []
    | otherwise =  x:replicate' (n-1) x


-- 从list中取出指定个数的元素
-- 先判断若为0 或 负数， 则回传空
-- 若试图从空LIST取值，回传空
-- 将LIST分割成头位两部分
take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _ 
    | n <= 0    = []
take' _ [] = []
take' n (x:xs) = x : take' (n-1) xs


-- 反转list
-- 取出list头部让其和剩余的相加, 加置剩余的尾部
reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

-- 无限LIST
repeat' :: a -> [a]
repeat' x = x:repeat' x

-- 组合list，成为二元组 tuple
zip' :: [a] -> [b] -> [(a,b)]
zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = (x,y):zip' xs ys

-- 判断元素是否属于LIST
elem' :: (Eq a) => a -> [a] -> Bool
elem' a [] = False
elem' a (x:xs) 
    | a == x = True
    | otherwise = a `elem'` xs


-- 快速排序
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = 
    let smallerSorted = quicksort [a | a <- xs, a <= x]
        biggerSorted = quicksort [a | a <- xs, a > x]
    in smallerSorted ++ [x] ++ biggerSorted


