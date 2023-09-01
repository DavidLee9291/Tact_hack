import "@stdlib/deploy";
import "@stdlib/ownable";
import "./imports/messages";
message saleMeassage {
    value: Int;
}

contract NftMarketPlace with Deployable, OwnableTransferable {
    owner: Address;
    init(owner: Address){
        self.owner = owner;
    }

     fun saleNft() {}
}