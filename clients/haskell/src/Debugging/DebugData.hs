module Debugging.DebugData where

import Prelude hiding (id)
import qualified Trans
import Trans (Trans)
import Data.Int
import Debugging.Color (Color)
import Debugging.ColoredVertex (ColoredVertex)
import Model.Vec2 (Vec2)

-- | Text
data DebugDataPlacedText = DebugDataPlacedText {
    -- | Position
    position :: Vec2,
    -- | Text
    text :: String,
    -- | Alignment, separate for x and y. From 0 to 1. 0.5 - center alignment
    alignment :: Vec2,
    -- | Size
    size :: Double,
    -- | Color
    color :: Color }
    deriving Show

instance Trans DebugDataPlacedText where
    read = do
        position <- Trans.read
        text <- Trans.read
        alignment <- Trans.read
        size <- Trans.read
        color <- Trans.read
        return DebugDataPlacedText {
            position,
            text,
            alignment,
            size,
            color }
    
    write DebugDataPlacedText {
        position,
        text,
        alignment,
        size,
        color } = do
            Trans.write position
            Trans.write text
            Trans.write alignment
            Trans.write size
            Trans.write color

-- | Circle
data DebugDataCircle = DebugDataCircle {
    -- | Position of the center
    position :: Vec2,
    -- | Radius
    radius :: Double,
    -- | Color
    color :: Color }
    deriving Show

instance Trans DebugDataCircle where
    read = do
        position <- Trans.read
        radius <- Trans.read
        color <- Trans.read
        return DebugDataCircle {
            position,
            radius,
            color }
    
    write DebugDataCircle {
        position,
        radius,
        color } = do
            Trans.write position
            Trans.write radius
            Trans.write color

-- | Circle with gradient fill
data DebugDataGradientCircle = DebugDataGradientCircle {
    -- | Position of the center
    position :: Vec2,
    -- | Radius
    radius :: Double,
    -- | Color of the center
    innerColor :: Color,
    -- | Color of the edge
    outerColor :: Color }
    deriving Show

instance Trans DebugDataGradientCircle where
    read = do
        position <- Trans.read
        radius <- Trans.read
        innerColor <- Trans.read
        outerColor <- Trans.read
        return DebugDataGradientCircle {
            position,
            radius,
            innerColor,
            outerColor }
    
    write DebugDataGradientCircle {
        position,
        radius,
        innerColor,
        outerColor } = do
            Trans.write position
            Trans.write radius
            Trans.write innerColor
            Trans.write outerColor

-- | Ring
data DebugDataRing = DebugDataRing {
    -- | Position of the center
    position :: Vec2,
    -- | Radius
    radius :: Double,
    -- | Width
    width :: Double,
    -- | Color
    color :: Color }
    deriving Show

instance Trans DebugDataRing where
    read = do
        position <- Trans.read
        radius <- Trans.read
        width <- Trans.read
        color <- Trans.read
        return DebugDataRing {
            position,
            radius,
            width,
            color }
    
    write DebugDataRing {
        position,
        radius,
        width,
        color } = do
            Trans.write position
            Trans.write radius
            Trans.write width
            Trans.write color

-- | Sector of a circle
data DebugDataPie = DebugDataPie {
    -- | Position of the center
    position :: Vec2,
    -- | Radius
    radius :: Double,
    -- | Start angle
    startAngle :: Double,
    -- | End angle
    endAngle :: Double,
    -- | Color
    color :: Color }
    deriving Show

instance Trans DebugDataPie where
    read = do
        position <- Trans.read
        radius <- Trans.read
        startAngle <- Trans.read
        endAngle <- Trans.read
        color <- Trans.read
        return DebugDataPie {
            position,
            radius,
            startAngle,
            endAngle,
            color }
    
    write DebugDataPie {
        position,
        radius,
        startAngle,
        endAngle,
        color } = do
            Trans.write position
            Trans.write radius
            Trans.write startAngle
            Trans.write endAngle
            Trans.write color

