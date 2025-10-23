import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

export default buildModule("YielderaVaultModule", (m) => {
  // Constructor parameters for YielderaVault
  // Hedera testnet SaucerSwap V3 addresses
  const pool = m.getParameter("pool", "0x37814eDc1ae88cf27c0C346648721FB04e7E0AE7");
  const whbarAddress = m.getParameter("whbarAddress", "0x0000000000000000000000000000000000003aD2");
  const whbarHelperAddress = m.getParameter("whbarHelperAddress", "0x000000000000000000000000000000000050a8a7");
  const saucerNftToken = m.getParameter("saucerNftToken", "0x000000000000000000000000000000000013feE4");
  const saucerFactoryAddress = m.getParameter("saucerFactoryAddress", "0x00000000000000000000000000000000001243eE");
  const nonfungiblePositionManagerAddress = m.getParameter(
    "nonfungiblePositionManagerAddress",
    "0x000000000000000000000000000000000013F618"
  );
  const swapRouterAddress = m.getParameter("swapRouterAddress", "0x0000000000000000000000000000000000159398");

  // Deploy the YielderaVault contract
  const yielderaVault = m.contract("YielderaVault", [
    pool,
    whbarAddress,
    whbarHelperAddress,
    saucerNftToken,
    saucerFactoryAddress,
    nonfungiblePositionManagerAddress,
    swapRouterAddress,
  ]);

  return { yielderaVault };
});
