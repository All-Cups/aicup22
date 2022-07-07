use super::*;

/// Data for debug rendering
#[derive(Clone, Debug)]
pub enum DebugData {
    /// Text
    PlacedText {
        /// Position
        position: model::Vec2,
        /// Text
        text: String,
        /// Alignment, separate for x and y. From 0 to 1. 0.5 - center alignment
        alignment: model::Vec2,
        /// Size
        size: f64,
        /// Color
        color: debugging::Color,
    },
    /// Circle
    Circle {
        /// Position of the center
        position: model::Vec2,
        /// Radius
        radius: f64,
        /// Color
        color: debugging::Color,
    },
    /// Circle with gradient fill
    GradientCircle {
        /// Position of the center
        position: model::Vec2,
        /// Radius
        radius: f64,
        /// Color of the center
        inner_color: debugging::Color,
        /// Color of the edge
        outer_color: debugging::Color,
    },
    /// Ring
    Ring {
        /// Position of the center
        position: model::Vec2,
        /// Radius
        radius: f64,
        /// Width
        width: f64,
        /// Color
        color: debugging::Color,
    },
    /// Sector of a circle
    Pie {
        /// Position of the center
        position: model::Vec2,
        /// Radius
        radius: f64,
        /// Start angle
        start_angle: f64,
        /// End angle
        end_angle: f64,
        /// Color
        color: debugging::Color,
    },
    /// Arc
    Arc {
        /// Position of the center
        position: model::Vec2,
        /// Radius
        radius: f64,
        /// Width
        width: f64,
        /// Start angle
        start_angle: f64,
        /// End angle
        end_angle: f64,
        /// Color
        color: debugging::Color,
    },
    /// Rectancle
    Rect {
        /// Bottom left position
        bottom_left: model::Vec2,
        /// Size
        size: model::Vec2,
        /// Color
        color: debugging::Color,
    },
    /// Polygon (convex)
    Polygon {
        /// Positions of vertices in order
        vertices: Vec<model::Vec2>,
        /// Color
        color: debugging::Color,
    },
    /// Polygon with gradient fill
    GradientPolygon {
        /// List of vertices in order
        vertices: Vec<debugging::ColoredVertex>,
    },
    /// Segment
    Segment {
        /// Position of the first end
        first_end: model::Vec2,
        /// Position of the second end
        second_end: model::Vec2,
        /// Width
        width: f64,
        /// Color
        color: debugging::Color,
    },
    /// Segment with gradient fill
    GradientSegment {
        /// Position of the first end
        first_end: model::Vec2,
        /// Color of the first end
        first_color: debugging::Color,
        /// Position of the second end
        second_end: model::Vec2,
        /// Color of the second end
        second_color: debugging::Color,
        /// Width
        width: f64,
    },
    /// Poly line
    PolyLine {
        /// List of points in order
        vertices: Vec<model::Vec2>,
        /// Width
        width: f64,
        /// Color
        color: debugging::Color,
    },
    /// Poly line with gradient fill
    GradientPolyLine {
        /// List of points and colors in order
        vertices: Vec<debugging::ColoredVertex>,
        /// Width
        width: f64,
    },
}