-- | Arc
data DebugDataArc = DebugDataArc {
    -- | Position of the center
    position :: Vec2,
    -- | Radius
    radius :: Double,
    -- | Width
    width :: Double,
    -- | Start angle
    startAngle :: Double,
    -- | End angle
    endAngle :: Double,
    -- | Color
    color :: Color }
    deriving Show

instance Trans DebugDataArc where
    read = do
        position <- Trans.read
        radius <- Trans.read
        width <- Trans.read
        startAngle <- Trans.read
        endAngle <- Trans.read
        color <- Trans.read
        return DebugDataArc {
            position,
            radius,
            width,
            startAngle,
            endAngle,
            color }
    
    write DebugDataArc {
        position,
        radius,
        width,
        startAngle,
        endAngle,
        color } = do
            Trans.write position
            Trans.write radius
            Trans.write width
            Trans.write startAngle
            Trans.write endAngle
            Trans.write color

-- | Rectancle
data DebugDataRect = DebugDataRect {
    -- | Bottom left position
    bottomLeft :: Vec2,
    -- | Size
    size :: Vec2,
    -- | Color
    color :: Color }
    deriving Show

instance Trans DebugDataRect where
    read = do
        bottomLeft <- Trans.read
        size <- Trans.read
        color <- Trans.read
        return DebugDataRect {
            bottomLeft,
            size,
            color }
    
    write DebugDataRect {
        bottomLeft,
        size,
        color } = do
            Trans.write bottomLeft
            Trans.write size
            Trans.write color

-- | Polygon (convex)
data DebugDataPolygon = DebugDataPolygon {
    -- | Positions of vertices in order
    vertices :: [Vec2],
    -- | Color
    color :: Color }
    deriving Show

instance Trans DebugDataPolygon where
    read = do
        vertices <- Trans.read
        color <- Trans.read
        return DebugDataPolygon {
            vertices,
            color }
    
    write DebugDataPolygon {
        vertices,
        color } = do
            Trans.write vertices
            Trans.write color

-- | Polygon with gradient fill
data DebugDataGradientPolygon = DebugDataGradientPolygon {
    -- | List of vertices in order
    vertices :: [ColoredVertex] }
    deriving Show

instance Trans DebugDataGradientPolygon where
    read = do
        vertices <- Trans.read
        return DebugDataGradientPolygon {
            vertices }
    
    write DebugDataGradientPolygon {
        vertices } = do
            Trans.write vertices

-- | Segment
data DebugDataSegment = DebugDataSegment {
    -- | Position of the first end
    firstEnd :: Vec2,
    -- | Position of the second end
    secondEnd :: Vec2,
    -- | Width
    width :: Double,
    -- | Color
    color :: Color }
    deriving Show

instance Trans DebugDataSegment where
    read = do
        firstEnd <- Trans.read
        secondEnd <- Trans.read
        width <- Trans.read
        color <- Trans.read
        return DebugDataSegment {
            firstEnd,
            secondEnd,
            width,
            color }
    
    write DebugDataSegment {
        firstEnd,
        secondEnd,
        width,
        color } = do
            Trans.write firstEnd
            Trans.write secondEnd
            Trans.write width
            Trans.write color

-- | Segment with gradient fill
data DebugDataGradientSegment = DebugDataGradientSegment {
    -- | Position of the first end
    firstEnd :: Vec2,
    -- | Color of the first end
    firstColor :: Color,
    -- | Position of the second end
    secondEnd :: Vec2,
    -- | Color of the second end
    secondColor :: Color,
    -- | Width
    width :: Double }
    deriving Show

instance Trans DebugDataGradientSegment where
    read = do
        firstEnd <- Trans.read
        firstColor <- Trans.read
        secondEnd <- Trans.read
        secondColor <- Trans.read
        width <- Trans.read
        return DebugDataGradientSegment {
            firstEnd,
            firstColor,
            secondEnd,
            secondColor,
            width }
    
    write DebugDataGradientSegment {
        firstEnd,
        firstColor,
        secondEnd,
        secondColor,
        width } = do
            Trans.write firstEnd
            Trans.write firstColor
            Trans.write secondEnd
            Trans.write secondColor
            Trans.write width

