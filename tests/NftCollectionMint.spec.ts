import { Blockchain, SandboxContract } from '@ton-community/sandbox';
import { toNano } from 'ton-core';
import { NftCollectionMint } from '../wrappers/NftCollectionMint';
import '@ton-community/test-utils';

describe('NftCollectionMint', () => {
    let blockchain: Blockchain;
    let nftCollectionMint: SandboxContract<NftCollectionMint>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();

        nftCollectionMint = blockchain.openContract(await NftCollectionMint.fromInit());

        const deployer = await blockchain.treasury('deployer');

        const deployResult = await nftCollectionMint.send(
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
            to: nftCollectionMint.address,
            deploy: true,
            success: true,
        });
    });

    it('should deploy', async () => {
        // the check is done inside beforeEach
        // blockchain and nftCollectionMint are ready to use
    });
});
