--Prints out the prediction
main = do print $ countColor vis_line : hatColor (countColor vis_line) vis_line

--This just makes it wasy to find the line of site for the first guy
vis_line = tail line

--The order of the line
line = [White,Black,Black,White,White,White,White,Black,White,White]
--


--Decide if there is an even number of white hats. If even White return White else Black
countColor:: [Color] -> Color
countColor ahead
        |even $ length $ filter (== White) ahead = White
        |otherwise = Black

--Possible Colors
data Color = White | Black deriving (Show, Eq)

--Make a list of the line order
hatColor:: Color -> [Color] -> [Color]
hatColor _ [] =[]
hatColor even_or_odd ahead = newColor : (hatColor colorCount $ tail ahead)
        where
            whiteCount = length $ filter (== White) $ tail ahead  --the count of hat colors this person can see
            newColor = hat even_or_odd whiteCount --what color is my hat
            colorCount = flipColor even_or_odd newColor -- how is the hat count effected by my hat

--Logic for the even vs odd color choices
flipColor:: Color -> Color -> Color
flipColor x y 
        | x == y = Black
        | otherwise = White

hat::Color -> Int -> Color
hat Black whiteCount
        | odd whiteCount = Black
        | otherwise = White
hat White  whiteCount
        | odd whiteCount = White
        | otherwise = Black

        
