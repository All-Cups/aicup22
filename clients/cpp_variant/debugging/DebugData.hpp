#ifndef __MODEL_DEBUG_DATA_HPP__
#define __MODEL_DEBUG_DATA_HPP__

#include "Stream.hpp"
#include "debugging/Color.hpp"
#include "debugging/ColoredVertex.hpp"
#include "model/Vec2.hpp"
#include <memory>
#include <sstream>
#include <stdexcept>
#include <string>
#include <variant>
#include <vector>

namespace debugging {


// Text
class PlacedText {
public:
    // Position
    model::Vec2 position;
    // Text
    std::string text;
    // Alignment, separate for x and y. From 0 to 1. 0.5 - center alignment
    model::Vec2 alignment;
    // Size
    double size;
    // Color
    debugging::Color color;

    PlacedText(model::Vec2 position, std::string text, model::Vec2 alignment, double size, debugging::Color color);

    // Read PlacedText from input stream
    static PlacedText readFrom(InputStream& stream);

    // Write PlacedText to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of PlacedText
    std::string toString() const;
};

// Circle
class Circle {
public:
    // Position of the center
    model::Vec2 position;
    // Radius
    double radius;
    // Color
    debugging::Color color;

    Circle(model::Vec2 position, double radius, debugging::Color color);

    // Read Circle from input stream
    static Circle readFrom(InputStream& stream);

    // Write Circle to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of Circle
    std::string toString() const;
};

// Circle with gradient fill
class GradientCircle {
public:
    // Position of the center
    model::Vec2 position;
    // Radius
    double radius;
    // Color of the center
    debugging::Color innerColor;
    // Color of the edge
    debugging::Color outerColor;

    GradientCircle(model::Vec2 position, double radius, debugging::Color innerColor, debugging::Color outerColor);

    // Read GradientCircle from input stream
    static GradientCircle readFrom(InputStream& stream);

    // Write GradientCircle to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of GradientCircle
    std::string toString() const;
};

// Ring
class Ring {
public:
    // Position of the center
    model::Vec2 position;
    // Radius
    double radius;
    // Width
    double width;
    // Color
    debugging::Color color;

    Ring(model::Vec2 position, double radius, double width, debugging::Color color);

    // Read Ring from input stream
    static Ring readFrom(InputStream& stream);

    // Write Ring to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of Ring
    std::string toString() const;
};

// Sector of a circle
class Pie {
public:
    // Position of the center
    model::Vec2 position;
    // Radius
    double radius;
    // Start angle
    double startAngle;
    // End angle
    double endAngle;
    // Color
    debugging::Color color;

    Pie(model::Vec2 position, double radius, double startAngle, double endAngle, debugging::Color color);

    // Read Pie from input stream
    static Pie readFrom(InputStream& stream);

    // Write Pie to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of Pie
    std::string toString() const;
};

// Arc
class Arc {
public:
    // Position of the center
    model::Vec2 position;
    // Radius
    double radius;
    // Width
    double width;
    // Start angle
    double startAngle;
    // End angle
    double endAngle;
    // Color
    debugging::Color color;

    Arc(model::Vec2 position, double radius, double width, double startAngle, double endAngle, debugging::Color color);

    // Read Arc from input stream
    static Arc readFrom(InputStream& stream);

    // Write Arc to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of Arc
    std::string toString() const;
};

// Rectancle
class Rect {
public:
    // Bottom left position
    model::Vec2 bottomLeft;
    // Size
    model::Vec2 size;
    // Color
    debugging::Color color;

    Rect(model::Vec2 bottomLeft, model::Vec2 size, debugging::Color color);

    // Read Rect from input stream
    static Rect readFrom(InputStream& stream);

    // Write Rect to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of Rect
    std::string toString() const;
};

// Polygon (convex)
class Polygon {
public:
    // Positions of vertices in order
    std::vector<model::Vec2> vertices;
    // Color
    debugging::Color color;

    Polygon(std::vector<model::Vec2> vertices, debugging::Color color);

    // Read Polygon from input stream
    static Polygon readFrom(InputStream& stream);

    // Write Polygon to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of Polygon
    std::string toString() const;
};

// Polygon with gradient fill
class GradientPolygon {
public:
    // List of vertices in order
    std::vector<debugging::ColoredVertex> vertices;

    GradientPolygon(std::vector<debugging::ColoredVertex> vertices);

    // Read GradientPolygon from input stream
    static GradientPolygon readFrom(InputStream& stream);

    // Write GradientPolygon to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of GradientPolygon
    std::string toString() const;
};

// Segment
class Segment {
public:
    // Position of the first end
    model::Vec2 firstEnd;
    // Position of the second end
    model::Vec2 secondEnd;
    // Width
    double width;
    // Color
    debugging::Color color;

    Segment(model::Vec2 firstEnd, model::Vec2 secondEnd, double width, debugging::Color color);

    // Read Segment from input stream
    static Segment readFrom(InputStream& stream);

    // Write Segment to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of Segment
    std::string toString() const;
};

// Segment with gradient fill
class GradientSegment {
public:
    // Position of the first end
    model::Vec2 firstEnd;
    // Color of the first end
    debugging::Color firstColor;
    // Position of the second end
    model::Vec2 secondEnd;
    // Color of the second end
    debugging::Color secondColor;
    // Width
    double width;

    GradientSegment(model::Vec2 firstEnd, debugging::Color firstColor, model::Vec2 secondEnd, debugging::Color secondColor, double width);

    // Read GradientSegment from input stream
    static GradientSegment readFrom(InputStream& stream);

    // Write GradientSegment to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of GradientSegment
    std::string toString() const;
};

// Poly line
class PolyLine {
public:
    // List of points in order
    std::vector<model::Vec2> vertices;
    // Width
    double width;
    // Color
    debugging::Color color;

    PolyLine(std::vector<model::Vec2> vertices, double width, debugging::Color color);

    // Read PolyLine from input stream
    static PolyLine readFrom(InputStream& stream);

    // Write PolyLine to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of PolyLine
    std::string toString() const;
};

// Poly line with gradient fill
class GradientPolyLine {
public:
    // List of points and colors in order
    std::vector<debugging::ColoredVertex> vertices;
    // Width
    double width;

    GradientPolyLine(std::vector<debugging::ColoredVertex> vertices, double width);

    // Read GradientPolyLine from input stream
    static GradientPolyLine readFrom(InputStream& stream);

    // Write GradientPolyLine to output stream
    void writeTo(OutputStream& stream) const;

    // Get string representation of GradientPolyLine
    std::string toString() const;
};

// Data for debug rendering
typedef std::variant<PlacedText, Circle, GradientCircle, Ring, Pie, Arc, Rect, Polygon, GradientPolygon, Segment, GradientSegment, PolyLine, GradientPolyLine> DebugData;

// Read DebugData from input stream
DebugData readDebugData(InputStream& stream);

// Write DebugData to output stream
void writeDebugData(const DebugData& value, OutputStream& stream);

// Get string representation of DebugData
std::string debugDataToString(const DebugData& value);

}

#endif