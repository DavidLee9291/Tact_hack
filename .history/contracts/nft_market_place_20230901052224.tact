import "@stdlib/deploy";
import "@stdlib/ownable";
import "./imports/messages";

contract NftMarketPlace with Deployable {
    owner: Address;

    receive("SaleNFT"){}

     fun saleNft(msg: TransferSale) {
        self.reply("Hello, World!".asComment());
    }
}