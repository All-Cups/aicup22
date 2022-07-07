import { Stream } from "./stream";
import { Socket } from "net";

export class TcpStream extends Stream {
    private socket: Socket;
    private readBuffers: Buffer[];
    private writeBuffers: Buffer[];
    private readBufferPos: number;
    private readBufferSize: number;
    private needAmount: number | null;
    private resolve: any;
    private connection: Promise<undefined>;
    constructor(host: string, port: number) {
        super();
        const _this = this;
        this.socket = new Socket().setNoDelay(true);
        this.socket
            .setNoDelay(true)
            .on('error', (error) => {
                console.error('Socket error: ' + error.message);
                process.exit(1);
            });
        this.connection = new Promise(function (resolve) {
            _this.socket.connect(port, host, () => resolve(undefined));
        });
        this.readBuffers = [];
        this.writeBuffers = [];
        this.readBufferPos = 0;
        this.readBufferSize = 0;
        this.needAmount = null;
        this.resolve = null;
        this.socket.on('data', function (data) { _this.dataHandler(data) });
    }
    destroy() {
        this.socket.destroy();
    }
    dataHandler(data: Buffer) {
        this.readBuffers.push(data);
        this.readBufferSize += data.length;
        this.update();
    }
    update() {
        if (this.needAmount === null || this.needAmount > this.readBufferSize) {
            return;
        }
        let chunks = [];
        let needAmount = this.needAmount;
        while (needAmount > 0) {
            let currentBuffer = this.readBuffers[0];
            let currentBufferSize = currentBuffer.length - this.readBufferPos;
            let chunkLength = Math.min(needAmount, currentBufferSize);
            chunks.push(currentBuffer.slice(this.readBufferPos, this.readBufferPos + chunkLength));
            needAmount -= chunkLength;
            if (chunkLength == currentBufferSize) {
                this.readBuffers.shift();
                this.readBufferPos = 0;
            } else {
                this.readBufferPos += chunkLength;
            }
            this.readBufferSize -= chunkLength;
        }
        this.needAmount = null;
        this.resolve(Buffer.concat(chunks));
        this.update();
    }
    async read(byteCount: number): Promise<Buffer> {
        const _this = this;
        return await new Promise<Buffer>(function (resolve, reject) {
            _this.needAmount = byteCount;
            _this.resolve = resolve;
            _this.update();
        });
    }
    async write(data: Buffer): Promise<void> {
        this.writeBuffers.push(data);
    }
    async flush() {
        const _this = this;
        await this.connection;
        return await new Promise<void>(function (resolve, reject) {
            _this.socket.write(Buffer.concat(_this.writeBuffers), 'utf8', function (error) {
                if (error) {
                    return reject(error);
                }
                resolve(undefined);
                _this.writeBuffers = [];
            });
        });
    }
}