impl trans::Trans for DebugData {
    fn write_to(&self, writer: &mut dyn std::io::Write) -> std::io::Result<()> {
        match self {
            Self::PlacedText {
                position,
                text,
                alignment,
                size,
                color,
            } => {
                <i32 as trans::Trans>::write_to(&0, writer)?;
                position.write_to(writer)?;
                text.write_to(writer)?;
                alignment.write_to(writer)?;
                size.write_to(writer)?;
                color.write_to(writer)?;
            }
            Self::Circle {
                position,
                radius,
                color,
            } => {
                <i32 as trans::Trans>::write_to(&1, writer)?;
                position.write_to(writer)?;
                radius.write_to(writer)?;
                color.write_to(writer)?;
            }
            Self::GradientCircle {
                position,
                radius,
                inner_color,
                outer_color,
            } => {
                <i32 as trans::Trans>::write_to(&2, writer)?;
                position.write_to(writer)?;
                radius.write_to(writer)?;
                inner_color.write_to(writer)?;
                outer_color.write_to(writer)?;
            }
            Self::Ring {
                position,
                radius,
                width,
                color,
            } => {
                <i32 as trans::Trans>::write_to(&3, writer)?;
                position.write_to(writer)?;
                radius.write_to(writer)?;
                width.write_to(writer)?;
                color.write_to(writer)?;
            }
            Self::Pie {
                position,
                radius,
                start_angle,
                end_angle,
                color,
            } => {
                <i32 as trans::Trans>::write_to(&4, writer)?;
                position.write_to(writer)?;
                radius.write_to(writer)?;
                start_angle.write_to(writer)?;
                end_angle.write_to(writer)?;
                color.write_to(writer)?;
            }
            Self::Arc {
                position,
                radius,
                width,
                start_angle,
                end_angle,
                color,
            } => {
                <i32 as trans::Trans>::write_to(&5, writer)?;
                position.write_to(writer)?;
                radius.write_to(writer)?;
                width.write_to(writer)?;
                start_angle.write_to(writer)?;
                end_angle.write_to(writer)?;
                color.write_to(writer)?;
            }
            Self::Rect {
                bottom_left,
                size,
                color,
            } => {
                <i32 as trans::Trans>::write_to(&6, writer)?;
                bottom_left.write_to(writer)?;
                size.write_to(writer)?;
                color.write_to(writer)?;
            }
            Self::Polygon {
                vertices,
                color,
            } => {
                <i32 as trans::Trans>::write_to(&7, writer)?;
                vertices.write_to(writer)?;
                color.write_to(writer)?;
            }
            Self::GradientPolygon {
                vertices,
            } => {
                <i32 as trans::Trans>::write_to(&8, writer)?;
                vertices.write_to(writer)?;
            }
            Self::Segment {
                first_end,
                second_end,
                width,
                color,
            } => {
                <i32 as trans::Trans>::write_to(&9, writer)?;
                first_end.write_to(writer)?;
                second_end.write_to(writer)?;
                width.write_to(writer)?;
                color.write_to(writer)?;
            }
            Self::GradientSegment {
                first_end,
                first_color,
                second_end,
                second_color,
                width,
            } => {
                <i32 as trans::Trans>::write_to(&10, writer)?;
                first_end.write_to(writer)?;
                first_color.write_to(writer)?;
                second_end.write_to(writer)?;
                second_color.write_to(writer)?;
                width.write_to(writer)?;
            }
            Self::PolyLine {
                vertices,
                width,
                color,
            } => {
                <i32 as trans::Trans>::write_to(&11, writer)?;
                vertices.write_to(writer)?;
                width.write_to(writer)?;
                color.write_to(writer)?;
            }
            Self::GradientPolyLine {
                vertices,
                width,
            } => {
                <i32 as trans::Trans>::write_to(&12, writer)?;
                vertices.write_to(writer)?;
                width.write_to(writer)?;
            }
        }
        Ok(())
    }
    fn read_from(reader: &mut dyn std::io::Read) -> std::io::Result<Self> {
        let tag = <i32 as trans::Trans>::read_from(reader)?;
        match tag {
            0 => {
                let position: model::Vec2 = trans::Trans::read_from(reader)?;
                let text: String = trans::Trans::read_from(reader)?;
                let alignment: model::Vec2 = trans::Trans::read_from(reader)?;
                let size: f64 = trans::Trans::read_from(reader)?;
                let color: debugging::Color = trans::Trans::read_from(reader)?;
                Ok(Self::PlacedText {
                    position,
                    text,
                    alignment,
                    size,
                    color,
                })
            }
            1 => {
                let position: model::Vec2 = trans::Trans::read_from(reader)?;
                let radius: f64 = trans::Trans::read_from(reader)?;
                let color: debugging::Color = trans::Trans::read_from(reader)?;
                Ok(Self::Circle {
                    position,
                    radius,
                    color,
                })
            }
            2 => {
                let position: model::Vec2 = trans::Trans::read_from(reader)?;
                let radius: f64 = trans::Trans::read_from(reader)?;
                let inner_color: debugging::Color = trans::Trans::read_from(reader)?;
                let outer_color: debugging::Color = trans::Trans::read_from(reader)?;
                Ok(Self::GradientCircle {
                    position,
                    radius,
                    inner_color,
                    outer_color,
                })
            }
            3 => {
                let position: model::Vec2 = trans::Trans::read_from(reader)?;
                let radius: f64 = trans::Trans::read_from(reader)?;
                let width: f64 = trans::Trans::read_from(reader)?;
                let color: debugging::Color = trans::Trans::read_from(reader)?;
                Ok(Self::Ring {
                    position,
                    radius,
                    width,
                    color,
                })
            }
            4 => {
                let position: model::Vec2 = trans::Trans::read_from(reader)?;
                let radius: f64 = trans::Trans::read_from(reader)?;
                let start_angle: f64 = trans::Trans::read_from(reader)?;
                let end_angle: f64 = trans::Trans::read_from(reader)?;
                let color: debugging::Color = trans::Trans::read_from(reader)?;
                Ok(Self::Pie {
                    position,
                    radius,
                    start_angle,
                    end_angle,
                    color,
                })
            }
            5 => {
                let position: model::Vec2 = trans::Trans::read_from(reader)?;
                let radius: f64 = trans::Trans::read_from(reader)?;
                let width: f64 = trans::Trans::read_from(reader)?;
                let start_angle: f64 = trans::Trans::read_from(reader)?;
                let end_angle: f64 = trans::Trans::read_from(reader)?;
                let color: debugging::Color = trans::Trans::read_from(reader)?;
                Ok(Self::Arc {
                    position,
                    radius,
                    width,
                    start_angle,
                    end_angle,
                    color,
                })
            }
            6 => {
                let bottom_left: model::Vec2 = trans::Trans::read_from(reader)?;
                let size: model::Vec2 = trans::Trans::read_from(reader)?;
                let color: debugging::Color = trans::Trans::read_from(reader)?;
                Ok(Self::Rect {
                    bottom_left,
                    size,
                    color,
                })
            }
            7 => {
                let vertices: Vec<model::Vec2> = trans::Trans::read_from(reader)?;
                let color: debugging::Color = trans::Trans::read_from(reader)?;
                Ok(Self::Polygon {
                    vertices,
                    color,
                })
            }
            8 => {
                let vertices: Vec<debugging::ColoredVertex> = trans::Trans::read_from(reader)?;
                Ok(Self::GradientPolygon {
                    vertices,
                })
            }
            9 => {
                let first_end: model::Vec2 = trans::Trans::read_from(reader)?;
                let second_end: model::Vec2 = trans::Trans::read_from(reader)?;
                let width: f64 = trans::Trans::read_from(reader)?;
                let color: debugging::Color = trans::Trans::read_from(reader)?;
                Ok(Self::Segment {
                    first_end,
                    second_end,
                    width,
                    color,
                })
            }
            10 => {
                let first_end: model::Vec2 = trans::Trans::read_from(reader)?;
                let first_color: debugging::Color = trans::Trans::read_from(reader)?;
                let second_end: model::Vec2 = trans::Trans::read_from(reader)?;
                let second_color: debugging::Color = trans::Trans::read_from(reader)?;
                let width: f64 = trans::Trans::read_from(reader)?;
                Ok(Self::GradientSegment {
                    first_end,
                    first_color,
                    second_end,
                    second_color,
                    width,
                })
            }
            11 => {
                let vertices: Vec<model::Vec2> = trans::Trans::read_from(reader)?;
                let width: f64 = trans::Trans::read_from(reader)?;
                let color: debugging::Color = trans::Trans::read_from(reader)?;
                Ok(Self::PolyLine {
                    vertices,
                    width,
                    color,
                })
            }
            12 => {
                let vertices: Vec<debugging::ColoredVertex> = trans::Trans::read_from(reader)?;
                let width: f64 = trans::Trans::read_from(reader)?;
                Ok(Self::GradientPolyLine {
                    vertices,
                    width,
                })
            }
            _ => Err(std::io::Error::new(
                std::io::ErrorKind::Other,
                format!("Unexpected tag {:?}", tag))),
        }
    }
}