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
        let to: Address = sender();
        let value: Int = ton("0.1");
        send(SendParameters{to: to,
                value: value,
                mode: SendIgnoreErrors,
                bounce: true,
                body: "Hello, World!".asComment()
            }
        );
    }
}