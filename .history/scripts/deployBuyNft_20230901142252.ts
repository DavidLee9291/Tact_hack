import { toNano } from 'ton-core';
import { BuyNft } from '../wrappers/BuyNft';
import { NetworkProvider } from '@ton-community/blueprint';

export async function run(provider: NetworkProvider) {
    const buyNft = provider.open(await BuyNft.fromInit(owner));

    const 

    await buyNft.send(
        provider.sender(),
        {
            value: toNano('0.05'),
        },
        {
            $$type: 'Deploy',
            queryId: 0n,
        }
    );

    await provider.waitForDeploy(buyNft.address);

    // run methods on `buyNft`
}
