# World of Warcraft Server

<image src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white"/>

[![Version](https://img.shields.io/badge/Version-v1.0-success)]()
[![Version](https://img.shields.io/badge/Ubuntu-v22.04-blue)]()

Based on **TrinityCore** branch `3.3.5` (**v3.3.5a.12340**) and compiled on **Ubuntu v22.04**.
> Compiled on 05/10/2023

--------------

## Requirements

Unzip the files `TDB_full_world_335.23061_2023_06_14.7z` and `worldserver.7z` localized in the `bin` directory.

## Docker

We have two containers with the following names: `core_wow` (wow:core) and `database_wow` (wow:database).

- **core_wow** - holds core server data on `3724` and `8085` port.
- **database_wow** - holds database server on `3306` port.
 
### Start/create containers

```
docker compose up -d
```

### Stop containers

```
docker compose stop
```

## Database

By default Trinity needs three databases to run with the following names: Auth, Characters, World.

- **auth** - holds account data - usernames, passwords, GM access, realm information, etc.
- **characters** - holds character data - created characters, inventory, bank items, auction house, tickets, etc.
- **world** - holds game-experience content such as NPCs, quests, objects, etc.

In `database_wow` container run the command to create the databases.
```
mysql -u root -p < wow.sql
```
> $ docker exec -it database_wow bash

## Start servers

In `core_wow` container.

> $ docker exec -it core_wow bash

### World

```
./start-world
```
> To start the World server

### Authentication

```
./start-auth
```
> To start the Authentication server

## GM Commands

GM commands can be entered mainly in 2 ways. Either by typing it directly into the world console window. In the world console window the leading dot (.) is not mandantory, but you can use it. The other way is using the gm command ingame in the chat console of the wow client. There, all commands must start with a leading dot, f.ex.: .gm on

> Some commands are working only by selecting a player or a creature. These commands can not be used in the world console.

### Create an account

```
account create
```
> Syntax: .account create $account $password Create account and set password to it.

### Delete an account

```
account delete
```
> Syntax: .account delete $account Delete account with all characters.

### Online accounts

```
account onlinelist
```
> Syntax: .account onlinelist Show list of online accounts.

### Select account

```
account set
```
> Syntax: .account set $subcommand Type .account set to see the list of possible subcommands or .help account set $subcommand to see info on subcommands

### Change account password

```
account password
```
> Syntax: .account password $old_password $new_password $new_password Change your account password.

#### GM

```
account set gmlevel
```
> Syntax: .account set gmlevel [$account] #level [#realmid] Set the security level for targeted player (can't be used at self) or for account $name to a level of #level on the realm #realmID. #level may range from 0 to 3. #reamID may be -1 for all realms.

### Addon

```
account set addon
```
> Syntax: .account set addon [$account] #addon Set user (possible targeted) expansion addon level allowed. Addon values: 0 - normal, 1 - tbc, 2 - wotlk.

### Announce

```
announce
```
> Syntax: .announce $MessageToBroadcast Send a global message to all players online in chat log.

### Rename character

```
character rename
```
> Syntax: .character rename [$name] Mark selected in game or by $name in command character for rename at next login.
