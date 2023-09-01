import "@stdlib/deploy";
import "@stdlib/ownable";
import "./imports/messages";
message SetName {
    newName: String;
}

contract NftMarketPlace with Deployable {
    name: String = " ";
    init(){}

    receive("SaleNFT"){
        let reply: StringBuilder = beginString();
        reply.append("Hello");
        reply.append(self.name);
        send(SendParameters{to: to,
                value: value,
                mode: SendIgnoreErrors,
                bounce: true,
                body: reply.toString().asComment()
            }
        );
    }
}