#include "DebugInterface.hpp"
#include "codegame/ClientMessage.hpp"

DebugInterface::DebugInterface(TcpStream* stream): stream(stream) {}

void DebugInterface::addPlacedText(model::Vec2 position, std::string text, model::Vec2 alignment, double size, debugging::Color color)
{
    add(std::shared_ptr<debugging::DebugData>(new debugging::DebugData::PlacedText(position, text, alignment, size, color)));
}

void DebugInterface::addCircle(model::Vec2 position, double radius, debugging::Color color)
{
    add(std::shared_ptr<debugging::DebugData>(new debugging::DebugData::Circle(position, radius, color)));
}

void DebugInterface::addGradientCircle(model::Vec2 position, double radius, debugging::Color innerColor, debugging::Color outerColor)
{
    add(std::shared_ptr<debugging::DebugData>(new debugging::DebugData::GradientCircle(position, radius, innerColor, outerColor)));
}

void DebugInterface::addRing(model::Vec2 position, double radius, double width, debugging::Color color)
{
    add(std::shared_ptr<debugging::DebugData>(new debugging::DebugData::Ring(position, radius, width, color)));
}

void DebugInterface::addPie(model::Vec2 position, double radius, double startAngle, double endAngle, debugging::Color color)
{
    add(std::shared_ptr<debugging::DebugData>(new debugging::DebugData::Pie(position, radius, startAngle, endAngle, color)));
}

void DebugInterface::addArc(model::Vec2 position, double radius, double width, double startAngle, double endAngle, debugging::Color color)
{
    add(std::shared_ptr<debugging::DebugData>(new debugging::DebugData::Arc(position, radius, width, startAngle, endAngle, color)));
}

void DebugInterface::addRect(model::Vec2 bottomLeft, model::Vec2 size, debugging::Color color)
{
    add(std::shared_ptr<debugging::DebugData>(new debugging::DebugData::Rect(bottomLeft, size, color)));
}

void DebugInterface::addPolygon(std::vector<model::Vec2> vertices, debugging::Color color)
{
    add(std::shared_ptr<debugging::DebugData>(new debugging::DebugData::Polygon(vertices, color)));
}

void DebugInterface::addGradientPolygon(std::vector<debugging::ColoredVertex> vertices)
{
    add(std::shared_ptr<debugging::DebugData>(new debugging::DebugData::GradientPolygon(vertices)));
}

void DebugInterface::addSegment(model::Vec2 firstEnd, model::Vec2 secondEnd, double width, debugging::Color color)
{
    add(std::shared_ptr<debugging::DebugData>(new debugging::DebugData::Segment(firstEnd, secondEnd, width, color)));
}

void DebugInterface::addGradientSegment(model::Vec2 firstEnd, debugging::Color firstColor, model::Vec2 secondEnd, debugging::Color secondColor, double width)
{
    add(std::shared_ptr<debugging::DebugData>(new debugging::DebugData::GradientSegment(firstEnd, firstColor, secondEnd, secondColor, width)));
}

void DebugInterface::addPolyLine(std::vector<model::Vec2> vertices, double width, debugging::Color color)
{
    add(std::shared_ptr<debugging::DebugData>(new debugging::DebugData::PolyLine(vertices, width, color)));
}

void DebugInterface::addGradientPolyLine(std::vector<debugging::ColoredVertex> vertices, double width)
{
    add(std::shared_ptr<debugging::DebugData>(new debugging::DebugData::GradientPolyLine(vertices, width)));
}

void DebugInterface::add(std::shared_ptr<debugging::DebugData> debugData)
{
    send(std::shared_ptr<debugging::DebugCommand>(new debugging::DebugCommand::Add(debugData)));
}

void DebugInterface::clear()
{
    send(std::shared_ptr<debugging::DebugCommand>(new debugging::DebugCommand::Clear()));
}

void DebugInterface::setAutoFlush(bool enable)
{
    send(std::shared_ptr<debugging::DebugCommand>(new debugging::DebugCommand::SetAutoFlush(enable)));
}

void DebugInterface::flush()
{
    send(std::shared_ptr<debugging::DebugCommand>(new debugging::DebugCommand::Flush()));
}

void DebugInterface::send(std::shared_ptr<debugging::DebugCommand> command)
{
    codegame::ClientMessage::DebugMessage(command).writeTo(*stream);
    stream->flush();
}

debugging::DebugState DebugInterface::getState()
{
    codegame::ClientMessage::RequestDebugState().writeTo(*stream);
    stream->flush();
    return debugging::DebugState::readFrom(*stream);
}