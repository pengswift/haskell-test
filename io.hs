--main = putStrLn "hello, world"


--main = do 
--    putStrLn "hello, what's your name?"
--    name <- getLine
--    putStrLn ("Hey " ++ name ++ ", you rock!")


--main = do 
--    foo <- putStrLn "hello, what's your name?"
--    name <- getLine
--    dd =  putStrLn ("Hey " ++ name ++ ", you rock!")

--import Data.Char    
--
--main  = do
--    putStrLn "What's your first name?"
--    firstName <- getLine
--    putStrLn "What's your last name?"
--    lastName <- getLine
--    let bigFirstName = map toUpper firstName
--        bigLastName = map toUpper lastName
--    putStrLn $ "hey " ++ bigFirstName ++ " " ++ bigLastName ++ ", how are you?"

--main = do 
--    line <- getLine
--    if null line
--        then return ()
--    else do 
--        putStrLn $ reverseWords line
--        main
--
--reverseWords :: String -> String
--reverseWords = unwords . map reverse .words

--main = do
--    return ()
--    return "HAHAHA"
--    line <- getLine
--    return "BLAH BLAH BLAH"
--    return 4
--    putStrLn line

--main = do
--    a <- return "hell"
--    b <- return "yeah!"
--    putStrLn $ a ++ " " ++ b

--main = do
--    let a = "hell"
--        b = "year"
--    putStrLn $ a ++ " " ++ b

--main = do putStr "Hey, "
--          putStr "I'm "
--          putStrLn "Andy!"

--main = do putChar 't'
--          putChar 'e'
--          putChar 'h'

--main = do print True
--          print 2
--          print "haha"
--          print 3.2
--          print [3,4,3]

--main = do
--    c <- getChar
--    if c /= ' '
--        then do
--            putChar c
--            main
--        else return ()

--import Control.Monad
--
--main = do
--    c <- getChar
--    when (c /= ' ') $ do
--        putChar c
--        main

--main = do
--    a <- getLine
--    b <- getLine
--    c <- getLine
--    print [a,b,c]

-- sequence 接收多个io action, 返回一个io action 
--main = do
--    rs <- sequence [getLine, getLine, getLine]
--    print rs
   
-- () 结果一般不会被打印，但 sequence 会打印（）结果
-- sequence (map print [1,2,3,4,5])

-- mapM_ 会丢掉回传结果
-- mapM print [1,2,3]
-- mapM_ print [1,2,3]


-- forever 接收一个io action 并回传永远做同一件事情的io action
--import Control.Monad
--import Data.Char
--
--main = forever $ do 
--    putStr "Give me some input: "
--    l <- getLine
--    putStrLn $ map toUpper l


