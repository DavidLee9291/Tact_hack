import "@stdlib/deploy";
import "@stdlib/ownable";
import "./imports/messages";

contract NftMarketPlace with Deployable {
    init(){}

    receive("SaleNFT"){}

     fun saleNft(msg: TransferSale) {
        let to: Address = owner;
        let value: Int = ton("1");
        send(SendParameters{to: to,
                value: value,
                mode: SendIgnoreErrors,
                bounce: true,
                body: "Hello, World!".asComment()
            }
        );
    }
}