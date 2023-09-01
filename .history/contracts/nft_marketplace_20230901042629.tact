import "@strlib/deploy";
import "@strlib/ownable";

contract NftMarketPlace {
    NftMarketPlace: Address;
    ownable: Address;

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