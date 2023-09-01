import { Blockchain, SandboxContract } from '@ton-community/sandbox';
import { toNano } from 'ton-core';
import { NftMarketPlace } from '../wrappers/NftMarketPlace';
import '@ton-community/test-utils';

describe('NftMarketPlace', () => {
    let blockchain: Blockchain;
    let nftMarketPlace: SandboxContract<NftMarketPlace>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();

        nftMarketPlace = blockchain.openContract(await NftMarketPlace.fromInit());

        const deployer = await blockchain.treasury('deployer');

        const deployResult = await nftMarketPlace.send(
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
            to: nftMarketPlace.address,
            deploy: true,
            success: true,
        });
    });

    it('should deploy', async () => {
        // the check is done inside beforeEach
        // blockchain and nftMarketPlace are ready to use
    });
});
