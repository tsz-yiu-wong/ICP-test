# 计数器 Canister 项目

这是一个简单的Internet Computer (ICP) canister项目，实现了一个计数器功能。

## 功能

- 初始化计数器为0
- 递增计数器
- 获取当前计数值

## 项目结构

- `src/lib.rs`: canister的主要代码实现
- `Cargo.toml`: Rust项目依赖配置
- `dfx.json`: Internet Computer部署配置
- `deploy.sh`: 部署脚本

## 前提条件

请确保已安装以下工具：

1. Rust和Cargo (https://www.rust-lang.org/tools/install)
2. Internet Computer SDK (DFX) (https://internetcomputer.org/docs/current/developer-docs/setup/install/)

```bash
sh -ci "$(curl -fsSL https://internetcomputer.org/install.sh)"
```

## 部署步骤

### 本地部署

1. 赋予部署脚本执行权限：

```bash
chmod +x deploy.sh
```

2. 运行部署脚本：

```bash
./deploy.sh
```

这将启动本地网络，构建并部署canister，并显示canister ID和访问URL。

### 手动部署

如果想手动部署，请按照以下步骤操作：

1. 启动本地Internet Computer网络：

```bash
dfx start --background --clean
```

2. 部署canister：

```bash
dfx deploy
```

3. 与canister交互：

```bash
# 获取当前计数
dfx canister call my_canister get_count

# 递增计数
dfx canister call my_canister increment
```

### 部署到主网

要部署到ICP主网，请确保您有足够的cycles：

1. 配置身份和钱包：

```bash
dfx identity use default
dfx identity get-wallet
```

2. 部署到主网：

```bash
dfx deploy --network ic
```

## Candid接口

您可以通过Candid UI来与canister交互。本地部署后，访问：

http://localhost:8000/?canisterId=$(dfx canister id __Candid_UI) 