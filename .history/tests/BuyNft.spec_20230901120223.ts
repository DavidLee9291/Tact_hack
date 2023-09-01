import { Blockchain, SandboxContract } from '@ton-community/sandbox';
import { toNano } from 'ton-core';
import { BuyNft } from '../wrappers/BuyNft';
import '@ton-community/test-utils';

describe('BuyNft', () => {
    let blockchain: Blockchain;
    let buyNft: SandboxContract<BuyNft>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        const owner = await blockchain.treasury('owner');
        buyNft = blockchain.openContract(await BuyNft.fromInit(owner.address));

        const deployer = await blockchain.treasury('deployer');

        const deployResult = await buyNft.send(
            deployer.getSender(),
            {
                value: toNano('0.05'),
            },
            {
                $$type: 'Deploy',
                queryId: 0n,
            }
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: deployer.address,
            to: buyNft.address,
            deploy: true,
            success: true,
        });
    });

    it('should deploy', async () => {
        // the check is done inside beforeEach
        // blockchain and buyNft are ready to use
        const deployer = await blockchain.treasury('deployer');
    });

    it('should buy nft', async () => {
        const owner = await blockchain.treasury('owner');
        buyNft = blockchain.openContract(await BuyNft.fromInit(owner.address));
        const deployer = await blockchain.treasury('deployer');

        await buyNft.send(
            owner.getSender(),
            {
                value: toNano("0.1"),
            },
            {
                $$type: 'ChangeOwner',
                queryId: 0n,
                newOwner: owner.address,
            }
        );
        

        expect(buyNft.getOwner()).toEqualAddress(deployer.address,);
    })
});
