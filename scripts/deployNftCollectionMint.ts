import { toNano } from 'ton-core';
import { NftCollectionMint } from '../wrappers/NftCollectionMint';
import { NetworkProvider } from '@ton-community/blueprint';

export async function run(provider: NetworkProvider) {
    const nftCollectionMint = provider.open(await NftCollectionMint.fromInit());

    await nftCollectionMint.send(
        provider.sender(),
        {
            value: toNano('0.05'),
        },
        {
            $$type: 'Deploy',
            queryId: 0n,
        }
    );

    await provider.waitForDeploy(nftCollectionMint.address);

    // run methods on `nftCollectionMint`
}
