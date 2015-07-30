import System.Environment
import System.Directory
import System.IO
import Data.List

--  派发函数 返回二元数组  k: String, v: [String] -> IO () 
dispatch :: [(String, [String] -> IO ())]
dispatch = [ ("add", add)
           , ("view", view) 
           , ("remove", remove)
           ]

main = do
    -- 读取参数, 分割第一个参数和后面参数
    (command:args) <- getArgs
    -- lookup 从一个数组中 匹配 key,  取出v, v 是 function
    let (Just action) = lookup command dispatch
    -- function 执行剩余参数
    action args


add :: [String] -> IO ()
add [fileName, todoItem] = appendFile fileName (todoItem ++ "\n")

view :: [String] -> IO ()
view [fileName] = do
    contents <- readFile fileName
    let todoTasks = lines contents
        numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks
    putStr $ unlines numberedTasks

remove :: [String] -> IO ()
remove [fileName, numberString] = do
    handle <- openFile fileName ReadMode
    (tempName, tempHandle) <- openTempFile "." "temp"
    contents <- hGetContents handle
    let number = read numberString
        todoTasks = lines contents
        newTodoItems = delete (todoTasks !! number) todoTasks
    hPutStr tempHandle $ unlines newTodoItems
    hClose handle
    hClose tempHandle
    removeFile fileName
    renameFile tempName fileName

