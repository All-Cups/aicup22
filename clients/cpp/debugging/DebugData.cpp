#include "DebugData.hpp"
#include <stdexcept>

namespace debugging {

DebugData::PlacedText::PlacedText(model::Vec2 position, std::string text, model::Vec2 alignment, double size, debugging::Color color) : position(position), text(text), alignment(alignment), size(size), color(color) { }

// Read PlacedText from input stream
DebugData::PlacedText DebugData::PlacedText::readFrom(InputStream& stream) {
    model::Vec2 position = model::Vec2::readFrom(stream);
    std::string text = stream.readString();
    model::Vec2 alignment = model::Vec2::readFrom(stream);
    double size = stream.readDouble();
    debugging::Color color = debugging::Color::readFrom(stream);
    return DebugData::PlacedText(position, text, alignment, size, color);
}

// Write PlacedText to output stream
void DebugData::PlacedText::writeTo(OutputStream& stream) const {
    stream.write(TAG);
    position.writeTo(stream);
    stream.write(text);
    alignment.writeTo(stream);
    stream.write(size);
    color.writeTo(stream);
}

// Get string representation of PlacedText
std::string DebugData::PlacedText::toString() const {
    std::stringstream ss;
    ss << "DebugData::PlacedText { ";
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

DebugData::Circle::Circle(model::Vec2 position, double radius, debugging::Color color) : position(position), radius(radius), color(color) { }

// Read Circle from input stream
DebugData::Circle DebugData::Circle::readFrom(InputStream& stream) {
    model::Vec2 position = model::Vec2::readFrom(stream);
    double radius = stream.readDouble();
    debugging::Color color = debugging::Color::readFrom(stream);
    return DebugData::Circle(position, radius, color);
}

// Write Circle to output stream
void DebugData::Circle::writeTo(OutputStream& stream) const {
    stream.write(TAG);
    position.writeTo(stream);
    stream.write(radius);
    color.writeTo(stream);
}

// Get string representation of Circle
std::string DebugData::Circle::toString() const {
    std::stringstream ss;
    ss << "DebugData::Circle { ";
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

DebugData::GradientCircle::GradientCircle(model::Vec2 position, double radius, debugging::Color innerColor, debugging::Color outerColor) : position(position), radius(radius), innerColor(innerColor), outerColor(outerColor) { }

// Read GradientCircle from input stream
DebugData::GradientCircle DebugData::GradientCircle::readFrom(InputStream& stream) {
    model::Vec2 position = model::Vec2::readFrom(stream);
    double radius = stream.readDouble();
    debugging::Color innerColor = debugging::Color::readFrom(stream);
    debugging::Color outerColor = debugging::Color::readFrom(stream);
    return DebugData::GradientCircle(position, radius, innerColor, outerColor);
}

// Write GradientCircle to output stream
void DebugData::GradientCircle::writeTo(OutputStream& stream) const {
    stream.write(TAG);
    position.writeTo(stream);
    stream.write(radius);
    innerColor.writeTo(stream);
    outerColor.writeTo(stream);
}

// Get string representation of GradientCircle
std::string DebugData::GradientCircle::toString() const {
    std::stringstream ss;
    ss << "DebugData::GradientCircle { ";
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

DebugData::Ring::Ring(model::Vec2 position, double radius, double width, debugging::Color color) : position(position), radius(radius), width(width), color(color) { }

// Read Ring from input stream
DebugData::Ring DebugData::Ring::readFrom(InputStream& stream) {
    model::Vec2 position = model::Vec2::readFrom(stream);
    double radius = stream.readDouble();
    double width = stream.readDouble();
    debugging::Color color = debugging::Color::readFrom(stream);
    return DebugData::Ring(position, radius, width, color);
}

// Write Ring to output stream
void DebugData::Ring::writeTo(OutputStream& stream) const {
    stream.write(TAG);
    position.writeTo(stream);
    stream.write(radius);
    stream.write(width);
    color.writeTo(stream);
}

// Get string representation of Ring
std::string DebugData::Ring::toString() const {
    std::stringstream ss;
    ss << "DebugData::Ring { ";
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

DebugData::Pie::Pie(model::Vec2 position, double radius, double startAngle, double endAngle, debugging::Color color) : position(position), radius(radius), startAngle(startAngle), endAngle(endAngle), color(color) { }

// Read Pie from input stream
DebugData::Pie DebugData::Pie::readFrom(InputStream& stream) {
    model::Vec2 position = model::Vec2::readFrom(stream);
    double radius = stream.readDouble();
    double startAngle = stream.readDouble();
    double endAngle = stream.readDouble();
    debugging::Color color = debugging::Color::readFrom(stream);
    return DebugData::Pie(position, radius, startAngle, endAngle, color);
}

// Write Pie to output stream
void DebugData::Pie::writeTo(OutputStream& stream) const {
    stream.write(TAG);
    position.writeTo(stream);
    stream.write(radius);
    stream.write(startAngle);
    stream.write(endAngle);
    color.writeTo(stream);
}

// Get string representation of Pie
std::string DebugData::Pie::toString() const {
    std::stringstream ss;
    ss << "DebugData::Pie { ";
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

DebugData::Arc::Arc(model::Vec2 position, double radius, double width, double startAngle, double endAngle, debugging::Color color) : position(position), radius(radius), width(width), startAngle(startAngle), endAngle(endAngle), color(color) { }

// Read Arc from input stream
DebugData::Arc DebugData::Arc::readFrom(InputStream& stream) {
    model::Vec2 position = model::Vec2::readFrom(stream);
    double radius = stream.readDouble();
    double width = stream.readDouble();
    double startAngle = stream.readDouble();
    double endAngle = stream.readDouble();
    debugging::Color color = debugging::Color::readFrom(stream);
    return DebugData::Arc(position, radius, width, startAngle, endAngle, color);
}

// Write Arc to output stream
void DebugData::Arc::writeTo(OutputStream& stream) const {
    stream.write(TAG);
    position.writeTo(stream);
    stream.write(radius);
    stream.write(width);
    stream.write(startAngle);
    stream.write(endAngle);
    color.writeTo(stream);
}

// Get string representation of Arc
std::string DebugData::Arc::toString() const {
    std::stringstream ss;
    ss << "DebugData::Arc { ";
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

DebugData::Rect::Rect(model::Vec2 bottomLeft, model::Vec2 size, debugging::Color color) : bottomLeft(bottomLeft), size(size), color(color) { }

// Read Rect from input stream
DebugData::Rect DebugData::Rect::readFrom(InputStream& stream) {
    model::Vec2 bottomLeft = model::Vec2::readFrom(stream);
    model::Vec2 size = model::Vec2::readFrom(stream);
    debugging::Color color = debugging::Color::readFrom(stream);
    return DebugData::Rect(bottomLeft, size, color);
}

// Write Rect to output stream
void DebugData::Rect::writeTo(OutputStream& stream) const {
    stream.write(TAG);
    bottomLeft.writeTo(stream);
    size.writeTo(stream);
    color.writeTo(stream);
}

// Get string representation of Rect
std::string DebugData::Rect::toString() const {
    std::stringstream ss;
    ss << "DebugData::Rect { ";
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

DebugData::Polygon::Polygon(std::vector<model::Vec2> vertices, debugging::Color color) : vertices(vertices), color(color) { }

// Read Polygon from input stream
DebugData::Polygon DebugData::Polygon::readFrom(InputStream& stream) {
    std::vector<model::Vec2> vertices = std::vector<model::Vec2>();
    size_t verticesSize = stream.readInt();
    vertices.reserve(verticesSize);
    for (size_t verticesIndex = 0; verticesIndex < verticesSize; verticesIndex++) {
        model::Vec2 verticesElement = model::Vec2::readFrom(stream);
        vertices.emplace_back(verticesElement);
    }
    debugging::Color color = debugging::Color::readFrom(stream);
    return DebugData::Polygon(vertices, color);
}

// Write Polygon to output stream
void DebugData::Polygon::writeTo(OutputStream& stream) const {
    stream.write(TAG);
    stream.write((int)(vertices.size()));
    for (const model::Vec2& verticesElement : vertices) {
        verticesElement.writeTo(stream);
    }
    color.writeTo(stream);
}

// Get string representation of Polygon
std::string DebugData::Polygon::toString() const {
    std::stringstream ss;
    ss << "DebugData::Polygon { ";
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

DebugData::GradientPolygon::GradientPolygon(std::vector<debugging::ColoredVertex> vertices) : vertices(vertices) { }

// Read GradientPolygon from input stream
DebugData::GradientPolygon DebugData::GradientPolygon::readFrom(InputStream& stream) {
    std::vector<debugging::ColoredVertex> vertices = std::vector<debugging::ColoredVertex>();
    size_t verticesSize = stream.readInt();
    vertices.reserve(verticesSize);
    for (size_t verticesIndex = 0; verticesIndex < verticesSize; verticesIndex++) {
        debugging::ColoredVertex verticesElement = debugging::ColoredVertex::readFrom(stream);
        vertices.emplace_back(verticesElement);
    }
    return DebugData::GradientPolygon(vertices);
}

// Write GradientPolygon to output stream
void DebugData::GradientPolygon::writeTo(OutputStream& stream) const {
    stream.write(TAG);
    stream.write((int)(vertices.size()));
    for (const debugging::ColoredVertex& verticesElement : vertices) {
        verticesElement.writeTo(stream);
    }
}

// Get string representation of GradientPolygon
std::string DebugData::GradientPolygon::toString() const {
    std::stringstream ss;
    ss << "DebugData::GradientPolygon { ";
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

DebugData::Segment::Segment(model::Vec2 firstEnd, model::Vec2 secondEnd, double width, debugging::Color color) : firstEnd(firstEnd), secondEnd(secondEnd), width(width), color(color) { }

// Read Segment from input stream
DebugData::Segment DebugData::Segment::readFrom(InputStream& stream) {
    model::Vec2 firstEnd = model::Vec2::readFrom(stream);
    model::Vec2 secondEnd = model::Vec2::readFrom(stream);
    double width = stream.readDouble();
    debugging::Color color = debugging::Color::readFrom(stream);
    return DebugData::Segment(firstEnd, secondEnd, width, color);
}

// Write Segment to output stream
void DebugData::Segment::writeTo(OutputStream& stream) const {
    stream.write(TAG);
    firstEnd.writeTo(stream);
    secondEnd.writeTo(stream);
    stream.write(width);
    color.writeTo(stream);
}

// Get string representation of Segment
std::string DebugData::Segment::toString() const {
    std::stringstream ss;
    ss << "DebugData::Segment { ";
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

DebugData::GradientSegment::GradientSegment(model::Vec2 firstEnd, debugging::Color firstColor, model::Vec2 secondEnd, debugging::Color secondColor, double width) : firstEnd(firstEnd), firstColor(firstColor), secondEnd(secondEnd), secondColor(secondColor), width(width) { }

// Read GradientSegment from input stream
DebugData::GradientSegment DebugData::GradientSegment::readFrom(InputStream& stream) {
    model::Vec2 firstEnd = model::Vec2::readFrom(stream);
    debugging::Color firstColor = debugging::Color::readFrom(stream);
    model::Vec2 secondEnd = model::Vec2::readFrom(stream);
    debugging::Color secondColor = debugging::Color::readFrom(stream);
    double width = stream.readDouble();
    return DebugData::GradientSegment(firstEnd, firstColor, secondEnd, secondColor, width);
}

// Write GradientSegment to output stream
void DebugData::GradientSegment::writeTo(OutputStream& stream) const {
    stream.write(TAG);
    firstEnd.writeTo(stream);
    firstColor.writeTo(stream);
    secondEnd.writeTo(stream);
    secondColor.writeTo(stream);
    stream.write(width);
}

// Get string representation of GradientSegment
std::string DebugData::GradientSegment::toString() const {
    std::stringstream ss;
    ss << "DebugData::GradientSegment { ";
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

DebugData::PolyLine::PolyLine(std::vector<model::Vec2> vertices, double width, debugging::Color color) : vertices(vertices), width(width), color(color) { }

// Read PolyLine from input stream
DebugData::PolyLine DebugData::PolyLine::readFrom(InputStream& stream) {
    std::vector<model::Vec2> vertices = std::vector<model::Vec2>();
    size_t verticesSize = stream.readInt();
    vertices.reserve(verticesSize);
    for (size_t verticesIndex = 0; verticesIndex < verticesSize; verticesIndex++) {
        model::Vec2 verticesElement = model::Vec2::readFrom(stream);
        vertices.emplace_back(verticesElement);
    }
    double width = stream.readDouble();
    debugging::Color color = debugging::Color::readFrom(stream);
    return DebugData::PolyLine(vertices, width, color);
}

// Write PolyLine to output stream
void DebugData::PolyLine::writeTo(OutputStream& stream) const {
    stream.write(TAG);
    stream.write((int)(vertices.size()));
    for (const model::Vec2& verticesElement : vertices) {
        verticesElement.writeTo(stream);
    }
    stream.write(width);
    color.writeTo(stream);
}

// Get string representation of PolyLine
std::string DebugData::PolyLine::toString() const {
    std::stringstream ss;
    ss << "DebugData::PolyLine { ";
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

DebugData::GradientPolyLine::GradientPolyLine(std::vector<debugging::ColoredVertex> vertices, double width) : vertices(vertices), width(width) { }

// Read GradientPolyLine from input stream
DebugData::GradientPolyLine DebugData::GradientPolyLine::readFrom(InputStream& stream) {
    std::vector<debugging::ColoredVertex> vertices = std::vector<debugging::ColoredVertex>();
    size_t verticesSize = stream.readInt();
    vertices.reserve(verticesSize);
    for (size_t verticesIndex = 0; verticesIndex < verticesSize; verticesIndex++) {
        debugging::ColoredVertex verticesElement = debugging::ColoredVertex::readFrom(stream);
        vertices.emplace_back(verticesElement);
    }
    double width = stream.readDouble();
    return DebugData::GradientPolyLine(vertices, width);
}

// Write GradientPolyLine to output stream
void DebugData::GradientPolyLine::writeTo(OutputStream& stream) const {
    stream.write(TAG);
    stream.write((int)(vertices.size()));
    for (const debugging::ColoredVertex& verticesElement : vertices) {
        verticesElement.writeTo(stream);
    }
    stream.write(width);
}

// Get string representation of GradientPolyLine
std::string DebugData::GradientPolyLine::toString() const {
    std::stringstream ss;
    ss << "DebugData::GradientPolyLine { ";
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
std::shared_ptr<DebugData> DebugData::readFrom(InputStream& stream) {
    switch (stream.readInt()) {
    case 0:
        return std::shared_ptr<DebugData::PlacedText>(new DebugData::PlacedText(DebugData::PlacedText::readFrom(stream)));
    case 1:
        return std::shared_ptr<DebugData::Circle>(new DebugData::Circle(DebugData::Circle::readFrom(stream)));
    case 2:
        return std::shared_ptr<DebugData::GradientCircle>(new DebugData::GradientCircle(DebugData::GradientCircle::readFrom(stream)));
    case 3:
        return std::shared_ptr<DebugData::Ring>(new DebugData::Ring(DebugData::Ring::readFrom(stream)));
    case 4:
        return std::shared_ptr<DebugData::Pie>(new DebugData::Pie(DebugData::Pie::readFrom(stream)));
    case 5:
        return std::shared_ptr<DebugData::Arc>(new DebugData::Arc(DebugData::Arc::readFrom(stream)));
    case 6:
        return std::shared_ptr<DebugData::Rect>(new DebugData::Rect(DebugData::Rect::readFrom(stream)));
    case 7:
        return std::shared_ptr<DebugData::Polygon>(new DebugData::Polygon(DebugData::Polygon::readFrom(stream)));
    case 8:
        return std::shared_ptr<DebugData::GradientPolygon>(new DebugData::GradientPolygon(DebugData::GradientPolygon::readFrom(stream)));
    case 9:
        return std::shared_ptr<DebugData::Segment>(new DebugData::Segment(DebugData::Segment::readFrom(stream)));
    case 10:
        return std::shared_ptr<DebugData::GradientSegment>(new DebugData::GradientSegment(DebugData::GradientSegment::readFrom(stream)));
    case 11:
        return std::shared_ptr<DebugData::PolyLine>(new DebugData::PolyLine(DebugData::PolyLine::readFrom(stream)));
    case 12:
        return std::shared_ptr<DebugData::GradientPolyLine>(new DebugData::GradientPolyLine(DebugData::GradientPolyLine::readFrom(stream)));
    default:
        throw std::runtime_error("Unexpected tag value");
    }
}

}