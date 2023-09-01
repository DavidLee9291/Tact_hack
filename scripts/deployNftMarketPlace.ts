import { toNano } from 'ton-core';
import { NftMarketPlace } from '../wrappers/NftMarketPlace';
import { NetworkProvider } from '@ton-community/blueprint';

export async function run(provider: NetworkProvider) {
    const nftMarketPlace = provider.open(await NftMarketPlace.fromInit());

    await nftMarketPlace.send(
        provider.sender(),
        {
            value: toNano('0.05'),
        },
        {
            $$type: 'Deploy',
            queryId: 0n,
        }
    );

    await provider.waitForDeploy(nftMarketPlace.address);

    // run methods on `nftMarketPlace`
}
