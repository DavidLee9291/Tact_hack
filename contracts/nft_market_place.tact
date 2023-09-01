import "@stdlib/deploy";
import "@stdlib/ownable";
import "./imports/messages";
message SetName {
    newName: String;
}

contract NftMarketPlace with Deployable, OwnableTransferable {
    owner: Address;
    name: String = " ";
    init(){
        self.owner = sender();
    }

    receive(msg: SetName){
        self.requireOwner();
        self.name = msg.newName;
    }

    receive("say hello"){
        let reply: StringBuilder = beginString();
        reply.append("Hello");
        reply.append(self.name);
        //self.reply(reply.toString().asComment());
        send(SendParameters{to: sender(), value: 0, mode: SendIgnoreErrors, body: reply.toString().asComment()});
    }

    get fun hello(): String {
        let hello: StringBuilder = beginString();
        hello.append("Hello ");
        hello.append(self.name);
        return hello.toString();
    }
}