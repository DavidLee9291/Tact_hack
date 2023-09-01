import "@stdlib/deploy";
import "@stdlib/ownable";
import "./imports/messages";

contract NftMarketPlace with Deployable, OwnableTransferable {
    owner: Address;
    init(){}

    receive("SaleNFT"){}

     fun saleNft(msg: TransferSale) {
        self.reply("Hello, World!".asComment());
    }
}