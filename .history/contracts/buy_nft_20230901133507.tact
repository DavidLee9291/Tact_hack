import "@stdlib/deploy";
import "@stdlib/ownable";

contract BuyNft with Deployable, OwnableTransferable {
    owner: Address;
    newOwner: Address;
    price: Int;
    init(){
        self.owner = owner;
        self.price = ton("0.1");
    }

    receive(){}

     fun Buy() {
        ChangeOwner{newOwner: Address};
    }

    get fun bought(): Int {
        return 0;
    }

    get fun newOwner(): Address {
        let owner: StringBuilder = beginString();
    }
}