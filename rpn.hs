--solveRPN :: (Num a) => String -> a
-- 初始值是空list，用于保存最终的结果,  需要折叠的list 是 words expression 分割字符串
--solveRPN expression = head (foldl foldingFunction [] (words expression))
    -- stack 是累加值, item是单个项目
--    where foldingFunction stack item = ...

--import Data.List
--
--solveRPN :: (Num a, Read a) => String -> a
--solveRPN = head . foldl foldingFunction [] . words
--    where foldingFunction (x:y:ys) "*" = (x * y):ys 
--          foldingFunction (x:y:ys) "+" = (x + y):ys
--          foldingFunction (x:y:ys) "-" = (y - x):ys
--          foldingFunction xs numberString = read numberString:xs

{--
    solveRPN "10 4 3 + 2 * -"
    solveRPN "2 3 +"
    solveRPN "90 34 12 33 55 66 + * - +"
    solveRPN "90 34 12 33 55 66 + * - + -"
    solveRPN "90 3 -"
--}

import Data.List

solveRPN :: String -> Float
solveRPN = head . foldl foldingFunction [] . words
    where foldingFunction (x:y:ys) "*" = (x * y):ys
          foldingFunction (x:y:ys) "+" = (x + y):ys
          foldingFunction (x:y:ys) "-" = (x - y):ys
          foldingFunction (x:y:ys) "/" = (y / x):ys
          foldingFunction (x:y:ys) "^" = (y ** x):ys
          foldingFunction (x:xs) "ln" = log x:xs
          foldingFunction xs "sum" = [sum xs]
          foldingFunction xs numberString = read numberString:xs 
          
{--
    solveRPN "2.7 ln" 
    solveRPN "10 10 10 10 sum 4 /"
    solveRPN "10 10 10 10 10 sum 4 /"
    solveRPN "10 2 ^"
    solveRPN "43.2425 0.5 ^"
--}


          
        
    



