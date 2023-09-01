import "@stdlib/deploy";
import "@stdlib/ownable";
import "./imports/messages";
message SetName {
    newName: String;
}

contract NftMarketPlace with Deployable, OwnableTransferable {
    name: String = " ";
    init(){}

    receive("SaleNFT"){
        let reply: StringBuilder = beginString();
        reply.append("Hello");
        reply.append(self.name);
        send(SendParameters{to: sender(),
                value: 0,
                mode: SendIgnoreErrors,
                bounce: true,
                body: reply.toString().asComment()
            }
        );
    }

    get fun hello(): String {
        let hello: StringBuilder = beginString();
        hello.append("Hello ");
        hello.append(self.name);
        return hello.toString();
    }
}