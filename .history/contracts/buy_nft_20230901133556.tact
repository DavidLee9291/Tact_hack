import "@stdlib/deploy";
import "@stdlib/ownable";

contract BuyNft with Deployable, OwnableTransferable {
    owner: Address;
    newOwner: Address;
    price: Int;
    init(){
        self.owner = ChangeOwner{newOwner: Address};
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