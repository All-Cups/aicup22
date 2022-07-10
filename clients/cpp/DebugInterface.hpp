#ifndef _DEBUG_INTERFACE_HPP_
#define _DEBUG_INTERFACE_HPP_

#include "TcpStream.hpp"
#include "debugging/DebugCommand.hpp"
#include "debugging/DebugState.hpp"
#include <memory>

class DebugInterface {
public:
    DebugInterface(TcpStream* stream);

    void addPlacedText(model::Vec2 position, std::string text, model::Vec2 alignment, double size, debugging::Color color);
    void addCircle(model::Vec2 position, double radius, debugging::Color color);
    void addGradientCircle(model::Vec2 position, double radius, debugging::Color innerColor, debugging::Color outerColor);
    void addRing(model::Vec2 position, double radius, double width, debugging::Color color);
    void addPie(model::Vec2 position, double radius, double startAngle, double endAngle, debugging::Color color);
    void addArc(model::Vec2 position, double radius, double width, double startAngle, double endAngle, debugging::Color color);
    void addRect(model::Vec2 bottomLeft, model::Vec2 size, debugging::Color color);
    void addPolygon(std::vector<model::Vec2> vertices, debugging::Color color);
    void addGradientPolygon(std::vector<debugging::ColoredVertex> vertices);
    void addSegment(model::Vec2 firstEnd, model::Vec2 secondEnd, double width, debugging::Color color);
    void addGradientSegment(model::Vec2 firstEnd, debugging::Color firstColor, model::Vec2 secondEnd, debugging::Color secondColor, double width);
    void addPolyLine(std::vector<model::Vec2> vertices, double width, debugging::Color color);
    void addGradientPolyLine(std::vector<debugging::ColoredVertex> vertices, double width);
    void add(debugging::DebugData debugData);
    void clear();
    void setAutoFlush(bool enable);
    void flush();
    void send(debugging::DebugCommand command);
    debugging::DebugState getState();

private:
    TcpStream* stream;
};

#endif