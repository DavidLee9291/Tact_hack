import { Blockchain, SandboxContract } from '@ton-community/sandbox';
import { toNano } from 'ton-core';
import { BuyNft } from '../wrappers/BuyNft';
import '@ton-community/test-utils';

describe('BuyNft', () => {
    let blockchain: Blockchain;
    let buyNft: SandboxContract<BuyNft>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();

        buyNft = blockchain.openContract(await BuyNft.fromInit());

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
    });
});
