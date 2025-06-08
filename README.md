# 🔐 Smart Access Wallet – Delegate-Controlled User Wallet in Solidity

This project is a modular system of smart contracts that simulates a **user-controlled wallet** with support for **delegated access**. It was developed for educational and portfolio purposes as part of my journey into advanced Solidity and smart contract architecture.

## 🚀 Key Features

- ✅ **UserWallet** acts as a personal wallet for users to deposit and withdraw ETH.
- 🔐 **AccessManager** manages which addresses or contracts are authorized to interact with the user wallet.
- 🧠 **Delegation Logic**: The user can approve specific contracts (e.g., dApps or automation systems) to perform actions on their behalf.
- 🔁 **Flexible Authorization**: Authorization is done per-wallet and per-caller (fine-grained access).
- ⚙️ Modular architecture for easy integration and extensibility.

---

## 📦 Smart Contracts

### 🧾 UserWallet.sol
- Acts as a secure wallet owned by a user.
- Allows ETH deposits and controlled withdrawals.
- Connects to `AccessManager` to verify if the caller is authorized.
- Emits `Deposit`, `Withdraw`, `ApprovedAddress`, and `RevokedAddress` events.
- Accepts native ETH via `receive()` and `fallback()` functions.

### 🛂 AccessManager.sol
- Stores access permissions using a double mapping:  
  `mapping(userWallet => mapping(address => bool))`
- Uses `tx.origin` for secure delegation control (EOA only).
- Only the original deployer can grant/revoke access for addresses per wallet.

---

## 🧪 How to Test (Remix IDE)

1. **Deploy `AccessManager.sol`**
2. **Deploy `UserWallet.sol`**, passing `AccessManager`'s address as a constructor argument
3. Use `depositEther()` or send ETH directly to the wallet
4. Use `approveAddress(address)` from the wallet to grant access to another wallet or contract
5. Let the approved address call `withdrawEther(amount)` to extract funds
6. Optionally, create an `Executor` contract to simulate third-party integrations

---

## 🔐 Security Notes

- ✅ **Fine-grained access**: Only authorized addresses (by the wallet owner) can interact with sensitive functions.
- ❗ `tx.origin` is used to avoid external contract relays or exploit chains.
- ❗ Withdrawals are only allowed if explicitly approved, reducing attack surface.
- 🧪 Still, not recommended for production without extensive audits or time-based limits.

---

## 📄 Example Use Cases

- **Web3 dApps** that require delegated control of user wallets
- **Automation systems** that move funds under controlled permissions
- **Simulations of multisig or DAO-controlled wallets**
- **Educational tool** to understand modular smart contract architecture

---

## 📍 Technologies

- Solidity `^0.8.24`
- Remix IDE (for deployment and testing)
- OpenZeppelin patterns (if extended)
- Custom modular architecture

---

## ✍️ Author

Developed by **Marcos Pérez**  
Smart contract developer and fullstack web3 builder.

---

## 📜 License

This project is licensed under the **MIT License**.
