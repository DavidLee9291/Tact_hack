import "@stdlib/deploy";
import "@stdlib/ownable";

contract BuyNft with Deployable, OwnableTransferable {
    owner: Address;
    price: Int;

    init(){
        self.owner = owner;
        self.price = ton("0.1");
    }

    receive(){
        self.owner = sender();
    }

    get fun bought(): Int {
        return 0;
    }
}