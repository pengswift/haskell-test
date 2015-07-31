--main = do 
--        line <- getLine
--        let line' = reverse line
--        putStrLn $ "You said " ++ line' ++ " backwards!"
--        putStrLn $ "Yes, you really said " ++ line' ++ " backwords!"


--main = do
--        line <- fmap reverse getLine
--        putStrLn $ "You said " ++ line ++ " backwards!"
--        putStrLn $ "Yes, you really said " ++ line ++ " backwords!"

import Data.Char
import Data.List

main = do
    line <- fmap (intersperse '_' . reverse . map toUpper) getLine
    putStrLn line

-- (->) r
-- r -> a   (->) r a
-- 2 + 3    (+) 2 3


--instance Functor IO where
--    fmap f action = do 
--        result <- action
--        return (f result)

instance Functor ((->) r) where
    fmap f g = (\x -> f (g x))

--instance Functor (r ->) where
--    fmap f g = (\x -> f (g x))

-- function map over function -> function
{--
    fmap :: (a->b) -> f a -> f b
    fmap :: (a->b) -> ((->) r a) -> ((->) r b)

    fmap :: (a->b) -> (r -> a) -> ( r-> b)

    instance Functor ((->) r) where
        fmap = (.)
--}


