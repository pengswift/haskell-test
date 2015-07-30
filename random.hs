import System.Random
import Control.Monad(when)

threeCoins :: StdGen -> (Bool, Bool, Bool) 
threeCoins gen = 
    let (firstCoin, newGen) = random gen
        (secondCoin, newGen') = random newGen
        (thirdCoin, newGen'') = random newGen'
    in (firstCoin, secondCoin, thirdCoin)

-- randomR 取范围随机
-- randomR (1, 6) (mkStdGen 359353)
-- randomR (1, 6) (mkStdGen 35935335)

-- 给定范围无限随机
-- take 10 $ randomRs ('a','z') (mkStdGen 3) :: [Char]

--main = do
--    gen <- getStdGen
--    putStrLn $ take 20 (randomRs ('a','z') gen)
--    gen2 <- getStdGen
--    putStr $ take 20 (randomRs ('a','z') gen)

-- 取前40个随机数
--main = do
--    gen <- getStdGen
--    let randomChars = randomRs ('a','z') gen
--        (first20, rest) = splitAt 20 randomChars
--        (second20, _) = splitAt 20 rest
--    putStrLn first20
--    putStr second20

--main = do
--    gen <- getStdGen
--    putStrLn $ take 20 (randomRs ('a','z') gen)
--    gen' <- newStdGen
--    putStr $ take 20 (randomRs ('a','z') gen')

--main = do
--    gen <- getStdGen
--    askForNumber gen
--
--askForNumber :: StdGen -> IO ()
--askForNumber gen = do
--    let (randNumber, newGen) = randomR (1,10) gen :: (Int, StdGen) 
--    putStr "Which number in the range from 1 to 10 am I thinking of? "
--    numberString <- getLine   
--    when (not $ null numberString) $ do
--        let number = read numberString
--        if randNumber == number 
--            then putStrLn "You are corrent!"
--            else putStrLn $ "Sorry, it was " ++ show randNumber
--        askForNumber newGen

--main = do
--    gen <- getStdGen   
--    let (randNumber, _) = randomR (1,10) gen :: (Int, StdGen)
--    putStr "Which number in the range from 1 to 10 am I thinking of? "
--    numberString <- getLine
--    when (not $ null numberString) $ do
--        let number = read numberString
--        if randNumber == number
--            then putStrLn "You are correct!"
--            else putStrLn $ "Sorry, it was " ++ show randNumber
--        newStdGen
--        main 
