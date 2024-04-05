# OneMinuteCharacter
## For All
### 概要
- キャラクターがTokenや各種のNFTを保持することで、ユーザの過去の履歴や資産を管理できるようにする

### NFT List
- Character NFT
  - ERC-721 
  - ThirdWebで作成後々こっちでつくる
    - https://thirdweb.com/astar-zkyoto/0x093d8549D8cBcF5844B23f508ac2c1687E92862D
  - ユーザがclaimするキャラクター
  - このNFTがERC-6551を使ってスマートアカウントを保持する
  - GelatoでGasslessTransactionを行う
    - https://app.gelato.network/relay
- Heart NFT
  - ERC-721
  - CrossMintで作成
  - クレカで購入またはAssetsで購入後CharacterNFTSmartWalletに転送
  - 課金プレイするためのアイテム
  - 初期に２０回（暫定）の体力が付与されている
  - 付与された体力はファイナライズの関係でoffchainで管理する
- Portion NFT
  - 初回購入の体力がなくなったら追加する体力
  - クレカで購入またはAssetsで購入後CharacterNFTSmartWalletに転送
- Free Portion NFT
  - ユーザのゲーム実績に応じて運営から付与されるNFT
  - GelatoでGasslessTransactionでClaimさせる
    - https://app.gelato.network/relay

## For Dev
- ERC-6551
  - characterNFT のmintの時に、ERC6551Registryをcallすることでスマートアカウントを作成する
- ERC-1167
  - ユーザが保持しているNFTを一括で確認、管理、転送するための機能を持つ
  - factory contractでfactory元のコントラクト機能を持ったスマートアカウントを生成する
- caracter accountの役割
  - 一括でユーザが保持しているコントラクト情報の一覧を返す
  - tokenをユーザが事前に保持しているWalletへ送信できる機能
  - Dex等でswapができるための承認機能