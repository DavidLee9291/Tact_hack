import "@stdlib/deploy";
import "@stdlib/ownable";
import "./imports/messages";

contract NftMarketPlace with Deployable, OwnableTransferable {
    owner: Address;
    init(owner: Address){
        self.owner = owner;
    }

    receive("SaleNFT"){}

     fun saleNft(msg: TransferSale) {
        dump(msg);
    }
}