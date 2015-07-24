-- Type 型别 首字母必须大写 Char String Int Integer Float Double Bool
--removeNonUppercase :: [Char] -> [Char]
removeNonUppercase :: String -> String
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]

addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

factorial :: Integer -> Integer
factorial n = product [1..n]

circumference :: Float -> Float
circumference r = 2 * pi * r

circumference' :: Double -> Double
circumference' r = 2 * pi * r


-- Type variables 型别变量 小写，单个字元，如a,b,c, 表示任意类型
-- 使用型别变量的函数称为多态函数
-- head :: [a] -> a
-- fst :: (a, b) -> a

-- Typeclasses 型别定义行为的介面 类似于java的interface, 如果一个型别属于某个Typeclass，则必须实现该Typeclass所描述的行为 
-- => 左侧叫型别约束， a 任意型别 属于 Eq Typeclass, 所以a 是可比较相等性的型别
-- (==) :: (Eq a) => a -> a -> Bool
{--
   //在检测值是否存于一个LIST时使用到了==的缘故
   elem :: (Eq a) => a -> [a] -> Bool  
--}
-- 结论: 如果一个函数中有Eq类的类型限制，则它必定在定义中用到了 == 和 /=
-- 除函数以外的所有型别都属于Eq，所以它们都可以判断相等性

-- Ord 包含可比较大小的型别 
-- <, >, <=, >= 回传结果是Bool型别
-- compare 回传结果是Ordering型别， Ordering 型别包含的值可能为GT, LT, EQ
-- 型别要成为Ord成员，则必须加入Eq家族 

-- Show 的成员为 可用字符串表示的型别
-- 除函数以外的所有型别都是Show的成员 
-- 其实现函数show, 可以取任意成员型别，并将其转换成字符串
{-- 
    show 3
    show 5.334
    show True
    show "33"
--}

-- Read 是与Show相反的Typeclass  read函数可以将一个字符串转为Read的某成员型别
-- read 函数 一定要跟后面的其它具体型别，它才能确定所读型别
{-- 
    read "True" || False
    read "8.2" + 3.8
    read "5" - 2
    read "[1,2,3,4]" ++ [3]
    read :: (Read a) => String -> a
--}
-- 或者在read后面指定要读取的型别
{-- 
    read "5" :: Int
    read "5" :: Float
    (read "5" :: Float) * 4
    read "[1,2,3,4]" :: [Int]
    read "(3,'a')" :: (Int, Char)
--}

-- Enum 的成员都是联系的型别,即可枚举的
-- 每个值都有后继子(successer) 和 前置子(predecesor)
-- 通过succ, pred 函数得到
-- 该Typeclass包含的型别有: (), Bool, Char, Ordering, Int, Integer, Float 和 Double
{--
    ['a'..'e']
    [LT .. GT]
    [3 .. 5]
    succ 'B'
--}

-- Bounded 成员都有一个上线和下线
-- 函数有 minBound maxBound
{--
    minBound :: Int
    maxBound :: Char

    maxBound :: Bool
    minBound :: Bool
--}

-- Num 是表示数字的Typeclass
{--
    //类型必须相同
    (*) :: (Num a) => a -> a -> a 

    (5 :: Int) * (6 :: Integer) 

--}

-- 加入Num成员 必须先加入 Show和Eq成员

-- Integral 表示数字的Typeclass
-- Num 包含所有的数字: 实数和整数
-- Integral 仅包含整数, 成员型别有Int 和 Integer
-- Floating 成员 仅包含浮点型别: Float 和 Double


-- fromIntegral :: (Num b, Integral a) => a -> b
-- 取一个整数作为参数，返回一个更为通用的Num
-- fromIntegral (length [1,2,3,4]) + 3.2


