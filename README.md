# Aeon cash Docker image

Aeon cash is a based on Monero system that used CryptoNight for the blockchains which is intended to use less power cosumption and can be used by CPUs.

This image can be deployed in your Docker network to work as your wallet as well as a simple miner.

The wallet and the miner are built directly from the source code at [https://github.com/aeonix/aeon/releases](https://github.com/aeonix/aeon/releases) for your later perusal. Find the Docker file at [https://github.com/ehehdada/aeoncash](https://github.com/ehehdada/aeoncash)

# Creating a Docker instance

The system is going to store the wallet in a external file, and the database for the transactions which is initially downloaded from the Aeon network, that requires a lot of time.

In the next example, we have the folders
```
./myAeon
+-- /wallet
+-- /aeon
```

`./myAeon/wallet` will be used to keep the wallet files, and `./myAeon/aeon` will be used for the database. You can use Docker volumes instead of folders at host, just make ensure nobody is going to steal/corrupt your files.

You can map the P2P port at 11180 (the RPC port is at 11181) to the host too.

```
docker run -dit --name myAeonWallet \
  -p 11180:11180 \
  -v $(pwd)/myAeon/wallet:/wallet \
  -v $(pwd)/myAeon/aeon:/root/.aeon \
  ehehdada/aeoncash
```

The container will be initialized with the name `myAeonWallet` for later access to its services.

# Managing the wallet

## Initializing the wallet

Once the Docker container is up and running, use the command

```
docker exec -it myAeonWallet /simplewallet --generate-new-wallet=/wallet/myWallet
```

It will ask you for a password and the wallet will be stored under the name `myWallet` in the folder `wallet` that we mapped previously in the host with the `./myAeon/wallet` folder.

## Accessing to an existing wallet

If the wallet files already exist, use the command

```
docker exec -it myAeonWallet /simplewallet --wallet-file=/wallet/myWallet
```

then input the password.

## Further information

Use the `--help` option

```
docker exec -it myAeonWallet /simplewallet --help
```

# Mining

Use the command `simpleminer` to join a pool.

```
docker exec -it myAeonWallet /simpleminer --pool-addr arg --login arg --pass arg --lite
```

Use the	`--help` option for more information

```
docker exec -it myAeonWallet /simpleminer --help                
```

# Credits and donations

Docker image brought you by [ehehdada, ltd.](http://www.ehehdada.com).

Donation addresses:
* Aeon cash address `WmtDfMG3PaGJazp9X9P4HhLnMHY6ur9Q9aLTkE7mh8JQPxt8ZTFQs7gRC3nAjyGG3gMxvEBYLBnRHLpAJGF5kzkj2Qx2JEpEg`
* Bitconnect coin address `8HudVnKaQTu7T5bXCrogHSEVHoPa28RLBX`
* Peercoin address `PEkmXcgL4wWb2mSZiLXr5cMfRKvpFY1kaA`

