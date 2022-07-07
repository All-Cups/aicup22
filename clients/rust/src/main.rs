mod my_strategy;
mod debug_interface;

use debug_interface::DebugInterface;
use my_strategy::MyStrategy;
use ai_cup_22::*;

struct Args {
    host: String,
    port: u16,
    token: String,
}

impl Args {
    fn parse() -> Self {
        let mut args = std::env::args();
        args.next().unwrap();
        let host = args.next().unwrap_or("127.0.0.1".to_owned());
        let port = args
            .next()
            .map_or(31001, |s| s.parse().expect("Can't parse port"));
        let token = args.next().unwrap_or("0000000000000000".to_string());
        Self { host, port, token }
    }
}

struct Runner {
    reader: Box<dyn std::io::BufRead>,
    writer: Box<dyn std::io::Write>,
}

impl Runner {
    fn new(args: &Args) -> std::io::Result<Self> {
        use std::io::Write;
        use trans::Trans;
        let stream = std::net::TcpStream::connect((args.host.as_str(), args.port))?;
        stream.set_nodelay(true)?;
        let stream_clone = stream.try_clone()?;
        let reader = std::io::BufReader::new(stream);
        let mut writer = std::io::BufWriter::new(stream_clone);
        args.token.write_to(&mut writer)?;
        1i32.write_to(&mut writer)?;
        0i32.write_to(&mut writer)?;
        1i32.write_to(&mut writer)?;
        writer.flush()?;
        Ok(Self {
            reader: Box::new(reader),
            writer: Box::new(writer),
        })
    }
    fn debug_interface(&mut self) -> DebugInterface {
        DebugInterface::new(&mut self.reader, &mut self.writer)
    }
    fn run(mut self) -> std::io::Result<()> {
        use trans::Trans;
        let mut strategy = None;
        loop {
            match codegame::ServerMessage::read_from(&mut self.reader)? {
                codegame::ServerMessage::UpdateConstants {
                    constants
                } => {
                    strategy = Some(MyStrategy::new(constants));
                }
                codegame::ServerMessage::GetOrder {
                    player_view,
                    debug_available,
                } => {
                    let mut debug_interface = self.debug_interface();
                    let message = codegame::ClientMessage::OrderMessage {
                        order: strategy.as_mut().unwrap().get_order(
                            &player_view,
                            if debug_available {
                                Some(&mut debug_interface)
                            } else {
                                None
                            },
                        ),
                    };
                    message.write_to(&mut self.writer)?;
                    self.writer.flush()?;
                }
                codegame::ServerMessage::Finish {} => {
                    strategy.as_mut().unwrap().finish();
                    break;
                }
                codegame::ServerMessage::DebugUpdate {} => {
                    strategy.as_mut().unwrap().debug_update(&mut self.debug_interface());
                    codegame::ClientMessage::DebugUpdateDone {}.write_to(&mut self.writer)?;
                    self.writer.flush()?;
                }
            }
        }
        Ok(())
    }
}

fn main() -> std::io::Result<()> {
    Runner::new(&Args::parse())?.run()
}