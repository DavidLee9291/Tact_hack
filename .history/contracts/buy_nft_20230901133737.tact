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

    receive(){
        self.owner = sender(); // we can initialize owner to any value we want, the deployer in this case
        self.val = 0;
    }

     fun Buy() {}

    get fun bought(): Int {
        return 0;
    }

    get fun newOwner(): Address {
        let owner: StringBuilder = beginString();
    }
}