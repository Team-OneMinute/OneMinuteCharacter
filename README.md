# OneMinuteCharacter
## For All
### 概要
- キャラクターがTokenや各種のNFTを保持することで、ユーザの過去の履歴や資産を管理できるようにする

### NFT List
- Character NFT
  - ERC-721 
  - ユーザがクリエイトするキャラクター
  - このNFTがERC-6551を使ってスマートアカウントを保持する
- Heart NFT
  - ERC-721
  - 課金プレイするためのアイテム
  - 初期に２０回（暫定）の体力が付与されている
  - 付与された体力はファイナライズの関係でoffchainで管理する
- Portion NFT
  - 初回購入の体力がなくなったら追加する体力
- Free Portion NFT
  - ユーザのゲーム実績に応じて運営から付与されるNFT

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