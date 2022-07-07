use ai_cup_22::*;

pub struct DebugInterface<'a> {
    reader: &'a mut dyn std::io::Read,
    writer: &'a mut dyn std::io::Write,
}

impl<'a> DebugInterface<'a> {
    pub fn new(reader: &'a mut dyn std::io::Read, writer: &'a mut dyn std::io::Write) -> Self {
        Self { reader, writer }
    }

    pub fn add_placed_text(&mut self, position: model::Vec2, text: String, alignment: model::Vec2, size: f64, color: debugging::Color) {
        self.add(debugging::DebugData::PlacedText { position, text, alignment, size, color });
    }
    
    pub fn add_circle(&mut self, position: model::Vec2, radius: f64, color: debugging::Color) {
        self.add(debugging::DebugData::Circle { position, radius, color });
    }
    
    pub fn add_gradient_circle(&mut self, position: model::Vec2, radius: f64, inner_color: debugging::Color, outer_color: debugging::Color) {
        self.add(debugging::DebugData::GradientCircle { position, radius, inner_color, outer_color });
    }
    
    pub fn add_ring(&mut self, position: model::Vec2, radius: f64, width: f64, color: debugging::Color) {
        self.add(debugging::DebugData::Ring { position, radius, width, color });
    }
    
    pub fn add_pie(&mut self, position: model::Vec2, radius: f64, start_angle: f64, end_angle: f64, color: debugging::Color) {
        self.add(debugging::DebugData::Pie { position, radius, start_angle, end_angle, color });
    }
    
    pub fn add_arc(&mut self, position: model::Vec2, radius: f64, width: f64, start_angle: f64, end_angle: f64, color: debugging::Color) {
        self.add(debugging::DebugData::Arc { position, radius, width, start_angle, end_angle, color });
    }
    
    pub fn add_rect(&mut self, bottom_left: model::Vec2, size: model::Vec2, color: debugging::Color) {
        self.add(debugging::DebugData::Rect { bottom_left, size, color });
    }
    
    pub fn add_polygon(&mut self, vertices: Vec<model::Vec2>, color: debugging::Color) {
        self.add(debugging::DebugData::Polygon { vertices, color });
    }
    
    pub fn add_gradient_polygon(&mut self, vertices: Vec<debugging::ColoredVertex>) {
        self.add(debugging::DebugData::GradientPolygon { vertices });
    }
    
    pub fn add_segment(&mut self, first_end: model::Vec2, second_end: model::Vec2, width: f64, color: debugging::Color) {
        self.add(debugging::DebugData::Segment { first_end, second_end, width, color });
    }
    
    pub fn add_gradient_segment(&mut self, first_end: model::Vec2, first_color: debugging::Color, second_end: model::Vec2, second_color: debugging::Color, width: f64) {
        self.add(debugging::DebugData::GradientSegment { first_end, first_color, second_end, second_color, width });
    }
    
    pub fn add_poly_line(&mut self, vertices: Vec<model::Vec2>, width: f64, color: debugging::Color) {
        self.add(debugging::DebugData::PolyLine { vertices, width, color });
    }
    
    pub fn add_gradient_poly_line(&mut self, vertices: Vec<debugging::ColoredVertex>, width: f64) {
        self.add(debugging::DebugData::GradientPolyLine { vertices, width });
    }

    pub fn add(&mut self, debug_data: debugging::DebugData) {
        self.send(debugging::DebugCommand::Add { debug_data });
    }
    
    pub fn clear(&mut self) {
        self.send(debugging::DebugCommand::Clear {  });
    }
    
    pub fn set_auto_flush(&mut self, enable: bool) {
        self.send(debugging::DebugCommand::SetAutoFlush { enable });
    }
    
    pub fn flush(&mut self) {
        self.send(debugging::DebugCommand::Flush {  });
    }

    pub fn send(&mut self, command: debugging::DebugCommand) {
        use trans::Trans;
        codegame::ClientMessage::DebugMessage { command }
            .write_to(self.writer)
            .expect("Failed to write custom debug data");
        self.writer.flush().expect("Failed to flush");
    }

    pub fn get_state(&mut self) -> debugging::DebugState {
        use trans::Trans;
        codegame::ClientMessage::RequestDebugState {}
            .write_to(self.writer)
            .expect("Failed to write request debug state message");
        self.writer.flush().expect("Failed to flush");
        debugging::DebugState::read_from(self.reader).expect("Failed to read debug state")
    }
}