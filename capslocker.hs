--main = forever $ do 
--    putStr  "Give me some input: "
--    l <- getLine
--    putStrLn $ map toUpper l

--main = do 
--    contents <- getContents
--    putStr (map toUpper contents)

--main = do 
--    contents <- getContents
--    putStr (shortLinesOnly contents)
--
--shortLinesOnly :: String -> String
--shortLinesOnly input = 
--    let allLines = lines input
--        shortLines = filter (\line -> length line < 10) allLines
--        result = unlines shortLines
--    in result

--main = interact shortLinesOnly
--
--shortLinesOnly :: String -> String
--shortLinesOnly input =
--    let allLines = lines input
--        shortLines = filter (\line -> length line < 10) allLines
--        result = unlines shortLines
--    in result

--main = interact $ unlines . filter ((<10) . length) . lines

--import Control.Monad
--import Data.Char

-- 检查回文，顺序和倒序都一样的词语
--respondPalindromes contents = unlines (map (\xs ->
--    if isPalindrome xs then "palinerome" else "not a palindrome") (lines contents))
--        where isPalindrome xs = xs == reverse xs
--

-- point-free style

--main = interact respondPalindromes
--
--respondPalindromes = unlines . map (\xs ->
--    if isPalindrome xs then "palinerome" else "not a palindrome") . lines
--        where isPalindrome xs = xs == reverse xs

--import System.IO
--
--main = do
--    handle <- openFile "girlfriend.txt" ReadMode
--    contents <- hGetContents handle
--    putStr contents
--    hClose handle


-- 读文件 

--import System.IO
--
--main = do
--    withFile "girlfriend.txt" ReadMode (\handle -> do
--            contents <- hGetContents handle
--            putStr contents)
--
--withFile' :: FilePath -> IOMode -> (Handle -> IO a) -> IO a
--withFile' path mode f = do
--    handle <- openFile path mode
--    result <- f handle
--    hClose handle
--    return result

--import System.IO
--
--main = do
--    contents <- readFile "girlfriend.txt"
--    putStr contents
--

-- 写入文件
--import System.IO 
--import Data.Char
--
--main = do
--    contents <- readFile "girlfriend.txt"
--    writeFile "girlfriendcaps.txt" (map toUpper contents)

-- 追加文件
--import System.IO
--
--main = do 
--    todoItem <- getLine
--    appendFile "todo.txt" (todoItem ++ "\n")

-- read by buffer
--import System.IO 
--import Data.Char
--main = do
--    withFile "girlfriend.txt" ReadMode (\handle -> do
--        hSetBuffering handle $ BlockBuffering (Just 2048)
--        contents <- hGetContents handle
--        putStr contents)

import System.IO
import System.Directory
import Data.List

main = do
    handle <- openFile "todo.txt" ReadMode
    (tempName, tempHandle) <- openTempFile "." "temp"
    contents <- hGetContents handle
    let todoTasks = lines contents
        numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks
    putStrLn "These are your TO-DO items:"
    putStr $ unlines numberedTasks
    putStrLn "Which one do you want to delete?"
    numberString <- getLine
    let number = read numberString
        newTodoItems = delete (todoTasks !! number) todoTasks
    hPutStr tempHandle $ unlines newTodoItems
    hClose handle
    hClose tempHandle
    removeFile "todo.txt"
    renameFile tempName "todo.txt"

