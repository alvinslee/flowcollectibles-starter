# Setup instructions

1. Make sure you have flow cli installed.

2. In project root, run:

```bash
$ flow emulator
```

3. In a separate terminal window, at project root, run:

```bash
$ flow accounts add-contract ./contracts/cadence/contracts/Collectibles.cdc
```

4. In a separate terminal window, go to `frontend` folder, then run:

```
$ npm i
$ npm run dev
```

With the buggy code commented out, this works:

* You can sign in by connecting to a Blocto account wallet.
* The hard-coded set of 4 collectibles is displayed.

However, the commented-out cadence code in `frontend/pages/index.js` is not working.