-- | Poly line
data DebugDataPolyLine = DebugDataPolyLine {
    -- | List of points in order
    vertices :: [Vec2],
    -- | Width
    width :: Double,
    -- | Color
    color :: Color }
    deriving Show

instance Trans DebugDataPolyLine where
    read = do
        vertices <- Trans.read
        width <- Trans.read
        color <- Trans.read
        return DebugDataPolyLine {
            vertices,
            width,
            color }
    
    write DebugDataPolyLine {
        vertices,
        width,
        color } = do
            Trans.write vertices
            Trans.write width
            Trans.write color

-- | Poly line with gradient fill
data DebugDataGradientPolyLine = DebugDataGradientPolyLine {
    -- | List of points and colors in order
    vertices :: [ColoredVertex],
    -- | Width
    width :: Double }
    deriving Show

instance Trans DebugDataGradientPolyLine where
    read = do
        vertices <- Trans.read
        width <- Trans.read
        return DebugDataGradientPolyLine {
            vertices,
            width }
    
    write DebugDataGradientPolyLine {
        vertices,
        width } = do
            Trans.write vertices
            Trans.write width

-- | Data for debug rendering
data DebugData
    -- | Text
    = PlacedText DebugDataPlacedText
    -- | Circle
    | Circle DebugDataCircle
    -- | Circle with gradient fill
    | GradientCircle DebugDataGradientCircle
    -- | Ring
    | Ring DebugDataRing
    -- | Sector of a circle
    | Pie DebugDataPie
    -- | Arc
    | Arc DebugDataArc
    -- | Rectancle
    | Rect DebugDataRect
    -- | Polygon (convex)
    | Polygon DebugDataPolygon
    -- | Polygon with gradient fill
    | GradientPolygon DebugDataGradientPolygon
    -- | Segment
    | Segment DebugDataSegment
    -- | Segment with gradient fill
    | GradientSegment DebugDataGradientSegment
    -- | Poly line
    | PolyLine DebugDataPolyLine
    -- | Poly line with gradient fill
    | GradientPolyLine DebugDataGradientPolyLine
    deriving Show

instance Trans DebugData where
    read = do
        tag :: Int32 <- Trans.read
        case tag of
            0 -> PlacedText <$> Trans.read
            1 -> Circle <$> Trans.read
            2 -> GradientCircle <$> Trans.read
            3 -> Ring <$> Trans.read
            4 -> Pie <$> Trans.read
            5 -> Arc <$> Trans.read
            6 -> Rect <$> Trans.read
            7 -> Polygon <$> Trans.read
            8 -> GradientPolygon <$> Trans.read
            9 -> Segment <$> Trans.read
            10 -> GradientSegment <$> Trans.read
            11 -> PolyLine <$> Trans.read
            12 -> GradientPolyLine <$> Trans.read
    
    write (PlacedText value) = do
        Trans.write (0 :: Int32)
        Trans.write value
    write (Circle value) = do
        Trans.write (1 :: Int32)
        Trans.write value
    write (GradientCircle value) = do
        Trans.write (2 :: Int32)
        Trans.write value
    write (Ring value) = do
        Trans.write (3 :: Int32)
        Trans.write value
    write (Pie value) = do
        Trans.write (4 :: Int32)
        Trans.write value
    write (Arc value) = do
        Trans.write (5 :: Int32)
        Trans.write value
    write (Rect value) = do
        Trans.write (6 :: Int32)
        Trans.write value
    write (Polygon value) = do
        Trans.write (7 :: Int32)
        Trans.write value
    write (GradientPolygon value) = do
        Trans.write (8 :: Int32)
        Trans.write value
    write (Segment value) = do
        Trans.write (9 :: Int32)
        Trans.write value
    write (GradientSegment value) = do
        Trans.write (10 :: Int32)
        Trans.write value
    write (PolyLine value) = do
        Trans.write (11 :: Int32)
        Trans.write value
    write (GradientPolyLine value) = do
        Trans.write (12 :: Int32)
        Trans.write value