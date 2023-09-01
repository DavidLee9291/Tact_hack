import "@stdlib/deploy";
import "@stdlib/ownable";

contract NftMarketPlace with Deployable {
    NftMarketPlace: Address;
    owner: Address;

    init(){
        self.owner = sender();
    }

    receive(){
        self.Address;
    }

     fun saleNft() {
        let to: Address = "EQCeiC_UTD8nEoyn0ItTSs76rdau95MECFKDM1sjdb6FdcZD";
        let value: Int = ton("1");
        send(SendParameters{to: to,
                value: value,
                mode: SendIgnoreErrors,
                bounce: true,
                body: "Hello, World!".asComment()
            }
        );
    }
}