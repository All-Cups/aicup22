#include "DebugData.hpp"
#include <stdexcept>

namespace debugging {

PlacedText::PlacedText(model::Vec2 position, std::string text, model::Vec2 alignment, double size, debugging::Color color) : position(position), text(text), alignment(alignment), size(size), color(color) { }

// Read PlacedText from input stream
PlacedText PlacedText::readFrom(InputStream& stream) {
    model::Vec2 position = model::Vec2::readFrom(stream);
    std::string text = stream.readString();
    model::Vec2 alignment = model::Vec2::readFrom(stream);
    double size = stream.readDouble();
    debugging::Color color = debugging::Color::readFrom(stream);
    return PlacedText(position, text, alignment, size, color);
}

// Write PlacedText to output stream
void PlacedText::writeTo(OutputStream& stream) const {
    position.writeTo(stream);
    stream.write(text);
    alignment.writeTo(stream);
    stream.write(size);
    color.writeTo(stream);
}

// Get string representation of PlacedText
std::string PlacedText::toString() const {
    std::stringstream ss;
    ss << "PlacedText { ";
    ss << "position: ";
    ss << position.toString();
    ss << ", ";
    ss << "text: ";
    ss << '"' << text << '"';
    ss << ", ";
    ss << "alignment: ";
    ss << alignment.toString();
    ss << ", ";
    ss << "size: ";
    ss << size;
    ss << ", ";
    ss << "color: ";
    ss << color.toString();
    ss << " }";
    return ss.str();
}

Circle::Circle(model::Vec2 position, double radius, debugging::Color color) : position(position), radius(radius), color(color) { }

// Read Circle from input stream
Circle Circle::readFrom(InputStream& stream) {
    model::Vec2 position = model::Vec2::readFrom(stream);
    double radius = stream.readDouble();
    debugging::Color color = debugging::Color::readFrom(stream);
    return Circle(position, radius, color);
}

// Write Circle to output stream
void Circle::writeTo(OutputStream& stream) const {
    position.writeTo(stream);
    stream.write(radius);
    color.writeTo(stream);
}

// Get string representation of Circle
std::string Circle::toString() const {
    std::stringstream ss;
    ss << "Circle { ";
    ss << "position: ";
    ss << position.toString();
    ss << ", ";
    ss << "radius: ";
    ss << radius;
    ss << ", ";
    ss << "color: ";
    ss << color.toString();
    ss << " }";
    return ss.str();
}

GradientCircle::GradientCircle(model::Vec2 position, double radius, debugging::Color innerColor, debugging::Color outerColor) : position(position), radius(radius), innerColor(innerColor), outerColor(outerColor) { }

// Read GradientCircle from input stream
GradientCircle GradientCircle::readFrom(InputStream& stream) {
    model::Vec2 position = model::Vec2::readFrom(stream);
    double radius = stream.readDouble();
    debugging::Color innerColor = debugging::Color::readFrom(stream);
    debugging::Color outerColor = debugging::Color::readFrom(stream);
    return GradientCircle(position, radius, innerColor, outerColor);
}

// Write GradientCircle to output stream
void GradientCircle::writeTo(OutputStream& stream) const {
    position.writeTo(stream);
    stream.write(radius);
    innerColor.writeTo(stream);
    outerColor.writeTo(stream);
}

// Get string representation of GradientCircle
std::string GradientCircle::toString() const {
    std::stringstream ss;
    ss << "GradientCircle { ";
    ss << "position: ";
    ss << position.toString();
    ss << ", ";
    ss << "radius: ";
    ss << radius;
    ss << ", ";
    ss << "innerColor: ";
    ss << innerColor.toString();
    ss << ", ";
    ss << "outerColor: ";
    ss << outerColor.toString();
    ss << " }";
    return ss.str();
}

Ring::Ring(model::Vec2 position, double radius, double width, debugging::Color color) : position(position), radius(radius), width(width), color(color) { }

// Read Ring from input stream
Ring Ring::readFrom(InputStream& stream) {
    model::Vec2 position = model::Vec2::readFrom(stream);
    double radius = stream.readDouble();
    double width = stream.readDouble();
    debugging::Color color = debugging::Color::readFrom(stream);
    return Ring(position, radius, width, color);
}

// Write Ring to output stream
void Ring::writeTo(OutputStream& stream) const {
    position.writeTo(stream);
    stream.write(radius);
    stream.write(width);
    color.writeTo(stream);
}

// Get string representation of Ring
std::string Ring::toString() const {
    std::stringstream ss;
    ss << "Ring { ";
    ss << "position: ";
    ss << position.toString();
    ss << ", ";
    ss << "radius: ";
    ss << radius;
    ss << ", ";
    ss << "width: ";
    ss << width;
    ss << ", ";
    ss << "color: ";
    ss << color.toString();
    ss << " }";
    return ss.str();
}

Pie::Pie(model::Vec2 position, double radius, double startAngle, double endAngle, debugging::Color color) : position(position), radius(radius), startAngle(startAngle), endAngle(endAngle), color(color) { }

// Read Pie from input stream
Pie Pie::readFrom(InputStream& stream) {
    model::Vec2 position = model::Vec2::readFrom(stream);
    double radius = stream.readDouble();
    double startAngle = stream.readDouble();
    double endAngle = stream.readDouble();
    debugging::Color color = debugging::Color::readFrom(stream);
    return Pie(position, radius, startAngle, endAngle, color);
}

// Write Pie to output stream
void Pie::writeTo(OutputStream& stream) const {
    position.writeTo(stream);
    stream.write(radius);
    stream.write(startAngle);
    stream.write(endAngle);
    color.writeTo(stream);
}

// Get string representation of Pie
std::string Pie::toString() const {
    std::stringstream ss;
    ss << "Pie { ";
    ss << "position: ";
    ss << position.toString();
    ss << ", ";
    ss << "radius: ";
    ss << radius;
    ss << ", ";
    ss << "startAngle: ";
    ss << startAngle;
    ss << ", ";
    ss << "endAngle: ";
    ss << endAngle;
    ss << ", ";
    ss << "color: ";
    ss << color.toString();
    ss << " }";
    return ss.str();
}

Arc::Arc(model::Vec2 position, double radius, double width, double startAngle, double endAngle, debugging::Color color) : position(position), radius(radius), width(width), startAngle(startAngle), endAngle(endAngle), color(color) { }

// Read Arc from input stream
Arc Arc::readFrom(InputStream& stream) {
    model::Vec2 position = model::Vec2::readFrom(stream);
    double radius = stream.readDouble();
    double width = stream.readDouble();
    double startAngle = stream.readDouble();
    double endAngle = stream.readDouble();
    debugging::Color color = debugging::Color::readFrom(stream);
    return Arc(position, radius, width, startAngle, endAngle, color);
}

// Write Arc to output stream
void Arc::writeTo(OutputStream& stream) const {
    position.writeTo(stream);
    stream.write(radius);
    stream.write(width);
    stream.write(startAngle);
    stream.write(endAngle);
    color.writeTo(stream);
}

// Get string representation of Arc
std::string Arc::toString() const {
    std::stringstream ss;
    ss << "Arc { ";
    ss << "position: ";
    ss << position.toString();
    ss << ", ";
    ss << "radius: ";
    ss << radius;
    ss << ", ";
    ss << "width: ";
    ss << width;
    ss << ", ";
    ss << "startAngle: ";
    ss << startAngle;
    ss << ", ";
    ss << "endAngle: ";
    ss << endAngle;
    ss << ", ";
    ss << "color: ";
    ss << color.toString();
    ss << " }";
    return ss.str();
}

Rect::Rect(model::Vec2 bottomLeft, model::Vec2 size, debugging::Color color) : bottomLeft(bottomLeft), size(size), color(color) { }

// Read Rect from input stream
Rect Rect::readFrom(InputStream& stream) {
    model::Vec2 bottomLeft = model::Vec2::readFrom(stream);
    model::Vec2 size = model::Vec2::readFrom(stream);
    debugging::Color color = debugging::Color::readFrom(stream);
    return Rect(bottomLeft, size, color);
}

// Write Rect to output stream
void Rect::writeTo(OutputStream& stream) const {
    bottomLeft.writeTo(stream);
    size.writeTo(stream);
    color.writeTo(stream);
}

// Get string representation of Rect
std::string Rect::toString() const {
    std::stringstream ss;
    ss << "Rect { ";
    ss << "bottomLeft: ";
    ss << bottomLeft.toString();
    ss << ", ";
    ss << "size: ";
    ss << size.toString();
    ss << ", ";
    ss << "color: ";
    ss << color.toString();
    ss << " }";
    return ss.str();
}

Polygon::Polygon(std::vector<model::Vec2> vertices, debugging::Color color) : vertices(vertices), color(color) { }

// Read Polygon from input stream
Polygon Polygon::readFrom(InputStream& stream) {
    std::vector<model::Vec2> vertices = std::vector<model::Vec2>();
    size_t verticesSize = stream.readInt();
    vertices.reserve(verticesSize);
    for (size_t verticesIndex = 0; verticesIndex < verticesSize; verticesIndex++) {
        model::Vec2 verticesElement = model::Vec2::readFrom(stream);
        vertices.emplace_back(verticesElement);
    }
    debugging::Color color = debugging::Color::readFrom(stream);
    return Polygon(vertices, color);
}

// Write Polygon to output stream
void Polygon::writeTo(OutputStream& stream) const {
    stream.write((int)(vertices.size()));
    for (const model::Vec2& verticesElement : vertices) {
        verticesElement.writeTo(stream);
    }
    color.writeTo(stream);
}

// Get string representation of Polygon
std::string Polygon::toString() const {
    std::stringstream ss;
    ss << "Polygon { ";
    ss << "vertices: ";
    ss << "[ ";
    for (size_t verticesIndex = 0; verticesIndex < vertices.size(); verticesIndex++) {
        const model::Vec2& verticesElement = vertices[verticesIndex];
        if (verticesIndex != 0) {
            ss << ", ";
        }
        ss << verticesElement.toString();
    }
    ss << " ]";
    ss << ", ";
    ss << "color: ";
    ss << color.toString();
    ss << " }";
    return ss.str();
}

GradientPolygon::GradientPolygon(std::vector<debugging::ColoredVertex> vertices) : vertices(vertices) { }

// Read GradientPolygon from input stream
GradientPolygon GradientPolygon::readFrom(InputStream& stream) {
    std::vector<debugging::ColoredVertex> vertices = std::vector<debugging::ColoredVertex>();
    size_t verticesSize = stream.readInt();
    vertices.reserve(verticesSize);
    for (size_t verticesIndex = 0; verticesIndex < verticesSize; verticesIndex++) {
        debugging::ColoredVertex verticesElement = debugging::ColoredVertex::readFrom(stream);
        vertices.emplace_back(verticesElement);
    }
    return GradientPolygon(vertices);
}

// Write GradientPolygon to output stream
void GradientPolygon::writeTo(OutputStream& stream) const {
    stream.write((int)(vertices.size()));
    for (const debugging::ColoredVertex& verticesElement : vertices) {
        verticesElement.writeTo(stream);
    }
}

// Get string representation of GradientPolygon
std::string GradientPolygon::toString() const {
    std::stringstream ss;
    ss << "GradientPolygon { ";
    ss << "vertices: ";
    ss << "[ ";
    for (size_t verticesIndex = 0; verticesIndex < vertices.size(); verticesIndex++) {
        const debugging::ColoredVertex& verticesElement = vertices[verticesIndex];
        if (verticesIndex != 0) {
            ss << ", ";
        }
        ss << verticesElement.toString();
    }
    ss << " ]";
    ss << " }";
    return ss.str();
}

Segment::Segment(model::Vec2 firstEnd, model::Vec2 secondEnd, double width, debugging::Color color) : firstEnd(firstEnd), secondEnd(secondEnd), width(width), color(color) { }

// Read Segment from input stream
Segment Segment::readFrom(InputStream& stream) {
    model::Vec2 firstEnd = model::Vec2::readFrom(stream);
    model::Vec2 secondEnd = model::Vec2::readFrom(stream);
    double width = stream.readDouble();
    debugging::Color color = debugging::Color::readFrom(stream);
    return Segment(firstEnd, secondEnd, width, color);
}

// Write Segment to output stream
void Segment::writeTo(OutputStream& stream) const {
    firstEnd.writeTo(stream);
    secondEnd.writeTo(stream);
    stream.write(width);
    color.writeTo(stream);
}

// Get string representation of Segment
std::string Segment::toString() const {
    std::stringstream ss;
    ss << "Segment { ";
    ss << "firstEnd: ";
    ss << firstEnd.toString();
    ss << ", ";
    ss << "secondEnd: ";
    ss << secondEnd.toString();
    ss << ", ";
    ss << "width: ";
    ss << width;
    ss << ", ";
    ss << "color: ";
    ss << color.toString();
    ss << " }";
    return ss.str();
}

GradientSegment::GradientSegment(model::Vec2 firstEnd, debugging::Color firstColor, model::Vec2 secondEnd, debugging::Color secondColor, double width) : firstEnd(firstEnd), firstColor(firstColor), secondEnd(secondEnd), secondColor(secondColor), width(width) { }

// Read GradientSegment from input stream
GradientSegment GradientSegment::readFrom(InputStream& stream) {
    model::Vec2 firstEnd = model::Vec2::readFrom(stream);
    debugging::Color firstColor = debugging::Color::readFrom(stream);
    model::Vec2 secondEnd = model::Vec2::readFrom(stream);
    debugging::Color secondColor = debugging::Color::readFrom(stream);
    double width = stream.readDouble();
    return GradientSegment(firstEnd, firstColor, secondEnd, secondColor, width);
}

// Write GradientSegment to output stream
void GradientSegment::writeTo(OutputStream& stream) const {
    firstEnd.writeTo(stream);
    firstColor.writeTo(stream);
    secondEnd.writeTo(stream);
    secondColor.writeTo(stream);
    stream.write(width);
}

// Get string representation of GradientSegment
std::string GradientSegment::toString() const {
    std::stringstream ss;
    ss << "GradientSegment { ";
    ss << "firstEnd: ";
    ss << firstEnd.toString();
    ss << ", ";
    ss << "firstColor: ";
    ss << firstColor.toString();
    ss << ", ";
    ss << "secondEnd: ";
    ss << secondEnd.toString();
    ss << ", ";
    ss << "secondColor: ";
    ss << secondColor.toString();
    ss << ", ";
    ss << "width: ";
    ss << width;
    ss << " }";
    return ss.str();
}

PolyLine::PolyLine(std::vector<model::Vec2> vertices, double width, debugging::Color color) : vertices(vertices), width(width), color(color) { }

// Read PolyLine from input stream
PolyLine PolyLine::readFrom(InputStream& stream) {
    std::vector<model::Vec2> vertices = std::vector<model::Vec2>();
    size_t verticesSize = stream.readInt();
    vertices.reserve(verticesSize);
    for (size_t verticesIndex = 0; verticesIndex < verticesSize; verticesIndex++) {
        model::Vec2 verticesElement = model::Vec2::readFrom(stream);
        vertices.emplace_back(verticesElement);
    }
    double width = stream.readDouble();
    debugging::Color color = debugging::Color::readFrom(stream);
    return PolyLine(vertices, width, color);
}

// Write PolyLine to output stream
void PolyLine::writeTo(OutputStream& stream) const {
    stream.write((int)(vertices.size()));
    for (const model::Vec2& verticesElement : vertices) {
        verticesElement.writeTo(stream);
    }
    stream.write(width);
    color.writeTo(stream);
}

// Get string representation of PolyLine
std::string PolyLine::toString() const {
    std::stringstream ss;
    ss << "PolyLine { ";
    ss << "vertices: ";
    ss << "[ ";
    for (size_t verticesIndex = 0; verticesIndex < vertices.size(); verticesIndex++) {
        const model::Vec2& verticesElement = vertices[verticesIndex];
        if (verticesIndex != 0) {
            ss << ", ";
        }
        ss << verticesElement.toString();
    }
    ss << " ]";
    ss << ", ";
    ss << "width: ";
    ss << width;
    ss << ", ";
    ss << "color: ";
    ss << color.toString();
    ss << " }";
    return ss.str();
}

GradientPolyLine::GradientPolyLine(std::vector<debugging::ColoredVertex> vertices, double width) : vertices(vertices), width(width) { }

// Read GradientPolyLine from input stream
GradientPolyLine GradientPolyLine::readFrom(InputStream& stream) {
    std::vector<debugging::ColoredVertex> vertices = std::vector<debugging::ColoredVertex>();
    size_t verticesSize = stream.readInt();
    vertices.reserve(verticesSize);
    for (size_t verticesIndex = 0; verticesIndex < verticesSize; verticesIndex++) {
        debugging::ColoredVertex verticesElement = debugging::ColoredVertex::readFrom(stream);
        vertices.emplace_back(verticesElement);
    }
    double width = stream.readDouble();
    return GradientPolyLine(vertices, width);
}

// Write GradientPolyLine to output stream
void GradientPolyLine::writeTo(OutputStream& stream) const {
    stream.write((int)(vertices.size()));
    for (const debugging::ColoredVertex& verticesElement : vertices) {
        verticesElement.writeTo(stream);
    }
    stream.write(width);
}

// Get string representation of GradientPolyLine
std::string GradientPolyLine::toString() const {
    std::stringstream ss;
    ss << "GradientPolyLine { ";
    ss << "vertices: ";
    ss << "[ ";
    for (size_t verticesIndex = 0; verticesIndex < vertices.size(); verticesIndex++) {
        const debugging::ColoredVertex& verticesElement = vertices[verticesIndex];
        if (verticesIndex != 0) {
            ss << ", ";
        }
        ss << verticesElement.toString();
    }
    ss << " ]";
    ss << ", ";
    ss << "width: ";
    ss << width;
    ss << " }";
    return ss.str();
}

    
// Read DebugData from input stream
DebugData readDebugData(InputStream& stream) {
    switch (stream.readInt()) {
    case 0:
        return PlacedText::readFrom(stream);
    case 1:
        return Circle::readFrom(stream);
    case 2:
        return GradientCircle::readFrom(stream);
    case 3:
        return Ring::readFrom(stream);
    case 4:
        return Pie::readFrom(stream);
    case 5:
        return Arc::readFrom(stream);
    case 6:
        return Rect::readFrom(stream);
    case 7:
        return Polygon::readFrom(stream);
    case 8:
        return GradientPolygon::readFrom(stream);
    case 9:
        return Segment::readFrom(stream);
    case 10:
        return GradientSegment::readFrom(stream);
    case 11:
        return PolyLine::readFrom(stream);
    case 12:
        return GradientPolyLine::readFrom(stream);
    default:
        throw std::runtime_error("Unexpected tag value");
    }
}

// Write DebugData to output stream
void writeDebugData(const DebugData& value, OutputStream& stream) {
    std::visit([&](auto& arg) {
        using T = std::decay_t<decltype(arg)>;
        if constexpr (std::is_same_v<T, PlacedText>) {
            stream.write((int) 0);
        }
        if constexpr (std::is_same_v<T, Circle>) {
            stream.write((int) 1);
        }
        if constexpr (std::is_same_v<T, GradientCircle>) {
            stream.write((int) 2);
        }
        if constexpr (std::is_same_v<T, Ring>) {
            stream.write((int) 3);
        }
        if constexpr (std::is_same_v<T, Pie>) {
            stream.write((int) 4);
        }
        if constexpr (std::is_same_v<T, Arc>) {
            stream.write((int) 5);
        }
        if constexpr (std::is_same_v<T, Rect>) {
            stream.write((int) 6);
        }
        if constexpr (std::is_same_v<T, Polygon>) {
            stream.write((int) 7);
        }
        if constexpr (std::is_same_v<T, GradientPolygon>) {
            stream.write((int) 8);
        }
        if constexpr (std::is_same_v<T, Segment>) {
            stream.write((int) 9);
        }
        if constexpr (std::is_same_v<T, GradientSegment>) {
            stream.write((int) 10);
        }
        if constexpr (std::is_same_v<T, PolyLine>) {
            stream.write((int) 11);
        }
        if constexpr (std::is_same_v<T, GradientPolyLine>) {
            stream.write((int) 12);
        }
        arg.writeTo(stream);
    }, value);
}

// Get string representation of DebugData
std::string debugDataToString(const DebugData& value) {
    return std::visit([](auto& arg) {
        return arg.toString();
    }, value);
}


}