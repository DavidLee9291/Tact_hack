import "@stdlib/deploy";
import "@stdlib/ownable";

contract BuyNft with Deployable, OwnableTransferable {
    owner: Address;
    price: Int;
    init(owner: Address){
        self.owner = owner;
        self.price = ton("0.1");
    }

    receive(){}

     fun Buy() {}

    get fun bought(): Int {
        return 0;
    }

    get fun newOwner(): Address {
        let owner: StringBuilder = beginString();
    }
}