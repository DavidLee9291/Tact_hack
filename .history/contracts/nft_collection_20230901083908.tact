import "@stdlib/deploy";
import "@stdlib/ownable";
import "./nft_item.tact";

contract NftCollection with Deployable, OwnableTransferable {
    const minTonForStorage: Int = ton("0.03");
    const gasConsumption: Int = ton("0.03");
    owner: Address;
    next_item_index: Int as uint32 = 0;
    collection_content: String;
    nft_img: String;
    init(){
        self.owner = sender();
        self.collection_content = "TACT Bootcamp NFT";
        self.nft_img = " ";
    }

    receive("Mint"){
        self.requireOwner();
        self.mint(sender());
    }

     fun mint(receiver: Address, msg: CollectionMetadata) {
        require(self.next_item_index >= 0, "non-sequential NFTs");
        let nft_init: StateInit = self.getNftItemInit(self.next_item_index);
        let msgValue: Int = context().value;
        let tonBalanceBeforeMsg: Int = myBalance() - msgValue;
        let storageFee: Int = self.minTonForStorage - min(tonBalanceBeforeMsg, self.minTonForStorage);
        msgValue = msgValue - storageFee + self.gasConsumption;
        let nft_img: String = msg.image;
        let nft_name: String = msg.name;
        let nft_description: String = msg.description;
        send(SendParameters{to: contractAddress(nft_init),
                value: context().value,
                mode: SendIgnoreErrors,
                body: Transfer{queryId: 0, new_owner: receiver}.toCell(),
                code: nft_init.code,
                data: nft_init.data
            }
        );
        self.next_item_index = self.next_item_index + 1;
    }

    get fun getNftItemInit(item_index: Int): StateInit {
        let b: StringBuilder = beginString();
        b.append("Item # ");
        b.append(item_index.toString());
        return initOf NftItem(self.owner, myAddress(), item_index, b.toString());
    }

    get fun get_nft_address_by_index(item_index: Int): Address {
        let initCode: StateInit = self.getNftItemInit(item_index);
        return contractAddress(initCode);
    }

    get fun getCollectionData(): CollectionData {
        return
            CollectionData{next_item_index: self.next_item_index,
                owner_address: self.owner,
                collection_content: self.collection_content.asSlice().asCell()
            };
    }
}