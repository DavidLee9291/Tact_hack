import "@strlib/deploy";
import "@strlib/ownable";

contract NftMarketPlace {
    NftMarketPlace: Address;
    ownable: Address;

    receive(){
        self.Address;
    }

     fun saleNft() {}
}