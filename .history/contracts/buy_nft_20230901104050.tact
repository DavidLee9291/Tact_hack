import "@stdlib/deploy";

contract BuyNft with Deployable, OwnableTransferable {
    owner: Address;

    init(owner: Address){
        self.owner = owner;
    }
}