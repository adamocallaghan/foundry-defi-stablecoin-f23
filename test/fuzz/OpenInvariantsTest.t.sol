// // SPDX-License-Identifier: MIT

// // Have our invariants, aka propertis of the system that should always hold true

// // What are our invariants?
// // 1. The total supply of DSC should be less than the total value of collateral
// // 2. Getter view functions shoudl never revert <- evergreen invariant

// import {Test} from "forge-std/Test.sol";
// import {StdInvariant} from "forge-std/StdInvariant.sol";
// import {DecentralizedStableCoin} from "../../src/DecentralizedStableCoin.sol";
// import {DSCEngine} from "../../src/DSCEngine.sol";
// import {DeployDSC} from "../../script/DeployDSC.s.sol";
// import {HelperConfig} from "../../script/HelperConfig.s.sol";
// import {ERC20Mock} from "@openzeppelin/contracts/mocks/ERC20Mock.sol";
// import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

// pragma solidity ^0.8.19;

// contract OpenInvariantsTest is StdInvariant, Test {
//     DeployDSC deployer;
//     DSCEngine dsce;
//     DecentralizedStableCoin dsc;
//     HelperConfig config;
//     address weth;
//     address wbtc;

//     function setUp() external {
//         deployer = new DeployDSC();
//         (dsc, dsce, config) = deployer.run();
//         (,, weth, wbtc,) = config.activeNetworkConfig();
//         targetContract(address(dsce));
//     }

//     function invariant_protocolMustHaveMoreValueThanTotalSupply() public view {
//         // get the value of all the collaterla in the protocol
//         // compare it to all the debt (DSC)
//         // Get total supply of DSC (dollar amount as valued at a dollar)
//         uint256 totalSupply = dsc.totalSupply();
//         // Get total weth & wbtc deposited into DSCEngine contract
//         uint256 totalWethDeposited = IERC20(weth).balanceOf(address(dsce));
//         uint256 totalWbtcDepositied = IERC20(wbtc).balanceOf(address(dsce));
//         // Get USD values of weth & wbtc collateral
//         uint256 wethValue = dsce.getUsdValue(weth, totalWethDeposited);
//         uint256 wbtcValue = dsce.getUsdValue(wbtc, totalWbtcDepositied);

//         // Check that the total weth & wbtc value in USD is > the total supply of DSC
//         assert(wethValue + wbtcValue >= totalSupply);
//     }
// }
