# Resonite Headless on ARM, dockerized

## WARNING: this doesn't work out of the box as of 2025-01-29, ~~I need to implement assembly rebuild stuff~~ (update 2025-02-18: not needed anymore; thanks, Cyro!) and depotdownloader currently doesn't work with the new private branches (update 2025-02-18: added a NO_UPDATE env var that'll disable the depot downloading part of the updater and just have it copy the libraries, so you can `scp` the files over manually)

## How to run

- `git clone` the repository
- copy .env.example to .env, add your Steam credentials and headless code
  - WARNING: the Steam account needs to have Steam Guard completely disabled, DO NOT use your main account for this
- `mkdir config`, create and edit `config/Config.json` according to [the wiki page on the headless config](https://wiki.resonite.com/Headless_Server_Software/Configuration_File)
- `docker compose build` - build the libraries and other containers
- `docker compose up -d` - start the containers - it'll copy the libraries and run the updater, then start the headless server
- `docker compose attach headless` - attach to the headless interactive console, detach with ^P ^Q (^C will stop the headless)
- `docker compose restart` - update and restart the headless

Tested on an Oracle Cloud Ampere A1 cloud VM, *should* work with other ARM machines - feel free to create an issue here or contact me on Discord (`adamski2003`) if you encounter any issues
