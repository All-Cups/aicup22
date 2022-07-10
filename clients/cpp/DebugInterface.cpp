#include "DebugInterface.hpp"
#include "codegame/ClientMessage.hpp"

DebugInterface::DebugInterface(TcpStream* stream): stream(stream) {}

void DebugInterface::addPlacedText(model::Vec2 position, std::string text, model::Vec2 alignment, double size, debugging::Color color)
{
    add(debugging::DebugData(debugging::PlacedText(position, text, alignment, size, color)));
}

void DebugInterface::addCircle(model::Vec2 position, double radius, debugging::Color color)
{
    add(debugging::DebugData(debugging::Circle(position, radius, color)));
}

void DebugInterface::addGradientCircle(model::Vec2 position, double radius, debugging::Color innerColor, debugging::Color outerColor)
{
    add(debugging::DebugData(debugging::GradientCircle(position, radius, innerColor, outerColor)));
}

void DebugInterface::addRing(model::Vec2 position, double radius, double width, debugging::Color color)
{
    add(debugging::DebugData(debugging::Ring(position, radius, width, color)));
}

void DebugInterface::addPie(model::Vec2 position, double radius, double startAngle, double endAngle, debugging::Color color)
{
    add(debugging::DebugData(debugging::Pie(position, radius, startAngle, endAngle, color)));
}

void DebugInterface::addArc(model::Vec2 position, double radius, double width, double startAngle, double endAngle, debugging::Color color)
{
    add(debugging::DebugData(debugging::Arc(position, radius, width, startAngle, endAngle, color)));
}

void DebugInterface::addRect(model::Vec2 bottomLeft, model::Vec2 size, debugging::Color color)
{
    add(debugging::DebugData(debugging::Rect(bottomLeft, size, color)));
}

void DebugInterface::addPolygon(std::vector<model::Vec2> vertices, debugging::Color color)
{
    add(debugging::DebugData(debugging::Polygon(vertices, color)));
}

void DebugInterface::addGradientPolygon(std::vector<debugging::ColoredVertex> vertices)
{
    add(debugging::DebugData(debugging::GradientPolygon(vertices)));
}

void DebugInterface::addSegment(model::Vec2 firstEnd, model::Vec2 secondEnd, double width, debugging::Color color)
{
    add(debugging::DebugData(debugging::Segment(firstEnd, secondEnd, width, color)));
}

void DebugInterface::addGradientSegment(model::Vec2 firstEnd, debugging::Color firstColor, model::Vec2 secondEnd, debugging::Color secondColor, double width)
{
    add(debugging::DebugData(debugging::GradientSegment(firstEnd, firstColor, secondEnd, secondColor, width)));
}

void DebugInterface::addPolyLine(std::vector<model::Vec2> vertices, double width, debugging::Color color)
{
    add(debugging::DebugData(debugging::PolyLine(vertices, width, color)));
}

void DebugInterface::addGradientPolyLine(std::vector<debugging::ColoredVertex> vertices, double width)
{
    add(debugging::DebugData(debugging::GradientPolyLine(vertices, width)));
}

void DebugInterface::add(debugging::DebugData debugData)
{
    send(debugging::DebugCommand(debugging::Add(debugData)));
}

void DebugInterface::clear()
{
    send(debugging::DebugCommand(debugging::Clear()));
}

void DebugInterface::setAutoFlush(bool enable)
{
    send(debugging::DebugCommand(debugging::SetAutoFlush(enable)));
}

void DebugInterface::flush()
{
    send(debugging::DebugCommand(debugging::Flush()));
}

void DebugInterface::send(debugging::DebugCommand command)
{
    codegame::ClientMessage message = codegame::DebugMessage(command);
    codegame::writeClientMessage(message, *stream);
    stream->flush();
}

debugging::DebugState DebugInterface::getState()
{
    codegame::ClientMessage message = codegame::RequestDebugState();
    codegame::writeClientMessage(message, *stream);
    stream->flush();
    return debugging::DebugState::readFrom(*stream);
}