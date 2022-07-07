'use strict';

const TcpStream = require('./tcp-stream');
const MyStrategy = require('./my-strategy');
const ServerMessage = require('./codegame/server-message');
const ClientMessage = require('./codegame/client-message');
const DebugInterface = require('./debug-interface');

class Runner {
    constructor(host, port, token) {
        this.stream = new TcpStream(host, port);
        this.token = token;
    }

    async connect() {
        await this.stream.writeString(this.token);
        await this.stream.writeInt(1);
        await this.stream.writeInt(0);
        await this.stream.writeInt(1);
        await this.stream.flush();
    }

    async run() {
        try {
            await this.connect();
            let strategy = null;
            const debugInterface = new DebugInterface(this.stream);
            while (true) {
                let message = await ServerMessage.readFrom(this.stream);
                if (message instanceof ServerMessage.UpdateConstants) {
                    strategy = new MyStrategy(message.constants);
                } else if (message instanceof ServerMessage.GetOrder) {
                    await (new ClientMessage.OrderMessage(await strategy.getOrder(message.playerView, message.debugAvailable ? debugInterface : null)).writeTo(this.stream));
                    await this.stream.flush();
                } else if (message instanceof ServerMessage.Finish) {
                    strategy.finish();
                    break;
                } else if (message instanceof ServerMessage.DebugUpdate) {
                    await strategy.debugUpdate(debugInterface);
                    await (new ClientMessage.DebugUpdateDone().writeTo(this.stream));
                    await this.stream.flush();
                } else {
                    throw new Error("Unexpected server message");
                }
            }
        } catch (e) {
            console.error(e);
            process.exit(1);
        }
    }
}


const argv = process.argv;
const argc = argv.length;
const host = argc < 3 ? '127.0.0.1' : argv[2];
const port = argc < 4 ? 31001 : parseInt(argv[3]);
const token = argc < 5 ? '0000000000000000' : argv[4];
(new Runner(host, port, token)).run();