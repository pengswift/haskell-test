-- 类型类 type class  
{--
    -- 定义方式 
    class Eq a where
        (==) :: a -> a -> Bool
        (/=) :: a -> a -> Bool
        x == y = not (x /= y)
        x /= y = not (x == y)
--}

-- 手工派生 Eq
data TrafficLight = Red | Yellow | Green

instance Eq TrafficLight where 
    Red == Red = True
    Green == Green = True
    Yellow == Yellow = True
    _ == _ = False

instance Show TrafficLight where
    show Red = "Red light"
    show Yellow = "Yellow light"
    show Green = "Green light"



--yes-no typeclass
class YesNo a where
    yesno :: a -> Bool

instance YesNo Int where
    yesno 0 = False
    yesno _ = True

instance YesNo [a] where
    yesno [] = False
    yesno _ = True

instance YesNo Bool where
    yesno = id

instance YesNo (Maybe a) where
    yesno (Just _) = True
    yesno Nothing = False

instance YesNo TrafficLight where
    yesno Red = False
    yesno _= True

{--
    yesno $ length []    
    yesno "haha"
    yesno ""
    yesno $ Just 0
    yesno []
    yesno [0,0,0]
--}

yesnoIf :: (YesNo y) => y -> a -> a -> a
yesnoIf yesnoVal yesResult noResult = 
    if yesno yesnoVal then yesResult else noResult
{--
    yesnoIf [] "YEAH!" "NO!" 
    yesnoIf [2,3,4] "YEAH!" "NO!"
    yesnoIf True "YEAH!" "NO!"
    yesnoIf (Just 500) "YEAH!" "NO!"
    yesnoIf Nothing "YEAH!" "NO!" 
--}

-- functor typeclass
{--
    class Functor f where 
        fmap :: (a -> b) -> f a -> f b
--}
-- 意义 如果一个空值是Nothing，回传Nothing
{-- 
    fmap (++ " HEY GUYS IM INSIDE THE JUST") (Just "Something serious.") 
    fmap (++ " HEY GUYS IM INSIDE THE JUST") Nothing
    fmap (*2) (Just 200)
    fmap (*2) Nothing
--}
{--
    instance Functor Tree where 
        fmap f EmptyTree = EmptyTree
        fmap f (Node x leftsub rightsub) = 
            Node (f x) (fmap f leftsub) (fmap f rightsub)
    
    fmap (*2) EmptyTree
    fmap (*4) (foldr treeInsert Empty [5,7,3,2,,1,7])
--}

