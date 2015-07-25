-- 函数组合  . 符号
{--
    (.) :: (b -> c) -> (a -> b) -> a -> c 
    f . g = \x -> f (g x)
--}
-- f的参数的型别必须与g的回传型别相同
-- 组合函数的参数型别与g相同  
-- 组合函数的回传型别与f相同

-- 函数组合是右结合
{-- 
    map (\x -> negate (abs x)) 

    map (negate . abs)


    map (\xs -> negate (sum (tail xs))) [[1..5],[3..6],[1..7]]

    map (negate . sum . tail) [[1..5],[3..6],[1..7]]

    sum (replicate 5 (max 6.7 8.9))

    (sum .replicate 5 . max 6.7) 8.9
    sum .replicate 5 . max 6.7 $ 8.9

    replicate 100 (product (map (*3) (zipWith max [1,2,3,4,5] [4,5,6,7,8])))

    replicate 100 . product . map (*3) .zipWith max [1,2,3,4,5] $ [4,5,6,7,8]
--}

-- point free style  根据柯里化特性，省掉等式两端相同的参数
{--
    sum' :: (Num a) => [a] -> a 
    sum' xs = foldl (+) 0 xs

    sum' = foldl (+) 0

    fn x = ceiling (negate (tan (cos (max 50 x))))

    fn = ceiling . negate . tan . cos. max 50
--}


