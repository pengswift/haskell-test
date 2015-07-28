-- 自定义 type 型别
-- 关键字data
-- =号左侧是型别名称， 右侧是值 构造子 (Value Constructor)
data Bool = False | True
data Bool' = String String | True' deriving (Show)

-- 值构造子 后跟几个型别表示它包含值的型别
-- 包含值也成项 或 参数
-- 构造子的本质是参数， 可以返回型别的值
-- 加入Show 型别类 type class,  可以使用show函数 得到Shape 型别的字符串表示形式
data Shape = Circle Float Float Float | Rectangle Float Float Float Float deriving (Show)

{--
    Circle :: Float -> Float -> Float -> Shape 
    Rectangle :: Float -> Float -> Float -> Float -> Shape
--}

surface :: Shape -> Float
surface (Circle _ _ r) = pi * r ^ 2
surface (Rectangle x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)

-- surface $ Circle 10 20 10
-- surface $ Rectangle 0 0 100 100
-- Circle 10 20 5
-- Rectangle 50 230 60 90

-- 由于值构造子是函数，可以做不全呼叫
-- map (Circle 10 20) [4,5,6,6]

-- 定义Point型别，当构造子数为1时，一般构造子名称与型别重名
data Point = Point Float Float deriving (Show)
data Shape' = Circle' Point Float | Rectangle' Point Point deriving (Show)

surface' :: Shape' -> Float
surface' (Circle' _ r) = pi * r ^ 2
surface' (Rectangle' (Point x1 y1) (Point x2 y2)) = (abs $ x2 - x1) * (abs $ y2 - y1)

-- surface (Rectangle' (Point 0 0) (Point 100 100))
-- surface (Circle' (Point 0 0) 24)

-- 移动图形
nudge :: Shape' -> Float -> Float -> Shape'
nudge (Circle' (Point x y) r) a b = Circle' (Point (x+a) (y+b)) r
nudge (Rectangle' (Point x1 y1) (Point x2 y2)) a b = Rectangle' (Point (x1+a) (y1+b)) (Point (x2+a) (y2+b))

--  nudge (Circle' (Point 34 34) 10) 5 10

baseCircle :: Float -> Shape'
baseCircle r = Circle' (Point 0 0) r

baseRect :: Float -> Float -> Shape'
baseRect width height = Rectangle' (Point 0 0) (Point width height)

-- nudge (baseRect 40 100) 60 23

-- 数据型别导出到模组
-- 用Shape(..）可以导出型别 和 型别包含的所有构造子
-- Shape(Rectangle,Circle) 指定导出的构造子
{--
    module Shapes
    ( Point(..)
    , Shape(..)
    , Shape(Rectangle')
    , surface
    , nudge
    , baseCircle
    , baseRect
    ) where
--}

-- Record Syntax
-- 在描述构造子参数值 可以设置别名, 方便用函数直接按项取值
-- 会自动生成函数 firstName, lastName, age, height, phoneNumber, flavor
data Person = Person { firstName :: String 
                     , lastName :: String
                     , age :: Int
                     , height :: Float
                     , phoneNumber :: Float
                     , flavor :: String
                     } deriving (Show)


{-- 
    flavor:: Person -> String

    firstName :: Person -> String
--}

-- Record Syntax 会影响show 函数的显示
data Car = Car String String Int deriving (Show)
data Car' = Car' {company :: String, model :: String, year :: Int} deriving (Show)

-- type parameters 型别构造子
-- data 定义型别时 ＝号左边是型别构造子(带参数的), 右边是值构造子
-- a 是型别参数, Maybe 是型别构造子 
data Maybe' a = Nothing' | Just' a deriving (Show) 

{--
    Just' "Haha" 
    Just' 84    
    :t Just' "Haha"
    :t Just' 84
    :t Nothing'
    Just' 10 :: Maybe' Double
--}

data Car1 a b c = Car1 { company1 :: a
                        , model1 :: b
                        , year1 :: c
                        } deriving (Show)

--tellCar :: Car1 -> String
--tellCar (Car1 {company1 = c, model1 = m, year1 = y}) = "This " ++ c ++ " " ++ m ++ " was made in " ++ show y

tellCar :: (Show a) => Car1 String String a -> String
tellCar (Car1 {company1 = c, model1 = m, year1 = y}) = "This " ++ c ++ " " ++ m ++ " was made in " ++ show y


